@interface HMMTRPairingWindowInfoTable
+ (id)logCategory;
- (HMMTRPairingWindowInfoTable)init;
- (NSMutableDictionary)table;
- (id)retrieveAccessoryServerForPairingWindowWithSetupPayload:(id)a3 currentDate:(id)a4;
- (void)_clearExpiredEntriesWithCurrentDate:(id)a3;
- (void)registerPairingWindowWithSetupPayload:(id)a3 currentDate:(id)a4 duration:(double)a5 accessoryServer:(id)a6;
@end

@implementation HMMTRPairingWindowInfoTable

- (void).cxx_destruct
{
}

- (NSMutableDictionary)table
{
  return self->_table;
}

- (void)_clearExpiredEntriesWithCurrentDate:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v21 = a3;
  v20 = [MEMORY[0x263EFF980] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v4 = [(HMMTRPairingWindowInfoTable *)self table];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v22 + 1) + 8 * v8);
        v10 = [(HMMTRPairingWindowInfoTable *)self table];
        v11 = [v10 objectForKeyedSubscript:v9];

        v12 = [v11 accessoryServer];
        if (!v12
          || ([v11 expirationDate],
              v13 = objc_claimAutoreleasedReturnValue(),
              uint64_t v14 = [v13 compare:v21],
              v13,
              v14 == -1))
        {
          [v20 addObject:v9];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v6);
  }

  v15 = [(HMMTRPairingWindowInfoTable *)self table];
  [v15 removeObjectsForKeys:v20];

  if ([v20 count])
  {
    v16 = (void *)MEMORY[0x2533B64D0]();
    v17 = self;
    v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v27 = v19;
      __int16 v28 = 2112;
      v29 = v20;
      _os_log_impl(&dword_252495000, v18, OS_LOG_TYPE_INFO, "%{public}@Expired setup payloads: %@", buf, 0x16u);
    }
  }
}

- (id)retrieveAccessoryServerForPairingWindowWithSetupPayload:(id)a3 currentDate:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  [(HMMTRPairingWindowInfoTable *)self _clearExpiredEntriesWithCurrentDate:v7];
  uint64_t v8 = [(HMMTRPairingWindowInfoTable *)self table];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];

  v10 = [v9 accessoryServer];
  os_unfair_lock_unlock(&self->_lock);
  v11 = (void *)MEMORY[0x2533B64D0]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    int v16 = 138543874;
    v17 = v14;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl(&dword_252495000, v13, OS_LOG_TYPE_INFO, "%{public}@Retrieves server with pairing window with setup payload: %@, server: %@", (uint8_t *)&v16, 0x20u);
  }

  return v10;
}

- (void)registerPairingWindowWithSetupPayload:(id)a3 currentDate:(id)a4 duration:(double)a5 accessoryServer:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = (void *)MEMORY[0x2533B64D0]();
  uint64_t v14 = self;
  v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v16 = HMFGetLogIdentifier();
    int v21 = 138544130;
    uint64_t v22 = v16;
    __int16 v23 = 2112;
    id v24 = v10;
    __int16 v25 = 2048;
    double v26 = a5;
    __int16 v27 = 2112;
    id v28 = v12;
    _os_log_impl(&dword_252495000, v15, OS_LOG_TYPE_INFO, "%{public}@Registering pairing window with setup payload: %@, duration: %g, server: %@", (uint8_t *)&v21, 0x2Au);
  }
  os_unfair_lock_lock(&v14->_lock);
  v17 = [HMMTRPairingWindowInfoTableEntry alloc];
  __int16 v18 = [MEMORY[0x263EFF910] dateWithTimeInterval:v11 sinceDate:a5];
  id v19 = [(HMMTRPairingWindowInfoTableEntry *)v17 initWithAccessoryServer:v12 expirationDate:v18];
  __int16 v20 = [(HMMTRPairingWindowInfoTable *)v14 table];
  [v20 setObject:v19 forKeyedSubscript:v10];

  [(HMMTRPairingWindowInfoTable *)v14 _clearExpiredEntriesWithCurrentDate:v11];
  os_unfair_lock_unlock(&v14->_lock);
}

- (HMMTRPairingWindowInfoTable)init
{
  v7.receiver = self;
  v7.super_class = (Class)HMMTRPairingWindowInfoTable;
  v2 = [(HMMTRPairingWindowInfoTable *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    table = v3->_table;
    v3->_table = (NSMutableDictionary *)v4;
  }
  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2 != -1) {
    dispatch_once(&logCategory__hmf_once_t2, &__block_literal_global_4342);
  }
  v2 = (void *)logCategory__hmf_once_v3;
  return v2;
}

uint64_t __42__HMMTRPairingWindowInfoTable_logCategory__block_invoke()
{
  logCategory__hmf_once_v3 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

@end