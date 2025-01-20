@interface HMBCloudPushHandler
+ (id)logCategory;
+ (id)sharedHandlerForEnvironment:(id)a3;
- (HMBCloudPushHandler)initWithAPSConnection:(id)a3;
- (void)_performObserverCallback:(os_unfair_lock_s *)a1;
- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)removeAllObserversForBundleIdentifier:(id)a3;
@end

@implementation HMBCloudPushHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiersByObservers, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D944CB30]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v30 = v11;
    __int16 v31 = 2112;
    id v32 = v6;
    __int16 v33 = 2112;
    id v34 = v7;
    _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_INFO, "%{public}@connection: %@ didReceiveIncomingMessage: %@", buf, 0x20u);
  }
  v12 = (void *)MEMORY[0x1D944CB30]();
  v13 = v9;
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = HMFGetLogIdentifier();
    v16 = [v7 topic];
    v17 = [v7 userInfo];
    *(_DWORD *)buf = 138543874;
    v30 = v15;
    __int16 v31 = 2112;
    id v32 = v16;
    __int16 v33 = 2112;
    id v34 = v17;
    _os_log_impl(&dword_1D4693000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Handling incoming APS message with topic: %@ userInfo: %@", buf, 0x20u);
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __60__HMBCloudPushHandler_connection_didReceiveIncomingMessage___block_invoke;
  v27[3] = &unk_1E69EAD58;
  v27[4] = v13;
  id v18 = v7;
  id v28 = v18;
  -[HMBCloudPushHandler _performObserverCallback:](v13, v27);
  v19 = (void *)MEMORY[0x1E4F1A1D0];
  v20 = [v18 userInfo];
  v21 = [v19 notificationFromRemoteNotificationDictionary:v20];

  if (v21)
  {
    v22 = v26;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v23 = __60__HMBCloudPushHandler_connection_didReceiveIncomingMessage___block_invoke_2;
    v24 = v21;
  }
  else
  {
    v22 = v25;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v23 = __60__HMBCloudPushHandler_connection_didReceiveIncomingMessage___block_invoke_3;
    v24 = v18;
  }
  v22[2] = v23;
  v22[3] = &unk_1E69EAD58;
  v22[4] = v13;
  v22[5] = v24;
  -[HMBCloudPushHandler _performObserverCallback:](v13, v22);
}

void __60__HMBCloudPushHandler_connection_didReceiveIncomingMessage___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = [*(id *)(a1 + 40) topic];
    [v5 handler:v3 didReceivePushForTopic:v4];
  }
}

- (void)_performObserverCallback:(os_unfair_lock_s *)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  if (a1)
  {
    v4 = a1 + 2;
    os_unfair_lock_lock_with_options();
    id v6 = (NSMapTable *)objc_getProperty(a1, v5, 24, 1);
    id v7 = NSAllMapTableKeys(v6);

    os_unfair_lock_unlock(v4);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v8);
          }
          v3[2](v3, *(void *)(*((void *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

void __60__HMBCloudPushHandler_connection_didReceiveIncomingMessage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 handler:*(void *)(a1 + 32) didReceiveCKNotification:*(void *)(a1 + 40)];
  }
}

void __60__HMBCloudPushHandler_connection_didReceiveIncomingMessage___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = [*(id *)(a1 + 40) userInfo];
    [v5 handler:v3 didReceiveMessageWithUserInfo:v4];
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D944CB30]();
  uint64_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v12 = 138543874;
    long long v13 = v11;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_INFO, "%{public}@connection: %@ didReceivePublicToken: %@", (uint8_t *)&v12, 0x20u);
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = (void *)MEMORY[0x1D944CB30]();
  id v15 = self;
  __int16 v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v17 = HMFGetLogIdentifier();
    int v18 = 138544386;
    v19 = v17;
    __int16 v20 = 2112;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    __int16 v24 = 2112;
    id v25 = v12;
    __int16 v26 = 2112;
    id v27 = v13;
    _os_log_impl(&dword_1D4693000, v16, OS_LOG_TYPE_INFO, "%{public}@connection: %@ didReceiveToken: %@ forTopic: %@ identifier: %@", (uint8_t *)&v18, 0x34u);
  }
}

- (void)removeAllObserversForBundleIdentifier:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  if (self) {
    id Property = objc_getProperty(self, v5, 24, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = Property;
  id v8 = (void *)[v7 copy];

  uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v41;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v40 + 1) + 8 * v12);
        if (self) {
          id v14 = objc_getProperty(self, v9, 24, 1);
        }
        else {
          id v14 = 0;
        }
        id v15 = v14;
        __int16 v16 = [v15 objectForKey:v13];

        if ([v16 isEqualToString:v4])
        {
          if (self) {
            id v18 = objc_getProperty(self, v17, 24, 1);
          }
          else {
            id v18 = 0;
          }
          id v19 = v18;
          [v19 removeObjectForKey:v13];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v20 = [v8 countByEnumeratingWithState:&v40 objects:v48 count:16];
      uint64_t v10 = v20;
    }
    while (v20);
  }

  os_unfair_lock_unlock(&self->_lock);
  os_unfair_lock_t lock = &self->_apsLock;
  os_unfair_lock_lock_with_options();
  __int16 v22 = [@"com.apple.icloud-container." stringByAppendingString:v4];
  id v23 = (void *)MEMORY[0x1E4F1CA80];
  if (self) {
    id v24 = objc_getProperty(self, v21, 16, 1);
  }
  else {
    id v24 = 0;
  }
  id v25 = v24;
  __int16 v26 = [v25 enabledTopics];
  id v27 = [v23 setWithArray:v26];

  uint64_t v28 = (void *)MEMORY[0x1D944CB30]([v27 removeObject:v22]);
  v29 = self;
  HMFGetOSLogHandle();
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    __int16 v31 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v45 = v31;
    __int16 v46 = 2112;
    v47 = v22;
    _os_log_impl(&dword_1D4693000, v30, OS_LOG_TYPE_INFO, "%{public}@Removing enabled topic from APS connection: %@", buf, 0x16u);
  }
  __int16 v33 = [v27 allObjects];
  if (self) {
    id v34 = objc_getProperty(v29, v32, 16, 1);
  }
  else {
    id v34 = 0;
  }
  id v35 = v34;
  [v35 setEnabledTopics:v33];

  if (self) {
    id v37 = objc_getProperty(v29, v36, 16, 1);
  }
  else {
    id v37 = 0;
  }
  id v38 = v37;
  [v38 invalidateTokenForTopic:v22 identifier:0];

  os_unfair_lock_unlock(lock);
}

- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v6 = a4;
  os_unfair_lock_lock_with_options();
  if (self) {
    id Property = objc_getProperty(self, v7, 24, 1);
  }
  else {
    id Property = 0;
  }
  id v9 = Property;
  [v9 setObject:v6 forKey:v32];

  os_unfair_lock_unlock(&self->_lock);
  p_apsLock = &self->_apsLock;
  os_unfair_lock_lock_with_options();
  uint64_t v12 = [@"com.apple.icloud-container." stringByAppendingString:v6];
  uint64_t v13 = (void *)MEMORY[0x1E4F1CA80];
  if (self) {
    id v14 = objc_getProperty(self, v11, 16, 1);
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;
  __int16 v16 = [v15 enabledTopics];
  id v17 = [v13 setWithArray:v16];

  id v18 = (void *)MEMORY[0x1D944CB30]([v17 addObject:v12]);
  id v19 = self;
  HMFGetOSLogHandle();
  uint64_t v20 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    id v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v34 = v21;
    __int16 v35 = 2112;
    v36 = v12;
    _os_log_impl(&dword_1D4693000, v20, OS_LOG_TYPE_INFO, "%{public}@Adding enabled topic to APS connection: %@", buf, 0x16u);
  }
  if (self) {
    id v23 = objc_getProperty(v19, v22, 16, 1);
  }
  else {
    id v23 = 0;
  }
  id v24 = v23;
  [v24 setDelegate:v19];

  __int16 v26 = [v17 allObjects];
  if (self) {
    id v27 = objc_getProperty(v19, v25, 16, 1);
  }
  else {
    id v27 = 0;
  }
  id v28 = v27;
  [v28 setEnabledTopics:v26];

  if (self) {
    id v30 = objc_getProperty(v19, v29, 16, 1);
  }
  else {
    id v30 = 0;
  }
  id v31 = v30;
  [v31 requestTokenForTopic:v12 identifier:0];

  os_unfair_lock_unlock(p_apsLock);
}

- (HMBCloudPushHandler)initWithAPSConnection:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMBCloudPushHandler;
  id v6 = [(HMBCloudPushHandler *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_apsLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_apsConnection, a3);
    uint64_t v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    bundleIdentifiersByObservers = v7->_bundleIdentifiersByObservers;
    v7->_bundleIdentifiersByObservers = (NSMapTable *)v8;
  }
  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t12 != -1) {
    dispatch_once(&logCategory__hmf_once_t12, &__block_literal_global_77);
  }
  v2 = (void *)logCategory__hmf_once_v13;
  return v2;
}

uint64_t __34__HMBCloudPushHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v13;
  logCategory__hmf_once_uint64_t v13 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)sharedHandlerForEnvironment:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (sharedHandlerForEnvironment__onceToken != -1) {
    dispatch_once(&sharedHandlerForEnvironment__onceToken, &__block_literal_global_5850);
  }
  id v4 = (id)sharedHandlerForEnvironment__pushHandlersByEnvironment;
  objc_sync_enter(v4);
  id v5 = [(id)sharedHandlerForEnvironment__pushHandlersByEnvironment objectForKeyedSubscript:v3];
  if (!v5)
  {
    id v5 = [HMBCloudPushHandler alloc];
    id v6 = v3;
    if (v5)
    {
      id v7 = (void *)MEMORY[0x1D944CB30]();
      uint64_t v8 = v5;
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = HMFGetLogIdentifier();
        int v17 = 138543874;
        id v18 = v10;
        __int16 v19 = 2112;
        id v20 = v6;
        __int16 v21 = 2112;
        __int16 v22 = @"com.apple.homed.aps";
        _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_INFO, "%{public}@Creating APSConnection with environment: %@ namedDelegatePort: %@", (uint8_t *)&v17, 0x20u);
      }
      id v11 = objc_alloc(MEMORY[0x1E4F4E1E8]);
      uint64_t v12 = (const char *)HMFDispatchQueueName();
      uint64_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v14 = dispatch_queue_create(v12, v13);
      id v15 = (void *)[v11 initWithEnvironmentName:v6 namedDelegatePort:@"com.apple.homed.aps" queue:v14];

      id v5 = [(HMBCloudPushHandler *)v8 initWithAPSConnection:v15];
    }

    [(id)sharedHandlerForEnvironment__pushHandlersByEnvironment setObject:v5 forKeyedSubscript:v6];
  }
  objc_sync_exit(v4);

  return v5;
}

uint64_t __51__HMBCloudPushHandler_sharedHandlerForEnvironment___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v1 = sharedHandlerForEnvironment__pushHandlersByEnvironment;
  sharedHandlerForEnvironment__pushHandlersByEnvironment = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end