@interface CRXUNetworkReachability
+ (CRXUNetworkReachability)sharedInstance;
- (BOOL)isConnected;
- (CRXUNetworkReachability)init;
- (void)addNetworkObserver:(id)a3;
- (void)dealloc;
- (void)noteReachabilityChange;
- (void)registerNetworkReachabilityCallback;
- (void)removeNetworkObserver:(id)a3;
@end

@implementation CRXUNetworkReachability

+ (CRXUNetworkReachability)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__CRXUNetworkReachability_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance___once__LINE___0 != -1) {
    dispatch_once(&sharedInstance___once__LINE___0, block);
  }
  v2 = (void *)sharedInstance_instance_0;
  return (CRXUNetworkReachability *)v2;
}

uint64_t __41__CRXUNetworkReachability_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_instance_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (CRXUNetworkReachability)init
{
  v11.receiver = self;
  v11.super_class = (Class)CRXUNetworkReachability;
  id v2 = [(CRXUNetworkReachability *)&v11 init];
  v3 = (CRXUNetworkReachability *)v2;
  if (v2)
  {
    *((void *)v2 + 2) = 0;
    *((void *)v2 + 3) = 0;
    *((_WORD *)v2 + 8) = 528;
    *((void *)v2 + 1) = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x263EFFB08], (const sockaddr *)v2 + 1);
    uint64_t v4 = +[CRXUDispatchQueue serialQueueWithName:@"com.apple.CorePrescription.NetworkQueue"];
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (CRXUDispatchQueue *)v4;

    [(CRXUNetworkReachability *)v3 registerNetworkReachabilityCallback];
    v6 = objc_alloc_init(CRXUWeakObserverList);
    observers = v3->_observers;
    v3->_observers = v6;

    os_log_t v8 = os_log_create(CRXULoggingSubsystem, CRXULoggingCategory);
    log = v3->_log;
    v3->_log = (OS_os_log *)v8;
  }
  return v3;
}

- (void)dealloc
{
  CFRelease(self->_reachabilityRef);
  v3.receiver = self;
  v3.super_class = (Class)CRXUNetworkReachability;
  [(CRXUNetworkReachability *)&v3 dealloc];
}

- (BOOL)isConnected
{
  SCNetworkReachabilityFlags flags = 0;
  return SCNetworkReachabilityGetFlags(self->_reachabilityRef, &flags) && (flags & 2) != 0;
}

- (void)addNetworkObserver:(id)a3
{
}

- (void)removeNetworkObserver:(id)a3
{
}

- (void)registerNetworkReachabilityCallback
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  int v2 = 86;
  _os_log_error_impl(&dword_24C484000, v0, OS_LOG_TYPE_ERROR, "%s @%d: Error in observing network calls", v1, 0x12u);
}

- (void)noteReachabilityChange
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  int v2 = 92;
  _os_log_debug_impl(&dword_24C484000, v0, OS_LOG_TYPE_DEBUG, "%s @%d: (notify) internet is Connected", v1, 0x12u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end