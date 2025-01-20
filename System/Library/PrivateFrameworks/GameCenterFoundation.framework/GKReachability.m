@interface GKReachability
+ (BOOL)_gkIsOnline;
+ (id)_gkReachabilityForInternetConnection;
+ (id)_gkReachabilityWithAddress:(const sockaddr_in *)a3;
- (BOOL)_gkStartNotifier;
- (int)_gkCurrentReachabilityStatus;
- (int)localWiFiStatusForFlags:(unsigned int)a3;
- (int)networkStatusForFlags:(unsigned int)a3;
- (void)_gkStopNotifier;
- (void)dealloc;
@end

@implementation GKReachability

- (BOOL)_gkStartNotifier
{
  v7.version = 0;
  memset(&v7.retain, 0, 24);
  v7.info = self;
  int v3 = SCNetworkReachabilitySetCallback(self->reachabilityRef, (SCNetworkReachabilityCallBack)ReachabilityCallback, &v7);
  if (v3)
  {
    reachabilityRef = self->reachabilityRef;
    Current = CFRunLoopGetCurrent();
    LOBYTE(v3) = SCNetworkReachabilityScheduleWithRunLoop(reachabilityRef, Current, (CFStringRef)*MEMORY[0x1E4F1D418]) != 0;
  }
  return v3;
}

- (void)_gkStopNotifier
{
  reachabilityRef = self->reachabilityRef;
  if (reachabilityRef)
  {
    Current = CFRunLoopGetCurrent();
    CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D418];
    SCNetworkReachabilityUnscheduleFromRunLoop(reachabilityRef, Current, v4);
  }
}

- (void)dealloc
{
  [(GKReachability *)self _gkStopNotifier];
  reachabilityRef = self->reachabilityRef;
  if (reachabilityRef) {
    CFRelease(reachabilityRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)GKReachability;
  [(GKReachability *)&v4 dealloc];
}

+ (id)_gkReachabilityWithAddress:(const sockaddr_in *)a3
{
  id result = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const sockaddr *)a3);
  if (result)
  {
    id v5 = result;
    id result = objc_alloc_init((Class)a1);
    if (result)
    {
      *((void *)result + 2) = v5;
      *((unsigned char *)result + 8) = 0;
    }
  }
  return result;
}

+ (id)_gkReachabilityForInternetConnection
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[1] = 0;
  v3[0] = 528;
  return (id)[a1 _gkReachabilityWithAddress:v3];
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

- (int)_gkCurrentReachabilityStatus
{
  SCNetworkReachabilityFlags flags = 0;
  int result = SCNetworkReachabilityGetFlags(self->reachabilityRef, &flags);
  if (result)
  {
    if (self->localWiFiRef) {
      return [(GKReachability *)self localWiFiStatusForFlags:flags];
    }
    else {
      return [(GKReachability *)self networkStatusForFlags:flags];
    }
  }
  return result;
}

+ (BOOL)_gkIsOnline
{
  return objc_msgSend(+[GKReachability _gkReachabilityForInternetConnection](GKReachability, "_gkReachabilityForInternetConnection"), "_gkCurrentReachabilityStatus") != 0;
}

@end