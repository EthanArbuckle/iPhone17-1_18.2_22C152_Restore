@interface FMReachability
+ (id)reachabilityForInternetConnection;
+ (id)reachabilityForLocalWiFi;
+ (id)reachabilityWithAddress:(const sockaddr_in *)a3;
+ (id)reachabilityWithHostName:(id)a3;
- (BOOL)connectionRequired;
- (BOOL)startNotifier;
- (unint64_t)currentReachabilityStatus;
- (unint64_t)localWiFiStatusForFlags:(unsigned int)a3;
- (unint64_t)networkStatusForFlags:(unsigned int)a3;
- (void)dealloc;
- (void)stopNotifier;
@end

@implementation FMReachability

- (BOOL)startNotifier
{
  v7.version = 0;
  memset(&v7.retain, 0, 24);
  v7.info = self;
  int v3 = SCNetworkReachabilitySetCallback(self->reachabilityRef, (SCNetworkReachabilityCallBack)FMReachabilityCallback, &v7);
  if (v3)
  {
    reachabilityRef = self->reachabilityRef;
    Current = CFRunLoopGetCurrent();
    LOBYTE(v3) = SCNetworkReachabilityScheduleWithRunLoop(reachabilityRef, Current, (CFStringRef)*MEMORY[0x1E4F1D418]) != 0;
  }
  return v3;
}

- (void)stopNotifier
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
  [(FMReachability *)self stopNotifier];
  reachabilityRef = self->reachabilityRef;
  if (reachabilityRef) {
    CFRelease(reachabilityRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)FMReachability;
  [(FMReachability *)&v4 dealloc];
}

+ (id)reachabilityWithHostName:(id)a3
{
  SCNetworkReachabilityRef v4 = (SCNetworkReachabilityRef)[a3 UTF8String];
  if (v4)
  {
    SCNetworkReachabilityRef v4 = SCNetworkReachabilityCreateWithName(0, (const char *)v4);
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
  }
  return v4;
}

+ (id)reachabilityWithAddress:(const sockaddr_in *)a3
{
  SCNetworkReachabilityRef v4 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const sockaddr *)a3);
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
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[1] = 0;
  v4[0] = 528;
  v2 = [a1 reachabilityWithAddress:v4];
  return v2;
}

+ (id)reachabilityForLocalWiFi
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[1] = 0;
  v4[0] = 0xFEA900000210;
  v2 = [a1 reachabilityWithAddress:v4];
  if (v2) {
    v2[8] = 1;
  }
  return v2;
}

- (unint64_t)localWiFiStatusForFlags:(unsigned int)a3
{
  return (~a3 & 0x20002) == 0;
}

- (unint64_t)networkStatusForFlags:(unsigned int)a3
{
  if ((a3 & 2) == 0) {
    return 0;
  }
  LODWORD(v4) = (a3 & 0x28) != 0;
  if ((a3 & 0x10) != 0) {
    LODWORD(v4) = 0;
  }
  if ((a3 & 4) != 0) {
    unint64_t v4 = v4;
  }
  else {
    unint64_t v4 = 1;
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

- (unint64_t)currentReachabilityStatus
{
  SCNetworkReachabilityFlags flags = 0;
  if (!SCNetworkReachabilityGetFlags(self->reachabilityRef, &flags)) {
    return 0;
  }
  if (self->localWiFiRef) {
    return [(FMReachability *)self localWiFiStatusForFlags:flags];
  }
  return [(FMReachability *)self networkStatusForFlags:flags];
}

@end