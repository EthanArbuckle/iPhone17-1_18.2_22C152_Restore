@interface HMFHTTPServer
+ (id)logCategory;
- (HMFHTTPServer)init;
- (HMFHTTPServer)initWithServiceType:(id)a3 name:(id)a4 port:(unint64_t)a5 options:(unint64_t)a6;
- (HMFHTTPServer)initWithServiceType:(id)a3 name:(id)a4 port:(unint64_t)a5 options:(unint64_t)a6 netManager:(id)a7;
- (HMFHTTPServerDelegate)delegate;
- (HMFMutableNetService)netService;
- (HMFNetManager)netManager;
- (NSArray)connections;
- (NSArray)requestHandlers;
- (NSString)name;
- (NSString)serviceType;
- (OS_dispatch_queue)clientQueue;
- (_HMFCFHTTPServer)internal;
- (double)connectionIdleTimeout;
- (id)attributeDescriptions;
- (id)dumpState;
- (id)logIdentifier;
- (id)shortDescription;
- (unint64_t)options;
- (unint64_t)port;
- (void)_handleClosedConnection:(id)a3;
- (void)_handleOpenedConnection:(id)a3;
- (void)_handleReceivedRequest:(id)a3 connection:(id)a4;
- (void)_stopWithError:(id)a3;
- (void)addConnection:(id)a3;
- (void)connection:(id)a3 didReceiveRequest:(id)a4;
- (void)dealloc;
- (void)registerRequestHandler:(id)a3;
- (void)removeConnection:(id)a3;
- (void)server:(id)a3 didCloseConnection:(id)a4;
- (void)server:(id)a3 didOpenConnection:(id)a4;
- (void)serverDidInvalidate:(id)a3;
- (void)setConnectionIdleTimeout:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setInternal:(id)a3;
- (void)startWithCompletionHandler:(id)a3;
- (void)stop;
- (void)stopWithError:(id)a3;
- (void)unregisterRequestHandler:(id)a3;
@end

@implementation HMFHTTPServer

- (HMFHTTPServer)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMFHTTPServer)initWithServiceType:(id)a3 name:(id)a4 port:(unint64_t)a5 options:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a3;
  v12 = +[HMFNetManager sharedManager];
  v13 = [(HMFHTTPServer *)self initWithServiceType:v11 name:v10 port:a5 options:a6 netManager:v12];

  return v13;
}

- (HMFHTTPServer)initWithServiceType:(id)a3 name:(id)a4 port:(unint64_t)a5 options:(unint64_t)a6 netManager:(id)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if ((a6 & 1) != 0 && ![v13 length])
  {
    v36 = (void *)MEMORY[0x19F3A87A0]();
    v33 = self;
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = HMFGetLogIdentifier(v33);
      *(_DWORD *)buf = 138543362;
      v41 = v38;
      _os_log_impl(&dword_19D57B000, v37, OS_LOG_TYPE_ERROR, "%{public}@A valid name is required for publishing", buf, 0xCu);
    }
    v34 = 0;
  }
  else
  {
    v39.receiver = self;
    v39.super_class = (Class)HMFHTTPServer;
    v15 = [(HMFHTTPServer *)&v39 init];
    v16 = v15;
    if (v15)
    {
      v17 = (const char *)HMFDispatchQueueName(v15, 0);
      dispatch_queue_t v18 = dispatch_queue_create(v17, 0);
      clientQueue = v16->_clientQueue;
      v16->_clientQueue = (OS_dispatch_queue *)v18;

      uint64_t v20 = [v12 length];
      if (v20) {
        v21 = (__CFString *)[v12 copy];
      }
      else {
        v21 = @"_http";
      }
      objc_storeStrong((id *)&v16->_serviceType, v21);
      if (v20) {

      }
      uint64_t v22 = [v13 copy];
      name = v16->_name;
      v16->_name = (NSString *)v22;

      v16->_port = a5;
      v16->_options = a6;
      v16->_connectionIdleTimeout = 15.0;
      uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
      connections = v16->_connections;
      v16->_connections = (NSMutableArray *)v24;

      uint64_t v26 = [MEMORY[0x1E4F1CA48] array];
      requestHandlers = v16->_requestHandlers;
      v16->_requestHandlers = (NSMutableArray *)v26;

      objc_storeStrong((id *)&v16->_netManager, a7);
      if (a6)
      {
        v28 = [HMFMutableNetService alloc];
        v29 = [(HMFHTTPServer *)v16 serviceType];
        v30 = [(HMFHTTPServer *)v16 name];
        uint64_t v31 = [(HMFMutableNetService *)v28 initWithDomain:&stru_1EEF0F5E0 type:v29 name:v30 port:[(HMFHTTPServer *)v16 port]];
        netService = v16->_netService;
        v16->_netService = (HMFMutableNetService *)v31;
      }
    }
    v33 = v16;
    v34 = v33;
  }

  return v34;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(_HMFCFHTTPServer *)self->_internal invalidate];
  [(HMFMutableNetService *)self->_netService stopPublishing];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = self->_connections;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) close];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(HMFNetManager *)self->_netManager deregisterObject:self];
  v8.receiver = self;
  v8.super_class = (Class)HMFHTTPServer;
  [(HMFHTTPServer *)&v8 dealloc];
}

- (id)shortDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(id)objc_opt_class() shortDescription];
  uint64_t v5 = [v3 stringWithFormat:@"%@ %tu", v4, -[HMFHTTPServer port](self, "port")];

  return v5;
}

- (id)attributeDescriptions
{
  v18[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [HMFAttributeDescription alloc];
  uint64_t v4 = [(HMFHTTPServer *)self serviceType];
  uint64_t v5 = [(HMFAttributeDescription *)v3 initWithName:@"Service Type" value:v4];
  v18[0] = v5;
  uint64_t v6 = [HMFAttributeDescription alloc];
  uint64_t v7 = [(HMFHTTPServer *)self name];
  objc_super v8 = [(HMFAttributeDescription *)v6 initWithName:@"Name" value:v7];
  v18[1] = v8;
  long long v9 = [HMFAttributeDescription alloc];
  long long v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMFHTTPServer port](self, "port"));
  long long v11 = [(HMFAttributeDescription *)v9 initWithName:@"Port" value:v10];
  v18[2] = v11;
  long long v12 = [HMFAttributeDescription alloc];
  id v13 = NSNumber;
  [(HMFHTTPServer *)self connectionIdleTimeout];
  uint64_t v14 = objc_msgSend(v13, "numberWithDouble:");
  v15 = [(HMFAttributeDescription *)v12 initWithName:@"Connection Idle Timeout" value:v14];
  v18[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];

  return v16;
}

- (unint64_t)port
{
  uint64_t v3 = [(HMFHTTPServer *)self internal];

  if (!v3) {
    return self->_port;
  }
  uint64_t v4 = [(HMFHTTPServer *)self internal];
  unint64_t v5 = [v4 port];

  return v5;
}

- (double)connectionIdleTimeout
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  double connectionIdleTimeout = self->_connectionIdleTimeout;
  os_unfair_lock_unlock(p_lock);
  return connectionIdleTimeout;
}

- (void)setConnectionIdleTimeout:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_connectionIdleTimeout != a3)
  {
    self->_double connectionIdleTimeout = a3;
    [(_HMFCFHTTPServer *)self->_internal setConnectionIdleTimeout:a3];
  }
  os_unfair_lock_unlock(p_lock);
}

- (NSArray)connections
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = (void *)[(NSMutableArray *)self->_connections copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)addConnection:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock_with_options();
    [(NSMutableArray *)self->_connections addObject:v5];
    os_unfair_lock_unlock(&self->_lock);
    id v4 = v5;
  }
}

- (void)removeConnection:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    os_unfair_lock_lock_with_options();
    [(NSMutableArray *)self->_connections removeObject:v5];
    os_unfair_lock_unlock(&self->_lock);
    id v4 = v5;
  }
}

- (_HMFCFHTTPServer)internal
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_internal;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setInternal:(id)a3
{
  id v4 = (_HMFCFHTTPServer *)a3;
  os_unfair_lock_lock_with_options();
  internal = self->_internal;
  self->_internal = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFHTTPServer *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__HMFHTTPServer_startWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5957780;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __44__HMFHTTPServer_startWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F3A87A0]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier(v3);
    *(_DWORD *)buf = 138543362;
    v38 = v5;
    _os_log_impl(&dword_19D57B000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Starting", buf, 0xCu);
  }
  id v6 = -[_HMFCFHTTPServer initWithPort:options:]([_HMFCFHTTPServer alloc], "initWithPort:options:", [*(id *)(a1 + 32) port], objc_msgSend(*(id *)(a1 + 32), "options"));
  if (v6)
  {
    [*(id *)(a1 + 32) setInternal:v6];
    uint64_t v7 = [*(id *)(a1 + 32) internal];
    [v7 setDelegate:*(void *)(a1 + 32)];

    id v8 = [*(id *)(a1 + 32) internal];
    [*(id *)(a1 + 32) connectionIdleTimeout];
    objc_msgSend(v8, "setConnectionIdleTimeout:");

    if (([*(id *)(a1 + 32) options] & 4) != 0)
    {
      long long v9 = (void *)MEMORY[0x19F3A87A0]();
      id v10 = *(id *)(a1 + 32);
      long long v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        long long v12 = HMFGetLogIdentifier(v10);
        *(_DWORD *)buf = 138543362;
        v38 = v12;
        _os_log_impl(&dword_19D57B000, v11, OS_LOG_TYPE_INFO, "%{public}@Enabling WoW", buf, 0xCu);
      }
      id v13 = [*(id *)(a1 + 32) netManager];
      [v13 registerWoWAssertionForObject:*(void *)(a1 + 32)];
    }
    uint64_t v14 = (void *)MEMORY[0x19F3A87A0]();
    id v15 = *(id *)(a1 + 32);
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = HMFGetLogIdentifier(v15);
      uint64_t v18 = [*(id *)(a1 + 32) port];
      *(_DWORD *)buf = 138543618;
      v38 = v17;
      __int16 v39 = 2048;
      uint64_t v40 = v18;
      _os_log_impl(&dword_19D57B000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Started server on port %tu", buf, 0x16u);
    }
    objc_initWeak(&location, *(id *)(a1 + 32));
    if ([*(id *)(a1 + 32) options])
    {
      uint64_t v26 = (void *)MEMORY[0x19F3A87A0]();
      id v27 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v28 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = HMFGetLogIdentifier(v27);
        *(_DWORD *)buf = 138543362;
        v38 = v29;
        _os_log_impl(&dword_19D57B000, v28, OS_LOG_TYPE_INFO, "%{public}@Publishing", buf, 0xCu);
      }
      v30 = [*(id *)(a1 + 32) netService];
      objc_msgSend(v30, "setPort:", objc_msgSend(*(id *)(a1 + 32), "port"));

      uint64_t v31 = [*(id *)(a1 + 32) netService];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __44__HMFHTTPServer_startWithCompletionHandler___block_invoke_33;
      v33[3] = &unk_1E5958890;
      objc_copyWeak(&v35, &location);
      v32 = *(void **)(a1 + 40);
      v33[4] = *(void *)(a1 + 32);
      id v34 = v32;
      [v31 startPublishingWithCompletionHandler:v33];

      objc_destroyWeak(&v35);
    }
    else
    {
      uint64_t v19 = MEMORY[0x19F3A8A20](*(void *)(a1 + 40));
      uint64_t v20 = (void *)v19;
      if (v19) {
        (*(void (**)(uint64_t, void))(v19 + 16))(v19, 0);
      }
    }
    objc_destroyWeak(&location);
  }
  else
  {
    v21 = (void *)MEMORY[0x19F3A87A0]();
    id v22 = *(id *)(a1 + 32);
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = HMFGetLogIdentifier(v22);
      *(_DWORD *)buf = 138543362;
      v38 = v24;
      _os_log_impl(&dword_19D57B000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to start server", buf, 0xCu);
    }
    if (*(void *)(a1 + 40))
    {
      v25 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:6];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void __44__HMFHTTPServer_startWithCompletionHandler___block_invoke_33(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v5 = (void *)MEMORY[0x19F3A87A0]();
    id v6 = WeakRetained;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier(v6);
      int v15 = 138543618;
      v16 = v8;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to publish net service with error: %@", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    long long v9 = (void *)MEMORY[0x19F3A87A0]();
    id v10 = *(id *)(a1 + 32);
    long long v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      long long v12 = HMFGetLogIdentifier(v10);
      int v15 = 138543362;
      v16 = v12;
      _os_log_impl(&dword_19D57B000, v11, OS_LOG_TYPE_INFO, "%{public}@Published", (uint8_t *)&v15, 0xCu);
    }
  }
  uint64_t v13 = MEMORY[0x19F3A8A20](*(void *)(a1 + 40));
  uint64_t v14 = (void *)v13;
  if (v13) {
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);
  }
}

- (void)stop
{
}

- (void)stopWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(HMFHTTPServer *)self clientQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__HMFHTTPServer_stopWithError___block_invoke;
  v7[3] = &unk_1E5957730;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __31__HMFHTTPServer_stopWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopWithError:*(void *)(a1 + 40)];
}

- (void)_stopWithError:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMFHTTPServer *)self internal];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x19F3A87A0]();
    uint64_t v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      long long v9 = HMFGetLogIdentifier(v7);
      int v14 = 138543618;
      int v15 = v9;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_19D57B000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Stopped with error: %@", (uint8_t *)&v14, 0x16u);
    }
    id v10 = [(HMFHTTPServer *)v7 internal];
    [v10 invalidate];

    [(HMFHTTPServer *)v7 setInternal:0];
    long long v11 = [(HMFHTTPServer *)v7 netService];
    [v11 stopPublishing];

    long long v12 = [(HMFHTTPServer *)v7 delegate];
    if (objc_opt_respondsToSelector()) {
      [v12 server:v7 didStopWithError:v4];
    }
  }
  uint64_t v13 = [(HMFHTTPServer *)self netManager];
  [v13 deregisterObject:self];
}

- (NSArray)requestHandlers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableArray *)self->_requestHandlers copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)registerRequestHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)MEMORY[0x19F3A87A0]();
    id v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier(v6);
      int v9 = 138543618;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_INFO, "%{public}@Adding request handler: %@", (uint8_t *)&v9, 0x16u);
    }
    os_unfair_lock_lock_with_options();
    [(NSMutableArray *)v6->_requestHandlers addObject:v4];
    os_unfair_lock_unlock(&v6->_lock);
  }
}

- (void)unregisterRequestHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)MEMORY[0x19F3A87A0]();
    id v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier(v6);
      int v9 = 138543618;
      id v10 = v8;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing request handler: %@", (uint8_t *)&v9, 0x16u);
    }
    os_unfair_lock_lock_with_options();
    [(NSMutableArray *)v6->_requestHandlers removeObject:v4];
    os_unfair_lock_unlock(&v6->_lock);
  }
}

- (void)_handleReceivedRequest:(id)a3 connection:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = (void *)MEMORY[0x19F3A87A0]();
    int v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = HMFGetLogIdentifier(v9);
      *(_DWORD *)buf = 138543874;
      uint64_t v42 = v11;
      __int16 v43 = 2112;
      id v44 = v6;
      __int16 v45 = 2112;
      id v46 = v7;
      _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_INFO, "%{public}@Received request, %@, from connection: %@", buf, 0x20u);
    }
    id v12 = [(HMFHTTPServer *)v9 requestHandlers];
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    v37 = __51__HMFHTTPServer__handleReceivedRequest_connection___block_invoke;
    v38 = &unk_1E59588B8;
    id v13 = v6;
    id v39 = v13;
    id v14 = v7;
    id v40 = v14;
    int v15 = objc_msgSend(v12, "hmf_objectPassingTest:", &v35);

    if (v15)
    {
      objc_msgSend(v15, "requestBlock", v35, v36, v37, v38, v39);
      v21 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      id v22 = (void *)MEMORY[0x19F3A87A0]();
      v23 = v9;
      uint64_t v24 = HMFGetOSLogHandle();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
      if (v21)
      {
        if (v25)
        {
          uint64_t v26 = HMFGetLogIdentifier(v23);
          *(_DWORD *)buf = 138543874;
          uint64_t v42 = v26;
          __int16 v43 = 2112;
          id v44 = v15;
          __int16 v45 = 2112;
          id v46 = v13;
          _os_log_impl(&dword_19D57B000, v24, OS_LOG_TYPE_INFO, "%{public}@Found a matching request handler, %@, for the request, %@", buf, 0x20u);
        }
        id v27 = [v13 internal];
        v28 = [v27 activity];
        [v28 markWithReason:@"Calling request handler"];

        ((void (**)(void, id, id))v21)[2](v21, v13, v14);
      }
      else
      {
        if (v25)
        {
          v33 = HMFGetLogIdentifier(v23);
          *(_DWORD *)buf = 138543874;
          uint64_t v42 = v33;
          __int16 v43 = 2112;
          id v44 = v15;
          __int16 v45 = 2112;
          id v46 = v13;
          _os_log_impl(&dword_19D57B000, v24, OS_LOG_TYPE_INFO, "%{public}@Found a matching request handler, %@, for the request, %@, but there was no request block", buf, 0x20u);
        }
        id v34 = [v13 responseWithStatusCode:404];
        [v14 sendResponse:v34 completionHandler:0];

        v21 = 0;
      }
    }
    else
    {
      v29 = (void *)MEMORY[0x19F3A87A0](v16, v17, v18, v19, v20);
      v30 = v9;
      uint64_t v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v32 = HMFGetLogIdentifier(v30);
        *(_DWORD *)buf = 138543618;
        uint64_t v42 = v32;
        __int16 v43 = 2112;
        id v44 = v13;
        _os_log_impl(&dword_19D57B000, v31, OS_LOG_TYPE_INFO, "%{public}@Failed to handle request: %@", buf, 0x16u);
      }
      objc_msgSend(v13, "responseWithStatusCode:", 501, v35, v36, v37, v38, v39);
      v21 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
      [v14 sendResponse:v21 completionHandler:0];
    }
  }
}

uint64_t __51__HMFHTTPServer__handleReceivedRequest_connection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 URLPredicate];
  id v5 = [*(id *)(a1 + 32) URL];
  int v6 = [v4 evaluateWithObject:v5];

  if (v6
    && ([v3 methodPredicate],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [*(id *)(a1 + 32) method],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v7 evaluateWithObject:v8],
        v8,
        v7,
        v9))
  {
    id v10 = [v3 matchBlock];

    if (!v10
      || ([v3 matchBlock],
          __int16 v11 = (uint64_t (**)(void, void, void))objc_claimAutoreleasedReturnValue(),
          uint64_t v12 = v11[2](v11, *(void *)(a1 + 32), *(void *)(a1 + 40)),
          v11,
          v12))
    {
      uint64_t v12 = 1;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)_handleOpenedConnection:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[HMFHTTPClientConnection alloc] initWithConnection:v4];
  int v6 = (void *)MEMORY[0x19F3A87A0]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = HMFGetLogIdentifier(v7);
    *(_DWORD *)buf = 138543618;
    uint64_t v24 = v9;
    __int16 v25 = 2112;
    uint64_t v26 = v5;
    _os_log_impl(&dword_19D57B000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Received connection: %@", buf, 0x16u);
  }
  id v10 = [(HMFHTTPServer *)v7 delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![v10 server:v7 shouldAcceptConnection:v5])
  {
    int v15 = (void *)MEMORY[0x19F3A87A0]();
    uint64_t v16 = v7;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier(v16);
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v18;
      __int16 v25 = 2112;
      uint64_t v26 = v5;
      _os_log_impl(&dword_19D57B000, v17, OS_LOG_TYPE_INFO, "%{public}@Rejecting connection: %@", buf, 0x16u);
    }
  }
  else
  {
    __int16 v11 = (void *)MEMORY[0x19F3A87A0]();
    uint64_t v12 = v7;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier(v12);
      *(_DWORD *)buf = 138543618;
      uint64_t v24 = v14;
      __int16 v25 = 2112;
      uint64_t v26 = v5;
      _os_log_impl(&dword_19D57B000, v13, OS_LOG_TYPE_INFO, "%{public}@Accepted connection: %@", buf, 0x16u);
    }
    [(HMFHTTPClientConnection *)v5 setDelegate:v12];
    objc_initWeak((id *)buf, v12);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __41__HMFHTTPServer__handleOpenedConnection___block_invoke;
    v19[3] = &unk_1E5958908;
    objc_copyWeak(&v22, (id *)buf);
    uint64_t v20 = v5;
    id v21 = v10;
    [(HMFHTTPClientConnection *)v20 openWithCompletionHandler:v19];

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
}

void __41__HMFHTTPServer__handleOpenedConnection___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    int v6 = [WeakRetained clientQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__HMFHTTPServer__handleOpenedConnection___block_invoke_2;
    v7[3] = &unk_1E59588E0;
    id v8 = v3;
    int v9 = v5;
    id v10 = a1[4];
    id v11 = a1[5];
    dispatch_async(v6, v7);
  }
}

void __41__HMFHTTPServer__handleOpenedConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (void *)MEMORY[0x19F3A87A0]();
  id v4 = *(id *)(a1 + 40);
  id v5 = HMFGetOSLogHandle();
  int v6 = v5;
  if (v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = HMFGetLogIdentifier(v4);
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 32);
      int v12 = 138543874;
      id v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to open connection, %@, with error: %@", (uint8_t *)&v12, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier(v4);
      uint64_t v11 = *(void *)(a1 + 48);
      int v12 = 138543618;
      id v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_INFO, "%{public}@Opened connection: %@", (uint8_t *)&v12, 0x16u);
    }
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 56) server:*(void *)(a1 + 40) didOpenConnection:*(void *)(a1 + 48)];
    }
    [*(id *)(a1 + 40) addConnection:*(void *)(a1 + 48)];
  }
}

- (void)_handleClosedConnection:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A87A0]();
  int v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier(v6);
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v8;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Connection closed: %@", buf, 0x16u);
  }
  uint64_t v9 = [(HMFHTTPServer *)v6 connections];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __41__HMFHTTPServer__handleClosedConnection___block_invoke;
  v17[3] = &unk_1E5958930;
  id v10 = v4;
  id v18 = v10;
  uint64_t v11 = objc_msgSend(v9, "hmf_objectPassingTest:", v17);

  if (v11)
  {
    int v12 = (void *)MEMORY[0x19F3A87A0]();
    id v13 = v6;
    __int16 v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier(v13);
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_impl(&dword_19D57B000, v14, OS_LOG_TYPE_INFO, "%{public}@Closing connection: %@", buf, 0x16u);
    }
    [v11 close];
    [(HMFHTTPServer *)v13 removeConnection:v11];
    __int16 v16 = [(HMFHTTPServer *)v13 delegate];
    if (objc_opt_respondsToSelector()) {
      [v16 server:v13 didCloseConnection:v11];
    }
  }
}

uint64_t __41__HMFHTTPServer__handleClosedConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 internal];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)serverDidInvalidate:(id)a3
{
  uint64_t v4 = [(HMFHTTPServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__HMFHTTPServer_serverDidInvalidate___block_invoke;
  block[3] = &unk_1E5957698;
  block[4] = self;
  dispatch_async(v4, block);
}

void __37__HMFHTTPServer_serverDidInvalidate___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:12 reason:@"Server invalidated."];
  [*(id *)(a1 + 32) _stopWithError:v2];
}

- (void)server:(id)a3 didOpenConnection:(id)a4
{
  id v5 = a4;
  int v6 = [(HMFHTTPServer *)self clientQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__HMFHTTPServer_server_didOpenConnection___block_invoke;
  v8[3] = &unk_1E5957730;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __42__HMFHTTPServer_server_didOpenConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleOpenedConnection:*(void *)(a1 + 40)];
}

- (void)server:(id)a3 didCloseConnection:(id)a4
{
  id v5 = a4;
  int v6 = [(HMFHTTPServer *)self clientQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__HMFHTTPServer_server_didCloseConnection___block_invoke;
  v8[3] = &unk_1E5957730;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __43__HMFHTTPServer_server_didCloseConnection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleClosedConnection:*(void *)(a1 + 40)];
}

+ (id)logCategory
{
  if (_MergedGlobals_3_18 != -1) {
    dispatch_once(&_MergedGlobals_3_18, &__block_literal_global_48);
  }
  id v2 = (void *)qword_1EB4EEBE0;
  return v2;
}

uint64_t __28__HMFHTTPServer_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle(@"Networking.HTTP.Server", @"com.apple.HMFoundation");
  uint64_t v1 = qword_1EB4EEBE0;
  qword_1EB4EEBE0 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)logIdentifier
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%tu", -[HMFHTTPServer port](self, "port"));
}

- (void)connection:(id)a3 didReceiveRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMFHTTPServer *)self clientQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__HMFHTTPServer_connection_didReceiveRequest___block_invoke;
  block[3] = &unk_1E5957CF8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

uint64_t __46__HMFHTTPServer_connection_didReceiveRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleReceivedRequest:*(void *)(a1 + 40) connection:*(void *)(a1 + 48)];
}

- (id)dumpState
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [(HMFObject *)self debugDescription];
  [v3 setObject:v4 forKeyedSubscript:@"Identity"];

  id v5 = [(HMFHTTPServer *)self connections];
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "shortDescription", (void)v16);
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  [v3 setObject:v6 forKeyedSubscript:@"clientConnections"];
  id v13 = [(HMFHTTPServer *)self netService];
  __int16 v14 = [v13 debugDescription];
  [v3 setObject:v14 forKeyedSubscript:@"NetService"];

  return v3;
}

- (HMFHTTPServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMFHTTPServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)options
{
  return self->_options;
}

- (HMFMutableNetService)netService
{
  return self->_netService;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (HMFNetManager)netManager
{
  return self->_netManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netManager, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_netService, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_internal, 0);
  objc_storeStrong((id *)&self->_requestHandlers, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

@end