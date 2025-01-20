@interface HMDLogEventDailyScheduler
+ (id)createSchedulerWithLogEventSubmitter:(id)a3;
+ (id)logCategory;
- (HMDLogEventDailyScheduler)initWithIdentifier:(id)a3 preferencesKey:(id)a4 logEventSubmitter:(id)a5 xpcActivityInterface:(id)a6 dateFactory:(id)a7;
- (HMDXPCActivityInterfacing)xpcActivityInterface;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSDate)lastRunTime;
- (NSHashTable)mutableTaskRunners;
- (NSString)preferencesKey;
- (NSString)xpcActivityIdentifier;
- (id)_criteriaForActivity;
- (id)dateFactory;
- (id)statusSummary;
- (id)taskRunners;
- (void)_handleCheckInForActivity:(id)a3;
- (void)_registerActivity;
- (void)_runActivity:(id)a3;
- (void)registerDailyTaskRunner:(id)a3;
- (void)runDailyTasks;
- (void)runHomeutilTasks;
- (void)setDateFactory:(id)a3;
- (void)setLastRunTime:(id)a3;
- (void)setMutableTaskRunners:(id)a3;
- (void)setXpcActivityInterface:(id)a3;
@end

@implementation HMDLogEventDailyScheduler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_xpcActivityInterface, 0);
  objc_storeStrong((id *)&self->_mutableTaskRunners, 0);
  objc_storeStrong((id *)&self->_preferencesKey, 0);
  objc_storeStrong((id *)&self->_xpcActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_lastRunTime, 0);
  objc_storeStrong(&self->_dateFactory, 0);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (void)setXpcActivityInterface:(id)a3
{
}

- (HMDXPCActivityInterfacing)xpcActivityInterface
{
  return self->_xpcActivityInterface;
}

- (void)setMutableTaskRunners:(id)a3
{
}

- (NSHashTable)mutableTaskRunners
{
  return self->_mutableTaskRunners;
}

- (NSString)preferencesKey
{
  return self->_preferencesKey;
}

- (NSString)xpcActivityIdentifier
{
  return self->_xpcActivityIdentifier;
}

- (void)setLastRunTime:(id)a3
{
}

- (NSDate)lastRunTime
{
  return self->_lastRunTime;
}

- (void)setDateFactory:(id)a3
{
}

- (id)dateFactory
{
  return objc_getProperty(self, a2, 16, 1);
}

- (id)statusSummary
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"xpcActivityIdentifier";
  v3 = [(HMDLogEventDailyScheduler *)self xpcActivityIdentifier];
  v8[1] = @"lastRunTime";
  v9[0] = v3;
  v4 = [(HMDLogEventDailyScheduler *)self lastRunTime];
  if (v4) {
    [(HMDLogEventDailyScheduler *)self lastRunTime];
  }
  else {
  v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (void)runHomeutilTasks
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(HMDLogEventDailyScheduler *)self taskRunners];
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        char v8 = objc_opt_respondsToSelector();
        v9 = (void *)MEMORY[0x1D9452090]();
        v10 = self;
        v11 = HMFGetOSLogHandle();
        BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
        if (v8)
        {
          if (v12)
          {
            v13 = HMFGetLogIdentifier();
            uint64_t v14 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v23 = v13;
            __int16 v24 = 2112;
            uint64_t v25 = v14;
            _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Running daily QA task for '%@'", buf, 0x16u);
          }
          [v7 runHomeutilTask];
        }
        else
        {
          if (v12)
          {
            v15 = HMFGetLogIdentifier();
            uint64_t v16 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v23 = v15;
            __int16 v24 = 2112;
            uint64_t v25 = v16;
            _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Running daily task for '%@'", buf, 0x16u);
          }
          [v7 runDailyTask];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v4);
  }
}

- (void)runDailyTasks
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = [(HMDLogEventDailyScheduler *)self taskRunners];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1D9452090]();
        v10 = self;
        v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          BOOL v12 = HMFGetLogIdentifier();
          uint64_t v13 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          long long v19 = v12;
          __int16 v20 = 2112;
          uint64_t v21 = v13;
          _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Running daily task for '%@'", buf, 0x16u);
        }
        [v8 runDailyTask];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v5);
  }
}

- (id)taskRunners
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = [(NSHashTable *)self->_mutableTaskRunners allObjects];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)registerDailyTaskRunner:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(NSHashTable *)self->_mutableTaskRunners addObject:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_runActivity:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDLogEventDailyScheduler *)self xpcActivityInterface];
  [v5 setState:4 forXPCActivity:v4];

  uint64_t v6 = [(HMDLogEventDailyScheduler *)self lastRunTime];

  double v7 = 86400.0;
  if (v6)
  {
    char v8 = [(HMDLogEventDailyScheduler *)self dateFactory];
    v9 = v8[2]();
    v10 = [(HMDLogEventDailyScheduler *)self lastRunTime];
    [v9 timeIntervalSinceDate:v10];
    double v7 = v11;
  }
  BOOL v12 = [(HMDLogEventDailyScheduler *)self logEventSubmitter];
  uint64_t v13 = [HMDXPCActivityRunReportLogEvent alloc];
  long long v14 = [(HMDLogEventDailyScheduler *)self xpcActivityIdentifier];
  long long v15 = [(HMDXPCActivityRunReportLogEvent *)v13 initWithActivityName:v14 definedInterval:1 activityShouldWake:86400.0 timeSinceLastRun:v7];
  [v12 submitLogEvent:v15];

  if (v7 >= 72000.0)
  {
    long long v16 = [(HMDLogEventDailyScheduler *)self dateFactory];
    long long v17 = v16[2]();
    [(HMDLogEventDailyScheduler *)self setLastRunTime:v17];

    long long v18 = [(HMDLogEventDailyScheduler *)self preferencesKey];

    if (v18)
    {
      long long v19 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      __int16 v20 = [(HMDLogEventDailyScheduler *)self lastRunTime];
      uint64_t v21 = [(HMDLogEventDailyScheduler *)self preferencesKey];
      [v19 setObject:v20 forKey:v21];
    }
    v22 = (void *)MEMORY[0x1D9452090]();
    self = self;
    uint64_t v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      __int16 v24 = HMFGetLogIdentifier();
      uint64_t v25 = [(HMDLogEventDailyScheduler *)self xpcActivityIdentifier];
      int v27 = 138543618;
      v28 = v24;
      __int16 v29 = 2112;
      v30 = v25;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Running activity '%@'", (uint8_t *)&v27, 0x16u);
    }
    [(HMDLogEventDailyScheduler *)self runDailyTasks];
  }
  v26 = [(HMDLogEventDailyScheduler *)self xpcActivityInterface];
  [v26 setState:5 forXPCActivity:v4];
}

- (void)_handleCheckInForActivity:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDLogEventDailyScheduler *)self xpcActivityInterface];
  uint64_t v6 = [v5 criteriaForXPCActivity:v4];

  if (v6)
  {
    double v7 = (void *)MEMORY[0x1D9452090]();
    char v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      double v11 = [(HMDLogEventDailyScheduler *)v8 xpcActivityIdentifier];
      int v18 = 138543874;
      long long v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      __int16 v22 = 2112;
      uint64_t v23 = v6;
      BOOL v12 = "%{public}@Activity '%@' resurrected with criteria: %@";
      uint64_t v13 = v9;
      uint32_t v14 = 32;
LABEL_6:
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v18, v14);
    }
  }
  else
  {
    long long v15 = [(HMDLogEventDailyScheduler *)self xpcActivityInterface];
    long long v16 = [(HMDLogEventDailyScheduler *)self _criteriaForActivity];
    [v15 setCriteria:v16 forXPCActivity:v4];

    double v7 = (void *)MEMORY[0x1D9452090]();
    long long v17 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      double v11 = [(HMDLogEventDailyScheduler *)v17 xpcActivityIdentifier];
      int v18 = 138543618;
      long long v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      BOOL v12 = "%{public}@Activity '%@' created for the first time";
      uint64_t v13 = v9;
      uint32_t v14 = 22;
      goto LABEL_6;
    }
  }
}

- (void)_registerActivity
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    double v7 = [(HMDLogEventDailyScheduler *)v4 xpcActivityIdentifier];
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    long long v15 = v7;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Registering XPC activity %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, v4);
  char v8 = [(HMDLogEventDailyScheduler *)v4 xpcActivityInterface];
  v9 = [(HMDLogEventDailyScheduler *)v4 xpcActivityIdentifier];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__HMDLogEventDailyScheduler__registerActivity__block_invoke;
  v10[3] = &unk_1E6A11D60;
  objc_copyWeak(&v11, (id *)buf);
  [v8 registerXPCActivityWithActivityIdentifier:v9 criteria:*MEMORY[0x1E4F14158] activityBlock:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __46__HMDLogEventDailyScheduler__registerActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (!WeakRetained)
  {
    char v8 = (void *)MEMORY[0x1D9452090]();
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      id v11 = [0 xpcActivityIdentifier];
      int v15 = 138543618;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      int v18 = v11;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Activity '%@' handler ran after scheduler was deallocated", (uint8_t *)&v15, 0x16u);
    }
    goto LABEL_11;
  }
  uint64_t v6 = [WeakRetained xpcActivityInterface];
  uint64_t v7 = [v6 stateForXPCActivity:v3];

  if (v7 == 2)
  {
    [v5 _runActivity:v3];
    goto LABEL_12;
  }
  if (v7)
  {
    char v8 = (void *)MEMORY[0x1D9452090]();
    v9 = v5;
    BOOL v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      __int16 v14 = [v9 xpcActivityIdentifier];
      int v15 = 138543874;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      int v18 = v14;
      __int16 v19 = 2048;
      uint64_t v20 = v7;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Activity '%@' callback with unhandled state: %ld", (uint8_t *)&v15, 0x20u);
    }
LABEL_11:

    goto LABEL_12;
  }
  [v5 _handleCheckInForActivity:v3];
LABEL_12:
}

- (id)_criteriaForActivity
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F141E8]);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F142F8], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F142B0], 1);
  xpc_dictionary_set_string(v2, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E4F14358], 1);
  return v2;
}

- (HMDLogEventDailyScheduler)initWithIdentifier:(id)a3 preferencesKey:(id)a4 logEventSubmitter:(id)a5 xpcActivityInterface:(id)a6 dateFactory:(id)a7
{
  id v25 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HMDLogEventDailyScheduler;
  __int16 v17 = [(HMDLogEventDailyScheduler *)&v26 init];
  int v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_xpcActivityIdentifier, a3);
    objc_storeStrong((id *)&v18->_xpcActivityInterface, a6);
    objc_storeStrong((id *)&v18->_preferencesKey, a4);
    objc_storeStrong((id *)&v18->_logEventSubmitter, a5);
    uint64_t v19 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    mutableTaskRunners = v18->_mutableTaskRunners;
    v18->_mutableTaskRunners = (NSHashTable *)v19;

    uint64_t v21 = _Block_copy(v16);
    id dateFactory = v18->_dateFactory;
    v18->_id dateFactory = v21;

    if (v13)
    {
      a5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      uint64_t v23 = [a5 objectForKey:v13];
    }
    else
    {
      uint64_t v23 = 0;
    }
    objc_storeStrong((id *)&v18->_lastRunTime, v23);
    if (v13)
    {
    }
    [(HMDLogEventDailyScheduler *)v18 _registerActivity];
  }

  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11_20678 != -1) {
    dispatch_once(&logCategory__hmf_once_t11_20678, &__block_literal_global_23);
  }
  xpc_object_t v2 = (void *)logCategory__hmf_once_v12_20679;
  return v2;
}

uint64_t __40__HMDLogEventDailyScheduler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v12_20679;
  logCategory__hmf_once_v12_20679 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)createSchedulerWithLogEventSubmitter:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__HMDLogEventDailyScheduler_createSchedulerWithLogEventSubmitter___block_invoke;
  block[3] = &unk_1E6A19B30;
  id v9 = v3;
  uint64_t v4 = createSchedulerWithLogEventSubmitter__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&createSchedulerWithLogEventSubmitter__onceToken, block);
  }
  id v6 = (id)createSchedulerWithLogEventSubmitter__result;

  return v6;
}

void __66__HMDLogEventDailyScheduler_createSchedulerWithLogEventSubmitter___block_invoke(uint64_t a1)
{
  xpc_object_t v2 = [HMDLogEventDailyScheduler alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = objc_alloc_init(HMDXPCActivityInterface);
  uint64_t v4 = [(HMDLogEventDailyScheduler *)v2 initWithIdentifier:@"com.apple.homed.logEvent.dailyScheduler" preferencesKey:@"HMDLogEventDailySchedulerLastRunTimeKey" logEventSubmitter:v3 xpcActivityInterface:v6 dateFactory:&__block_literal_global_20687];
  id v5 = (void *)createSchedulerWithLogEventSubmitter__result;
  createSchedulerWithLogEventSubmitter__result = v4;
}

uint64_t __66__HMDLogEventDailyScheduler_createSchedulerWithLogEventSubmitter___block_invoke_2()
{
  return [MEMORY[0x1E4F1C9C8] now];
}

@end