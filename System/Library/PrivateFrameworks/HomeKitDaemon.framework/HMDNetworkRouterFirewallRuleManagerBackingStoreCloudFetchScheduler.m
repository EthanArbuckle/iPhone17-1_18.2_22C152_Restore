@interface HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler
+ (id)logCategory;
+ (void)__unregisterActivity:(id)a3;
- (BOOL)isRunning;
- (HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler)initWithIdentifier:(id)a3 interval:(double)a4 retryInterval:(double)a5 delegate:(id)a6;
- (HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchSchedulerDelegate)delegate;
- (NSString)description;
- (NSString)identifier;
- (OS_xpc_object)overrideCriteria;
- (OS_xpc_object)runningActivity;
- (double)currentInterval;
- (double)interval;
- (double)retryInterval;
- (id)__initialCriteria;
- (void)__checkInActivity:(id)a3;
- (void)__registerActivity;
- (void)__runActivity:(id)a3;
- (void)__transitionActivity:(id)a3 state:(int64_t)a4;
- (void)__unregisterActivity;
- (void)dealloc;
- (void)setOverrideCriteria:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setRunningActivity:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideCriteria, 0);
  objc_storeStrong((id *)&self->_runningActivity, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (double)currentInterval
{
  return self->_currentInterval;
}

- (void)setOverrideCriteria:(id)a3
{
}

- (OS_xpc_object)overrideCriteria
{
  return self->_overrideCriteria;
}

- (void)setRunningActivity:(id)a3
{
}

- (OS_xpc_object)runningActivity
{
  return self->_runningActivity;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchSchedulerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchSchedulerDelegate *)WeakRetained;
}

- (double)retryInterval
{
  return self->_retryInterval;
}

- (double)interval
{
  return self->_interval;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)stop
{
  if ([(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)self isRunning])
  {
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)self setRunning:0];
    self->_currentInterval = 0.0;
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)self __unregisterActivity];
    id v3 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v3 cloudFetchSchedulerStopped:self];
    }
  }
}

- (void)start
{
  if (![(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)self isRunning])
  {
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)self setRunning:1];
    self->_currentInterval = 0.0;
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)self __registerActivity];
    id v3 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v3 cloudFetchSchedulerStarted:self];
    }
  }
}

- (void)__transitionActivity:(id)a3 state:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v6 = (_xpc_activity_s *)a3;
  BOOL v7 = xpc_activity_set_state(v6, a4);
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v12 = HMFGetLogIdentifier();
      v13 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)v9 identifier];
      int v17 = 138543874;
      v18 = v12;
      __int16 v19 = 2112;
      v20 = v13;
      __int16 v21 = 2048;
      int64_t v22 = a4;
      v14 = "%{public}@Activity '%@' transitioned to state %ld";
      v15 = v11;
      os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v15, v16, v14, (uint8_t *)&v17, 0x20u);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v12 = HMFGetLogIdentifier();
    v13 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)v9 identifier];
    int v17 = 138543874;
    v18 = v12;
    __int16 v19 = 2112;
    v20 = v13;
    __int16 v21 = 2048;
    int64_t v22 = a4;
    v14 = "%{public}@Activity '%@' failed to transition to state %ld";
    v15 = v11;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }
}

- (void)__unregisterActivity
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    BOOL v7 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)v4 identifier];
    int v8 = 138543618;
    v9 = v6;
    __int16 v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Unregistering activity '%@'", (uint8_t *)&v8, 0x16u);
  }
  objc_msgSend((id)objc_opt_class(), "__unregisterActivity:", v4->_identifier);
}

- (void)__runActivity:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)self identifier];
  if (xpc_activity_should_defer((xpc_activity_t)v4))
  {
    v6 = (void *)MEMORY[0x230FBD990]();
    BOOL v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v24 = v9;
      __int16 v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Activity '%@' was ready to run but it should be deferred", buf, 0x16u);
    }
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)v7 __transitionActivity:v4 state:3];
  }
  else
  {
    __int16 v10 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)self delegate];
    if (v10)
    {
      v11 = (void *)MEMORY[0x230FBD990]([(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)self __transitionActivity:v4 state:4]);
      uint64_t v12 = self;
      v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v24 = v14;
        __int16 v25 = 2112;
        v26 = v5;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Activity '%@' running", buf, 0x16u);
      }
      [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)v12 setRunningActivity:v4];
      objc_initWeak((id *)buf, v12);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __84__HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler___runActivity___block_invoke;
      v19[3] = &unk_264A2B420;
      objc_copyWeak(&v22, (id *)buf);
      id v20 = v5;
      id v21 = v4;
      [v10 cloudFetchSchedulerFired:v12 completion:v19];

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v15 = (void *)MEMORY[0x230FBD990]();
      os_log_type_t v16 = self;
      int v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v24 = v18;
        __int16 v25 = 2112;
        v26 = v5;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Activity '%@' was ready to run but delegate has died", buf, 0x16u);
      }
      [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)v16 __transitionActivity:v4 state:5];
    }
  }
}

void __84__HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler___runActivity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = (void *)MEMORY[0x230FBD990]();
  if (WeakRetained)
  {
    v6 = (double *)WeakRetained;
    BOOL v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 32);
      int v22 = 138543874;
      uint64_t v23 = v8;
      __int16 v24 = 2112;
      uint64_t v25 = v9;
      __int16 v26 = 2112;
      uint64_t v27 = (uint64_t)v3;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Activity '%@' completion handler called with error: %@", (uint8_t *)&v22, 0x20u);
    }
    [v6 setRunningActivity:0];
    xpc_object_t v10 = xpc_activity_copy_criteria(*(xpc_activity_t *)(a1 + 40));
    v11 = (const char *)*MEMORY[0x263EF81D8];
    int64_t int64 = xpc_dictionary_get_int64(v10, (const char *)*MEMORY[0x263EF81D8]);
    if (v3) {
      [v6 retryInterval];
    }
    else {
      [v6 interval];
    }
    uint64_t v21 = (uint64_t)v13;
    if (int64 != (uint64_t)v13)
    {
      xpc_dictionary_set_int64(v10, v11, (uint64_t)v13);
      xpc_activity_set_criteria(*(xpc_activity_t *)(a1 + 40), v10);
      v6[8] = (double)v21;
    }
    objc_msgSend(v6, "__transitionActivity:state:", *(void *)(a1 + 40), 5);
  }
  else
  {
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      uint64_t v16 = *(void *)(a1 + 32);
      int v22 = 138543874;
      uint64_t v23 = v15;
      __int16 v24 = 2112;
      uint64_t v25 = v16;
      __int16 v26 = 2112;
      uint64_t v27 = (uint64_t)v3;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Activity '%@' completion handler called after scheduler has died with error: %@", (uint8_t *)&v22, 0x20u);
    }
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
    {
      int v17 = (void *)MEMORY[0x230FBD990]();
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = HMFGetLogIdentifier();
        uint64_t v20 = *(void *)(a1 + 32);
        int v22 = 138543874;
        uint64_t v23 = v19;
        __int16 v24 = 2112;
        uint64_t v25 = v20;
        __int16 v26 = 2048;
        uint64_t v27 = 5;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Activity '%@' failed to transition to state %ld", (uint8_t *)&v22, 0x20u);
      }
    }
  }
}

- (void)__checkInActivity:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = (_xpc_activity_s *)a3;
  xpc_object_t v5 = xpc_activity_copy_criteria(v4);
  if (v5)
  {
    v6 = v5;
    BOOL v7 = (void *)MEMORY[0x230FBD990]();
    int v8 = self;
    uint64_t v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      xpc_object_t v10 = HMFGetLogIdentifier();
      v11 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)v8 identifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v28 = v10;
      __int16 v29 = 2112;
      v30 = v11;
      __int16 v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Activity '%@' resurrected with criteria: %@", buf, 0x20u);
    }
  }
  else
  {
    v6 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)self __initialCriteria];
    uint64_t v12 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)self overrideCriteria];

    if (v12)
    {
      double v13 = (void *)MEMORY[0x230FBD990]();
      v14 = self;
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        int v17 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)v14 identifier];
        v18 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)v14 overrideCriteria];
        *(_DWORD *)buf = 138543874;
        uint64_t v28 = v16;
        __int16 v29 = 2112;
        v30 = v17;
        __int16 v31 = 2112;
        v32 = v18;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Activity '%@' applying override criteria: %@", buf, 0x20u);
      }
      __int16 v19 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)v14 overrideCriteria];
      applier[0] = MEMORY[0x263EF8330];
      applier[1] = 3221225472;
      applier[2] = __88__HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler___checkInActivity___block_invoke;
      applier[3] = &unk_264A22FE0;
      id v26 = v6;
      xpc_dictionary_apply(v19, applier);
    }
    uint64_t v20 = (void *)MEMORY[0x230FBD990]();
    uint64_t v21 = self;
    int v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      __int16 v24 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)v21 identifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v28 = v23;
      __int16 v29 = 2112;
      v30 = v24;
      __int16 v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Activity '%@' created for the first time with criteria: %@", buf, 0x20u);
    }
    xpc_activity_set_criteria(v4, v6);
  }
  self->_currentInterval = (double)xpc_dictionary_get_int64(v6, (const char *)*MEMORY[0x263EF81D8]);
}

uint64_t __88__HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler___checkInActivity___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  return 1;
}

- (void)__registerActivity
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)self identifier];
  id v4 = (void *)MEMORY[0x230FBD990]();
  xpc_object_t v5 = self;
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    BOOL v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Registering activity '%@'", buf, 0x16u);
  }
  objc_initWeak((id *)buf, v5);
  id v8 = v3;
  uint64_t v9 = (const char *)[v8 UTF8String];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __88__HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler___registerActivity__block_invoke;
  v12[3] = &unk_264A22FB8;
  objc_copyWeak(&v14, (id *)buf);
  xpc_object_t v10 = (void *)*MEMORY[0x263EF8188];
  id v11 = v8;
  id v13 = v11;
  xpc_activity_register(v9, v10, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __88__HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler___registerActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    BOOL v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      uint64_t v10 = *(void *)(a1 + 32);
      int v14 = 138543618;
      v15 = v9;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Activity '%@' handler ran after scheduler has died", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_11;
  }
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    objc_msgSend(WeakRetained, "__runActivity:", v3);
    goto LABEL_12;
  }
  xpc_activity_state_t v6 = state;
  if (state)
  {
    BOOL v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = WeakRetained;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      uint64_t v13 = *(void *)(a1 + 32);
      int v14 = 138543874;
      v15 = v12;
      __int16 v16 = 2112;
      uint64_t v17 = v13;
      __int16 v18 = 2048;
      xpc_activity_state_t v19 = v6;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Activity %@ callback with unhandled state: %ld", (uint8_t *)&v14, 0x20u);
    }
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(WeakRetained, "__checkInActivity:", v3);
LABEL_12:
}

- (id)__initialCriteria
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  id v4 = (const char *)*MEMORY[0x263EF81D8];
  [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)self interval];
  xpc_dictionary_set_int64(v3, v4, llround(v5));
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF82A0], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF82D0], 1);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x263EF8240], (const char *)*MEMORY[0x263EF8248]);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF8180], 1);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x263EF81B8], *MEMORY[0x263EF81F8]);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8288]);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF8270], 1);
  return v3;
}

- (NSString)description
{
  xpc_object_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v5 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)self identifier];
  xpc_activity_state_t v6 = NSNumber;
  [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)self interval];
  BOOL v7 = objc_msgSend(v6, "numberWithDouble:");
  id v8 = NSNumber;
  [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)self retryInterval];
  uint64_t v9 = objc_msgSend(v8, "numberWithDouble:");
  uint64_t v10 = [v3 stringWithFormat:@"<%@, Identifier = %@, Interval=%@, retryInterval=%@>", v4, v5, v7, v9];

  return (NSString *)v10;
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (self->_running)
  {
    xpc_object_t v3 = (void *)MEMORY[0x230FBD990]();
    uint64_t v4 = self;
    double v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      xpc_activity_state_t v6 = HMFGetLogIdentifier();
      identifier = v4->_identifier;
      *(_DWORD *)buf = 138543618;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = identifier;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_ERROR, "%{public}@Scheduler dying while activity '%@' was still active", buf, 0x16u);
    }
    objc_msgSend((id)objc_opt_class(), "__unregisterActivity:", v4->_identifier);
  }
  v8.receiver = self;
  v8.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler;
  [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)&v8 dealloc];
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler)initWithIdentifier:(id)a3 interval:(double)a4 retryInterval:(double)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler;
  uint64_t v13 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler *)&v17 init];
  int v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    v14->_interval = a4;
    v14->_retryInterval = a5;
    objc_storeWeak((id *)&v14->_delegate, v12);
    v14->_running = 0;
    v15 = v14;
  }

  return v14;
}

+ (void)__unregisterActivity:(id)a3
{
  xpc_object_t v3 = (const char *)[a3 UTF8String];
  xpc_activity_unregister(v3);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_167197 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_167197, &__block_literal_global_167198);
  }
  v2 = (void *)logCategory__hmf_once_v1_167199;
  return v2;
}

void __81__HMDNetworkRouterFirewallRuleManagerBackingStoreCloudFetchScheduler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_167199;
  logCategory__hmf_once_v1_167199 = v0;
}

@end