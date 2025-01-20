@interface HMFNetService
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)errorFromNetServiceErrorDict:(id)a3;
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPublishing;
- (BOOL)isResolved;
- (HMFNetAddress)hostName;
- (HMFNetService)init;
- (HMFNetService)initWithDomain:(id)a3 type:(id)a4 name:(id)a5;
- (HMFNetService)initWithNetService:(id)a3;
- (HMFNetServiceDelegate)delegate;
- (NSArray)addresses;
- (NSDictionary)TXTRecord;
- (NSMutableArray)resolveBlocks;
- (NSNetService)internal;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)domain;
- (NSString)name;
- (NSString)type;
- (OS_dispatch_queue)clientQueue;
- (id)bestAddress;
- (id)descriptionWithPointer:(BOOL)a3;
- (id)shortDescription;
- (int64_t)resolveRunningState;
- (int64_t)resolveState;
- (unint64_t)hash;
- (unint64_t)port;
- (void)_reallyResolveWithTimeout:(double)a3 completionHandler:(id)a4;
- (void)confirmWithTimeout:(double)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)netService:(id)a3 didNotResolve:(id)a4;
- (void)netService:(id)a3 didUpdateTXTRecordData:(id)a4;
- (void)netServiceDidResolveAddress:(id)a3;
- (void)netServiceDidStop:(id)a3;
- (void)netServiceWillResolve:(id)a3;
- (void)notifyUpdatedAddresses:(id)a3;
- (void)removeAllTXTRecordObjects;
- (void)resolveWithTimeout:(double)a3 completionHandler:(id)a4;
- (void)setAddresses:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHostname:(id)a3;
- (void)setPublishing:(BOOL)a3;
- (void)setResolveRunningState:(int64_t)a3;
- (void)setResolveState:(int64_t)a3;
- (void)setResolved:(BOOL)a3;
- (void)setTXTRecord:(id)a3;
- (void)startMonitoring;
- (void)updateTXTRecordWithData:(id)a3;
@end

@implementation HMFNetService

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"resolved"] & 1) != 0
    || ([v3 isEqualToString:@"isResolved"] & 1) != 0
    || ([v3 isEqualToString:@"publishing"] & 1) != 0
    || ([v3 isEqualToString:@"isPublishing"] & 1) != 0)
  {
    char v4 = 0;
  }
  else
  {
    v6 = NSStringFromSelector(sel_port);
    char v7 = [v3 isEqualToString:v6];

    char v4 = v7 ^ 1;
  }

  return v4;
}

+ (id)errorFromNetServiceErrorDict:(id)a3
{
  id v3 = a3;
  char v4 = objc_msgSend(v3, "hmf_numberForKey:", *MEMORY[0x1E4F18C68]);
  v5 = v4;
  if (v4) {
    objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"NSNetServiceErrorDomain", objc_msgSend(v4, "integerValue"), v3);
  }
  else {
  v6 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:11 userInfo:v3];
  }

  return v6;
}

- (HMFNetService)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  char v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMFNetService)initWithDomain:(id)a3 type:(id)a4 name:(id)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F18D60];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)[[v8 alloc] initWithDomain:v11 type:v10 name:v9];

  v13 = [(HMFNetService *)self initWithNetService:v12];
  return v13;
}

- (HMFNetService)initWithNetService:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HMFNetService;
  v6 = [(HMFNetService *)&v26 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientQueue, MEMORY[0x1E4F14428]);
    v8 = [v5 domain];
    uint64_t v9 = [v8 copy];
    domain = v7->_domain;
    v7->_domain = (NSString *)v9;

    id v11 = [v5 type];
    uint64_t v12 = [v11 copy];
    type = v7->_type;
    v7->_type = (NSString *)v12;

    v14 = [v5 name];
    uint64_t v15 = [v14 copy];
    name = v7->_name;
    v7->_name = (NSString *)v15;

    v7->_port = [v5 port];
    uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
    resolveBlocks = v7->_resolveBlocks;
    v7->_resolveBlocks = (NSMutableArray *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    TXTRecord = v7->_TXTRecord;
    v7->_TXTRecord = (NSMutableDictionary *)v19;

    objc_storeStrong((id *)&v7->_internal, a3);
    v21 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    uint64_t v22 = *MEMORY[0x1E4F1C4B0];
    [v5 removeFromRunLoop:v21 forMode:*MEMORY[0x1E4F1C4B0]];

    v23 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v5 scheduleInRunLoop:v23 forMode:v22];

    if (v5)
    {
      v24 = [v5 TXTRecordData];
      [(HMFNetService *)v7 updateTXTRecordWithData:v24];
    }
    [(HMFNetService *)v7 startMonitoring];
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v3 = self->_internal;
  [(NSNetService *)v3 setDelegate:0];
  internal = self->_internal;
  self->_internal = 0;

  if (v3)
  {
    clientQueue = self->_clientQueue;
    if (clientQueue)
    {
      v6 = clientQueue;
    }
    else
    {
      v6 = MEMORY[0x1E4F14428];
      id v7 = MEMORY[0x1E4F14428];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __24__HMFNetService_dealloc__block_invoke;
    block[3] = &unk_1E5957698;
    id v10 = v3;
    dispatch_async(v6, block);
  }
  v8.receiver = self;
  v8.super_class = (Class)HMFNetService;
  [(HMFNetService *)&v8 dealloc];
}

uint64_t __24__HMFNetService_dealloc__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) stop];
  v2 = *(void **)(a1 + 32);
  return [v2 stopMonitoring];
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)shortDescription
{
  v2 = objc_opt_class();
  return (id)[v2 shortDescription];
}

- (id)descriptionWithPointer:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = NSString;
  id v5 = [(HMFNetService *)self shortDescription];
  BOOL v19 = v3;
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = &stru_1EEF0F5E0;
  }
  v6 = [(HMFNetService *)self domain];
  id v7 = [(HMFNetService *)self type];
  objc_super v8 = [(HMFNetService *)self name];
  unint64_t v9 = [(HMFNetService *)self port];
  id v10 = [(HMFNetService *)self addresses];
  BOOL v11 = [(HMFNetService *)self isPublishing];
  BOOL v12 = self->_resolveState == 1;
  BOOL v13 = self->_resolveRunningState == 1;
  v14 = [(HMFNetService *)self resolveBlocks];
  uint64_t v15 = [v17 stringWithFormat:@"<%@%@, Domain = %@, Type = %@, Name = %@, Port = %tu, Addresses = %@, isPublishing = %d, ResolveState = %d, ResolveRunningState = %d, ResolveBlocksCount = %d>", v5, v18, v6, v7, v8, v9, v10, v11, v12, v13, objc_msgSend(v14, "count")];

  if (v19) {
  return v15;
  }
}

- (NSString)debugDescription
{
  return (NSString *)[(HMFNetService *)self descriptionWithPointer:1];
}

- (NSString)description
{
  return (NSString *)[(HMFNetService *)self descriptionWithPointer:0];
}

- (unint64_t)hash
{
  BOOL v3 = [(HMFNetService *)self name];
  uint64_t v4 = [v3 hash];
  id v5 = [(HMFNetService *)self type];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(HMFNetService *)self domain];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMFNetService *)a3;
  if (self == v4)
  {
    char v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_11;
    }
    unint64_t v5 = [(HMFNetService *)self port];
    uint64_t v6 = [(HMFNetService *)v4 port];
    if (v5 != -1 && v6 != -1)
    {
      unint64_t v7 = [(HMFNetService *)self port];
      if (v7 != [(HMFNetService *)v4 port]) {
        goto LABEL_11;
      }
    }
    unint64_t v8 = [(HMFNetService *)self name];
    unint64_t v9 = [(HMFNetService *)v4 name];
    int v10 = [v8 isEqualToString:v9];

    if (!v10) {
      goto LABEL_11;
    }
    BOOL v11 = [(HMFNetService *)self type];
    BOOL v12 = [(HMFNetService *)v4 type];
    int v13 = [v11 isEqualToString:v12];

    if (v13)
    {
      v14 = [(HMFNetService *)self domain];
      if ([v14 length])
      {
        uint64_t v15 = [(HMFNetService *)v4 domain];
        if ([v15 length])
        {
          v16 = [(HMFNetService *)self domain];
          uint64_t v17 = [(HMFNetService *)v4 domain];
          char v18 = [v16 isEqualToString:v17];
        }
        else
        {
          char v18 = 1;
        }
      }
      else
      {
        char v18 = 1;
      }
    }
    else
    {
LABEL_11:
      char v18 = 0;
    }
  }

  return v18;
}

- (void)startMonitoring
{
  BOOL v3 = [(HMFNetService *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__HMFNetService_startMonitoring__block_invoke;
  block[3] = &unk_1E5957698;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __32__HMFNetService_startMonitoring__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) internal];
  [v2 setDelegate:*(void *)(a1 + 32)];

  id v3 = [*(id *)(a1 + 32) internal];
  [v3 startMonitoring];
}

- (unint64_t)port
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unint64_t port = self->_port;
  os_unfair_lock_unlock(p_lock);
  return port;
}

- (BOOL)isResolved
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_resolved;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setResolved:(BOOL)a3
{
  if (a3)
  {
    [(HMFNetService *)self willChangeValueForKey:@"isResolved"];
    os_unfair_lock_lock_with_options();
    self->_resolved = 1;
    os_unfair_lock_unlock(&self->_lock);
    [(HMFNetService *)self didChangeValueForKey:@"isResolved"];
  }
}

- (BOOL)isPublishing
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_publishing;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setPublishing:(BOOL)a3
{
  BOOL v3 = a3;
  [(HMFNetService *)self willChangeValueForKey:@"isPublishing"];
  os_unfair_lock_lock_with_options();
  if (self->_publishing == v3)
  {
    os_unfair_lock_unlock(&self->_lock);
    [(HMFNetService *)self didChangeValueForKey:@"isPublishing"];
  }
  else
  {
    self->_publishing = v3;
    os_unfair_lock_unlock(&self->_lock);
    [(HMFNetService *)self didChangeValueForKey:@"isPublishing"];
    id v5 = [(HMFNetService *)self delegate];
    if (v3)
    {
      if (objc_opt_respondsToSelector()) {
        [v5 netServiceDidStartPublishing:self];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      [v5 netServiceDidStopPublishing:self];
    }
  }
}

- (int64_t)resolveState
{
  BOOL v3 = [(HMFNetService *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  return self->_resolveState;
}

- (void)setResolveState:(int64_t)a3
{
  id v5 = [(HMFNetService *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  self->_resolveState = a3;
}

- (int64_t)resolveRunningState
{
  BOOL v3 = [(HMFNetService *)self clientQueue];
  dispatch_assert_queue_V2(v3);

  return self->_resolveRunningState;
}

- (void)setResolveRunningState:(int64_t)a3
{
  id v5 = [(HMFNetService *)self clientQueue];
  dispatch_assert_queue_V2(v5);

  self->_resolveRunningState = a3;
}

- (HMFNetAddress)hostName
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_hostName;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setHostname:(id)a3
{
  uint64_t v4 = (HMFNetAddress *)a3;
  os_unfair_lock_lock_with_options();
  hostName = self->_hostName;
  self->_hostName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)addresses
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_addresses;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAddresses:(id)a3
{
  id v5 = a3;
  uint64_t v4 = (void *)[v5 copy];
  os_unfair_lock_lock_with_options();
  if (([(NSArray *)self->_addresses isEqual:v4] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_addresses, v4);
    [(HMFNetService *)self notifyUpdatedAddresses:v4];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)notifyUpdatedAddresses:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFNetService *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__HMFNetService_notifyUpdatedAddresses___block_invoke;
  v7[3] = &unk_1E5957730;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __40__HMFNetService_notifyUpdatedAddresses___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 netService:*(void *)(a1 + 32) didUpdateAddresses:*(void *)(a1 + 40)];
  }
}

- (NSDictionary)TXTRecord
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableDictionary *)self->_TXTRecord copy];
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (void)setTXTRecord:(id)a3
{
  id v10 = a3;
  id v4 = (void *)[v10 mutableCopy];
  os_unfair_lock_lock_with_options();
  if ([(NSMutableDictionary *)self->_TXTRecord isEqualToDictionary:v10])
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    if (v4)
    {
      id v5 = v4;
    }
    else
    {
      id v5 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    TXTRecord = self->_TXTRecord;
    self->_TXTRecord = v5;

    os_unfair_lock_unlock(&self->_lock);
    uint64_t v7 = [v4 copy];
    id v8 = (void *)v7;
    if (v7) {
      unint64_t v9 = (void *)v7;
    }
    else {
      unint64_t v9 = (void *)MEMORY[0x1E4F1CC08];
    }
    __notifyUpdatedTXTRecord(self, v9);
  }
}

- (void)removeAllTXTRecordObjects
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ([(NSMutableDictionary *)self->_TXTRecord count])
  {
    [(NSMutableDictionary *)self->_TXTRecord removeAllObjects];
    os_unfair_lock_unlock(p_lock);
    id v4 = (void *)MEMORY[0x1E4F1CC08];
    __notifyUpdatedTXTRecord(self, v4);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)updateTXTRecordWithData:(id)a3
{
  id v6 = a3;
  if (v6
    && ([MEMORY[0x1E4F18D60] dictionaryFromTXTRecordData:v6],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = (void *)v4;
    [(HMFNetService *)self setTXTRecord:v4];
  }
  else
  {
    [(HMFNetService *)self removeAllTXTRecordObjects];
  }
}

- (id)bestAddress
{
  BOOL v3 = [(HMFNetService *)self hostName];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(HMFNetService *)self addresses];
    id v5 = [v6 firstObject];
  }
  return v5;
}

- (void)resolveWithTimeout:(double)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(HMFNetService *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__HMFNetService_resolveWithTimeout_completionHandler___block_invoke;
  block[3] = &unk_1E5957B60;
  void block[4] = self;
  id v10 = v6;
  double v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __54__HMFNetService_resolveWithTimeout_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) resolveState] == 1
    && ([*(id *)(a1 + 32) bestAddress], (uint64_t v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v3 = (void *)v2;
    uint64_t v4 = (void *)MEMORY[0x19F3A87A0]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = HMFGetLogIdentifier(v5);
      int v12 = 138543618;
      int v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v3;
      _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Skipping resolving service, already have a cached address: %@", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v3, 0);
    }
  }
  else
  {
    double v9 = *(double *)(a1 + 48);
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    [v10 _reallyResolveWithTimeout:v11 completionHandler:v9];
  }
}

- (void)confirmWithTimeout:(double)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(HMFNetService *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__HMFNetService_confirmWithTimeout_completionHandler___block_invoke;
  block[3] = &unk_1E5957B60;
  void block[4] = self;
  id v10 = v6;
  double v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __54__HMFNetService_confirmWithTimeout_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) resolveRunningState] == 1 && objc_msgSend(*(id *)(a1 + 32), "resolveState") == 1)
  {
    uint64_t v2 = (void *)MEMORY[0x19F3A87A0]();
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v5 = HMFGetLogIdentifier(v3);
      *(_DWORD *)buf = 138543362;
      int v12 = v5;
      _os_log_impl(&dword_19D57B000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Skipping resolving service, still running and already resolved", buf, 0xCu);
    }
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
    }
  }
  else
  {
    double v7 = *(double *)(a1 + 48);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__HMFNetService_confirmWithTimeout_completionHandler___block_invoke_43;
    v9[3] = &unk_1E59589A8;
    id v8 = *(void **)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    [v8 _reallyResolveWithTimeout:v9 completionHandler:v7];
  }
}

uint64_t __54__HMFNetService_confirmWithTimeout_completionHandler___block_invoke_43(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (void)_reallyResolveWithTimeout:(double)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    double v7 = [(HMFNetService *)self resolveBlocks];
    id v8 = (void *)[v6 copy];
    double v9 = (void *)MEMORY[0x19F3A8A20]();
    [v7 addObject:v9];
  }
  if ([(HMFNetService *)self resolveRunningState] != 1)
  {
    id v10 = (void *)MEMORY[0x19F3A87A0]();
    double v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = HMFGetLogIdentifier(v11);
      int v17 = 138543362;
      char v18 = v13;
      _os_log_impl(&dword_19D57B000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Starting to resolve service", (uint8_t *)&v17, 0xCu);
    }
    [(HMFNetService *)v11 setResolveRunningState:1];
    __int16 v14 = [(HMFNetService *)v11 internal];
    uint64_t v15 = v14;
    double v16 = 15.0;
    if (a3 > 0.0) {
      double v16 = a3;
    }
    [v14 resolveWithTimeout:v16];
  }
}

+ (id)logCategory
{
  if (_MergedGlobals_3_20 != -1) {
    dispatch_once(&_MergedGlobals_3_20, &__block_literal_global_52);
  }
  uint64_t v2 = (void *)qword_1EB4EEC00;
  return v2;
}

uint64_t __28__HMFNetService_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle(@"Networking.Service", @"com.apple.HMFoundation");
  uint64_t v1 = qword_1EB4EEC00;
  qword_1EB4EEC00 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)netServiceWillResolve:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A87A0]();
  id v6 = self;
  double v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier(v6);
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Net service will resolve", (uint8_t *)&v9, 0xCu);
  }
}

- (void)netServiceDidResolveAddress:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFNetService *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__HMFNetService_netServiceDidResolveAddress___block_invoke;
  v7[3] = &unk_1E5957730;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __45__HMFNetService_netServiceDidResolveAddress___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A87A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier(v3);
    *(_DWORD *)buf = 138543362;
    v38 = v5;
    _os_log_impl(&dword_19D57B000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Net service resolved", buf, 0xCu);
  }
  [*(id *)(a1 + 32) setResolveState:1];
  uint64_t v6 = [*(id *)(a1 + 40) port];
  if (v6 != [*(id *)(a1 + 32) port]) {
    __HMFNetServiceUpdatePort(*(void **)(a1 + 32), v6);
  }
  double v7 = [HMFNetAddress alloc];
  id v8 = [*(id *)(a1 + 40) hostName];
  int v9 = [(HMFNetAddress *)v7 initWithHostname:v8];

  [*(id *)(a1 + 32) setHostname:v9];
  id v10 = [*(id *)(a1 + 40) addresses];
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count") + 1);
  int v12 = v11;
  if (v9) {
    [v11 addObject:v9];
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v13);
        }
        char v18 = -[HMFNetAddress initWithSocketAddress:]([HMFNetAddress alloc], "initWithSocketAddress:", [*(id *)(*((void *)&v31 + 1) + 8 * i) bytes]);
        if (v18) {
          [v12 addObject:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v15);
  }

  [*(id *)(a1 + 32) setAddresses:v12];
  [*(id *)(a1 + 32) setResolved:1];
  if ([v12 count])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v19 = [*(id *)(a1 + 32) resolveBlocks];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v28 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v27 + 1) + 8 * j);
          if (v9)
          {
            (*(void (**)(void, HMFNetAddress *, void))(v24 + 16))(*(void *)(*((void *)&v27 + 1) + 8 * j), v9, 0);
          }
          else
          {
            v25 = [v12 firstObject];
            (*(void (**)(uint64_t, void *, void))(v24 + 16))(v24, v25, 0);
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v21);
    }

    objc_super v26 = [*(id *)(a1 + 32) resolveBlocks];
    [v26 removeAllObjects];
  }
}

- (void)netService:(id)a3 didNotResolve:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(HMFNetService *)self clientQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__HMFNetService_netService_didNotResolve___block_invoke;
  v8[3] = &unk_1E5957730;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __42__HMFNetService_netService_didNotResolve___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A87A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier(v3);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v23 = v5;
    __int16 v24 = 2112;
    uint64_t v25 = v6;
    _os_log_impl(&dword_19D57B000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Net service failed to resolve with error: %@", buf, 0x16u);
  }
  [*(id *)(a1 + 32) setResolveState:0];
  [*(id *)(a1 + 32) setResolveRunningState:0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = objc_msgSend(*(id *)(a1 + 32), "resolveBlocks", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
        id v13 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v14 = [(id)objc_opt_class() errorFromNetServiceErrorDict:*(void *)(a1 + 40)];
        uint64_t v15 = [v13 hmfErrorWithCode:2 reason:@"Failed to resolve." suggestion:0 underlyingError:v14];

        (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v15);
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  uint64_t v16 = [*(id *)(a1 + 32) resolveBlocks];
  [v16 removeAllObjects];
}

- (void)netServiceDidStop:(id)a3
{
  id v4 = [(HMFNetService *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__HMFNetService_netServiceDidStop___block_invoke;
  block[3] = &unk_1E5957698;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __35__HMFNetService_netServiceDidStop___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x19F3A87A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier(v3);
    *(_DWORD *)buf = 138543362;
    long long v20 = v5;
    _os_log_impl(&dword_19D57B000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Net service stopped resolving", buf, 0xCu);
  }
  [*(id *)(a1 + 32) setResolveRunningState:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "resolveBlocks", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        uint64_t v12 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:12 reason:@"Net service stopped resolving."];
        (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v13 = [*(id *)(a1 + 32) resolveBlocks];
  [v13 removeAllObjects];
}

- (void)netService:(id)a3 didUpdateTXTRecordData:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x19F3A87A0]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = HMFGetLogIdentifier(v9);
    int v12 = 138543618;
    id v13 = v11;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Net service TXT record updated: %@", (uint8_t *)&v12, 0x16u);
  }
  [(HMFNetService *)v9 updateTXTRecordWithData:v7];
}

- (NSNetService)internal
{
  return self->_internal;
}

- (HMFNetServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMFNetServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (NSMutableArray)resolveBlocks
{
  return self->_resolveBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolveBlocks, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hostName, 0);
  objc_storeStrong((id *)&self->_TXTRecord, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

@end