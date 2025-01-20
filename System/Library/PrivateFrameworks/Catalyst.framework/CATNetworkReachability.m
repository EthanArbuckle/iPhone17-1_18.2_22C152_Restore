@interface CATNetworkReachability
+ (BOOL)isReachableForLocalWiFiWithFlags:(unsigned int)a3;
+ (BOOL)isReachableForNetworkWithFlags:(unsigned int)a3;
+ (id)keyPathsForValuesAffectingReachable;
+ (id)reachabilityForInternetConnection;
+ (id)reachabilityForLocalWiFi;
+ (id)reachabilityWithAddress:(id)a3;
- (BOOL)isReachable;
- (CATAddress)address;
- (CATNetworkReachability)initWithAddress:(id)a3;
- (CATNetworkReachabilityDelegate)delegate;
- (id)debugDescription;
- (unsigned)flags;
- (void)configureCallback;
- (void)dealloc;
- (void)delegateDidChange;
- (void)reachabilityDidChangeWithFlags:(unsigned int)a3;
- (void)removeFromRunLoop:(id)a3 forMode:(id)a4;
- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setFlags:(unsigned int)a3;
@end

@implementation CATNetworkReachability

+ (id)keyPathsForValuesAffectingReachable
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"flags"];
}

- (BOOL)isReachable
{
  v3 = [(CATNetworkReachability *)self address];
  int v4 = [v3 isLocalWiFi];

  uint64_t v5 = [(CATNetworkReachability *)self flags];
  if (v4)
  {
    return +[CATNetworkReachability isReachableForLocalWiFiWithFlags:v5];
  }
  else
  {
    return +[CATNetworkReachability isReachableForNetworkWithFlags:v5];
  }
}

+ (id)reachabilityWithAddress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithAddress:v4];

  return v5;
}

+ (id)reachabilityForInternetConnection
{
  v3 = +[CATAddress any];
  id v4 = [a1 reachabilityWithAddress:v3];

  return v4;
}

+ (id)reachabilityForLocalWiFi
{
  v3 = +[CATAddress localWiFi];
  id v4 = [a1 reachabilityWithAddress:v3];

  return v4;
}

- (CATNetworkReachability)initWithAddress:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"CATNetworkReachability.m", 73, @"Invalid parameter not satisfying: %@", @"address" object file lineNumber description];
  }
  v7 = [(CATNetworkReachability *)self init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_address, a3);
    id v9 = [v6 data];
    v8->mReachabilityRef = SCNetworkReachabilityCreateWithAddress(0, (const sockaddr *)[v9 bytes]);

    [(CATNetworkReachability *)v8 configureCallback];
  }

  return v8;
}

- (void)dealloc
{
  mReachabilityRef = self->mReachabilityRef;
  if (mReachabilityRef)
  {
    CFRelease(mReachabilityRef);
    self->mReachabilityRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CATNetworkReachability;
  [(CATNetworkReachability *)&v4 dealloc];
}

- (id)debugDescription
{
  unsigned int v3 = [(CATNetworkReachability *)self flags];
  objc_super v4 = NSString;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = [(CATNetworkReachability *)self isReachable];
  v7 = @"unreachable";
  if (v6) {
    v7 = @"reachable";
  }
  uint64_t v8 = 100;
  if ((v3 & 0x20000) == 0) {
    uint64_t v8 = 45;
  }
  uint64_t v22 = v8;
  uint64_t v9 = 108;
  if ((v3 & 0x10000) == 0) {
    uint64_t v9 = 45;
  }
  uint64_t v10 = 68;
  if ((v3 & 0x20) == 0) {
    uint64_t v10 = 45;
  }
  uint64_t v20 = v10;
  uint64_t v21 = v9;
  uint64_t v11 = 105;
  if ((v3 & 0x10) == 0) {
    uint64_t v11 = 45;
  }
  uint64_t v12 = 67;
  if ((v3 & 8) == 0) {
    uint64_t v12 = 45;
  }
  uint64_t v18 = v12;
  uint64_t v19 = v11;
  uint64_t v13 = 99;
  if ((v3 & 4) == 0) {
    uint64_t v13 = 45;
  }
  uint64_t v14 = 116;
  if ((v3 & 1) == 0) {
    uint64_t v14 = 45;
  }
  uint64_t v17 = v13;
  uint64_t v15 = 82;
  if ((v3 & 2) == 0) {
    uint64_t v15 = 45;
  }
  return (id)[v4 stringWithFormat:@"<%@: %p { %@, flags = '%c %c%c%c%c%c%c%c' }>", v5, self, v7, v15, v14, v17, v18, v19, v20, v21, v22];
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  mReachabilityRef = self->mReachabilityRef;
  v7 = (__CFString *)a4;
  SCNetworkReachabilityScheduleWithRunLoop(mReachabilityRef, (CFRunLoopRef)[a3 getCFRunLoop], v7);

  SCNetworkReachabilityFlags flags = 0;
  if (SCNetworkReachabilityGetFlags(self->mReachabilityRef, &flags)) {
    [(CATNetworkReachability *)self reachabilityDidChangeWithFlags:flags];
  }
}

- (void)removeFromRunLoop:(id)a3 forMode:(id)a4
{
  mReachabilityRef = self->mReachabilityRef;
  runLoopMode = (__CFString *)a4;
  SCNetworkReachabilityUnscheduleFromRunLoop(mReachabilityRef, (CFRunLoopRef)[a3 getCFRunLoop], runLoopMode);
}

- (void)reachabilityDidChangeWithFlags:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(CATNetworkReachability *)self flags] != a3)
  {
    BOOL v5 = [(CATNetworkReachability *)self isReachable];
    [(CATNetworkReachability *)self setFlags:v3];
    if (v5 != [(CATNetworkReachability *)self isReachable])
    {
      [(CATNetworkReachability *)self delegateDidChange];
    }
  }
}

- (void)delegateDidChange
{
  uint64_t v3 = [(CATNetworkReachability *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CATNetworkReachability *)self delegate];
    [v5 reachabilityDidChange:self];
  }
}

- (void)configureCallback
{
  context.version = 0;
  context.info = self;
  context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x263EFF3B8];
  context.release = (void (__cdecl *)(const void *))MEMORY[0x263EFF3B0];
  context.copyDescription = (CFStringRef (__cdecl *)(const void *))MEMORY[0x263EFF380];
  SCNetworkReachabilitySetCallback(self->mReachabilityRef, (SCNetworkReachabilityCallBack)__REACHABILITY_CALLBACK__, &context);
}

+ (BOOL)isReachableForLocalWiFiWithFlags:(unsigned int)a3
{
  return (~a3 & 0x20002) == 0;
}

+ (BOOL)isReachableForNetworkWithFlags:(unsigned int)a3
{
  BOOL v3 = (a3 & 0x28) != 0;
  if ((a3 & 0x10) != 0) {
    BOOL v3 = 0;
  }
  BOOL v4 = (a3 & 4) == 0 || v3;
  return (a3 & 2) != 0 && v4;
}

- (CATAddress)address
{
  return self->_address;
}

- (CATNetworkReachabilityDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CATNetworkReachabilityDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_SCNetworkReachabilityFlags flags = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_address, 0);
}

@end