@interface HMFNetMonitor
+ (id)logCategory;
- (BOOL)isReachable;
- (HMFNetAddress)netAddress;
- (HMFNetMonitor)init;
- (HMFNetMonitor)initWithNetAddress:(id)a3;
- (HMFNetMonitor)initWithNetService:(id)a3;
- (HMFNetMonitorDelegate)delegate;
- (unint64_t)reachabilityPath;
- (void)setDelegate:(id)a3;
- (void)setReachable:(BOOL)a3;
@end

@implementation HMFNetMonitor

- (HMFNetMonitor)init
{
  return [(HMFNetMonitor *)self initWithNetAddress:0];
}

- (HMFNetMonitor)initWithNetAddress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v6 = [[__HMFNetAddressMonitor alloc] initWithNetAddress:v4];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)HMFNetMonitor;
    v6 = [(HMFNetMonitor *)&v9 init];
    self = &v6->super;
  }
  p_super = &v6->super;

  return p_super;
}

- (HMFNetMonitor)initWithNetService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v6 = [[__HMFNetServiceMonitor alloc] initWithNetService:v4];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)HMFNetMonitor;
    v6 = [(HMFNetMonitor *)&v9 init];
    self = &v6->super;
  }
  p_super = &v6->super;

  return p_super;
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
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_reachable == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_reachable = v3;
    os_unfair_lock_unlock(p_lock);
    v6 = (void *)MEMORY[0x19F3A87A0]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_super v9 = HMFGetLogIdentifier(v7);
      v10 = HMFBooleanToString(v3);
      int v20 = 138543618;
      v21 = v9;
      __int16 v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_19D57B000, v8, OS_LOG_TYPE_INFO, "%{public}@Reachability changed to: %@", (uint8_t *)&v20, 0x16u);
    }
    v11 = [(HMFNetMonitor *)v7 delegate];
    if (v3)
    {
      if (objc_opt_respondsToSelector())
      {
        v12 = (void *)MEMORY[0x19F3A87A0]();
        v13 = v7;
        v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = HMFGetLogIdentifier(v13);
          int v20 = 138543362;
          v21 = v15;
          _os_log_impl(&dword_19D57B000, v14, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate address is reachable", (uint8_t *)&v20, 0xCu);
        }
        [v11 networkMonitorIsReachable:v13];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      v16 = (void *)MEMORY[0x19F3A87A0]();
      v17 = v7;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = HMFGetLogIdentifier(v17);
        int v20 = 138543362;
        v21 = v19;
        _os_log_impl(&dword_19D57B000, v18, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate address is unreachable", (uint8_t *)&v20, 0xCu);
      }
      [v11 networkMonitorIsUnreachable:v17];
    }
  }
}

- (unint64_t)reachabilityPath
{
  return 1;
}

+ (id)logCategory
{
  if (_MergedGlobals_3 != -1) {
    dispatch_once(&_MergedGlobals_3, &__block_literal_global_6);
  }
  v2 = (void *)qword_1EB4EEA20;
  return v2;
}

uint64_t __28__HMFNetMonitor_logCategory__block_invoke()
{
  qword_1EB4EEA20 = HMFCreateOSLogHandle(@"Networking.Monitor", @"com.apple.HMFoundation");
  return MEMORY[0x1F41817F8]();
}

- (HMFNetMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMFNetMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HMFNetAddress)netAddress
{
  return self->_netAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netAddress, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end