@interface HMDThreadCommandTimer
+ (id)logCategory;
- (HMDThreadCommandTimer)initWithQueue:(id)a3 delayInSecs:(id)a4;
- (HMDThreadCommandTimer)initWithTimer:(id)a3;
- (HMFTimer)commandTimer;
- (NSNumber)delayInSecs;
- (OS_dispatch_queue)commandQueue;
- (id)_commandTypeValueToString:(int64_t)a3;
- (id)commandBlock;
- (id)completionForBlock;
- (int64_t)commandType;
- (int64_t)currentlyScheduledCommand;
- (unint64_t)commandCount;
- (void)abort;
- (void)setCommandBlock:(id)a3;
- (void)setCommandCount:(unint64_t)a3;
- (void)setCommandQueue:(id)a3;
- (void)setCommandTimer:(id)a3;
- (void)setCommandType:(int64_t)a3;
- (void)setCompletionForBlock:(id)a3;
- (void)setDelayInSecs:(id)a3;
- (void)startWithBlock:(id)a3 completion:(id)a4 commandType:(int64_t)a5;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDThreadCommandTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong(&self->_completionForBlock, 0);
  objc_storeStrong(&self->_commandBlock, 0);
  objc_storeStrong((id *)&self->_delayInSecs, 0);
  objc_storeStrong((id *)&self->_commandTimer, 0);
}

- (void)setCommandCount:(unint64_t)a3
{
  self->_commandCount = a3;
}

- (unint64_t)commandCount
{
  return self->_commandCount;
}

- (void)setCommandType:(int64_t)a3
{
  self->_commandType = a3;
}

- (int64_t)commandType
{
  return self->_commandType;
}

- (void)setCommandQueue:(id)a3
{
}

- (OS_dispatch_queue)commandQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCompletionForBlock:(id)a3
{
}

- (id)completionForBlock
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setCommandBlock:(id)a3
{
}

- (id)commandBlock
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setDelayInSecs:(id)a3
{
}

- (NSNumber)delayInSecs
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCommandTimer:(id)a3
{
}

- (HMFTimer)commandTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 16, 1);
}

- (id)_commandTypeValueToString:(int64_t)a3
{
  if (a3 == 1) {
    return @"provideExtendedMACAddress";
  }
  else {
    return @"unknown";
  }
}

- (void)timerDidFire:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = [(HMDThreadCommandTimer *)self commandBlock];

  v7 = (void *)MEMORY[0x230FBD990]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      v12 = [(HMDThreadCommandTimer *)v8 _commandTypeValueToString:[(HMDThreadCommandTimer *)v8 commandType]];
      int v17 = 138543874;
      v18 = v11;
      __int16 v19 = 2112;
      v20 = v12;
      __int16 v21 = 2048;
      uint64_t v22 = [(HMDThreadCommandTimer *)v8 commandCount];
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Executing deferred thread command %@ now with id(%lu)", (uint8_t *)&v17, 0x20u);
    }
    v13 = [(HMDThreadCommandTimer *)v8 commandQueue];
    v14 = [(HMDThreadCommandTimer *)v8 commandBlock];
    dispatch_async(v13, v14);

    [(HMDThreadCommandTimer *)v8 setCommandType:0];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      v16 = [(HMDThreadCommandTimer *)v8 _commandTypeValueToString:[(HMDThreadCommandTimer *)v8 commandType]];
      int v17 = 138543874;
      v18 = v15;
      __int16 v19 = 2112;
      v20 = v16;
      __int16 v21 = 2048;
      uint64_t v22 = [(HMDThreadCommandTimer *)v8 commandCount];
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Execution block not found for thread command %@ with id(%lu)", (uint8_t *)&v17, 0x20u);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)currentlyScheduledCommand
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(HMDThreadCommandTimer *)self commandTimer];
  int v5 = [v4 isRunning];

  if (v5) {
    int64_t v6 = [(HMDThreadCommandTimer *)self commandType];
  }
  else {
    int64_t v6 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)abort
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(HMDThreadCommandTimer *)self commandTimer];
  int v5 = [v4 isRunning];

  if (v5)
  {
    int64_t v6 = [(HMDThreadCommandTimer *)self commandTimer];
    [v6 suspend];

    v7 = (void *)MEMORY[0x230FBD990]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      v11 = [(HMDThreadCommandTimer *)v8 _commandTypeValueToString:[(HMDThreadCommandTimer *)v8 commandType]];
      int v13 = 138543874;
      v14 = v10;
      __int16 v15 = 2112;
      v16 = v11;
      __int16 v17 = 2048;
      uint64_t v18 = [(HMDThreadCommandTimer *)v8 commandCount];
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Not executing deferred thread command %@ with id(%lu). Sending nil completion", (uint8_t *)&v13, 0x20u);
    }
    v12 = [(HMDThreadCommandTimer *)v8 completionForBlock];
    v12[2](v12, 0);

    [(HMDThreadCommandTimer *)v8 setCommandType:0];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)startWithBlock:(id)a3 completion:(id)a4 commandType:(int64_t)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v11 = [(HMDThreadCommandTimer *)self commandTimer];
  int v12 = [v11 isRunning];

  if (v12)
  {
    int v13 = [(HMDThreadCommandTimer *)self commandTimer];
    [v13 suspend];

    v14 = (void *)MEMORY[0x230FBD990]();
    __int16 v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = HMFGetLogIdentifier();
      uint64_t v18 = [(HMDThreadCommandTimer *)v15 _commandTypeValueToString:[(HMDThreadCommandTimer *)v15 commandType]];
      int v28 = 138543874;
      v29 = v17;
      __int16 v30 = 2112;
      v31 = v18;
      __int16 v32 = 2048;
      uint64_t v33 = [(HMDThreadCommandTimer *)v15 commandCount];
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Not executing deferred thread command %@ with id(%lu). Sending nil completion", (uint8_t *)&v28, 0x20u);
    }
    uint64_t v19 = [(HMDThreadCommandTimer *)v15 completionForBlock];
    v19[2](v19, 0);
  }
  [(HMDThreadCommandTimer *)self setCommandBlock:v8];
  [(HMDThreadCommandTimer *)self setCompletionForBlock:v9];
  [(HMDThreadCommandTimer *)self setCommandCount:[(HMDThreadCommandTimer *)self commandCount] + 1];
  v20 = (void *)MEMORY[0x230FBD990]([(HMDThreadCommandTimer *)self setCommandType:a5]);
  __int16 v21 = self;
  uint64_t v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    uint64_t v23 = HMFGetLogIdentifier();
    v24 = [(HMDThreadCommandTimer *)v21 _commandTypeValueToString:[(HMDThreadCommandTimer *)v21 commandType]];
    v25 = [(HMDThreadCommandTimer *)v21 delayInSecs];
    uint64_t v26 = [(HMDThreadCommandTimer *)v21 commandCount];
    int v28 = 138544130;
    v29 = v23;
    __int16 v30 = 2112;
    v31 = v24;
    __int16 v32 = 2112;
    uint64_t v33 = (uint64_t)v25;
    __int16 v34 = 2048;
    uint64_t v35 = v26;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Scheduling deferred thread command %@ to execute after %@ secs with id(%lu)", (uint8_t *)&v28, 0x2Au);
  }
  v27 = [(HMDThreadCommandTimer *)v21 commandTimer];
  [v27 resume];

  os_unfair_lock_unlock(p_lock);
}

- (HMDThreadCommandTimer)initWithTimer:(id)a3
{
  int v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  int64_t v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_BACKGROUND, 0);
  id v7 = a3;
  dispatch_queue_t v8 = dispatch_queue_create("thread-command-timer-test", v6);
  id v9 = [(HMDThreadCommandTimer *)self initWithQueue:v8 delayInSecs:&unk_26E472130];

  [(HMDThreadCommandTimer *)v9 setCommandTimer:v7];
  return v9;
}

- (HMDThreadCommandTimer)initWithQueue:(id)a3 delayInSecs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDThreadCommandTimer;
  id v9 = [(HMDThreadCommandTimer *)&v13 init];
  if (v9)
  {
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263F42658]), "initWithTimeInterval:options:", 0, (double)objc_msgSend(v8, "integerValue"));
    commandTimer = v9->_commandTimer;
    v9->_commandTimer = (HMFTimer *)v10;

    objc_storeStrong((id *)&v9->_delayInSecs, a4);
    [(HMFTimer *)v9->_commandTimer setDelegateQueue:v7];
    [(HMFTimer *)v9->_commandTimer setDelegate:v9];
    v9->_commandType = 0;
    v9->_commandCount = 0;
    objc_storeStrong((id *)&v9->_commandQueue, a3);
  }

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_145101 != -1) {
    dispatch_once(&logCategory__hmf_once_t5_145101, &__block_literal_global_145102);
  }
  v2 = (void *)logCategory__hmf_once_v6_145103;
  return v2;
}

void __36__HMDThreadCommandTimer_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v6_145103;
  logCategory__hmf_once_v6_145103 = v0;
}

@end