@interface HMDMediaAccessoryBrowseOperation
+ (double)defaultTimeout;
+ (id)logCategory;
- (HMDMediaAccessoryBrowseOperation)initWithAccessoryIdentifier:(id)a3;
- (HMDMediaAccessoryBrowseOperation)initWithAccessoryIdentifier:(id)a3 timeout:(double)a4;
- (HMDMediaEndpoint)endpoint;
- (NSArray)outputDevices;
- (NSString)accessoryIdentifier;
- (unsigned)endpointFeatures;
- (void)cancel;
- (void)dealloc;
- (void)main;
- (void)setEndpointFeatures:(unsigned int)a3;
@end

@implementation HMDMediaAccessoryBrowseOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_outputDevices, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (NSString)accessoryIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 352, 1);
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)HMDMediaAccessoryBrowseOperation;
  [(HMFOperation *)&v3 cancel];
  if (self->_session) {
    MEMORY[0x230FBC470]();
  }
}

- (void)main
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unsigned int v3 = [(HMDMediaAccessoryBrowseOperation *)self endpointFeatures];
  if (v3 != -1)
  {
    unsigned int v4 = v3;
    v5 = (void *)MEMORY[0x230FBD990]();
    v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v15 = v8;
      __int16 v16 = 1024;
      unsigned int v17 = v4;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting features: %u", buf, 0x12u);
    }
  }
  accessoryIdentifier = self->_accessoryIdentifier;
  [MEMORY[0x263EFF8C0] arrayWithObjects:&accessoryIdentifier count:1];
  [(HMDMediaAccessoryBrowseOperation *)self endpointFeatures];
  self->_session = (void *)MRAVReconnaissanceSessionCreateWithEndpointFeatures();
  objc_initWeak((id *)buf, self);
  v9 = [(HMFOperation *)self timeoutDate];
  [v9 timeIntervalSinceNow];
  double v11 = v10;

  if (v11 <= 0.0) {
    +[HMDMediaAccessoryBrowseOperation defaultTimeout];
  }
  objc_copyWeak(&v12, (id *)buf);
  MRAVReconnaissanceSessionBeginSearch();
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __40__HMDMediaAccessoryBrowseOperation_main__block_invoke(uint64_t a1, const __CFArray *a2, uint64_t a3, void *a4)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained && [WeakRetained isExecuting])
  {
    if (a3)
    {
      v9 = [[HMDMediaEndpoint alloc] initWithEndpoint:a3];
      if (!a2) {
        goto LABEL_16;
      }
    }
    else
    {
      v9 = 0;
      if (!a2) {
        goto LABEL_16;
      }
    }
    CFIndex Count = CFArrayGetCount(a2);
    if (Count < 1)
    {
      a2 = 0;
      if (v9) {
        goto LABEL_22;
      }
LABEL_17:
      if (![(__CFArray *)a2 count])
      {
        v28 = (void *)MEMORY[0x230FBD990]();
        v29 = v8;
        v30 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v37 = v31;
          __int16 v38 = 2112;
          v39 = a4;
          _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to find accessory with error: %@", buf, 0x16u);
        }
        v32 = [MEMORY[0x263F087E8] hmErrorWithCode:2 description:0 reason:0 suggestion:0 underlyingError:a4];
        [v29 cancelWithError:v32];

        goto LABEL_23;
      }
LABEL_22:
      os_unfair_lock_lock_with_options();
      objc_storeStrong((id *)v8 + 42, v9);
      objc_storeStrong((id *)v8 + 43, a2);
      os_unfair_lock_unlock((os_unfair_lock_t)v8 + 78);
      [v8 finish];
LABEL_23:

      goto LABEL_24;
    }
    CFIndex v11 = Count;
    v33 = a4;
    v34 = v9;
    id v12 = [MEMORY[0x263EFF980] arrayWithCapacity:Count];
    CFIndex v13 = 0;
    v14 = &OBJC_METACLASS___HMDSharedUserInviteLogEventBuilder;
    v15 = &OBJC_IVAR___HMDAccessoryAllowedHostsPreviewHelper__expires;
    CFIndex v35 = v11;
    do
    {
      __int16 v16 = objc_msgSend(objc_alloc(&v14[87]), "initWithOutputDevice:", CFArrayGetValueAtIndex(a2, v13));
      unsigned int v17 = v16;
      if (v16)
      {
        uint64_t v18 = *(void **)&v8[v15[610]];
        v19 = [v16 uniqueIdentifier];
        LODWORD(v18) = [v18 isEqualToString:v19];

        if (v18)
        {
          v20 = (void *)MEMORY[0x230FBD990]();
          v21 = v8;
          v22 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            CFArrayRef v23 = a2;
            v24 = v8;
            v25 = v14;
            v27 = v26 = v12;
            *(_DWORD *)buf = 138543618;
            v37 = v27;
            __int16 v38 = 2112;
            v39 = v17;
            _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Found output device: %@", buf, 0x16u);

            id v12 = v26;
            v14 = v25;
            v8 = v24;
            a2 = v23;
            CFIndex v11 = v35;
          }

          [v12 addObject:v17];
          v15 = &OBJC_IVAR___HMDAccessoryAllowedHostsPreviewHelper__expires;
        }
      }

      ++v13;
    }
    while (v11 != v13);
    a2 = (const __CFArray *)[v12 copy];

    a4 = v33;
    v9 = v34;
LABEL_16:
    if (v9) {
      goto LABEL_22;
    }
    goto LABEL_17;
  }
LABEL_24:
}

- (NSArray)outputDevices
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unsigned int v4 = self->_outputDevices;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (HMDMediaEndpoint)endpoint
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  unsigned int v4 = self->_endpoint;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setEndpointFeatures:(unsigned int)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_endpointFeatures = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unsigned)endpointFeatures
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LODWORD(v2) = v2->_endpointFeatures;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (void)dealloc
{
  session = self->_session;
  if (session) {
    CFRelease(session);
  }
  v4.receiver = self;
  v4.super_class = (Class)HMDMediaAccessoryBrowseOperation;
  [(HMDMediaAccessoryBrowseOperation *)&v4 dealloc];
}

- (HMDMediaAccessoryBrowseOperation)initWithAccessoryIdentifier:(id)a3 timeout:(double)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    if (a4 <= 0.0)
    {
      +[HMDMediaAccessoryBrowseOperation defaultTimeout];
      a4 = v7;
    }
    v18.receiver = self;
    v18.super_class = (Class)HMDMediaAccessoryBrowseOperation;
    v8 = [(HMFOperation *)&v18 initWithTimeout:a4];
    v9 = v8;
    if (v8)
    {
      v8->_endpointFeatures = -1;
      uint64_t v10 = [v6 copy];
      accessoryIdentifier = v9->_accessoryIdentifier;
      v9->_accessoryIdentifier = (NSString *)v10;
    }
    id v12 = v9;
    CFIndex v13 = v12;
  }
  else
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    id v12 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v20 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unable to create reconnaissance session with nil identifier", buf, 0xCu);
    }
    CFIndex v13 = 0;
  }

  return v13;
}

- (HMDMediaAccessoryBrowseOperation)initWithAccessoryIdentifier:(id)a3
{
  return [(HMDMediaAccessoryBrowseOperation *)self initWithAccessoryIdentifier:a3 timeout:0.0];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_66748 != -1) {
    dispatch_once(&logCategory__hmf_once_t9_66748, &__block_literal_global_14_66749);
  }
  v2 = (void *)logCategory__hmf_once_v10_66750;
  return v2;
}

void __47__HMDMediaAccessoryBrowseOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v10_66750;
  logCategory__hmf_once_v10_66750 = v0;
}

+ (double)defaultTimeout
{
  if (defaultTimeout_onceToken != -1) {
    dispatch_once(&defaultTimeout_onceToken, &__block_literal_global_66755);
  }
  return *(double *)&defaultTimeout_timeout;
}

void __50__HMDMediaAccessoryBrowseOperation_defaultTimeout__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F42608] sharedPreferences];
  v1 = [v0 preferenceForKey:@"mediaAccessoryResolutionTimeout"];
  id v5 = [v1 numberValue];

  [v5 doubleValue];
  BOOL v3 = fabs(v2) < 2.22044605e-16 || v2 <= 0.0;
  double v4 = v2 + 3.0;
  if (v3) {
    double v4 = 3.0;
  }
  defaultTimeout_timeout = *(void *)&v4;
}

@end