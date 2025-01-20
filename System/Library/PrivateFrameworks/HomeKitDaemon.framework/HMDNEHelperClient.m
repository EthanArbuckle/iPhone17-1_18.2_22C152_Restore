@interface HMDNEHelperClient
+ (id)logCategory;
- (HMDNEHelperClient)init;
- (id)_signingIdentifierWithProcessId:(id)a3;
- (id)cacheCopyAppUUIDForSigningIdentifier:(id)a3 executablePath:(id)a4;
- (id)cacheCopySigningIdentifierForProcessIdentifier:(id)a3;
- (void)_addIdentifiers:(id)a3 signingId:(id)a4;
- (void)cacheClearUUIDs;
@end

@implementation HMDNEHelperClient

- (void).cxx_destruct
{
}

- (void)cacheClearUUIDs
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Clearing cached UUIDs", (uint8_t *)&v8, 0xCu);
  }
  cachedEntries = v4->_cachedEntries;
  v4->_cachedEntries = (NSArray *)MEMORY[0x263EFFA68];

  NEHelperCacheClearUUIDs();
}

- (id)cacheCopySigningIdentifierForProcessIdentifier:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDNEHelperClient *)self _signingIdentifierWithProcessId:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v13[0] = 0;
    v13[1] = 0;
    [v4 getUUIDBytes:v13];
    uint64_t v8 = NEHelperCacheCopySigningIdentifierMapping();
    v9 = (void *)v8;
    if (v8 && MEMORY[0x230FBEB10](v8) == MEMORY[0x263EF8798])
    {
      id v10 = [NSString alloc];
      string_ptr = xpc_string_get_string_ptr(v9);
      id v7 = (id)[v10 initWithBytes:string_ptr length:xpc_string_get_length(v9) encoding:4];
    }
    else
    {
      id v7 = 0;
    }
  }
  return v7;
}

- (id)cacheCopyAppUUIDForSigningIdentifier:(id)a3 executablePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  [v8 UTF8String];
  if (v7) {
    [v7 UTF8String];
  }
  uint64_t v9 = NEHelperCacheCopyAppUUIDMapping();
  id v10 = (void *)v9;
  if (v9 && MEMORY[0x230FBEB10](v9) == MEMORY[0x263EF86D8])
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__12728;
    v18 = __Block_byref_object_dispose__12729;
    id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = __73__HMDNEHelperClient_cacheCopyAppUUIDForSigningIdentifier_executablePath___block_invoke;
    applier[3] = &unk_264A15E70;
    applier[4] = &v14;
    xpc_array_apply(v10, applier);
    if ([(id)v15[5] count])
    {
      [(HMDNEHelperClient *)self _addIdentifiers:v15[5] signingId:v8];
      id v11 = (id)v15[5];
    }
    else
    {
      id v11 = 0;
    }
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

uint64_t __73__HMDNEHelperClient_cacheCopyAppUUIDForSigningIdentifier_executablePath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x230FBEB10](v4) == MEMORY[0x263EF87A8])
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:xpc_uuid_get_bytes(v5)];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v6];
  }
  return 1;
}

- (id)_signingIdentifierWithProcessId:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  cachedEntries = self->_cachedEntries;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __53__HMDNEHelperClient__signingIdentifierWithProcessId___block_invoke;
  v15[3] = &unk_264A15E48;
  id v6 = v4;
  id v16 = v6;
  uint64_t v7 = [(NSArray *)cachedEntries indexOfObjectPassingTest:v15];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v9 = [(NSArray *)self->_cachedEntries objectAtIndexedSubscript:v7];
    id v8 = [v9 signingId];

    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v18 = v13;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Local cache hit for %@: %@", buf, 0x20u);
    }
  }

  return v8;
}

uint64_t __53__HMDNEHelperClient__signingIdentifierWithProcessId___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifiers];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

- (void)_addIdentifiers:(id)a3 signingId:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  cachedEntries = self->_cachedEntries;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __47__HMDNEHelperClient__addIdentifiers_signingId___block_invoke;
  v17[3] = &unk_264A15E48;
  id v9 = v7;
  id v18 = v9;
  if ([(NSArray *)cachedEntries indexOfObjectPassingTest:v17] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      id v20 = v13;
      __int16 v21 = 2112;
      id v22 = v9;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Caching process identifiers for %@: %@", buf, 0x20u);
    }
    uint64_t v14 = [[_HMDNEHelperClientCacheEntry alloc] initWithSigningId:v9 identifiers:v6];
    v15 = [(NSArray *)self->_cachedEntries arrayByAddingObject:v14];
    id v16 = self->_cachedEntries;
    self->_cachedEntries = v15;
  }
}

uint64_t __47__HMDNEHelperClient__addIdentifiers_signingId___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 signingId];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (HMDNEHelperClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMDNEHelperClient;
  v2 = [(HMDNEHelperClient *)&v6 init];
  v3 = v2;
  if (v2)
  {
    cachedEntries = v2->_cachedEntries;
    v2->_cachedEntries = (NSArray *)MEMORY[0x263EFFA68];
  }
  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3 != -1) {
    dispatch_once(&logCategory__hmf_once_t3, &__block_literal_global_12738);
  }
  v2 = (void *)logCategory__hmf_once_v4;
  return v2;
}

void __32__HMDNEHelperClient_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v4;
  logCategory__hmf_once_uint64_t v4 = v0;
}

@end