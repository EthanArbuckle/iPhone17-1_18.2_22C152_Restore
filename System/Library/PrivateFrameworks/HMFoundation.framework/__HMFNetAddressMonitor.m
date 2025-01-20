@interface __HMFNetAddressMonitor
- (__HMFNetAddressMonitor)init;
- (__HMFNetAddressMonitor)initWithNetAddress:(id)a3;
- (__HMFNetAddressMonitor)initWithNetService:(id)a3;
- (__SCNetworkReachability)networkReachabilityRef;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (id)netAddress;
- (id)shortDescription;
- (unint64_t)reachabilityPath;
- (unsigned)currentNetworkFlags;
- (void)dealloc;
- (void)handleNetworkReachabilityChange:(unsigned int)a3;
- (void)setCurrentNetworkFlags:(unsigned int)a3;
@end

@implementation __HMFNetAddressMonitor

- (unint64_t)reachabilityPath
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  unsigned int currentNetworkFlags = self->_currentNetworkFlags;
  uint64_t v5 = 2;
  if ((currentNetworkFlags & 0x40000) != 0) {
    uint64_t v5 = 3;
  }
  if ((currentNetworkFlags & 2) != 0) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = 1;
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (__HMFNetAddressMonitor)initWithNetService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (__HMFNetAddressMonitor)init
{
  return [(__HMFNetAddressMonitor *)self initWithNetAddress:0];
}

- (__HMFNetAddressMonitor)initWithNetAddress:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v35.receiver = self;
  v35.super_class = (Class)__HMFNetAddressMonitor;
  v7 = [(HMFNetMonitor *)&v35 initWithNetAddress:v6];
  v8 = v7;
  if (!v7)
  {
LABEL_16:
    v32 = v8;
    goto LABEL_22;
  }
  v9 = (const char *)HMFDispatchQueueName(v7, 0);
  id v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v11 = dispatch_queue_create(v9, v10);
  queue = v8->_queue;
  v8->_queue = (OS_dispatch_queue *)v11;

  objc_storeStrong((id *)&v8->_netAddress, a3);
  if (v6)
  {
    CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    id v14 = [v6 addressString];
    v8->_networkReachabilityRef = SCNetworkReachabilityCreateWithName(v13, (const char *)[v14 UTF8String]);

    if (v8->_networkReachabilityRef)
    {
LABEL_4:
      memset(&context, 0, sizeof(context));
      v15 = [[HMFWeakObject alloc] initWithWeakObject:v8];
      context.info = v15;
      context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E4F1C280];
      context.release = (void (__cdecl *)(const void *))MEMORY[0x1E4F1C278];
      SCNetworkReachabilitySetCallback(v8->_networkReachabilityRef, (SCNetworkReachabilityCallBack)_networkReachabilityChangeCallback, &context);
      SCNetworkReachabilitySetDispatchQueue(v8->_networkReachabilityRef, (dispatch_queue_t)v8->_queue);
      SCNetworkReachabilityFlags flags = 0;
      int v16 = SCNetworkReachabilityGetFlags(v8->_networkReachabilityRef, &flags);
      v17 = (void *)MEMORY[0x19F3A87A0]();
      v18 = v8;
      v19 = HMFGetOSLogHandle();
      v20 = v19;
      if (v16)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v21 = HMFGetLogIdentifier(v18);
          v22 = __SCNetworkReachabilityFlagsToString(flags);
          *(_DWORD *)buf = 138543618;
          v37 = v21;
          __int16 v38 = 2112;
          v39 = v22;
          _os_log_impl(&dword_19D57B000, v20, OS_LOG_TYPE_INFO, "%{public}@Initial flags: %@", buf, 0x16u);
        }
        char v23 = flags;
        v18->_unsigned int currentNetworkFlags = flags;
        v18->super._reachable = (v23 & 2) != 0;
      }
      else
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v31 = HMFGetLogIdentifier(v18);
          *(_DWORD *)buf = 138543362;
          v37 = v31;
          _os_log_impl(&dword_19D57B000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to get initial reachability", buf, 0xCu);
        }
      }

      goto LABEL_16;
    }
  }
  else
  {
    *(_OWORD *)&context.version = xmmword_19D611960;
    SCNetworkReachabilityRef v24 = SCNetworkReachabilityCreateWithAddress(0, (const sockaddr *)&context);
    v8->_networkReachabilityRef = v24;
    if (v24) {
      goto LABEL_4;
    }
  }
  v25 = (void *)MEMORY[0x19F3A87A0]();
  v26 = v8;
  v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier(v26);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v29 = NSString;
      v3 = [v6 addressString];
      v30 = [v29 stringWithFormat:@"for %@", v3];
    }
    else
    {
      v30 = &stru_1EEF0F5E0;
    }
    LODWORD(context.version) = 138543618;
    *(CFIndex *)((char *)&context.version + 4) = (CFIndex)v28;
    WORD2(context.info) = 2112;
    *(void **)((char *)&context.info + 6) = v30;
    _os_log_impl(&dword_19D57B000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to create network reachability monitor%@.", (uint8_t *)&context, 0x16u);
    if (v6)
    {
    }
  }

  v32 = 0;
LABEL_22:

  return v32;
}

- (void)dealloc
{
  networkReachabilityRef = self->_networkReachabilityRef;
  if (networkReachabilityRef)
  {
    SCNetworkReachabilitySetCallback(networkReachabilityRef, 0, 0);
    SCNetworkReachabilitySetDispatchQueue(self->_networkReachabilityRef, 0);
    CFRelease(self->_networkReachabilityRef);
    self->_networkReachabilityRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)__HMFNetAddressMonitor;
  [(__HMFNetAddressMonitor *)&v4 dealloc];
}

- (id)shortDescription
{
  v3 = NSString;
  objc_super v4 = [(id)objc_opt_class() shortDescription];
  uint64_t v5 = [(__HMFNetAddressMonitor *)self netAddress];
  if (v5)
  {
    id v6 = [(__HMFNetAddressMonitor *)self netAddress];
    v7 = [v6 addressString];
    v8 = [v3 stringWithFormat:@"%@ '%@'", v4, v7];
  }
  else
  {
    v8 = [v3 stringWithFormat:@"%@ '%@'", v4, @"localhost"];
  }

  return v8;
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = [HMFAttributeDescription alloc];
  objc_super v4 = [(__HMFNetAddressMonitor *)self netAddress];
  uint64_t v5 = [(HMFAttributeDescription *)v3 initWithName:@"Address" value:v4];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (void)handleNetworkReachabilityChange:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x19F3A87A0](self, a2);
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = HMFGetLogIdentifier(v6);
    __SCNetworkReachabilityFlagsToString(v3);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v19 = 138543618;
    uint64_t v20 = (uint64_t)v8;
    __int16 v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Received notification of updated flags: %@", (uint8_t *)&v19, 0x16u);
  }
  unsigned int v10 = [(__HMFNetAddressMonitor *)v6 currentNetworkFlags];
  unsigned int v11 = v3 & 2;
  uint64_t v12 = [(__HMFNetAddressMonitor *)v6 setCurrentNetworkFlags:v3];
  if (((v10 >> 1) & 1) != v11 >> 1)
  {
    CFAllocatorRef v13 = (void *)MEMORY[0x19F3A87A0](v12);
    id v14 = v6;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = HMFGetLogIdentifier(v14);
      v17 = (void *)v16;
      v18 = @"unreachable";
      if (v11) {
        v18 = @"reachable";
      }
      int v19 = 138543618;
      uint64_t v20 = v16;
      __int16 v21 = 2112;
      v22 = v18;
      _os_log_impl(&dword_19D57B000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Updating reachability to: %@", (uint8_t *)&v19, 0x16u);
    }
    [(HMFNetMonitor *)v14 setReachable:v11 != 0];
  }
}

- (id)logIdentifier
{
  uint64_t v3 = [(__HMFNetAddressMonitor *)self netAddress];
  if (v3)
  {
    objc_super v4 = [(__HMFNetAddressMonitor *)self netAddress];
    uint64_t v5 = [v4 addressString];
  }
  else
  {
    uint64_t v5 = @"localhost";
  }

  return v5;
}

- (id)netAddress
{
  return self->_netAddress;
}

- (__SCNetworkReachability)networkReachabilityRef
{
  return self->_networkReachabilityRef;
}

- (unsigned)currentNetworkFlags
{
  return self->_currentNetworkFlags;
}

- (void)setCurrentNetworkFlags:(unsigned int)a3
{
  self->_unsigned int currentNetworkFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_netAddress, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end