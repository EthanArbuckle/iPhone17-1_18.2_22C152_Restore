@interface HMFStagedValue
+ (id)logCategory;
- (BOOL)isStaged;
- (HMFStagedValue)initWithValue:(id)a3;
- (HMFStagedValueDelegate)delegate;
- (HMFTimer)timer;
- (id)committedValue;
- (id)timerFactory;
- (id)value;
- (void)_commitValue:(id)a3;
- (void)_stageValue:(id)a3 withTimer:(id)a4;
- (void)_unstageValue;
- (void)commitValue:(id)a3;
- (void)setCommittedValue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTimerFactory:(id)a3;
- (void)stageValue:(id)a3;
- (void)stageValue:(id)a3 withTimeout:(double)a4;
- (void)timerDidFire:(id)a3;
@end

@implementation HMFStagedValue

- (HMFStagedValue)initWithValue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMFStagedValue;
  v6 = [(HMFStagedValue *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_committedValue, a3);
    v7->_isStaged = 0;
    id timerFactory = v7->_timerFactory;
    v7->_id timerFactory = &__block_literal_global_0;
  }
  return v7;
}

HMFTimer *__32__HMFStagedValue_initWithValue___block_invoke(double a1)
{
  v1 = [[HMFTimer alloc] initWithTimeInterval:2 options:a1];
  return v1;
}

- (void)stageValue:(id)a3 withTimeout:(double)a4
{
  id v7 = a3;
  os_unfair_lock_lock_with_options();
  v6 = (*((void (**)(double))self->_timerFactory + 2))(a4);
  [(HMFStagedValue *)self _stageValue:v7 withTimer:v6];

  os_unfair_lock_unlock(&self->_lock);
}

- (void)stageValue:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(HMFStagedValue *)self _stageValue:v4 withTimer:0];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)commitValue:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(HMFStagedValue *)self _commitValue:v4];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_stageValue:(id)a3 withTimer:(id)a4
{
  id v9 = a3;
  id v7 = a4;
  if (HMFEqualObjects(v9, self->_committedValue))
  {
    [(HMFStagedValue *)self _unstageValue];
  }
  else
  {
    self->_isStaged = 1;
    objc_storeStrong(&self->_stagedValue, a3);
    objc_storeStrong((id *)&self->_timer, a4);
    timer = self->_timer;
    if (timer)
    {
      [(HMFTimer *)timer setDelegate:self];
      [(HMFTimer *)self->_timer resume];
    }
  }
}

- (void)_unstageValue
{
  self->_isStaged = 0;
  id stagedValue = self->_stagedValue;
  self->_id stagedValue = 0;

  timer = self->_timer;
  self->_timer = 0;
}

- (void)_commitValue:(id)a3
{
  objc_storeStrong(&self->_committedValue, a3);
  [(HMFStagedValue *)self _unstageValue];
}

- (id)value
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = 16;
  if (!self->_isStaged) {
    uint64_t v4 = 32;
  }
  id v5 = *(id *)((char *)&self->super.isa + v4);
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)committedValue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_committedValue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isStaged
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_isStaged;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setCommittedValue:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  id committedValue = self->_committedValue;
  self->_id committedValue = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)timerDidFire:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  if (self->_isStaged && [(HMFTimer *)self->_timer isEqual:v4])
  {
    id v5 = self->_committedValue;
    id v6 = self->_stagedValue;
    [(HMFStagedValue *)self _unstageValue];
    os_unfair_lock_unlock(&self->_lock);
    id v7 = [(HMFStagedValue *)self delegate];
    v8 = (void *)MEMORY[0x19F3A87A0]();
    id v9 = self;
    objc_super v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier(v9);
      int v12 = 138544130;
      v13 = v11;
      __int16 v14 = 2112;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v5;
      __int16 v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_INFO, "%{public}@Notify of expired value: %@ committed value: %@ delegate: %@", (uint8_t *)&v12, 0x2Au);
    }
    if (v7)
    {
      if (objc_opt_respondsToSelector()) {
        [v7 stagedValue:v9 didExpireValue:v6];
      }
    }
    else
    {
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

+ (id)logCategory
{
  if (_MergedGlobals_52 != -1) {
    dispatch_once(&_MergedGlobals_52, &__block_literal_global_5);
  }
  v2 = (void *)qword_1EB4EEC70;
  return v2;
}

uint64_t __29__HMFStagedValue_logCategory__block_invoke()
{
  qword_1EB4EEC70 = HMFCreateOSLogHandle(@"StagedValue", @"com.apple.HMFoundation");
  return MEMORY[0x1F41817F8]();
}

- (HMFTimer)timer
{
  return (HMFTimer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTimer:(id)a3
{
}

- (HMFStagedValueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMFStagedValueDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)timerFactory
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setTimerFactory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timerFactory, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_committedValue, 0);
  objc_storeStrong(&self->_stagedValue, 0);
}

@end