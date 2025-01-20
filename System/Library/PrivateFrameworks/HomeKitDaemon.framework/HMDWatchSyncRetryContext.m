@interface HMDWatchSyncRetryContext
+ (id)createWithWatchIdentifier:(id)a3 watchSync:(id)a4 retryAttempt:(int64_t)a5;
- (HMDWatchSync)watchSync;
- (HMDWatchSyncRetryContext)initWithWatchIdentifier:(id)a3 watchSync:(id)a4 retryAttempt:(int64_t)a5 initialRetryInterval:(double)a6 maximumRetryAttempts:(int64_t)a7;
- (NSString)watchIdentifier;
- (double)initialRetryInterval;
- (double)retryInterval;
- (id)attributeDescriptions;
- (int64_t)maximumRetryAttempts;
- (int64_t)retryAttempt;
@end

@implementation HMDWatchSyncRetryContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchIdentifier, 0);
  objc_storeStrong((id *)&self->_watchSync, 0);
}

- (int64_t)maximumRetryAttempts
{
  return self->_maximumRetryAttempts;
}

- (double)initialRetryInterval
{
  return self->_initialRetryInterval;
}

- (int64_t)retryAttempt
{
  return self->_retryAttempt;
}

- (NSString)watchIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (HMDWatchSync)watchSync
{
  return (HMDWatchSync *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v15[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDWatchSyncRetryContext *)self watchIdentifier];
  v5 = (void *)[v3 initWithName:@"Watch Identifier" value:v4];
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDWatchSyncRetryContext *)self watchSync];
  v8 = (void *)[v6 initWithName:@"Watch Sync" value:v7];
  v15[1] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  v10 = NSNumber;
  [(HMDWatchSyncRetryContext *)self retryInterval];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  v12 = (void *)[v9 initWithName:@"Retry Interval" value:v11];
  v15[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];

  return v13;
}

- (double)retryInterval
{
  double v3 = exp2((double)[(HMDWatchSyncRetryContext *)self retryAttempt]);
  [(HMDWatchSyncRetryContext *)self initialRetryInterval];
  return v4 * v3;
}

- (HMDWatchSyncRetryContext)initWithWatchIdentifier:(id)a3 watchSync:(id)a4 retryAttempt:(int64_t)a5 initialRetryInterval:(double)a6 maximumRetryAttempts:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HMDWatchSyncRetryContext;
  v15 = [(HMDWatchSyncRetryContext *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_watchIdentifier, a3);
    uint64_t v17 = [v14 copy];
    watchSync = v16->_watchSync;
    v16->_watchSync = (HMDWatchSync *)v17;

    v16->_retryAttempt = a5;
    v16->_initialRetryInterval = a6;
    v16->_maximumRetryAttempts = a7;
  }

  return v16;
}

+ (id)createWithWatchIdentifier:(id)a3 watchSync:(id)a4 retryAttempt:(int64_t)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x263F42608] sharedPreferences];
  v10 = [v9 preferenceForKey:@"HMDWatchSyncMaximumRetryAttempts"];
  v11 = [v10 numberValue];

  if ([v11 integerValue] <= 0)
  {
    uint64_t v20 = MEMORY[0x230FBD990]();
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      int v31 = 138543874;
      v32 = v22;
      __int16 v33 = 2112;
      v34 = @"HMDWatchSyncMaximumRetryAttempts";
      __int16 v35 = 2112;
      v36 = v11;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Value for maximum watch sync retry attempts key: %@ is less than equal to 0: %@", (uint8_t *)&v31, 0x20u);
    }
    v23 = (void *)v20;
    goto LABEL_11;
  }
  if ([v11 integerValue] <= a5)
  {
    uint64_t v24 = MEMORY[0x230FBD990]();
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = HMFGetLogIdentifier();
      int v31 = 138543874;
      v32 = v26;
      __int16 v33 = 2048;
      v34 = (__CFString *)a5;
      __int16 v35 = 2112;
      v36 = v11;
      _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Exhausted all watch sync retry attempts. Current attempt: %lu, maximum attempts: %@", (uint8_t *)&v31, 0x20u);
    }
    v23 = (void *)v24;
LABEL_11:
    v19 = 0;
    goto LABEL_16;
  }
  v12 = [MEMORY[0x263F42608] sharedPreferences];
  id v13 = [v12 preferenceForKey:@"HMDWatchSyncInitialRetryInterval"];
  id v14 = [v13 numberValue];

  uint64_t v15 = [v14 doubleValue];
  if (v16 <= 0.0)
  {
    v27 = (void *)MEMORY[0x230FBD990](v15);
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = HMFGetLogIdentifier();
      int v31 = 138543874;
      v32 = v29;
      __int16 v33 = 2112;
      v34 = @"HMDWatchSyncInitialRetryInterval";
      __int16 v35 = 2112;
      v36 = v14;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Value for watch sync initial retry interval: %@ is less than equal to 0: %@", (uint8_t *)&v31, 0x20u);
    }
    v19 = 0;
  }
  else
  {
    uint64_t v17 = [HMDWatchSyncRetryContext alloc];
    [v14 doubleValue];
    v19 = -[HMDWatchSyncRetryContext initWithWatchIdentifier:watchSync:retryAttempt:initialRetryInterval:maximumRetryAttempts:](v17, "initWithWatchIdentifier:watchSync:retryAttempt:initialRetryInterval:maximumRetryAttempts:", v7, v8, a5, [v11 integerValue], v18);
  }

LABEL_16:
  return v19;
}

@end