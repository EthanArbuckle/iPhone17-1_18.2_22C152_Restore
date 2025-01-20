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
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v7.version = 0;
  memset(&v7.retain, 0, 24);
  v7.info = self;
  int v3 = SCNetworkReachabilitySetCallback(self->reachabilityRef, (SCNetworkReachabilityCallBack)sub_100010CC0, &v7);
  if (v3)
  {
    reachabilityRef = self->reachabilityRef;
    Current = CFRunLoopGetCurrent();
    LOBYTE(v3) = SCNetworkReachabilityScheduleWithRunLoop(reachabilityRef, Current, kCFRunLoopDefaultMode) != 0;
  }
  return v3;
}

- (void)stopNotifier
{
  reachabilityRef = self->reachabilityRef;
  if (reachabilityRef)
  {
    Current = CFRunLoopGetCurrent();
    SCNetworkReachabilityUnscheduleFromRunLoop(reachabilityRef, Current, kCFRunLoopDefaultMode);
  }
}

- (void)dealloc
{
  [(BDSReachability *)self stopNotifier];
  reachabilityRef = self->reachabilityRef;
  if (reachabilityRef) {
    CFRelease(reachabilityRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)BDSReachability;
  [(BDSReachability *)&v4 dealloc];
}

+ (id)reachabilityWithHostName:(id)a3
{
  SCNetworkReachabilityRef v4 = SCNetworkReachabilityCreateWithName(0, (const char *)[a3 UTF8String]);
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

+ (id)reachabilityWithAddress:(const sockaddr_in *)a3
{
  SCNetworkReachabilityRef v4 = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, (const sockaddr *)a3);
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
  v4[1] = 0;
  v4[0] = 528;
  v2 = [a1 reachabilityWithAddress:v4];
  return v2;
}

+ (id)reachabilityForLocalWiFi
{
  v4[1] = 0;
  v4[0] = 0xFEA900000210;
  v2 = [a1 reachabilityWithAddress:v4];
  if (v2) {
    v2[8] = 1;
  }
  return v2;
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
      return [(BDSReachability *)self localWiFiStatusForFlags:flags];
    }
    else {
      return [(BDSReachability *)self networkStatusForFlags:flags];
    }
  }
  return result;
}

+ (void)_updateIsOffline
{
  id v2 = +[BDSReachability sharedReachabilityForInternetConnection];
  byte_10028F9E0 = [v2 currentReachabilityStatus] == 0;
}

+ (BOOL)isOffline
{
  return byte_10028F9E0;
}

+ (id)sharedReachabilityForInternetConnection
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000111C0;
  block[3] = &unk_10025F9D0;
  block[4] = a1;
  if (qword_1002974C8 != -1) {
    dispatch_once(&qword_1002974C8, block);
  }
  id v2 = (void *)qword_1002974C0;
  return v2;
}

@end