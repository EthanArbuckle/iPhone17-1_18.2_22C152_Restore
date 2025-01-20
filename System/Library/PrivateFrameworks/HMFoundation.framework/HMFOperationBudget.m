@interface HMFOperationBudget
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)logCategory;
- (BOOL)decrement;
- (BOOL)decrementByCount:(unint64_t)a3;
- (BOOL)isEmpty;
- (BOOL)isFull;
- (HMFOperationBudget)init;
- (HMFOperationBudget)initWithLimit:(unint64_t)a3 rate:(_HMFRate)a4;
- (_HMFRate)rate;
- (unint64_t)limit;
- (unint64_t)value;
- (void)reset;
- (void)timerDidFire:(id)a3;
@end

@implementation HMFOperationBudget

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"value"] & 1) != 0
    || ([v3 isEqualToString:@"full"] & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    int v4 = [v3 isEqualToString:@"empty"] ^ 1;
  }

  return v4;
}

- (HMFOperationBudget)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  int v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMFOperationBudget)initWithLimit:(unint64_t)a3 rate:(_HMFRate)a4
{
  if (!a3)
  {
    v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    v15 = @"Limit must be nonzero";
    goto LABEL_9;
  }
  unint64_t value = a4.value;
  if (!a4.value || (double period = a4.period, v6 = a4.period, a4.period <= 0.0))
  {
    v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    v15 = @"Rate is invalid";
LABEL_9:
    id v16 = [v13 exceptionWithName:v14 reason:v15 userInfo:0];
    objc_exception_throw(v16);
  }
  v17.receiver = self;
  v17.super_class = (Class)HMFOperationBudget;
  v8 = [(HMFOperationBudget *)&v17 init];
  v9 = v8;
  if (v8)
  {
    v8->_limit = a3;
    v8->_unint64_t value = a3;
    v8->_rate.unint64_t value = value;
    v8->_rate.double period = period;
    v10 = [[HMFTimer alloc] initWithTimeInterval:5 options:v6];
    timer = v9->_timer;
    v9->_timer = v10;

    [(HMFTimer *)v9->_timer setDelegate:v9];
  }
  return v9;
}

- (unint64_t)value
{
  os_unfair_recursive_lock_lock_with_options();
  unint64_t value = self->_value;
  os_unfair_recursive_lock_unlock();
  return value;
}

- (BOOL)isFull
{
  LOBYTE(self) = self->_value == self->_limit;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (BOOL)isEmpty
{
  LOBYTE(self) = self->_value == 0;
  os_unfair_recursive_lock_unlock();
  return (char)self;
}

- (void)reset
{
  os_unfair_recursive_lock_lock_with_options();
  if (self->_value != self->_limit)
  {
    [(HMFTimer *)self->_timer suspend];
    __updateValue(self, self->_limit);
  }
  os_unfair_recursive_lock_unlock();
}

- (BOOL)decrement
{
  return [(HMFOperationBudget *)self decrementByCount:1];
}

- (BOOL)decrementByCount:(unint64_t)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = os_unfair_recursive_lock_lock_with_options();
  double v6 = (void *)MEMORY[0x19F3A87A0](v5);
  id v7 = self;
  HMFGetOSLogHandle();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = HMFGetLogIdentifier(v7);
    int v27 = 138543618;
    v28 = v9;
    __int16 v29 = 2048;
    unint64_t v30 = a3;
    _os_log_impl(&dword_19D57B000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Decrementing by %tu", (uint8_t *)&v27, 0x16u);
  }
  unint64_t value = v7->_value;
  if (value < a3)
  {
    v22 = (void *)MEMORY[0x19F3A87A0]();
    v23 = v7;
    HMFGetOSLogHandle();
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v25 = HMFGetLogIdentifier(v23);
      int v27 = 138543362;
      v28 = v25;
      _os_log_impl(&dword_19D57B000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Cannot decrement, not enough budget", (uint8_t *)&v27, 0xCu);
    }
  }
  else
  {
    BOOL v11 = [(HMFOperationBudget *)v7 isFull];
    __updateValue(v7, v7->_value - a3);
    if (v11)
    {
      v13 = (void *)MEMORY[0x19F3A87A0]();
      uint64_t v14 = v7;
      HMFGetOSLogHandle();
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        id v16 = HMFGetLogIdentifier(v14);
        int v27 = 138543362;
        v28 = v16;
        _os_log_impl(&dword_19D57B000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Starting timer", (uint8_t *)&v27, 0xCu);
      }
      uint64_t v12 = [v14[2] resume];
    }
    objc_super v17 = (void *)MEMORY[0x19F3A87A0](v12);
    v18 = v7;
    HMFGetOSLogHandle();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = HMFGetLogIdentifier(v18);
      unint64_t v21 = v7->_value;
      int v27 = 138543618;
      v28 = v20;
      __int16 v29 = 2048;
      unint64_t v30 = v21;
      _os_log_impl(&dword_19D57B000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Successfully decremented to: %tu", (uint8_t *)&v27, 0x16u);
    }
  }
  os_unfair_recursive_lock_unlock();
  return value >= a3;
}

+ (id)logCategory
{
  if (_MergedGlobals_3_1 != -1) {
    dispatch_once(&_MergedGlobals_3_1, &__block_literal_global_11);
  }
  v2 = (void *)qword_1EB4EEA50;
  return v2;
}

uint64_t __33__HMFOperationBudget_logCategory__block_invoke()
{
  qword_1EB4EEA50 = HMFCreateOSLogHandle(@"OperationBudget", @"com.apple.HMFoundation");
  return MEMORY[0x1F41817F8]();
}

- (void)timerDidFire:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = os_unfair_recursive_lock_lock_with_options();
  double v6 = (void *)MEMORY[0x19F3A87A0](v5);
  id v7 = self;
  HMFGetOSLogHandle();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = HMFGetLogIdentifier(v7);
    int v20 = 138543362;
    unint64_t v21 = v9;
    _os_log_impl(&dword_19D57B000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Incrementing", (uint8_t *)&v20, 0xCu);
  }
  unint64_t v10 = v7->_rate.value + v7->_value;
  if (v10 >= v7->_limit)
  {
    BOOL v11 = (void *)MEMORY[0x19F3A87A0]();
    uint64_t v12 = v7;
    HMFGetOSLogHandle();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = HMFGetLogIdentifier(v12);
      int v20 = 138543362;
      unint64_t v21 = v14;
      _os_log_impl(&dword_19D57B000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Stopping timer", (uint8_t *)&v20, 0xCu);
    }
    [v12[2] suspend];
    __updateValue(v12, v7->_limit);
  }
  else
  {
    __updateValue(v7, v10);
    v7->_value += v7->_rate.value;
  }
  v15 = (void *)MEMORY[0x19F3A87A0]();
  id v16 = v7;
  HMFGetOSLogHandle();
  objc_super v17 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18 = HMFGetLogIdentifier(v16);
    unint64_t value = v7->_value;
    int v20 = 138543618;
    unint64_t v21 = v18;
    __int16 v22 = 2048;
    unint64_t v23 = value;
    _os_log_impl(&dword_19D57B000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Incremented to: %tu", (uint8_t *)&v20, 0x16u);
  }
  os_unfair_recursive_lock_unlock();
}

- (unint64_t)limit
{
  return self->_limit;
}

- (_HMFRate)rate
{
  p_rate = &self->_rate;
  unint64_t value = self->_rate.value;
  double period = p_rate->period;
  result.double period = period;
  result.unint64_t value = value;
  return result;
}

- (void).cxx_destruct
{
}

@end