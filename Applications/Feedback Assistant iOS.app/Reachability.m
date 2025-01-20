@interface Reachability
+ (Reachability)reachabilityWithAddress:(const sockaddr *)a3;
+ (Reachability)reachabilityWithHostName:(id)a3;
+ (id)reachabilityForInternetConnection;
- (BOOL)connectionRequired;
- (BOOL)startNotifier;
- (int64_t)currentReachabilityStatus;
- (int64_t)networkStatusForFlags:(unsigned int)a3;
- (void)dealloc;
- (void)stopNotifier;
@end

@implementation Reachability

+ (Reachability)reachabilityWithHostName:(id)a3
{
  SCNetworkReachabilityRef v4 = SCNetworkReachabilityCreateWithName(0, (const char *)[a3 UTF8String]);
  if (v4)
  {
    SCNetworkReachabilityRef v5 = v4;
    SCNetworkReachabilityRef v4 = (SCNetworkReachabilityRef)objc_alloc_init((Class)a1);
    if (v4)
    {
      *((void *)v4 + 1) = v5;
    }
    else
    {
      CFRelease(v5);
      SCNetworkReachabilityRef v4 = 0;
    }
  }

  return (Reachability *)v4;
}

+ (Reachability)reachabilityWithAddress:(const sockaddr *)a3
{
  SCNetworkReachabilityRef v4 = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, a3);
  if (v4)
  {
    SCNetworkReachabilityRef v5 = v4;
    SCNetworkReachabilityRef v4 = (SCNetworkReachabilityRef)objc_alloc_init((Class)a1);
    if (v4)
    {
      *((void *)v4 + 1) = v5;
    }
    else
    {
      CFRelease(v5);
      SCNetworkReachabilityRef v4 = 0;
    }
  }

  return (Reachability *)v4;
}

+ (id)reachabilityForInternetConnection
{
  v4[1] = 0;
  v4[0] = 528;
  v2 = [a1 reachabilityWithAddress:v4];

  return v2;
}

- (BOOL)startNotifier
{
  v7.version = 0;
  memset(&v7.retain, 0, 24);
  v7.info = self;
  int v3 = SCNetworkReachabilitySetCallback(self->_reachabilityRef, (SCNetworkReachabilityCallBack)sub_100027D20, &v7);
  if (v3)
  {
    reachabilityRef = self->_reachabilityRef;
    Current = CFRunLoopGetCurrent();
    LOBYTE(v3) = SCNetworkReachabilityScheduleWithRunLoop(reachabilityRef, Current, kCFRunLoopDefaultMode) != 0;
  }
  return v3;
}

- (void)stopNotifier
{
  reachabilityRef = self->_reachabilityRef;
  if (reachabilityRef)
  {
    Current = CFRunLoopGetCurrent();
    SCNetworkReachabilityUnscheduleFromRunLoop(reachabilityRef, Current, kCFRunLoopDefaultMode);
  }
}

- (void)dealloc
{
  [(Reachability *)self stopNotifier];
  reachabilityRef = self->_reachabilityRef;
  if (reachabilityRef) {
    CFRelease(reachabilityRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)Reachability;
  [(Reachability *)&v4 dealloc];
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
  return SCNetworkReachabilityGetFlags(self->_reachabilityRef, &flags) && (flags & 4) != 0;
}

- (int64_t)currentReachabilityStatus
{
  SCNetworkReachabilityFlags flags = 0;
  if (SCNetworkReachabilityGetFlags(self->_reachabilityRef, &flags)) {
    return [(Reachability *)self networkStatusForFlags:flags];
  }
  else {
    return 0;
  }
}

@end