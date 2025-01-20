@interface CUTReachability
+ (id)reachabilityForInternetConnection;
+ (id)reachabilityForLocalWiFi;
+ (id)reachabilityWithAddress:(const sockaddr_in *)a3;
+ (id)reachabilityWithHostName:(id)a3;
- (BOOL)connectionRequired;
- (int64_t)currentReachabilityStatus;
- (int64_t)localWiFiStatusForFlags:(unsigned int)a3;
- (int64_t)networkStatusForFlags:(unsigned int)a3;
- (void)dealloc;
@end

@implementation CUTReachability

- (void)dealloc
{
  reachabilityRef = self->reachabilityRef;
  if (reachabilityRef)
  {
    CFRelease(reachabilityRef);
    self->reachabilityRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUTReachability;
  [(CUTReachability *)&v4 dealloc];
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

- (int64_t)localWiFiStatusForFlags:(unsigned int)a3
{
  return (~a3 & 0x20002) == 0;
}

- (int64_t)networkStatusForFlags:(unsigned int)a3
{
  sub_1A355DD6C(a3, (uint64_t)"networkStatusForFlags");
  if ((a3 & 2) == 0) {
    return 0;
  }
  LODWORD(v5) = (a3 & 0x28) != 0;
  if ((a3 & 0x10) != 0) {
    LODWORD(v5) = 0;
  }
  if ((a3 & 4) != 0) {
    int64_t v5 = v5;
  }
  else {
    int64_t v5 = 1;
  }
  if ((a3 & 0x40000) != 0) {
    return 2;
  }
  else {
    return v5;
  }
}

- (BOOL)connectionRequired
{
  reachabilityRef = self->reachabilityRef;
  if (!reachabilityRef)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"CUTReachability.m" lineNumber:186 description:@"connectionRequired called with NULL reachabilityRef"];

    reachabilityRef = self->reachabilityRef;
  }
  SCNetworkReachabilityFlags flags = -1431655766;
  return SCNetworkReachabilityGetFlags(reachabilityRef, &flags) && (flags & 4) != 0;
}

- (int64_t)currentReachabilityStatus
{
  reachabilityRef = self->reachabilityRef;
  if (!reachabilityRef)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"CUTReachability.m" lineNumber:194 description:@"currentNetworkStatus called with NULL reachabilityRef"];

    reachabilityRef = self->reachabilityRef;
  }
  SCNetworkReachabilityFlags flags = -1431655766;
  if (!SCNetworkReachabilityGetFlags(reachabilityRef, &flags)) {
    return 0;
  }
  if (self->localWiFiRef) {
    return [(CUTReachability *)self localWiFiStatusForFlags:flags];
  }
  return [(CUTReachability *)self networkStatusForFlags:flags];
}

@end