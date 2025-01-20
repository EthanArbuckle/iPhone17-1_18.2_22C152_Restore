@interface HMFrameworkCacheManager
+ (id)sharedInstance;
- (HMFrameworkCacheManager)initWithTimerFactory:(id)a3;
@end

@implementation HMFrameworkCacheManager

uint64_t __41__HMFrameworkCacheManager_sharedInstance__block_invoke()
{
  v0 = [[HMFrameworkCacheManager alloc] initWithTimerFactory:&__block_literal_global_4];
  uint64_t v1 = sharedInstance_cacheManager;
  sharedInstance_cacheManager = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (HMFrameworkCacheManager)initWithTimerFactory:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = HMCreateFrameworkCacheDirectory();
  if (v5)
  {
    v6 = [[HMDiskCache alloc] initWithCachePath:v5];
    v13.receiver = self;
    v13.super_class = (Class)HMFrameworkCacheManager;
    v7 = [(HMCacheManager *)&v13 initWithTimerFactory:v4 persistentCache:v6];

    v8 = v7;
  }
  else
  {
    v9 = (void *)MEMORY[0x19F3A64A0]();
    v7 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v15 = v11;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to resolve cache directory, not using cache", buf, 0xCu);
    }
    v8 = 0;
  }

  return v8;
}

id __41__HMFrameworkCacheManager_sharedInstance__block_invoke_2()
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:0 options:5.0];

  return v0;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_22665);
  }
  v2 = (void *)sharedInstance_cacheManager;

  return v2;
}

@end