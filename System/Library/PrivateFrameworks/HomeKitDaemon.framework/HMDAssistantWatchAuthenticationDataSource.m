@interface HMDAssistantWatchAuthenticationDataSource
- (void)getCurrentRequestIsWatchAuthenticatedWithCompletion:(id)a3;
@end

@implementation HMDAssistantWatchAuthenticationDataSource

- (void)getCurrentRequestIsWatchAuthenticatedWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Requesting watch auth from siri for current request", buf, 0xCu);
  }
  id v9 = objc_alloc_init(MEMORY[0x263F285E0]);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __97__HMDAssistantWatchAuthenticationDataSource_getCurrentRequestIsWatchAuthenticatedWithCompletion___block_invoke;
  v12[3] = &unk_264A1A670;
  id v13 = v9;
  id v14 = v4;
  id v10 = v4;
  id v11 = v9;
  [v11 getCurrentRequestIsWatchAuthenticatedWithCompletion:v12];
}

uint64_t __97__HMDAssistantWatchAuthenticationDataSource_getCurrentRequestIsWatchAuthenticatedWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end