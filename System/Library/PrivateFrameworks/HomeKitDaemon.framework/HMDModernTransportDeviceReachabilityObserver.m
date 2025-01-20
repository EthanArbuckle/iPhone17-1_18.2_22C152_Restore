@interface HMDModernTransportDeviceReachabilityObserver
+ (id)logCategory;
- (HMDModernTransportDeviceReachabilityObserver)init;
- (HMDModernTransportDeviceReachabilityObserver)initWithTimerProvider:(id)a3 dateProvider:(id)a4;
- (id)isDeviceAddressReachable:(id)a3;
- (void)_clearUnreachablePendingForContext:(id)a3;
- (void)_evaluateDebounceTimer;
- (void)_notifyListeners:(id)a3 address:(id)a4 isReachable:(BOOL)a5;
- (void)_serviceExpiredUnreachableDevices;
- (void)_setUnreachablePendingForContext:(id)a3;
- (void)addListener:(id)a3 forDeviceAddress:(id)a4;
- (void)removeListener:(id)a3 forDeviceAddress:(id)a4;
- (void)setDebounceTimer:(uint64_t)a1;
- (void)transport:(id)a3 idsIdentifier:(id)a4 didAppearReachable:(BOOL)a5;
@end

@implementation HMDModernTransportDeviceReachabilityObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debounceTimer, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_timerProvider, 0);
  objc_storeStrong((id *)&self->_devicesWithPendingUnreachability, 0);
  objc_storeStrong((id *)&self->_deviceToListenersMap, 0);
}

- (void)_serviceExpiredUnreachableDevices
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  os_unfair_lock_lock_with_options();
  -[HMDModernTransportDeviceReachabilityObserver setDebounceTimer:]((uint64_t)self, 0);
  if (self) {
    devicesWithPendingUnreachability = self->_devicesWithPendingUnreachability;
  }
  else {
    devicesWithPendingUnreachability = 0;
  }
  v5 = devicesWithPendingUnreachability;
  v6 = [(NSMutableArray *)v5 firstObject];

  if (self) {
    dateProvider = self->_dateProvider;
  }
  else {
    dateProvider = 0;
  }
  v8 = dateProvider;
  [(HMDDateProvider *)v8 timeIntervalSince1970];
  double v10 = v9;

  if (v6)
  {
    uint64_t v11 = MEMORY[0x263EFFA80];
    do
    {
      uint64_t v12 = [v6 unreachableStartTime];
      if (v13 + 20.0 - v10 > 0.01) {
        break;
      }
      v14 = (void *)MEMORY[0x230FBD990](v12);
      v15 = self;
      HMFGetOSLogHandle();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        v18 = [v6 address];
        *(_DWORD *)buf = 138543618;
        id v34 = v17;
        __int16 v35 = 2112;
        v36 = v18;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Unreachable Debounce timer did fire for device address %@", buf, 0x16u);
      }
      if (self) {
        v19 = v15->_devicesWithPendingUnreachability;
      }
      else {
        v19 = 0;
      }
      v20 = v19;
      [(NSMutableArray *)v20 removeObjectAtIndex:0];

      [v6 setReachability:v11];
      if (self) {
        deviceToListenersMap = v15->_deviceToListenersMap;
      }
      else {
        deviceToListenersMap = 0;
      }
      v22 = deviceToListenersMap;
      v23 = [v6 address];
      v24 = [v23 idsIdentifier];
      v25 = [(NSMapTable *)v22 objectForKey:v24];

      if (v25)
      {
        v26 = [v6 listeners];
        v27 = [v26 allObjects];
        v28 = [v6 address];
        [v3 setObject:v27 forKey:v28];
      }
      v29 = self ? v15->_devicesWithPendingUnreachability : 0;
      v30 = v29;
      uint64_t v31 = [(NSMutableArray *)v30 firstObject];

      v6 = (void *)v31;
    }
    while (v31);
  }
  [(HMDModernTransportDeviceReachabilityObserver *)self _evaluateDebounceTimer];

  os_unfair_lock_unlock(&self->_lock);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __81__HMDModernTransportDeviceReachabilityObserver__serviceExpiredUnreachableDevices__block_invoke;
  v32[3] = &unk_264A157E0;
  v32[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v32];
}

- (void)setDebounceTimer:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

uint64_t __81__HMDModernTransportDeviceReachabilityObserver__serviceExpiredUnreachableDevices__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _notifyListeners:a3 address:a2 isReachable:0];
}

- (void)_notifyListeners:(id)a3 address:(id)a4 isReachable:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  double v10 = (void *)MEMORY[0x230FBD990]();
  uint64_t v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  double v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = HMFGetLogIdentifier();
      v15 = @"unreachable";
      *(_DWORD *)buf = 138543874;
      v28 = v14;
      __int16 v29 = 2112;
      if (v5) {
        v15 = @"reachable";
      }
      v30 = v15;
      __int16 v31 = 2112;
      id v32 = v9;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Notifying listeners that device address is %@: %@", buf, 0x20u);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v16 = v8;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v20++), "modernTransportDeviceReachabilityObserverDidUpdate:isReachable:", v9, v5, (void)v22);
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v18);
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v28 = v21;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Cannot notify listeners for reachability change with nil address", buf, 0xCu);
    }
  }
}

- (void)transport:(id)a3 idsIdentifier:(id)a4 didAppearReachable:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  double v10 = (void *)MEMORY[0x230FBD990]();
  uint64_t v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    double v13 = HMFGetLogIdentifier();
    v14 = @"unreachable";
    *(_DWORD *)long long v24 = 138543874;
    *(void *)&v24[4] = v13;
    *(_WORD *)&v24[12] = 2112;
    if (v5) {
      v14 = @"reachable";
    }
    *(void *)&v24[14] = v14;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Device with idsIdentifier reporting %@: %@ ", v24, 0x20u);
  }
  os_unfair_lock_lock_with_options();
  if (v11) {
    deviceToListenersMap = v11->_deviceToListenersMap;
  }
  else {
    deviceToListenersMap = 0;
  }
  id v16 = deviceToListenersMap;
  uint64_t v17 = [(NSMapTable *)v16 objectForKey:v9];

  if (!v17) {
    goto LABEL_13;
  }
  if (!v5)
  {
    [(HMDModernTransportDeviceReachabilityObserver *)v11 _setUnreachablePendingForContext:v17];
LABEL_13:

    os_unfair_lock_unlock(&v11->_lock);
    goto LABEL_14;
  }
  [(HMDModernTransportDeviceReachabilityObserver *)v11 _clearUnreachablePendingForContext:v17];
  uint64_t v18 = [v17 reachability];
  if (v18)
  {
    uint64_t v19 = [v17 reachability];
    char v20 = [v19 BOOLValue];

    if (v20) {
      goto LABEL_13;
    }
  }
  objc_msgSend(v17, "setReachability:", MEMORY[0x263EFFA88], *(_OWORD *)v24);
  v21 = [v17 address];
  long long v22 = [v17 listeners];
  long long v23 = [v22 allObjects];

  os_unfair_lock_unlock(&v11->_lock);
  [(HMDModernTransportDeviceReachabilityObserver *)v11 _notifyListeners:v23 address:v21 isReachable:1];

LABEL_14:
}

- (void)_clearUnreachablePendingForContext:(id)a3
{
  p_lock = &self->_lock;
  id v6 = a3;
  os_unfair_lock_assert_owner(p_lock);
  [v6 setUnreachableStartTime:0.0];
  if (self) {
    devicesWithPendingUnreachability = self->_devicesWithPendingUnreachability;
  }
  else {
    devicesWithPendingUnreachability = 0;
  }
  [(NSMutableArray *)devicesWithPendingUnreachability removeObject:v6];
}

- (void)_setUnreachablePendingForContext:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (([(NSMutableArray *)self->_devicesWithPendingUnreachability containsObject:v4] & 1) == 0)
  {
    uint64_t v5 = [v4 reachability];
    if (!v5
      || (id v6 = (void *)v5,
          [v4 reachability],
          v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v7 BOOLValue],
          v7,
          v6,
          v8))
    {
      id v9 = (void *)MEMORY[0x230FBD990]();
      double v10 = self;
      uint64_t v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = HMFGetLogIdentifier();
        double v13 = [v4 address];
        int v14 = 138543618;
        v15 = v12;
        __int16 v16 = 2112;
        uint64_t v17 = v13;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Device address %@ reported unreachable.  Debouncing reachability", (uint8_t *)&v14, 0x16u);
      }
      [(HMDDateProvider *)v10->_dateProvider timeIntervalSince1970];
      objc_msgSend(v4, "setUnreachableStartTime:");
      [(NSMutableArray *)self->_devicesWithPendingUnreachability addObject:v4];
      [(HMDModernTransportDeviceReachabilityObserver *)v10 _evaluateDebounceTimer];
    }
  }
}

- (void)_evaluateDebounceTimer
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self || !self->_debounceTimer)
  {
    id v8 = [(NSMutableArray *)self->_devicesWithPendingUnreachability firstObject];
    if (v8)
    {
      [(HMDDateProvider *)self->_dateProvider timeIntervalSince1970];
      double v4 = v3;
      [v8 unreachableStartTime];
      double v6 = v5 + 20.0 - v4;
      if (v6 <= 0.01) {
        double v6 = 0.01;
      }
      v7 = [(HMDTimerProvider *)self->_timerProvider timerWithTimeInterval:0 options:v6];
      objc_storeStrong((id *)&self->_debounceTimer, v7);

      [(HMFTimer *)self->_debounceTimer setDelegate:self];
      [(HMFTimer *)self->_debounceTimer resume];
    }
  }
}

- (id)isDeviceAddressReachable:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self) {
    deviceToListenersMap = self->_deviceToListenersMap;
  }
  else {
    deviceToListenersMap = 0;
  }
  v7 = deviceToListenersMap;
  id v8 = [v4 idsIdentifier];
  id v9 = [(NSMapTable *)v7 objectForKey:v8];

  if (v9)
  {
    double v10 = [v9 reachability];
  }
  else
  {
    double v10 = 0;
  }

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (void)removeListener:(id)a3 forDeviceAddress:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  double v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v23 = 138543874;
    long long v24 = v11;
    __int16 v25 = 2048;
    id v26 = v6;
    __int16 v27 = 2112;
    id v28 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing listener %p for address: %@", (uint8_t *)&v23, 0x20u);
  }
  p_lock = &v9->_lock;
  os_unfair_lock_lock_with_options();
  if (v9) {
    deviceToListenersMap = v9->_deviceToListenersMap;
  }
  else {
    deviceToListenersMap = 0;
  }
  int v14 = deviceToListenersMap;
  v15 = [v7 idsIdentifier];
  __int16 v16 = [(NSMapTable *)v14 objectForKey:v15];

  if (v16)
  {
    uint64_t v17 = [v16 listeners];
    [v17 removeObject:v6];

    uint64_t v18 = [v16 listeners];
    BOOL v19 = [v18 count] == 0;

    if (v19)
    {
      [(HMDModernTransportDeviceReachabilityObserver *)v9 _clearUnreachablePendingForContext:v16];
      if (v9) {
        char v20 = v9->_deviceToListenersMap;
      }
      else {
        char v20 = 0;
      }
      v21 = v20;
      long long v22 = [v7 idsIdentifier];
      [(NSMapTable *)v21 removeObjectForKey:v22];
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)addListener:(id)a3 forDeviceAddress:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  double v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v21 = 138543874;
    long long v22 = v11;
    __int16 v23 = 2048;
    id v24 = v6;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding listener %p for address: %@", (uint8_t *)&v21, 0x20u);
  }
  p_lock = &v9->_lock;
  os_unfair_lock_lock_with_options();
  if (v9) {
    deviceToListenersMap = v9->_deviceToListenersMap;
  }
  else {
    deviceToListenersMap = 0;
  }
  int v14 = deviceToListenersMap;
  v15 = [v7 idsIdentifier];
  __int16 v16 = [(NSMapTable *)v14 objectForKey:v15];

  if (!v16)
  {
    __int16 v16 = [[HMDModernTransportDeviceReachabilityObserverListenerContext alloc] initWithAddress:v7];
    if (v9) {
      uint64_t v17 = v9->_deviceToListenersMap;
    }
    else {
      uint64_t v17 = 0;
    }
    uint64_t v18 = v17;
    BOOL v19 = [v7 idsIdentifier];
    [(NSMapTable *)v18 setObject:v16 forKey:v19];
  }
  char v20 = [(HMDModernTransportDeviceReachabilityObserverListenerContext *)v16 listeners];
  [v20 addObject:v6];

  os_unfair_lock_unlock(p_lock);
}

- (HMDModernTransportDeviceReachabilityObserver)initWithTimerProvider:(id)a3 dateProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDModernTransportDeviceReachabilityObserver;
  id v9 = [(HMDModernTransportDeviceReachabilityObserver *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    deviceToListenersMap = v9->_deviceToListenersMap;
    v9->_deviceToListenersMap = (NSMapTable *)v10;

    uint64_t v12 = [MEMORY[0x263EFF980] array];
    devicesWithPendingUnreachability = v9->_devicesWithPendingUnreachability;
    v9->_devicesWithPendingUnreachability = (NSMutableArray *)v12;

    objc_storeStrong((id *)&v9->_timerProvider, a3);
    objc_storeStrong((id *)&v9->_dateProvider, a4);
  }

  return v9;
}

- (HMDModernTransportDeviceReachabilityObserver)init
{
  double v3 = objc_opt_new();
  id v4 = objc_alloc_init(HMDDate);
  double v5 = [(HMDModernTransportDeviceReachabilityObserver *)self initWithTimerProvider:v3 dateProvider:v4];

  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t12 != -1) {
    dispatch_once(&logCategory__hmf_once_t12, &__block_literal_global_8221);
  }
  v2 = (void *)logCategory__hmf_once_v13;
  return v2;
}

void __59__HMDModernTransportDeviceReachabilityObserver_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v13;
  logCategory__hmf_once_double v13 = v0;
}

@end