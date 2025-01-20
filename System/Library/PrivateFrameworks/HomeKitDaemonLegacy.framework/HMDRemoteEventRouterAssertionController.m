@interface HMDRemoteEventRouterAssertionController
+ (id)logCategory;
- (HMDRemoteEventRouterAssertionController)initWithQueue:(id)a3 notificationCenter:(id)a4;
- (id)takeEventRouterAssertion;
- (uint64_t)hasActiveClients;
- (void)_notifyDidChangeHasForegroundClient;
- (void)assertionDidBecomeInactive:(id)a3;
- (void)configure;
- (void)handleConnectionActiveStateUpdatedNotification:(id)a3;
- (void)registerClient:(id)a3;
@end

@implementation HMDRemoteEventRouterAssertionController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonAssertions, 0);
  objc_storeStrong((id *)&self->_appStateChangeAssertion, 0);
  objc_storeStrong((id *)&self->_timerProvider, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)assertionDidBecomeInactive:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Event router active assertion became inactive: %@", buf, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  if (v6) {
    id Property = objc_getProperty(v6, v9, 56, 1);
  }
  else {
    id Property = 0;
  }
  id v11 = Property;
  [v11 removeObject:v4];

  os_unfair_lock_unlock(&v6->_lock);
  if (v6) {
    queue = v6->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__HMDRemoteEventRouterAssertionController_assertionDidBecomeInactive___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = v6;
  dispatch_async(queue, block);
}

void __70__HMDRemoteEventRouterAssertionController_assertionDidBecomeInactive___block_invoke(uint64_t a1)
{
}

- (void)_notifyDidChangeHasForegroundClient
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    uint64_t active = -[HMDRemoteEventRouterAssertionController hasActiveClients]((os_unfair_lock_s *)a1);
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "didChangeHasForegroundClient:", active, (void)v8);
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (uint64_t)hasActiveClients
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v2 = a1 + 2;
  os_unfair_lock_lock_with_options();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = objc_getProperty(a1, v3, 56, 1);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isActive", (void)v9))
        {
          uint64_t v5 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  os_unfair_lock_unlock(v2);
  return v5;
}

- (id)takeEventRouterAssertion
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  SEL v3 = [[HMDRemoteEventRouterAssertion alloc] initWithAssertionController:self];
  id v4 = (void *)MEMORY[0x1D9452090]();
  uint64_t v5 = self;
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v15 = v7;
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Did take event router active assertion: %@", buf, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  if (v5) {
    id Property = objc_getProperty(v5, v8, 56, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  [v10 addObject:v3];

  os_unfair_lock_unlock(&v5->_lock);
  if (v5) {
    queue = v5->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__HMDRemoteEventRouterAssertionController_takeEventRouterAssertion__block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = v5;
  dispatch_async(queue, block);
  return v3;
}

void __67__HMDRemoteEventRouterAssertionController_takeEventRouterAssertion__block_invoke(uint64_t a1)
{
}

- (void)registerClient:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__HMDRemoteEventRouterAssertionController_registerClient___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __58__HMDRemoteEventRouterAssertionController_registerClient___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    SEL v3 = *(void **)(v2 + 32);
  }
  else {
    SEL v3 = 0;
  }
  uint64_t result = [v3 containsObject:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      id v6 = *(void **)(v5 + 32);
    }
    else {
      id v6 = 0;
    }
    [v6 addObject:*(void *)(a1 + 40)];
    [*(id *)(a1 + 40) didChangeHasForegroundClient:-[HMDRemoteEventRouterAssertionController hasActiveClients](*(os_unfair_lock_s **)(a1 + 32))];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(a1 + 40);
    if (v8) {
      BOOL v9 = *(unsigned __int8 *)(v8 + 12) != 0;
    }
    else {
      BOOL v9 = 0;
    }
    return [v7 didChangeFetchAvailableCondition:v9];
  }
  return result;
}

- (void)configure
{
  SEL v3 = objc_alloc_init(HMDEventRouterTimerProvider);
  if (self) {
    objc_storeStrong((id *)&self->_timerProvider, v3);
  }

  id v4 = [HMDRemoteEventRouterProcessStateChangeAssertion alloc];
  if (self)
  {
    v20 = self->_queue;
    uint64_t v5 = self->_timerProvider;
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:5];
    uint64_t v7 = [NSNumber numberWithDouble:300.0];
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F2D1C8]];

    uint64_t v8 = [NSNumber numberWithDouble:30.0];
    [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F2DA38]];

    BOOL v9 = [NSNumber numberWithDouble:300.0];
    [v6 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F2D168]];

    if (isInternalBuild())
    {
      id v10 = [NSNumber numberWithDouble:300.0];
      [v6 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F2D160]];
    }
    else
    {
      [v6 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F2D160]];
    }
    if (isInternalBuild())
    {
      long long v11 = [NSNumber numberWithDouble:300.0];
      [v6 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F2D2C0]];
    }
    else
    {
      [v6 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F2D2C0]];
    }
    if (isInternalBuild())
    {
      long long v12 = [NSNumber numberWithDouble:300.0];
      [v6 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F2D2C8]];
    }
    else
    {
      [v6 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F2D2C8]];
    }
    if (isInternalBuild())
    {
      uint64_t v13 = [NSNumber numberWithDouble:300.0];
      [v6 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F2E1B0]];
    }
    else
    {
      [v6 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F2E1B0]];
    }
    uint64_t v14 = (void *)[v6 copy];

    uint64_t v15 = [(HMDRemoteEventRouterProcessStateChangeAssertion *)v4 initWithQueue:v20 timerProvider:v5 applicationsAndIntervals:v14 dataSource:self];
  }
  else
  {
    uint64_t v14 = 0;
    v20 = 0;
    uint64_t v5 = 0;
    uint64_t v15 = [(HMDRemoteEventRouterProcessStateChangeAssertion *)v4 initWithQueue:0 timerProvider:0 applicationsAndIntervals:0 dataSource:0];
  }
  __int16 v16 = (void *)v15;

  if (self)
  {
    objc_setProperty_atomic(self, v17, v16, 48);

    int out_token = 0;
    queue = self->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __68__HMDRemoteEventRouterAssertionController__registerForNotifications__block_invoke;
    handler[3] = &unk_1E6A16CB0;
    handler[4] = self;
    notify_register_dispatch("kIOPSNotifyPowerSource", &out_token, queue, handler);
    objc_msgSend(objc_getProperty(self, v19, 24, 1), "addObserver:selector:name:object:", self, sel_handleConnectionActiveStateUpdatedNotification_, @"HMDHomeManagerConnectionActiveStateUpdatedNotification", 0);
  }
  else
  {
  }
}

void __68__HMDRemoteEventRouterAssertionController__registerForNotifications__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = IOPSDrawingUnlimitedPower();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = v2;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 16));
    if ((*(unsigned char *)(v3 + 12) != 0) != v4)
    {
      uint64_t v5 = (void *)MEMORY[0x1D9452090]();
      id v6 = (id *)(id)v3;
      uint64_t v7 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = HMFGetLogIdentifier();
        BOOL v9 = [NSNumber numberWithBool:v4];
        *(_DWORD *)buf = 138543618;
        v20 = v8;
        __int16 v21 = 2114;
        v22 = v9;
        _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Plugged in state changed to %{public}@", buf, 0x16u);
      }
      *(unsigned char *)(v3 + 12) = v4;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v10 = v6[4];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:buf count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v16;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v10);
            }
            objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "didChangeFetchAvailableCondition:", v4, (void)v15);
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:buf count:16];
        }
        while (v12);
      }
    }
  }
}

- (void)handleConnectionActiveStateUpdatedNotification:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    if (self) {
      queue = self->_queue;
    }
    else {
      queue = 0;
    }
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __90__HMDRemoteEventRouterAssertionController_handleConnectionActiveStateUpdatedNotification___block_invoke;
    v17[3] = &unk_1E6A197C8;
    id v18 = v7;
    SEL v19 = self;
    dispatch_async(queue, v17);
  }
  else
  {
    BOOL v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = self;
    uint64_t v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      uint64_t v13 = [v4 name];
      uint64_t v14 = [v4 object];
      long long v15 = [v4 object];
      *(_DWORD *)buf = 138544130;
      __int16 v21 = v12;
      __int16 v22 = 2112;
      uint64_t v23 = v13;
      __int16 v24 = 2112;
      v25 = v14;
      __int16 v26 = 2112;
      id v27 = (id)objc_opt_class();
      id v16 = v27;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_FAULT, "%{public}@%@ notification object was not a HMDXPCClientConnection: %@ (%@)", buf, 0x2Au);
    }
  }
}

void __90__HMDRemoteEventRouterAssertionController_handleConnectionActiveStateUpdatedNotification___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) sendPolicyParameters];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  uint64_t v5 = [v4 isActive];
  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = HMFGetLogIdentifier();
    int v15 = 138543618;
    id v16 = v9;
    __int16 v17 = 1024;
    int v18 = v5;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received notification that connection active state is now %{BOOL}d", (uint8_t *)&v15, 0x12u);
  }
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v10, 48, 1);
  }
  uint64_t v12 = *(void **)(a1 + 32);
  id v13 = Property;
  uint64_t v14 = [v12 clientIdentifier];
  [v13 handleProcessWithBundleIdentifier:v14 updatedIsActive:v5];
}

- (HMDRemoteEventRouterAssertionController)initWithQueue:(id)a3 notificationCenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDRemoteEventRouterAssertionController;
  BOOL v9 = [(HMDRemoteEventRouterAssertionController *)&v16 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v10->_notificationCenter, a4);
    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    clients = v10->_clients;
    v10->_clients = (NSHashTable *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    daemonAssertions = v10->_daemonAssertions;
    v10->_daemonAssertions = (NSHashTable *)v13;

    v10->_isPluggedIn = IOPSDrawingUnlimitedPower();
    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_171874 != -1) {
    dispatch_once(&logCategory__hmf_once_t8_171874, &__block_literal_global_171875);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v9_171876;
  return v2;
}

uint64_t __54__HMDRemoteEventRouterAssertionController_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v9_171876;
  logCategory__hmf_once_v9_171876 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end