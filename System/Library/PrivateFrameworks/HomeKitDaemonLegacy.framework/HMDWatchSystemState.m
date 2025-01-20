@interface HMDWatchSystemState
+ (id)sharedState;
- (BOOL)isCompanionReachable;
- (HMDWatchSystemState)init;
- (NSHashTable)watchSystemStateDelegates;
- (void)_callDidUpdateReachabilityChangeForCompanion:(BOOL)a3 forDelegate:(id)a4;
- (void)registerDelegate:(id)a3;
- (void)setCompanionReachable:(BOOL)a3;
@end

@implementation HMDWatchSystemState

- (void).cxx_destruct
{
}

- (void)_callDidUpdateReachabilityChangeForCompanion:(BOOL)a3 forDelegate:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  if [v5 conformsToProtocol:&unk_1F2E99130] && (objc_opt_respondsToSelector()) {
    [v5 didUpdateReachabilityChangeForCompanion:v4];
  }
}

- (void)registerDelegate:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSHashTable *)self->_watchSystemStateDelegates addObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (NSHashTable)watchSystemStateDelegates
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSHashTable *)self->_watchSystemStateDelegates copy];
  os_unfair_lock_unlock(p_lock);
  return (NSHashTable *)v4;
}

- (void)setCompanionReachable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  uint64_t v6 = os_unfair_lock_lock_with_options();
  if (self->_companionReachable == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v7 = (void *)MEMORY[0x1D9452090](v6);
    HMFGetOSLogHandle();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = HMFBooleanToString();
      *(_DWORD *)buf = 138543874;
      id v23 = v9;
      __int16 v24 = 2112;
      id v25 = v10;
      __int16 v26 = 2112;
      v27 = v11;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@[HMDWatchState] companion reachability is changing from %@ to %@", buf, 0x20u);
    }
    v12 = +[HMDWatchConnectivityLogEventManager sharedInstance];
    if (v3) {
      [v12 incrementWatchAddedNotificationCount];
    }
    else {
      [v12 incrementWatchRemovedNotificationCount];
    }

    self->_companionReachable = v3;
    os_unfair_lock_unlock(p_lock);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v13 = self->_watchSystemStateDelegates;
    uint64_t v14 = [(NSHashTable *)v13 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v13);
          }
          -[HMDWatchSystemState _callDidUpdateReachabilityChangeForCompanion:forDelegate:](self, "_callDidUpdateReachabilityChangeForCompanion:forDelegate:", v3, *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        }
        uint64_t v14 = [(NSHashTable *)v13 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v14);
    }
  }
}

- (BOOL)isCompanionReachable
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_companionReachable;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (HMDWatchSystemState)init
{
  v7.receiver = self;
  v7.super_class = (Class)HMDWatchSystemState;
  v2 = [(HMDWatchSystemState *)&v7 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_companionReachable = 0;
    uint64_t v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    watchSystemStateDelegates = v3->_watchSystemStateDelegates;
    v3->_watchSystemStateDelegates = (NSHashTable *)v4;
  }
  return v3;
}

+ (id)sharedState
{
  if (isWatch())
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__HMDWatchSystemState_sharedState__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (sharedState_onceToken != -1) {
      dispatch_once(&sharedState_onceToken, block);
    }
    id v3 = (id)sharedState_shared;
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

uint64_t __34__HMDWatchSystemState_sharedState__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedState_shared;
  sharedState_shared = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

@end