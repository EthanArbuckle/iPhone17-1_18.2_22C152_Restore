@interface HMFExponentialBackoffTimer
- (BOOL)isIncreasing;
- (HMFExponentialBackoffTimer)initWithMinimumTimeInterval:(double)a3 maximumTimeInterval:(double)a4 exponentialFactor:(int64_t)a5 options:(unint64_t)a6;
- (HMFExponentialBackoffTimer)initWithTimeInterval:(double)a3 options:(unint64_t)a4;
- (double)maximumTimeInterval;
- (double)minimumTimeInterval;
- (double)timeInterval;
- (int64_t)exponentialFactor;
- (void)__fire;
- (void)reset;
@end

@implementation HMFExponentialBackoffTimer

- (double)maximumTimeInterval
{
  return self->_maximumTimeInterval;
}

- (BOOL)isIncreasing
{
  return self->_increasing;
}

- (int64_t)exponentialFactor
{
  return self->_exponentialFactor;
}

- (void)__fire
{
  BOOL v3 = [(HMFExponentialBackoffTimer *)self isIncreasing];
  double timeInterval = self->super._timeInterval;
  double v5 = (double)[(HMFExponentialBackoffTimer *)self exponentialFactor];
  if (v3)
  {
    double v6 = timeInterval * v5;
    [(HMFExponentialBackoffTimer *)self maximumTimeInterval];
    if (v6 > v7)
    {
      [(HMFExponentialBackoffTimer *)self maximumTimeInterval];
LABEL_6:
      double v6 = v8;
    }
  }
  else
  {
    double v6 = timeInterval / v5;
    [(HMFExponentialBackoffTimer *)self minimumTimeInterval];
    if (v6 < v9)
    {
      [(HMFExponentialBackoffTimer *)self minimumTimeInterval];
      goto LABEL_6;
    }
  }
  self->super._double timeInterval = v6;
  v10.receiver = self;
  v10.super_class = (Class)HMFExponentialBackoffTimer;
  [(HMFTimer *)&v10 __fire];
}

- (HMFExponentialBackoffTimer)initWithTimeInterval:(double)a3 options:(unint64_t)a4
{
  return [(HMFExponentialBackoffTimer *)self initWithMinimumTimeInterval:1 maximumTimeInterval:a4 exponentialFactor:a3 options:a3];
}

- (HMFExponentialBackoffTimer)initWithMinimumTimeInterval:(double)a3 maximumTimeInterval:(double)a4 exponentialFactor:(int64_t)a5 options:(unint64_t)a6
{
  double v6 = self;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a5)
  {
    v11 = (void *)MEMORY[0x19F3A87A0](self, a2, 0, a6, a3, a4);
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier(0);
      *(_DWORD *)buf = 138543362;
      v22 = v13;
      v14 = "%{public}@[HMFExponentialBackoffTimer] The exponential factor cannot be 0";
      v15 = v12;
      uint32_t v16 = 12;
      goto LABEL_10;
    }
LABEL_11:

    v17 = 0;
    goto LABEL_12;
  }
  double v8 = a3;
  BOOL v9 = a5 > 0;
  if (a3 <= 0.0)
  {
    v11 = (void *)MEMORY[0x19F3A87A0](self, a2);
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier(0);
      *(_DWORD *)buf = 138543618;
      v22 = v13;
      __int16 v23 = 2048;
      double v24 = v8;
      v14 = "%{public}@[HMFExponentialBackoffTimer] The minimum time interval, %f, must be greater than 0";
      v15 = v12;
      uint32_t v16 = 22;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (a4 < a3)
  {
    v11 = (void *)MEMORY[0x19F3A87A0](self, a2);
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier(0);
      *(_DWORD *)buf = 138543874;
      v22 = v13;
      __int16 v23 = 2048;
      double v24 = a4;
      __int16 v25 = 2048;
      double v26 = v8;
      v14 = "%{public}@[HMFExponentialBackoffTimer] The maximum time interval, %f, must be greater than or equal to the m"
            "inimum time interval, %f";
      v15 = v12;
      uint32_t v16 = 32;
LABEL_10:
      _os_log_impl(&dword_19D57B000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (a5 <= 0) {
    a3 = a4;
  }
  v20.receiver = self;
  v20.super_class = (Class)HMFExponentialBackoffTimer;
  v19 = [(HMFTimer *)&v20 initWithTimeInterval:a6 | 4 options:a3];
  if (v19)
  {
    v19->_minimumTimeInterval = v8;
    v19->_maximumTimeInterval = a4;
    v19->_exponentialFactor = a5;
    v19->_increasing = v9;
  }
  double v6 = v19;
  v17 = v6;
LABEL_12:

  return v17;
}

- (double)timeInterval
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  double timeInterval = self->super._timeInterval;
  os_unfair_lock_unlock(p_lock);
  return timeInterval;
}

- (void)reset
{
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  if ([(HMFExponentialBackoffTimer *)self isIncreasing]) {
    [(HMFExponentialBackoffTimer *)self minimumTimeInterval];
  }
  else {
    [(HMFExponentialBackoffTimer *)self maximumTimeInterval];
  }
  self->super._double timeInterval = v4;
  if (self->super._state == 2) {
    __kick(self);
  }
  os_unfair_lock_unlock(p_lock);
}

- (double)minimumTimeInterval
{
  return self->_minimumTimeInterval;
}

@end