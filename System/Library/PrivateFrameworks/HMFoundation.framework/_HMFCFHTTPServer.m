@interface _HMFCFHTTPServer
+ (id)logCategory;
- (BOOL)isValid;
- (NSMutableArray)connections;
- (OS_dispatch_queue)clientQueue;
- (_CFHTTPServer)internal;
- (_HMFCFHTTPServer)init;
- (_HMFCFHTTPServer)initWithPort:(unint64_t)a3 options:(unint64_t)a4;
- (_HMFCFHTTPServerDelegate)delegate;
- (double)connectionIdleTimeout;
- (double)watchdogTimeout;
- (id)logIdentifier;
- (unint64_t)port;
- (void)dealloc;
- (void)invalidate;
- (void)setConnectionIdleTimeout:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setWatchdogTimeout:(double)a3;
@end

@implementation _HMFCFHTTPServer

- (_HMFCFHTTPServer)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (_HMFCFHTTPServer)initWithPort:(unint64_t)a3 options:(unint64_t)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a3 >= 0x10000) {
    _HMFPreconditionFailure(@"port <= UINT16_MAX");
  }
  char v4 = a4;
  v32.receiver = self;
  v32.super_class = (Class)_HMFCFHTTPServer;
  v6 = [(_HMFCFHTTPServer *)&v32 init];
  id v7 = v6;
  if (!v6) {
    goto LABEL_11;
  }
  v8 = (const char *)HMFDispatchQueueName(v6, 0);
  dispatch_queue_t v9 = dispatch_queue_create(v8, 0);
  clientQueue = v7->_clientQueue;
  v7->_clientQueue = (OS_dispatch_queue *)v9;

  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  connections = v7->_connections;
  v7->_connections = (NSMutableArray *)v11;

  v13 = [[HMFWeakObject alloc] initWithWeakObject:v7];
  v7->_internal = (_CFHTTPServer *)_CFHTTPServerCreateService();
  if (![(_HMFCFHTTPServer *)v7 isValid])
  {
    v22 = (void *)MEMORY[0x19F3A87A0]();
    v23 = v7;
    v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = HMFGetLogIdentifier(v23);
      *(_DWORD *)buf = 138543362;
      v36 = v25;
      _os_log_impl(&dword_19D57B000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to create server, server is invalid", buf, 0xCu);
    }
    goto LABEL_21;
  }
  if ((v4 & 2) != 0)
  {
    v14 = (void *)MEMORY[0x19F3A87A0]();
    v15 = v7;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = HMFGetLogIdentifier(v15);
      *(_DWORD *)buf = 138543362;
      v36 = v17;
      _os_log_impl(&dword_19D57B000, v16, OS_LOG_TYPE_INFO, "%{public}@Requiring TLS in anonymous mode", buf, 0xCu);
    }
    uint64_t v18 = *MEMORY[0x1E4F18EC0];
    v33[0] = *MEMORY[0x1E4F18E88];
    v33[1] = v18;
    v34[0] = MEMORY[0x1E4F1CC38];
    v34[1] = MEMORY[0x1E4F1CC28];
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
    [(_HMFCFHTTPServer *)v15 internal];
    _CFHTTPServerSetProperty();
  }
  [(_HMFCFHTTPServer *)v7 internal];
  v20 = [(_HMFCFHTTPServer *)v7 clientQueue];
  _CFHTTPServerSetDispatchQueue();

  if (!a3)
  {
    [(_HMFCFHTTPServer *)v7 internal];
    v26 = (void *)_CFHTTPServerCopyProperty();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v26 integerValue])
    {
      v7->_port = [v26 unsignedIntegerValue];

      goto LABEL_10;
    }
    v27 = (void *)MEMORY[0x19F3A87A0]();
    v28 = v7;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier(v28);
      *(_DWORD *)buf = 138543362;
      v36 = v30;
      _os_log_impl(&dword_19D57B000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to bind server", buf, 0xCu);
    }
    [(_HMFCFHTTPServer *)v28 invalidate];

LABEL_21:
    v21 = 0;
    goto LABEL_22;
  }
  v7->_port = a3;
LABEL_10:

LABEL_11:
  v21 = v7;
LABEL_22:

  return v21;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  if (self->_internal)
  {
    if (_CFHTTPServerIsValid()) {
      _CFHTTPServerInvalidate();
    }
    CFRelease(self->_internal);
    self->_internal = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)_HMFCFHTTPServer;
  [(_HMFCFHTTPServer *)&v8 dealloc];
}

- (double)connectionIdleTimeout
{
  [(_HMFCFHTTPServer *)self internal];
  v2 = (void *)_CFHTTPServerCopyProperty();
  CFTypeID TypeID = CFNumberGetTypeID();
  objc_opt_class();
  if (v2 && CFGetTypeID(v2) != TypeID)
  {
    CFRelease(v2);
    v2 = 0;
  }
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v2;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    [v5 doubleValue];
    double v7 = v6;
  }
  else
  {
    double v7 = 15.0;
  }

  return v7;
}

- (void)setConnectionIdleTimeout:(double)a3
{
  [(_HMFCFHTTPServer *)self internal];
  [NSNumber numberWithDouble:a3];
  _CFHTTPServerSetProperty();
}

- (double)watchdogTimeout
{
  [(_HMFCFHTTPServer *)self internal];
  v2 = (void *)_CFHTTPServerCopyProperty();
  CFTypeID TypeID = CFNumberGetTypeID();
  objc_opt_class();
  if (v2 && CFGetTypeID(v2) != TypeID)
  {
    CFRelease(v2);
    v2 = 0;
  }
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v2;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    [v5 doubleValue];
    double v7 = v6;
  }
  else
  {
    double v7 = 15.0;
  }

  return v7;
}

- (void)setWatchdogTimeout:(double)a3
{
  [(_HMFCFHTTPServer *)self internal];
  [NSNumber numberWithDouble:a3];
  _CFHTTPServerSetProperty();
}

- (void)invalidate
{
  if ([(_HMFCFHTTPServer *)self isValid])
  {
    [(_HMFCFHTTPServer *)self internal];
    _CFHTTPServerInvalidate();
  }
}

- (BOOL)isValid
{
  return _CFHTTPServerIsValid() != 0;
}

+ (id)logCategory
{
  if (_MergedGlobals_5_0 != -1) {
    dispatch_once(&_MergedGlobals_5_0, &__block_literal_global_18);
  }
  v2 = (void *)qword_1EB4EEA00;
  return v2;
}

- (id)logIdentifier
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%tu", -[_HMFCFHTTPServer port](self, "port"));
}

- (_HMFCFHTTPServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_HMFCFHTTPServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)port
{
  return self->_port;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (_CFHTTPServer)internal
{
  return self->_internal;
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end