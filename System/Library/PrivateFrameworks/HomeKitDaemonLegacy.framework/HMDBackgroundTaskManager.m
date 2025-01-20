@interface HMDBackgroundTaskManager
+ (HMDBackgroundTaskManager)sharedManager;
+ (id)logCategory;
- (BOOL)hasOutstandingTaskWithIdentifier:(id)a3;
- (BOOL)scheduleTaskWithIdentifier:(id)a3 fireDate:(id)a4 onObserver:(id)a5 selector:(SEL)a6 error:(id *)a7;
- (HMDBackgroundTaskLogger)logger;
- (HMDBackgroundTaskManager)init;
- (HMDBackgroundTaskManager)initWithNotificationCenter:(id)a3 dateProvider:(id)a4 logger:(id)a5;
- (HMDDateProvider)dateProvider;
- (NSMutableDictionary)pendingTaskDateByIdentifier;
- (NSMutableDictionary)tasksByIdentifier;
- (NSNotificationCenter)notificationCenter;
- (id)_taskForIdentifier:(id)a3;
- (id)expectedFireDateForTaskWithIdentifier:(id)a3;
- (void)_handleEvent:(id)a3;
- (void)_handlePendingTaskWithIdentifier:(id)a3 date:(id)a4;
- (void)_postNotificationWithIdentifier:(id)a3;
- (void)_registerEventWithIdentifier:(id)a3 fireDate:(id)a4;
- (void)_setTask:(id)a3 forIdentifier:(id)a4;
- (void)_unregisterEventWithIdentifier:(id)a3;
- (void)cancelTaskWithIdentifier:(id)a3 onObserver:(id)a4;
- (void)configure;
@end

@implementation HMDBackgroundTaskManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_pendingTaskDateByIdentifier, 0);
  objc_storeStrong((id *)&self->_tasksByIdentifier, 0);
}

- (HMDDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (HMDBackgroundTaskLogger)logger
{
  return self->_logger;
}

- (NSMutableDictionary)pendingTaskDateByIdentifier
{
  return self->_pendingTaskDateByIdentifier;
}

- (NSMutableDictionary)tasksByIdentifier
{
  return self->_tasksByIdentifier;
}

- (id)_taskForIdentifier:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = [(HMDBackgroundTaskManager *)self tasksByIdentifier];
  v7 = [v6 objectForKeyedSubscript:v4];

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)_setTask:(id)a3 forIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v8 = [(HMDBackgroundTaskManager *)self tasksByIdentifier];
  [v8 setObject:v9 forKeyedSubscript:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void)_unregisterEventWithIdentifier:(id)a3
{
  [a3 UTF8String];
  xpc_set_event();
}

- (void)_registerEventWithIdentifier:(id)a3 fireDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  [v5 timeIntervalSince1970];
  double v8 = v7;

  xpc_object_t v9 = xpc_date_create(1000000000 * (uint64_t)v8);
  int64_t value = xpc_date_get_value(v9);
  xpc_dictionary_set_date(xdict, "Date", value);
  xpc_dictionary_set_BOOL(xdict, "UserVisible", 1);
  id v11 = v6;
  [v11 UTF8String];

  xpc_set_event();
}

- (void)_postNotificationWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__HMDBackgroundTaskManager__postNotificationWithIdentifier___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __60__HMDBackgroundTaskManager__postNotificationWithIdentifier___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) notificationCenter];
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = @"HMD.BGTM.NK";
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v2 postNotificationName:@"HMD.BGTM.NN" object:0 userInfo:v4];
}

- (void)_handlePendingTaskWithIdentifier:(id)a3 date:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDBackgroundTaskManager *)self pendingTaskDateByIdentifier];
  xpc_object_t v9 = [v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    uint64_t v10 = [v9 timeIntervalSinceDate:v7];
    if (v11 <= 10.0)
    {
      v16 = [(HMDBackgroundTaskManager *)self pendingTaskDateByIdentifier];
      [v16 setObject:0 forKeyedSubscript:v6];

      v17 = (void *)MEMORY[0x1D9452090]();
      v18 = self;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = HMFGetLogIdentifier();
        int v21 = 138543618;
        v22 = v20;
        __int16 v23 = 2112;
        id v24 = v6;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Executing pending task identifier: %@", (uint8_t *)&v21, 0x16u);
      }
      [(HMDBackgroundTaskManager *)v18 _postNotificationWithIdentifier:v6];
    }
    else
    {
      v12 = (void *)MEMORY[0x1D9452090](v10);
      v13 = self;
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = HMFGetLogIdentifier();
        int v21 = 138543874;
        v22 = v15;
        __int16 v23 = 2112;
        id v24 = v9;
        __int16 v25 = 2112;
        id v26 = v6;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@Not executing pending task because client was registered too late, expected fire date: %@, identifier: %@", (uint8_t *)&v21, 0x20u);
      }
    }
  }
}

- (void)_handleEvent:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E4F14560]);
  if (string)
  {
    id v6 = string;
    id v7 = [NSString stringWithUTF8String:string];
    if (v7)
    {
      id v8 = [(HMDBackgroundTaskManager *)self _taskForIdentifier:v7];
      [(HMDBackgroundTaskManager *)self _setTask:0 forIdentifier:v7];
      [(HMDBackgroundTaskManager *)self _unregisterEventWithIdentifier:v7];
      xpc_object_t v9 = [(HMDBackgroundTaskManager *)self dateProvider];
      uint64_t v10 = [v9 now];

      if (v8)
      {
        double v11 = [v8 expectedFireDate];
        [v11 timeIntervalSinceDate:v10];
        BOOL v13 = v12 > 10.0;

        v14 = (void *)MEMORY[0x1D9452090]();
        v15 = self;
        v16 = HMFGetOSLogHandle();
        v17 = v16;
        if (v13)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v18 = HMFGetLogIdentifier();
            v19 = [v8 expectedFireDate];
            int v37 = 138543874;
            v38 = v18;
            __int16 v39 = 2112;
            v40 = v19;
            __int16 v41 = 2112;
            v42 = v7;
            _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Not executing task because xpc event was delivered too late, expected fire date: %@, identifier: %@", (uint8_t *)&v37, 0x20u);
          }
          v20 = [(HMDBackgroundTaskManager *)v15 logger];
          [v20 submitNotFiredLogEventForTask:v8];
        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            v35 = HMFGetLogIdentifier();
            int v37 = 138543618;
            v38 = v35;
            __int16 v39 = 2112;
            v40 = (const char *)v8;
            _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Executing task %@", (uint8_t *)&v37, 0x16u);
          }
          [(HMDBackgroundTaskManager *)v15 _postNotificationWithIdentifier:v7];
          v36 = [(HMDBackgroundTaskManager *)v15 logger];
          [v36 submitLogEventForTask:v8];
        }
      }
      else
      {
        v29 = (void *)MEMORY[0x1D9452090]();
        v30 = self;
        v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          v32 = HMFGetLogIdentifier();
          int v37 = 138543618;
          v38 = v32;
          __int16 v39 = 2112;
          v40 = (const char *)v7;
          _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Pausing scheduled task until observer is added, identifier: %@", (uint8_t *)&v37, 0x16u);
        }
        p_lock = &v30->_lock;
        os_unfair_lock_lock_with_options();
        v34 = [(HMDBackgroundTaskManager *)v30 pendingTaskDateByIdentifier];
        [v34 setObject:v10 forKeyedSubscript:v7];

        os_unfair_lock_unlock(p_lock);
      }
    }
    else
    {
      __int16 v25 = (void *)MEMORY[0x1D9452090]();
      id v26 = self;
      uint64_t v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = HMFGetLogIdentifier();
        int v37 = 138543618;
        v38 = v28;
        __int16 v39 = 2080;
        v40 = v6;
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unable to execute task with missing identifier for event key name: %s", (uint8_t *)&v37, 0x16u);
      }
    }
  }
  else
  {
    int v21 = (void *)MEMORY[0x1D9452090]();
    v22 = self;
    __int16 v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = HMFGetLogIdentifier();
      int v37 = 138543362;
      v38 = v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unable to execute task because xpc event key name is missing", (uint8_t *)&v37, 0xCu);
    }
  }
}

- (void)configure
{
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __37__HMDBackgroundTaskManager_configure__block_invoke;
  handler[3] = &unk_1E6A0BC70;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.alarm", 0, handler);
}

uint64_t __37__HMDBackgroundTaskManager_configure__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleEvent:a2];
}

- (id)expectedFireDateForTaskWithIdentifier:(id)a3
{
  uint64_t v3 = [(HMDBackgroundTaskManager *)self _taskForIdentifier:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 expectedFireDate];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)hasOutstandingTaskWithIdentifier:(id)a3
{
  uint64_t v3 = [(HMDBackgroundTaskManager *)self _taskForIdentifier:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)cancelTaskWithIdentifier:(id)a3 onObserver:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1D9452090]();
  xpc_object_t v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    double v11 = HMFGetLogIdentifier();
    int v18 = 138543618;
    v19 = v11;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Cancelling task with identifier: %@", (uint8_t *)&v18, 0x16u);
  }
  double v12 = [(HMDBackgroundTaskManager *)v9 notificationCenter];
  [v12 removeObserver:v7 name:@"HMD.BGTM.NN" object:0];

  os_unfair_lock_lock_with_options();
  BOOL v13 = [(HMDBackgroundTaskManager *)v9 pendingTaskDateByIdentifier];
  [v13 setObject:0 forKeyedSubscript:v6];

  v14 = [(HMDBackgroundTaskManager *)v9 tasksByIdentifier];
  v15 = [v14 objectForKeyedSubscript:v6];

  if (v15)
  {
    v16 = [(HMDBackgroundTaskManager *)v9 logger];
    [v16 submitNotFiredLogEventForTask:v15];
  }
  v17 = [(HMDBackgroundTaskManager *)v9 tasksByIdentifier];
  [v17 setObject:0 forKeyedSubscript:v6];

  os_unfair_lock_unlock(&v9->_lock);
  [(HMDBackgroundTaskManager *)v9 _unregisterEventWithIdentifier:v6];
}

- (BOOL)scheduleTaskWithIdentifier:(id)a3 fireDate:(id)a4 onObserver:(id)a5 selector:(SEL)a6 error:(id *)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  double v12 = (HMDBackgroundTask *)a3;
  id v13 = a4;
  id v14 = a5;
  v15 = [(HMDBackgroundTaskManager *)self notificationCenter];
  [v15 removeObserver:v14 name:@"HMD.BGTM.NN" object:0];

  v16 = [(HMDBackgroundTaskManager *)self notificationCenter];
  [v16 addObserver:v14 selector:a6 name:@"HMD.BGTM.NN" object:0];

  v17 = [(HMDBackgroundTaskManager *)self dateProvider];
  int v18 = [v17 now];

  os_unfair_lock_lock_with_options();
  [(HMDBackgroundTaskManager *)self _handlePendingTaskWithIdentifier:v12 date:v18];
  v19 = [(HMDBackgroundTaskManager *)self tasksByIdentifier];
  __int16 v20 = [v19 objectForKeyedSubscript:v12];

  if (v20)
  {
    id v21 = [(HMDBackgroundTaskManager *)self logger];
    [v21 submitNotFiredLogEventForTask:v20];
  }
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v22 = [v13 compare:v18];
  if (v22 == -1)
  {
    v29 = (void *)MEMORY[0x1D9452090]();
    v30 = self;
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = HMFGetLogIdentifier();
      int v34 = 138543874;
      v35 = v32;
      __int16 v36 = 2112;
      int v37 = v12;
      __int16 v38 = 2112;
      id v39 = v13;
      _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to schedule task for identifier %@ with fire date in the past: %@", (uint8_t *)&v34, 0x20u);
    }
    if (a7)
    {
      *a7 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
    }
  }
  else
  {
    [(HMDBackgroundTaskManager *)self _unregisterEventWithIdentifier:v12];
    __int16 v23 = [[HMDBackgroundTask alloc] initWithIdentifier:v12 expectedFireDate:v13 scheduledDate:v18];
    id v24 = (void *)MEMORY[0x1D9452090]([(HMDBackgroundTaskManager *)self _setTask:v23 forIdentifier:v12]);
    __int16 v25 = self;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      [v13 timeIntervalSinceDate:v18];
      int v34 = 138543874;
      v35 = v27;
      __int16 v36 = 2112;
      int v37 = v23;
      __int16 v38 = 2048;
      id v39 = v28;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@Scheduling task %@ (in %fs)", (uint8_t *)&v34, 0x20u);
    }
    [(HMDBackgroundTaskManager *)v25 _registerEventWithIdentifier:v12 fireDate:v13];
  }
  return v22 != -1;
}

- (HMDBackgroundTaskManager)initWithNotificationCenter:(id)a3 dateProvider:(id)a4 logger:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMDBackgroundTaskManager;
  double v12 = [(HMDBackgroundTaskManager *)&v19 init];
  id v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    tasksByIdentifier = v13->_tasksByIdentifier;
    v13->_tasksByIdentifier = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    pendingTaskDateByIdentifier = v13->_pendingTaskDateByIdentifier;
    v13->_pendingTaskDateByIdentifier = (NSMutableDictionary *)v16;

    objc_storeStrong((id *)&v13->_dateProvider, a4);
    objc_storeStrong((id *)&v13->_logger, a5);
    objc_storeStrong((id *)&v13->_notificationCenter, a3);
  }

  return v13;
}

- (HMDBackgroundTaskManager)init
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  BOOL v4 = objc_alloc_init(HMDDate);
  id v5 = objc_alloc_init(HMDBackgroundTaskLogger);
  id v6 = [(HMDBackgroundTaskManager *)self initWithNotificationCenter:v3 dateProvider:v4 logger:v5];

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18_41603 != -1) {
    dispatch_once(&logCategory__hmf_once_t18_41603, &__block_literal_global_18_41604);
  }
  v2 = (void *)logCategory__hmf_once_v19_41605;
  return v2;
}

uint64_t __39__HMDBackgroundTaskManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v19_41605;
  logCategory__hmf_once_v19_41605 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (HMDBackgroundTaskManager)sharedManager
{
  if (sharedManager__hmf_once_t0 != -1) {
    dispatch_once(&sharedManager__hmf_once_t0, &__block_literal_global_41610);
  }
  v2 = (void *)sharedManager__hmf_once_v1;
  return (HMDBackgroundTaskManager *)v2;
}

uint64_t __41__HMDBackgroundTaskManager_sharedManager__block_invoke()
{
  uint64_t v0 = objc_alloc_init(HMDBackgroundTaskManager);
  uint64_t v1 = sharedManager__hmf_once_v1;
  sharedManager__hmf_once_uint64_t v1 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end