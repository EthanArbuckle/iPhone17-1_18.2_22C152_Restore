@interface HMFHTTPClient
+ (id)baseURLWithScheme:(id)a3 hostAddress:(id)a4 port:(unint64_t)a5;
+ (id)logCategory;
- (BOOL)allowAnonymousConnection;
- (BOOL)isActive;
- (BOOL)isPinging;
- (BOOL)isReachable;
- (BOOL)requestClientReachabilityPingWithRetry:(BOOL)a3;
- (HMFHTTPClient)init;
- (HMFHTTPClient)initWithBaseURL:(id)a3 configuration:(id)a4;
- (HMFHTTPClient)initWithBaseURL:(id)a3 configuration:(id)a4 netManager:(id)a5;
- (HMFHTTPClient)initWithBaseURL:(id)a3 configuration:(id)a4 session:(id)a5 reachabilityMonitor:(id)a6 netManager:(id)a7;
- (HMFHTTPClient)initWithBaseURL:(id)a3 options:(unint64_t)a4;
- (HMFHTTPClient)initWithNetService:(id)a3 options:(unint64_t)a4;
- (HMFHTTPClient)initWithService:(id)a3 configuration:(id)a4;
- (HMFHTTPClient)initWithService:(id)a3 configuration:(id)a4 netManager:(id)a5;
- (HMFHTTPClient)initWithService:(id)a3 configuration:(id)a4 session:(id)a5 reachabilityMonitor:(id)a6 netManager:(id)a7;
- (HMFHTTPClientConfiguration)configuration;
- (HMFHTTPClientDelegate)delegate;
- (HMFNetManager)netManager;
- (HMFNetMonitor)reachabilityMonitor;
- (HMFNetService)netService;
- (HMFTimer)delegatedPingTimer;
- (NSOperationQueue)reachabilityProbeQueue;
- (NSString)debugDescription;
- (NSURL)baseURL;
- (NSURLSession)session;
- (id)attributeDescriptions;
- (id)createNSURLSession:(id)a3;
- (id)logIdentifier;
- (id)timerFactory;
- (unint64_t)options;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)_sendRequest:(id)a3 baseURL:(id)a4 completionHandler:(id)a5;
- (void)cancelPendingRequests;
- (void)dealloc;
- (void)finishCommonInitialization;
- (void)invalidate;
- (void)networkMonitorIsReachable:(id)a3;
- (void)networkMonitorIsUnreachable:(id)a3;
- (void)resolveWithCompletionHandler:(id)a3;
- (void)sendRequest:(id)a3 completionHandler:(id)a4;
- (void)setActive:(BOOL)a3;
- (void)setAllowAnonymousConnection:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegatedPingTimer:(id)a3;
- (void)setPinging:(BOOL)a3;
- (void)setReachable:(BOOL)a3;
- (void)setTimerFactory:(id)a3;
- (void)startDelegatedPingTimer;
- (void)startReachabilityProbe;
- (void)stopDelegatedPingTimer;
- (void)timerDidFire:(id)a3;
@end

@implementation HMFHTTPClient

+ (id)baseURLWithScheme:(id)a3 hostAddress:(id)a4 port:(unint64_t)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8)
  {
    v16 = (void *)MEMORY[0x19F3A87A0]();
    id v17 = a1;
    v18 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    v19 = HMFGetLogIdentifier(v17);
    *(_DWORD *)buf = 138543362;
    v27 = v19;
    v20 = "%{public}@Scheme is required";
LABEL_12:
    _os_log_impl(&dword_19D57B000, v18, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);

    goto LABEL_13;
  }
  if (!v9)
  {
    v16 = (void *)MEMORY[0x19F3A87A0]();
    id v17 = a1;
    v18 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    v19 = HMFGetLogIdentifier(v17);
    *(_DWORD *)buf = 138543362;
    v27 = v19;
    v20 = "%{public}@Host address is required";
    goto LABEL_12;
  }
  if (!a5)
  {
    v16 = (void *)MEMORY[0x19F3A87A0]();
    id v17 = a1;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier(v17);
      *(_DWORD *)buf = 138543362;
      v27 = v19;
      v20 = "%{public}@Port is required";
      goto LABEL_12;
    }
LABEL_13:

    v15 = 0;
    goto LABEL_14;
  }
  if ([v9 addressFamily] == 2)
  {
    v11 = [v10 addressString];
    v12 = [v11 stringByReplacingOccurrencesOfString:@"%" withString:@"%25"];

    v13 = (void *)MEMORY[0x1E4F1CB10];
    v14 = [NSString stringWithFormat:@"%@://[%@]:%tu", v8, v12, a5];
    v15 = [v13 URLWithString:v14];
  }
  else
  {
    v22 = (void *)MEMORY[0x1E4F1CB10];
    v23 = NSString;
    v24 = [v10 addressString];
    v25 = [v23 stringWithFormat:@"%@://%@:%tu", v8, v24, a5];
    v15 = [v22 URLWithString:v25];
  }
LABEL_14:

  return v15;
}

- (HMFHTTPClient)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMFHTTPClient)initWithBaseURL:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(HMFHTTPClientConfiguration);
  id v8 = v7;
  if ((v4 & 1) == 0)
  {
    if ((v4 & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    [(HMFHTTPClientConfiguration *)v8 setMonitorsReachability:1];
    if ((v4 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  [(HMFHTTPClientConfiguration *)v7 setRequiresEncryption:1];
  if ((v4 & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((v4 & 4) != 0) {
LABEL_4:
  }
    [(HMFHTTPClientConfiguration *)v8 setSupportsWakeOnLAN:1];
LABEL_5:
  id v9 = [(HMFHTTPClient *)self initWithBaseURL:v6 configuration:v8];

  return v9;
}

- (HMFHTTPClient)initWithBaseURL:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[HMFNetManager sharedManager];
  id v9 = [(HMFHTTPClient *)self initWithBaseURL:v7 configuration:v6 netManager:v8];

  return v9;
}

- (HMFHTTPClient)initWithBaseURL:(id)a3 configuration:(id)a4 netManager:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  v12 = [v11 scheme];

  if (v12 && ([v11 host], v13 = objc_claimAutoreleasedReturnValue(), v13, v13))
  {
    v14 = [v11 port];

    if (v14)
    {
      v15 = [v11 baseURL];

      if (v15)
      {
        uint64_t v16 = [v11 baseURL];

        id v11 = (id)v16;
      }
      if ([v9 monitorsReachability])
      {
        id v17 = [HMFNetAddress alloc];
        v18 = [v11 host];
        v19 = [(HMFNetAddress *)v17 initWithHostname:v18];

        v20 = [[HMFNetMonitor alloc] initWithNetAddress:v19];
      }
      else
      {
        v20 = 0;
      }
      v26 = [(HMFHTTPClient *)self createNSURLSession:v9];
      v22 = [(HMFHTTPClient *)self initWithBaseURL:v11 configuration:v9 session:v26 reachabilityMonitor:v20 netManager:v10];

      v25 = v22;
      goto LABEL_14;
    }
  }
  else
  {
  }
  v21 = (void *)MEMORY[0x19F3A87A0]();
  v22 = self;
  v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = HMFGetLogIdentifier(v22);
    int v28 = 138543618;
    v29 = v24;
    __int16 v30 = 2112;
    id v31 = v11;
    _os_log_impl(&dword_19D57B000, v23, OS_LOG_TYPE_ERROR, "%{public}@Invalid base URL: %@", (uint8_t *)&v28, 0x16u);
  }
  v25 = 0;
LABEL_14:

  return v25;
}

- (HMFHTTPClient)initWithBaseURL:(id)a3 configuration:(id)a4 session:(id)a5 reachabilityMonitor:(id)a6 netManager:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)HMFHTTPClient;
  id v17 = [(HMFHTTPClient *)&v27 init];
  v18 = v17;
  if (v17)
  {
    v19 = (const char *)HMFDispatchQueueName(v17, 0);
    dispatch_queue_t v20 = dispatch_queue_create(v19, 0);
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v20;

    uint64_t v22 = [v12 copy];
    baseURL = v18->_baseURL;
    v18->_baseURL = (NSURL *)v22;

    uint64_t v24 = [v13 copy];
    configuration = v18->_configuration;
    v18->_configuration = (HMFHTTPClientConfiguration *)v24;

    objc_storeStrong((id *)&v18->_session, a5);
    objc_storeStrong((id *)&v18->_reachabilityMonitor, a6);
    objc_storeStrong((id *)&v18->_netManager, a7);
    [(HMFHTTPClient *)v18 finishCommonInitialization];
  }

  return v18;
}

- (HMFHTTPClient)initWithNetService:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(HMFHTTPClientConfiguration);
  id v8 = v7;
  if ((v4 & 1) == 0)
  {
    if ((v4 & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    [(HMFHTTPClientConfiguration *)v8 setMonitorsReachability:1];
    if ((v4 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  [(HMFHTTPClientConfiguration *)v7 setRequiresEncryption:1];
  if ((v4 & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((v4 & 4) != 0) {
LABEL_4:
  }
    [(HMFHTTPClientConfiguration *)v8 setSupportsWakeOnLAN:1];
LABEL_5:
  id v9 = [(HMFHTTPClient *)self initWithService:v6 configuration:v8];

  return v9;
}

- (HMFHTTPClient)initWithService:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[HMFNetManager sharedManager];
  id v9 = [(HMFHTTPClient *)self initWithService:v7 configuration:v6 netManager:v8];

  return v9;
}

- (HMFHTTPClient)initWithService:(id)a3 configuration:(id)a4 netManager:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if ([v9 monitorsReachability]) {
      id v11 = [[HMFNetMonitor alloc] initWithNetService:v8];
    }
    else {
      id v11 = 0;
    }
    id v17 = [(HMFHTTPClient *)self createNSURLSession:v9];
    id v13 = [(HMFHTTPClient *)self initWithService:v8 configuration:v9 session:v17 reachabilityMonitor:v11 netManager:v10];

    id v16 = v13;
  }
  else
  {
    id v12 = (void *)MEMORY[0x19F3A87A0]();
    id v13 = self;
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier(v13);
      int v19 = 138543362;
      dispatch_queue_t v20 = v15;
      _os_log_impl(&dword_19D57B000, v14, OS_LOG_TYPE_ERROR, "%{public}@Network service is required", (uint8_t *)&v19, 0xCu);
    }
    id v16 = 0;
  }

  return v16;
}

- (HMFHTTPClient)initWithService:(id)a3 configuration:(id)a4 session:(id)a5 reachabilityMonitor:(id)a6 netManager:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v30.receiver = self;
  v30.super_class = (Class)HMFHTTPClient;
  v18 = [(HMFHTTPClient *)&v30 init];
  int v19 = v18;
  if (v18)
  {
    dispatch_queue_t v20 = (const char *)HMFDispatchQueueName(v18, 0);
    dispatch_queue_t v21 = dispatch_queue_create(v20, 0);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v21;

    objc_storeStrong((id *)&v19->_netService, a3);
    uint64_t v23 = [v14 copy];
    configuration = v19->_configuration;
    v19->_configuration = (HMFHTTPClientConfiguration *)v23;

    objc_storeStrong((id *)&v19->_session, a5);
    objc_storeStrong((id *)&v19->_reachabilityMonitor, a6);
    objc_storeStrong((id *)&v19->_netManager, a7);
    if (v19->_reachabilityMonitor)
    {
      v25 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
      reachabilityProbeQueue = v19->_reachabilityProbeQueue;
      v19->_reachabilityProbeQueue = v25;

      objc_super v27 = v19->_reachabilityProbeQueue;
      int v28 = objc_msgSend(NSString, "stringWithFormat:", @"%s", HMFDispatchQueueName(v19, @"reachabilityProbeQueue"));
      [(NSOperationQueue *)v27 setName:v28];

      [(NSOperationQueue *)v19->_reachabilityProbeQueue setMaxConcurrentOperationCount:1];
      [(NSOperationQueue *)v19->_reachabilityProbeQueue setQualityOfService:25];
    }
    [(HMFHTTPClient *)v19 finishCommonInitialization];
  }

  return v19;
}

- (id)createNSURLSession:(id)a3
{
  char v4 = (void *)MEMORY[0x1E4F18DD0];
  id v5 = a3;
  id v6 = [v4 defaultSessionConfiguration];
  [v6 setHTTPCookieAcceptPolicy:1];
  [v6 setHTTPCookieStorage:0];
  [v6 setHTTPShouldSetCookies:0];
  [v6 setURLCredentialStorage:0];
  [v6 setURLCache:0];
  [v6 setHTTPShouldUsePipelining:1];
  uint64_t v7 = [v5 allowsCellularAccess];

  [v6 setAllowsCellularAccess:v7];
  id v8 = (void *)MEMORY[0x1E4F18DC0];
  id v9 = [MEMORY[0x1E4F28F08] mainQueue];
  id v10 = [v8 sessionWithConfiguration:v6 delegate:self delegateQueue:v9];

  return v10;
}

- (void)finishCommonInitialization
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  self->_reachable = 1;
  id timerFactory = self->_timerFactory;
  self->_id timerFactory = &__block_literal_global_31;

  [(HMFNetMonitor *)self->_reachabilityMonitor setDelegate:self];
  if ([(HMFHTTPClientConfiguration *)self->_configuration supportsWakeOnLAN])
  {
    char v4 = (void *)MEMORY[0x19F3A87A0]();
    id v5 = self;
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier(v5);
      int v8 = 138543362;
      id v9 = v7;
      _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_INFO, "%{public}@Registering for WOW assertion", (uint8_t *)&v8, 0xCu);
    }
    [(HMFNetManager *)v5->_netManager registerWoWAssertionForObject:v5];
  }
  [(HMFHTTPClient *)self resolveWithCompletionHandler:0];
}

HMFExponentialBackoffTimer *__43__HMFHTTPClient_finishCommonInitialization__block_invoke()
{
  v0 = [[HMFExponentialBackoffTimer alloc] initWithMinimumTimeInterval:3 maximumTimeInterval:1 exponentialFactor:1.0 options:1800.0];
  return v0;
}

- (void)dealloc
{
  [(HMFNetManager *)self->_netManager deregisterObject:self];
  v3.receiver = self;
  v3.super_class = (Class)HMFHTTPClient;
  [(HMFHTTPClient *)&v3 dealloc];
}

- (id)attributeDescriptions
{
  v9[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [HMFAttributeDescription alloc];
  char v4 = [(HMFHTTPClient *)self baseURL];
  id v5 = +[HMFPrivateObjectFormatter defaultFormatter];
  id v6 = [(HMFAttributeDescription *)v3 initWithName:@"URL" value:v4 options:0 formatter:v5];
  v9[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  return v7;
}

- (NSString)debugDescription
{
  objc_super v3 = NSString;
  char v4 = [(id)objc_opt_class() shortDescription];
  id v5 = [(HMFHTTPClient *)self baseURL];
  id v6 = [(HMFHTTPClient *)self session];
  uint64_t v7 = [v6 description];
  int v8 = [v3 stringWithFormat:@"<%@ URL = %@, Session = %@, active = %d, pinging = %d, proxy = %d, reachable = %d>", v4, v5, v7, -[HMFHTTPClient isActive](self, "isActive"), -[HMFHTTPClient isPinging](self, "isPinging"), -[HMFHTTPClient isProxy](self, "isProxy"), -[HMFHTTPClient isReachable](self, "isReachable")];

  return (NSString *)v8;
}

- (HMFHTTPClientConfiguration)configuration
{
  v2 = (void *)[(HMFHTTPClientConfiguration *)self->_configuration copy];
  return (HMFHTTPClientConfiguration *)v2;
}

- (unint64_t)options
{
  unint64_t v3 = [(HMFHTTPClientConfiguration *)self->_configuration requiresEncryption];
  if ([(HMFHTTPClientConfiguration *)self->_configuration monitorsReachability]) {
    v3 |= 2uLL;
  }
  if ([(HMFHTTPClientConfiguration *)self->_configuration supportsWakeOnLAN]) {
    return v3 | 4;
  }
  else {
    return v3;
  }
}

- (NSURL)baseURL
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  netService = self->_netService;
  if (netService)
  {
    char v4 = [(HMFNetService *)netService hostName];
    id v5 = [(HMFNetService *)self->_netService addresses];
    unint64_t v6 = [(HMFNetService *)self->_netService port];
    if ([v5 count]) {
      BOOL v7 = v6 == -1;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      int v8 = 0;
    }
    else
    {
      if ([(HMFHTTPClientConfiguration *)self->_configuration requiresEncryption]) {
        uint64_t v10 = @"https";
      }
      else {
        uint64_t v10 = @"http";
      }
      if (v4)
      {
        id v11 = v4;
      }
      else
      {
        id v11 = [v5 firstObject];
      }
      id v12 = v11;
      if ([(HMFHTTPClientConfiguration *)self->_configuration supportsWakeOnLAN])
      {
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v13 = v5;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          v25 = v10;
          uint64_t v16 = *(void *)v27;
          while (2)
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v27 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
              if ([v18 addressFamily] == 1)
              {
                id v19 = v18;

                id v12 = v19;
                goto LABEL_26;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v15) {
              continue;
            }
            break;
          }
LABEL_26:
          uint64_t v10 = v25;
        }

        if ([v12 addressFamily] != 1)
        {
          dispatch_queue_t v20 = (void *)MEMORY[0x19F3A87A0]();
          dispatch_queue_t v21 = self;
          uint64_t v22 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            uint64_t v23 = HMFGetLogIdentifier(v21);
            *(_DWORD *)buf = 138543618;
            id v31 = v23;
            __int16 v32 = 2112;
            v33 = v12;
            _os_log_impl(&dword_19D57B000, v22, OS_LOG_TYPE_INFO, "%{public}@No available IPv4 address, falling back to '%@', WoW may fail.", buf, 0x16u);
          }
        }
      }
      int v8 = +[HMFHTTPClient baseURLWithScheme:v10 hostAddress:v12 port:v6];
    }
  }
  else
  {
    int v8 = self->_baseURL;
  }
  return v8;
}

- (BOOL)isReachable
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_reachable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setReachable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_reachable == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_reachable = v3;
    if (!v3) {
      self->_active = 0;
    }
    os_unfair_lock_unlock(p_lock);
    unint64_t v6 = self;
    BOOL v7 = (void *)MEMORY[0x19F3A87A0]();
    int v8 = v6;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier(v8);
      id v11 = (void *)v10;
      id v12 = @"unreachable";
      if (v3) {
        id v12 = @"reachable";
      }
      int v14 = 138543618;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = v12;
      _os_log_impl(&dword_19D57B000, v9, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of reachablity change to %@", (uint8_t *)&v14, 0x16u);
    }
    id v13 = [(HMFHTTPClient *)v8 delegate];
    if (v3)
    {
      if (objc_opt_respondsToSelector()) {
        [v13 clientDidBecomeReachable:v8];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      [v13 clientDidBecomeUnreachable:v8];
    }
  }
}

- (BOOL)isPinging
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_pinging;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setPinging:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_pinging = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)startReachabilityProbe
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__HMFHTTPClient_startReachabilityProbe__block_invoke;
  block[3] = &unk_1E5957698;
  block[4] = self;
  dispatch_async(queue, block);
}

void __39__HMFHTTPClient_startReachabilityProbe__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 56);
  BOOL v3 = v2;
  if (v2)
  {
    if ([v2 isPublishing])
    {
      char v4 = (void *)MEMORY[0x19F3A87A0]();
      id v5 = *(id *)(a1 + 32);
      unint64_t v6 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v7 = HMFGetLogIdentifier(v5);
        *(_DWORD *)buf = 138543362;
        uint64_t v23 = v7;
        _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Starting net service reachability resolution", buf, 0xCu);
      }
      int v8 = objc_alloc_init(HMFBlockOperation);
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      objc_initWeak(&location, v8);
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      __int16 v16 = __39__HMFHTTPClient_startReachabilityProbe__block_invoke_74;
      id v17 = &unk_1E5958298;
      objc_copyWeak(&v19, &location);
      objc_copyWeak(&v20, (id *)buf);
      id v18 = v3;
      [(HMFBlockOperation *)v8 addExecutionBlock:&v14];
      id v9 = objc_msgSend(*(id *)(a1 + 32), "reachabilityProbeQueue", v14, v15, v16, v17);
      [v9 addOperation:v8];

      objc_destroyWeak(&v20);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);
    }
    else if ([*(id *)(a1 + 32) isReachable] {
           && ([*(id *)(a1 + 32) isPinging] & 1) == 0)
    }
    {
      uint64_t v10 = (void *)MEMORY[0x19F3A87A0]();
      id v11 = *(id *)(a1 + 32);
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = HMFGetLogIdentifier(v11);
        *(_DWORD *)buf = 138543362;
        uint64_t v23 = v13;
        _os_log_impl(&dword_19D57B000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Service is unreachable, performing a one-time ping", buf, 0xCu);
      }
      if (([*(id *)(a1 + 32) requestClientReachabilityPingWithRetry:0] & 1) == 0) {
        [*(id *)(a1 + 32) setReachable:0];
      }
    }
  }
  else if (([*(id *)(a1 + 32) requestClientReachabilityPingWithRetry:1] & 1) == 0)
  {
    [*(id *)(a1 + 32) setReachable:0];
  }
}

void __39__HMFHTTPClient_startReachabilityProbe__block_invoke_74(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v4 = WeakRetained;
  if (WeakRetained && ([WeakRetained isCancelled] & 1) == 0)
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 48));
    unint64_t v6 = (void *)MEMORY[0x19F3A87A0]();
    id v7 = v5;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier(v7);
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      __int16 v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      _os_log_impl(&dword_19D57B000, v8, OS_LOG_TYPE_INFO, "%{public}@Starting confirmation for service: %@", buf, 0x16u);
    }
    id v11 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __39__HMFHTTPClient_startReachabilityProbe__block_invoke_75;
    v12[3] = &unk_1E5957F80;
    objc_copyWeak(&v13, v2);
    objc_copyWeak(&v14, (id *)(a1 + 48));
    [v11 confirmWithTimeout:v12 completionHandler:15.0];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
  }
}

void __39__HMFHTTPClient_startReachabilityProbe__block_invoke_75(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained && ([WeakRetained isCancelled] & 1) == 0)
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 40));
    id v7 = v6;
    if (v3)
    {
      int v8 = [v6 isReachable];
      id v9 = (void *)MEMORY[0x19F3A87A0]();
      id v10 = v7;
      id v11 = HMFGetOSLogHandle();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v12)
        {
          id v13 = HMFGetLogIdentifier(v10);
          int v21 = 138543362;
          uint64_t v22 = v13;
          _os_log_impl(&dword_19D57B000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to confirm service, marking the client as unreachable", (uint8_t *)&v21, 0xCu);
        }
        [v10 setReachable:0];
      }
      else
      {
        if (v12)
        {
          id v20 = HMFGetLogIdentifier(v10);
          int v21 = 138543362;
          uint64_t v22 = v20;
          _os_log_impl(&dword_19D57B000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to confirm service, the client is already unreachable", (uint8_t *)&v21, 0xCu);
        }
      }
    }
    else
    {
      id v14 = [v6 reachabilityProbeQueue];
      [v14 cancelAllOperations];

      uint64_t v15 = [v7 delegatedPingTimer];

      if (!v15)
      {
        __int16 v16 = (void *)MEMORY[0x19F3A87A0]();
        id v17 = v7;
        uint64_t v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          uint64_t v19 = HMFGetLogIdentifier(v17);
          int v21 = 138543362;
          uint64_t v22 = v19;
          _os_log_impl(&dword_19D57B000, v18, OS_LOG_TYPE_INFO, "%{public}@Confirmed service, requesting application ping", (uint8_t *)&v21, 0xCu);
        }
        [v17 requestClientReachabilityPingWithRetry:1];
      }
    }
    [v5 finish];
  }
}

- (BOOL)requestClientReachabilityPingWithRetry:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMFHTTPClient *)self delegate];
  char v6 = objc_opt_respondsToSelector();
  if (v6)
  {
    BOOL v7 = [(HMFHTTPClient *)self isPinging];
    int v8 = (void *)MEMORY[0x19F3A87A0]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v11)
      {
        BOOL v12 = HMFGetLogIdentifier(v9);
        *(_DWORD *)buf = 138543362;
        uint64_t v19 = v12;
        _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_INFO, "%{public}@Client ping in progress, dropping ping request", buf, 0xCu);
      }
    }
    else
    {
      if (v11)
      {
        id v13 = HMFGetLogIdentifier(v9);
        *(_DWORD *)buf = 138543362;
        uint64_t v19 = v13;
        _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_INFO, "%{public}@Requesting client to perform a ping", buf, 0xCu);
      }
      [(HMFHTTPClient *)v9 setPinging:1];
      objc_initWeak((id *)buf, v9);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __56__HMFHTTPClient_requestClientReachabilityPingWithRetry___block_invoke;
      v15[3] = &unk_1E59582C0;
      objc_copyWeak(&v16, (id *)buf);
      BOOL v17 = a3;
      [v5 client:v9 didRequestPingWithCompletionHandler:v15];
      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
  }

  return v6 & 1;
}

void __56__HMFHTTPClient_requestClientReachabilityPingWithRetry___block_invoke(uint64_t a1, char a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = [WeakRetained setPinging:0];
  if (a2)
  {
    char v6 = (void *)MEMORY[0x19F3A87A0](v5);
    id v7 = WeakRetained;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = HMFGetLogIdentifier(v7);
      int v17 = 138543362;
      uint64_t v18 = v9;
      _os_log_impl(&dword_19D57B000, v8, OS_LOG_TYPE_INFO, "%{public}@Delegated ping succeeded, marking the client as reachable", (uint8_t *)&v17, 0xCu);
    }
    [v7 setReachable:1];
    [v7 stopDelegatedPingTimer];
  }
  else
  {
    int v10 = [WeakRetained isReachable];
    BOOL v11 = (void *)MEMORY[0x19F3A87A0]();
    id v12 = WeakRetained;
    id v13 = HMFGetOSLogHandle();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v14)
      {
        uint64_t v15 = HMFGetLogIdentifier(v12);
        int v17 = 138543362;
        uint64_t v18 = v15;
        _os_log_impl(&dword_19D57B000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Delegated ping failed, marking the client as unreachable", (uint8_t *)&v17, 0xCu);
      }
      [v12 setReachable:0];
    }
    else
    {
      if (v14)
      {
        id v16 = HMFGetLogIdentifier(v12);
        int v17 = 138543362;
        uint64_t v18 = v16;
        _os_log_impl(&dword_19D57B000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Delegated ping failed, the client is already unreachable", (uint8_t *)&v17, 0xCu);
      }
    }
    if (*(unsigned char *)(a1 + 40)) {
      [v12 startDelegatedPingTimer];
    }
  }
}

- (void)startDelegatedPingTimer
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__HMFHTTPClient_startDelegatedPingTimer__block_invoke;
  block[3] = &unk_1E5957698;
  block[4] = self;
  dispatch_async(queue, block);
}

void __40__HMFHTTPClient_startDelegatedPingTimer__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A87A0]();
  id v3 = *(id *)(a1 + 32);
  char v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier(v3);
    int v13 = 138543362;
    BOOL v14 = v5;
    _os_log_impl(&dword_19D57B000, v4, OS_LOG_TYPE_INFO, "%{public}@Going to attempt to retry delegated ping later", (uint8_t *)&v13, 0xCu);
  }
  char v6 = [*(id *)(a1 + 32) delegatedPingTimer];

  if (!v6)
  {
    id v7 = *(void **)(a1 + 32);
    int v8 = [v7 timerFactory];
    id v9 = v8[2]();
    [v7 setDelegatedPingTimer:v9];

    int v10 = [*(id *)(a1 + 32) delegatedPingTimer];
    [v10 setDelegateQueue:*(void *)(*(void *)(a1 + 32) + 16)];

    BOOL v11 = [*(id *)(a1 + 32) delegatedPingTimer];
    [v11 setDelegate:*(void *)(a1 + 32)];
  }
  id v12 = [*(id *)(a1 + 32) delegatedPingTimer];
  [v12 resume];
}

- (void)stopDelegatedPingTimer
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__HMFHTTPClient_stopDelegatedPingTimer__block_invoke;
  block[3] = &unk_1E5957698;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __39__HMFHTTPClient_stopDelegatedPingTimer__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegatedPingTimer];
  [v2 suspend];

  id v3 = *(void **)(a1 + 32);
  return [v3 setDelegatedPingTimer:0];
}

- (void)sendRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__HMFHTTPClient_sendRequest_completionHandler___block_invoke;
  block[3] = &unk_1E5958338;
  id v12 = v6;
  int v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __47__HMFHTTPClient_sendRequest_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) internal];
  id v3 = [v2 activity];
  [v3 markWithReason:@"Resolving"];

  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  int v17 = __47__HMFHTTPClient_sendRequest_completionHandler___block_invoke_2;
  uint64_t v18 = &unk_1E5958310;
  char v4 = *(void **)(a1 + 40);
  id v19 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  uint64_t v20 = *(void *)(a1 + 40);
  id v21 = v5;
  id v6 = v4;
  id v7 = &v15;
  int v8 = v7;
  if (v6)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = ____HMFHTTPClientGetBaseURL_block_invoke;
    v25[3] = &unk_1E5958400;
    id v9 = v7;
    long long v26 = v9;
    id v10 = (void (**)(void, void, void))MEMORY[0x19F3A8A20](v25);
    BOOL v11 = objc_msgSend(v6, "netService", v15, v16, v17, v18, v19, v20, v21);
    id v12 = v11;
    if (v11 && ![v11 isResolved])
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = ____HMFHTTPClientGetBaseURL_block_invoke_2;
      v22[3] = &unk_1E5958428;
      id v14 = v6;
      id v23 = v14;
      uint64_t v24 = v9;
      [v14 resolveWithCompletionHandler:v22];

      int v13 = v23;
    }
    else
    {
      int v13 = [v6 baseURL];
      ((void (**)(void, void *, void))v10)[2](v10, v13, 0);
    }
  }
}

void __47__HMFHTTPClient_sendRequest_completionHandler___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] internal];
  int v8 = [v7 activity];
  [v8 markWithReason:@"Resolved"];

  if (v5)
  {
    [a1[5] setActive:1];
    id v10 = a1[4];
    id v9 = a1[5];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47__HMFHTTPClient_sendRequest_completionHandler___block_invoke_3;
    v12[3] = &unk_1E59582E8;
    void v12[4] = v9;
    id v13 = a1[6];
    [v9 _sendRequest:v10 baseURL:v5 completionHandler:v12];
  }
  else
  {
    BOOL v11 = (void (**)(id, void, id))a1[6];
    if (v11) {
      v11[2](v11, 0, v6);
    }
    [a1[5] startReachabilityProbe];
  }
}

void __47__HMFHTTPClient_sendRequest_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v6) {
    goto LABEL_18;
  }
  id v8 = v6;
  id v9 = [v8 domain];
  uint64_t v10 = *MEMORY[0x1E4F289A0];
  if ([v9 isEqualToString:*MEMORY[0x1E4F289A0]])
  {
    uint64_t v11 = [v8 code];

    if (v11 == -999)
    {
      id v12 = (void *)MEMORY[0x19F3A87A0]();
      id v13 = *(id *)(a1 + 32);
      id v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = HMFGetLogIdentifier(v13);
        int v32 = 138543362;
        v33 = v15;
        _os_log_impl(&dword_19D57B000, v14, OS_LOG_TYPE_INFO, "%{public}@Request cancelled, reachability probe is not started", (uint8_t *)&v32, 0xCu);
      }
      goto LABEL_18;
    }
  }
  else
  {
  }
  id v16 = v8;
  int v17 = [v16 domain];
  if ([v17 isEqualToString:v10])
  {
    uint64_t v18 = [v16 code];

    if (v18 == -1001)
    {
      int v20 = [*(id *)(a1 + 32) isReachable];
      id v21 = (void *)MEMORY[0x19F3A87A0]();
      id v22 = *(id *)(a1 + 32);
      id v23 = HMFGetOSLogHandle();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
      if (v20)
      {
        if (v24)
        {
          v25 = HMFGetLogIdentifier(v22);
          int v32 = 138543362;
          v33 = v25;
          _os_log_impl(&dword_19D57B000, v23, OS_LOG_TYPE_INFO, "%{public}@Request timed out, marking the client as unreachable", (uint8_t *)&v32, 0xCu);
        }
        uint64_t v19 = [*(id *)(a1 + 32) setReachable:0];
      }
      else
      {
        if (v24)
        {
          id v31 = HMFGetLogIdentifier(v22);
          int v32 = 138543362;
          v33 = v31;
          _os_log_impl(&dword_19D57B000, v23, OS_LOG_TYPE_INFO, "%{public}@Request timed out, the client is already unreachable", (uint8_t *)&v32, 0xCu);
        }
      }
    }
  }
  else
  {
  }
  long long v26 = (void *)MEMORY[0x19F3A87A0](v19);
  id v27 = *(id *)(a1 + 32);
  long long v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    long long v29 = HMFGetLogIdentifier(v27);
    int v32 = 138543362;
    v33 = v29;
    _os_log_impl(&dword_19D57B000, v28, OS_LOG_TYPE_INFO, "%{public}@Request failed, starting reachability probe", (uint8_t *)&v32, 0xCu);
  }
  [*(id *)(a1 + 32) startReachabilityProbe];
LABEL_18:
  uint64_t v30 = *(void *)(a1 + 40);
  if (v30) {
    (*(void (**)(uint64_t, id, void *))(v30 + 16))(v30, v5, v7);
  }
}

- (void)_sendRequest:(id)a3 baseURL:(id)a4 completionHandler:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 urlRequest];
  id v12 = (void *)[v11 mutableCopy];

  objc_msgSend(v12, "setAllowsCellularAccess:", -[HMFHTTPClientConfiguration allowsCellularAccess](self->_configuration, "allowsCellularAccess"));
  id v13 = (void *)MEMORY[0x1E4F1CB10];
  id v14 = [v12 URL];
  uint64_t v15 = [v14 relativePath];
  id v16 = [v13 URLWithString:v15 relativeToURL:v9];

  int v17 = [v16 baseURL];
  uint64_t v18 = [v12 URL];
  uint64_t v19 = [v18 baseURL];
  char v20 = [v17 isEqual:v19];

  if ((v20 & 1) == 0)
  {
    id v21 = (void *)MEMORY[0x19F3A87A0]();
    id v22 = self;
    id v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      BOOL v24 = HMFGetLogIdentifier(v22);
      *(_DWORD *)buf = 138543618;
      v46 = v24;
      __int16 v47 = 2112;
      v48 = v16;
      _os_log_impl(&dword_19D57B000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Override the request URL to: %@", buf, 0x16u);
    }
    [v12 setURL:v16];
  }
  v25 = [v12 valueForHTTPHeaderField:@"Host"];

  if (!v25)
  {
    long long v26 = [MEMORY[0x1E4F29088] componentsWithURL:v9 resolvingAgainstBaseURL:0];
    id v27 = [v26 host];

    [v12 setValue:v27 forHTTPHeaderField:@"Host"];
  }
  long long v28 = (void *)MEMORY[0x19F3A87A0]();
  long long v29 = self;
  uint64_t v30 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    id v31 = HMFGetLogIdentifier(v29);
    *(_DWORD *)buf = 138543618;
    v46 = v31;
    __int16 v47 = 2112;
    v48 = v12;
    _os_log_impl(&dword_19D57B000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Sending request: %@", buf, 0x16u);
  }
  int v32 = [(HMFHTTPClient *)v29 session];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __56__HMFHTTPClient__sendRequest_baseURL_completionHandler___block_invoke;
  v42[3] = &unk_1E5958360;
  v42[4] = v29;
  id v33 = v8;
  id v43 = v33;
  id v34 = v10;
  id v44 = v34;
  uint64_t v35 = [v32 dataTaskWithRequest:v12 completionHandler:v42];

  v36 = (void *)MEMORY[0x19F3A87A0]();
  v37 = v29;
  v38 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    v39 = HMFGetLogIdentifier(v37);
    *(_DWORD *)buf = 138543618;
    v46 = v39;
    __int16 v47 = 2112;
    v48 = v35;
    _os_log_impl(&dword_19D57B000, v38, OS_LOG_TYPE_INFO, "%{public}@Resuming task: %@", buf, 0x16u);
  }
  v40 = [v33 internal];
  v41 = [v40 activity];
  [v41 markWithReason:@"Sending"];

  [v35 resume];
}

void __56__HMFHTTPClient__sendRequest_baseURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x19F3A87A0]();
  id v11 = *(id *)(a1 + 32);
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v13 = HMFGetLogIdentifier(v11);
    id v14 = [*(id *)(a1 + 40) shortDescription];
    int v36 = 138544130;
    v37 = v13;
    __int16 v38 = 2112;
    v39 = v8;
    __int16 v40 = 2112;
    v41 = v14;
    __int16 v42 = 2112;
    id v43 = v9;
    _os_log_impl(&dword_19D57B000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Received response, %@, to request, %@, with error: %@", (uint8_t *)&v36, 0x2Au);
  }
  id v15 = v9;
  id v16 = v15;
  if (v15) {
    goto LABEL_4;
  }
  id v23 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v24 = v23;
  }
  else {
    BOOL v24 = 0;
  }
  v25 = v24;

  if (v25)
  {
    long long v26 = [*(id *)(a1 + 40) internal];
    id v27 = objc_msgSend(v26, "responseWithStatusCode:", -[HMFHTTPResponse statusCode](v25, "statusCode"));

    long long v28 = [(HMFHTTPResponse *)v25 allHeaderFields];
    [v27 setHeaderFields:v28];

    [v27 setBody:v7];
    id v22 = [[HMFHTTPResponse alloc] initWithRequest:*(void *)(a1 + 40) internalResponse:v27];
  }
  else
  {
    id v16 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3 reason:@"Invalid response scheme type"];
    if (v16)
    {
LABEL_4:
      int v17 = (void *)MEMORY[0x19F3A87A0]();
      id v18 = *(id *)(a1 + 32);
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        char v20 = HMFGetLogIdentifier(v18);
        id v21 = *(HMFHTTPResponse **)(a1 + 40);
        int v36 = 138543874;
        v37 = v20;
        __int16 v38 = 2112;
        v39 = v21;
        __int16 v40 = 2112;
        v41 = v16;
        _os_log_impl(&dword_19D57B000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to send request, %@, with error: %@", (uint8_t *)&v36, 0x20u);
      }
      id v22 = 0;
      goto LABEL_15;
    }
    id v22 = 0;
  }
  int v17 = (void *)MEMORY[0x19F3A87A0]();
  id v18 = *(id *)(a1 + 32);
  uint64_t v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    long long v29 = HMFGetLogIdentifier(v18);
    int v36 = 138543618;
    v37 = v29;
    __int16 v38 = 2112;
    v39 = v22;
    _os_log_impl(&dword_19D57B000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Received response: %@", (uint8_t *)&v36, 0x16u);
  }
  id v16 = 0;
LABEL_15:

  if (*(void *)(a1 + 48))
  {
    uint64_t v30 = [*(id *)(a1 + 40) internal];
    id v31 = [v30 activity];
    [v31 markWithReason:@"Received response"];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  int v32 = [(HMFHTTPResponse *)v22 internal];
  id v33 = [v32 activity];
  [v33 invalidate];

  id v34 = [*(id *)(a1 + 40) internal];
  uint64_t v35 = [v34 activity];
  [v35 invalidate];
}

- (void)cancelPendingRequests
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__HMFHTTPClient_cancelPendingRequests__block_invoke;
  block[3] = &unk_1E5957698;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __38__HMFHTTPClient_cancelPendingRequests__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A87A0]();
  id v3 = *(id *)(a1 + 32);
  char v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier(v3);
    *(_DWORD *)buf = 138543362;
    id v10 = v5;
    _os_log_impl(&dword_19D57B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Cancelling all pending requests", buf, 0xCu);
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  id v6 = [*(id *)(a1 + 32) session];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__HMFHTTPClient_cancelPendingRequests__block_invoke_103;
  v7[3] = &unk_1E5958388;
  objc_copyWeak(&v8, (id *)buf);
  [v6 getAllTasksWithCompletionHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __38__HMFHTTPClient_cancelPendingRequests__block_invoke_103(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = (void *)MEMORY[0x19F3A87A0]();
        id v12 = WeakRetained;
        id v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          id v14 = HMFGetLogIdentifier(v12);
          *(_DWORD *)buf = 138543618;
          char v20 = v14;
          __int16 v21 = 2112;
          id v22 = v10;
          _os_log_impl(&dword_19D57B000, v13, OS_LOG_TYPE_INFO, "%{public}@Canceling task: %@", buf, 0x16u);
        }
        [v10 cancel];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v7);
  }
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__HMFHTTPClient_invalidate__block_invoke;
  block[3] = &unk_1E5957698;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __27__HMFHTTPClient_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F3A87A0]();
  id v3 = *(id *)(a1 + 32);
  char v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier(v3);
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_19D57B000, v4, OS_LOG_TYPE_INFO, "%{public}@Invalidating the client", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v6 = [*(id *)(a1 + 32) session];
  [v6 invalidateAndCancel];
}

- (void)resolveWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_netService)
  {
    objc_initWeak(&location, self);
    netService = self->_netService;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__HMFHTTPClient_resolveWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E59583D8;
    objc_copyWeak(&v9, &location);
    id v8 = v5;
    [(HMFNetService *)netService resolveWithTimeout:v7 completionHandler:15.0];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __46__HMFHTTPClient_resolveWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    int v7 = *(void **)(a1 + 32);
    if (v7)
    {
      id v8 = WeakRetained[2];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      void v9[2] = __46__HMFHTTPClient_resolveWithCompletionHandler___block_invoke_2;
      v9[3] = &unk_1E59583B0;
      id v11 = v7;
      id v10 = v4;
      dispatch_async(v8, v9);
    }
  }
}

uint64_t __46__HMFHTTPClient_resolveWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (id)logCategory
{
  if (_MergedGlobals_3_12 != -1) {
    dispatch_once(&_MergedGlobals_3_12, &__block_literal_global_107);
  }
  id v2 = (void *)qword_1EB4EEB70;
  return v2;
}

uint64_t __28__HMFHTTPClient_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle(@"Networking.HTTP.Client", @"com.apple.HMFoundation");
  uint64_t v1 = qword_1EB4EEB70;
  qword_1EB4EEB70 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)logIdentifier
{
  netService = self->_netService;
  if (netService)
  {
    id v4 = NSString;
    id v5 = [(HMFNetService *)netService domain];
    uint64_t v6 = [(HMFNetService *)self->_netService type];
    int v7 = [(HMFNetService *)self->_netService name];
    id v8 = [v4 stringWithFormat:@"%@%@%@", v5, v6, v7];
  }
  else
  {
    id v5 = [(HMFHTTPClient *)self baseURL];
    id v8 = [v5 absoluteString];
  }

  return v8;
}

- (void)networkMonitorIsReachable:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__HMFHTTPClient_networkMonitorIsReachable___block_invoke;
  block[3] = &unk_1E5957698;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __43__HMFHTTPClient_networkMonitorIsReachable___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  if (v2[7])
  {
    __HMFHTTPClientHandleReachabilityChange(v2, 1);
  }
  else
  {
    id v3 = (void *)MEMORY[0x19F3A87A0]();
    id v4 = *(id *)(a1 + 32);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = HMFGetLogIdentifier(v4);
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_19D57B000, v5, OS_LOG_TYPE_INFO, "%{public}@Received notification that the client is now reachable", (uint8_t *)&v7, 0xCu);
    }
    [*(id *)(a1 + 32) setReachable:1];
  }
}

- (void)networkMonitorIsUnreachable:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__HMFHTTPClient_networkMonitorIsUnreachable___block_invoke;
  block[3] = &unk_1E5957698;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __45__HMFHTTPClient_networkMonitorIsUnreachable___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  if (v2[7])
  {
    __HMFHTTPClientHandleReachabilityChange(v2, 0);
  }
  else
  {
    id v3 = (void *)MEMORY[0x19F3A87A0]();
    id v4 = *(id *)(a1 + 32);
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = HMFGetLogIdentifier(v4);
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_19D57B000, v5, OS_LOG_TYPE_INFO, "%{public}@Received notification that the client is no longer reachable", (uint8_t *)&v7, 0xCu);
    }
    [*(id *)(a1 + 32) setReachable:0];
  }
}

- (void)timerDidFire:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)MEMORY[0x19F3A87A0]();
  uint64_t v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier(v6);
    int v14 = 138543362;
    long long v15 = v8;
    _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Delegated ping timer fired", (uint8_t *)&v14, 0xCu);
  }
  [v4 suspend];
  netService = v6->_netService;
  if (!netService || [(HMFNetService *)netService isPublishing])
  {
    id v10 = (void *)MEMORY[0x19F3A87A0]();
    id v11 = v6;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = HMFGetLogIdentifier(v11);
      int v14 = 138543362;
      long long v15 = v13;
      _os_log_impl(&dword_19D57B000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Retrying delegated ping", (uint8_t *)&v14, 0xCu);
    }
    if (![(HMFHTTPClient *)v11 requestClientReachabilityPingWithRetry:1]) {
      [(HMFHTTPClient *)v11 stopDelegatedPingTimer];
    }
  }
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x19F3A87A0]();
  uint64_t v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = HMFGetLogIdentifier(v9);
    int v12 = 138543618;
    id v13 = v11;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Session did become invalid with error: %@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = (void *)MEMORY[0x19F3A87A0]();
  int v12 = self;
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    __int16 v14 = HMFGetLogIdentifier(v12);
    int v22 = 138543618;
    id v23 = v14;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_19D57B000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Received challenge: %@", (uint8_t *)&v22, 0x16u);
  }
  if ([(HMFHTTPClientConfiguration *)v12->_configuration allowsAnonymousConnection]
    || [(HMFHTTPClient *)v12 allowAnonymousConnection])
  {
    id v15 = (void *)MEMORY[0x19F3A87A0]();
    uint64_t v16 = v12;
    long long v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      long long v18 = HMFGetLogIdentifier(v16);
      int v22 = 138543362;
      id v23 = v18;
      _os_log_impl(&dword_19D57B000, v17, OS_LOG_TYPE_INFO, "%{public}@Received connection challenge, accepting the server's certificate as the client is set to allow anonymous connections", (uint8_t *)&v22, 0xCu);
    }
    uint64_t v19 = (void *)MEMORY[0x1E4F18D88];
    char v20 = [v9 protectionSpace];
    __int16 v21 = objc_msgSend(v19, "credentialForTrust:", objc_msgSend(v20, "serverTrust"));
    v10[2](v10, 0, v21);
  }
  else
  {
    v10[2](v10, 1, 0);
  }
}

- (HMFHTTPClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMFHTTPClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HMFNetService)netService
{
  return self->_netService;
}

- (BOOL)allowAnonymousConnection
{
  return self->_allowAnonymousConnection;
}

- (void)setAllowAnonymousConnection:(BOOL)a3
{
  self->_allowAnonymousConnection = a3;
}

- (NSURLSession)session
{
  return self->_session;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (HMFNetMonitor)reachabilityMonitor
{
  return self->_reachabilityMonitor;
}

- (NSOperationQueue)reachabilityProbeQueue
{
  return self->_reachabilityProbeQueue;
}

- (HMFNetManager)netManager
{
  return self->_netManager;
}

- (HMFTimer)delegatedPingTimer
{
  return self->_delegatedPingTimer;
}

- (void)setDelegatedPingTimer:(id)a3
{
}

- (id)timerFactory
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setTimerFactory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timerFactory, 0);
  objc_storeStrong((id *)&self->_delegatedPingTimer, 0);
  objc_storeStrong((id *)&self->_netManager, 0);
  objc_storeStrong((id *)&self->_reachabilityProbeQueue, 0);
  objc_storeStrong((id *)&self->_reachabilityMonitor, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_netService, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end