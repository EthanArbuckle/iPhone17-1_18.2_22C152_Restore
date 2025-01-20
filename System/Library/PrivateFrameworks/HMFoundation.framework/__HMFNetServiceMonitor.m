@interface __HMFNetServiceMonitor
- (HMFNetService)service;
- (__HMFNetServiceMonitor)initWithNetAddress:(id)a3;
- (__HMFNetServiceMonitor)initWithNetService:(id)a3;
- (id)logIdentifier;
- (id)netAddress;
- (unint64_t)reachabilityPath;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation __HMFNetServiceMonitor

- (__HMFNetServiceMonitor)initWithNetAddress:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (__HMFNetServiceMonitor)initWithNetService:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)__HMFNetServiceMonitor;
  uint64_t v6 = [(HMFNetMonitor *)&v10 initWithNetService:v5];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_service, a3);
    v8 = NSStringFromSelector(sel_isPublishing);
    [v5 addObserver:v7 forKeyPath:v8 options:3 context:0];

    v7->super._reachable = [v5 isPublishing];
  }

  return v7;
}

- (void)dealloc
{
  service = self->_service;
  id v4 = NSStringFromSelector(sel_isPublishing);
  [(HMFNetService *)service removeObserver:self forKeyPath:v4];

  v5.receiver = self;
  v5.super_class = (Class)__HMFNetServiceMonitor;
  [(__HMFNetServiceMonitor *)&v5 dealloc];
}

- (id)netAddress
{
  v2 = [(HMFNetService *)self->_service addresses];
  v3 = [v2 firstObject];

  return v3;
}

- (unint64_t)reachabilityPath
{
  if ([(HMFNetMonitor *)self isReachable]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a5;
  if (self->_service == a4)
  {
    id v19 = v9;
    id v10 = a3;
    v11 = NSStringFromSelector(sel_isPublishing);
    int v12 = [v10 isEqualToString:v11];

    id v9 = v19;
    if (v12)
    {
      v13 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F284E0]];
      uint64_t v14 = *MEMORY[0x1E4F284C8];
      v15 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
      char v16 = HMFEqualObjects(v13, v15);

      id v9 = v19;
      if ((v16 & 1) == 0)
      {
        v17 = objc_msgSend(v19, "hmf_numberForKey:", v14);
        v18 = v17;
        if (v17) {
          -[HMFNetMonitor setReachable:](self, "setReachable:", [v17 BOOLValue]);
        }

        id v9 = v19;
      }
    }
  }
}

- (id)logIdentifier
{
  return [(HMFNetService *)self->_service name];
}

- (HMFNetService)service
{
  return (HMFNetService *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
}

@end