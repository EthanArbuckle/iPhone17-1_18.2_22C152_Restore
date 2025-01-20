@interface _HMDIDSProxyLinkPreferenceAssertion
- (HMDIDSService)proxyService;
- (_HMDIDSProxyLinkPreferenceAssertion)initWithIDSProxyService:(id)a3;
- (void)dealloc;
@end

@implementation _HMDIDSProxyLinkPreferenceAssertion

- (void).cxx_destruct
{
}

- (HMDIDSService)proxyService
{
  return self->_proxyService;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Resetting the link preference for proxy service", buf, 0xCu);
  }
  v7 = [(_HMDIDSProxyLinkPreferenceAssertion *)v4 proxyService];
  [v7 setLinkPreferences:MEMORY[0x1E4F1CC08]];

  v8.receiver = v4;
  v8.super_class = (Class)_HMDIDSProxyLinkPreferenceAssertion;
  [(_HMDIDSProxyLinkPreferenceAssertion *)&v8 dealloc];
}

- (_HMDIDSProxyLinkPreferenceAssertion)initWithIDSProxyService:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_HMDIDSProxyLinkPreferenceAssertion;
  v6 = [(_HMDIDSProxyLinkPreferenceAssertion *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_proxyService, a3);
    objc_super v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
    v9 = [NSNumber numberWithUnsignedInteger:150];
    [v8 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F6A8C8]];

    [v8 setObject:@"forceBTClassic" forKeyedSubscript:*MEMORY[0x1E4F6A8B8]];
    BOOL v10 = isWatch();
    if (v10) {
      uint64_t v11 = 6250;
    }
    else {
      uint64_t v11 = 37500;
    }
    if (v10) {
      uint64_t v12 = 37500;
    }
    else {
      uint64_t v12 = 6250;
    }
    v13 = [NSNumber numberWithUnsignedInteger:v11];
    [v8 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F6A8B0]];

    v14 = [NSNumber numberWithUnsignedInteger:v12];
    [v8 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F6A8C0]];

    v15 = (void *)MEMORY[0x1D9452090]();
    v16 = v7;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v22 = v18;
      __int16 v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Setting the link preference for proxy service with %@", buf, 0x16u);
    }
    [(HMDIDSService *)v7->_proxyService setLinkPreferences:v8];
  }
  return v7;
}

@end