@interface HMFTimer
+ (id)shortDescription;
- (BOOL)isRunning;
- (HMFTimer)init;
- (HMFTimer)initWithTimeInterval:(double)a3 options:(unint64_t)a4;
- (HMFTimerDelegate)delegate;
- (NSDate)fireDate;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_source)timer;
- (double)timeInterval;
- (id)attributeDescriptions;
- (unint64_t)leeway;
- (unint64_t)options;
- (void)__fire;
- (void)__handleExpiration;
- (void)cancel;
- (void)dealloc;
- (void)fire;
- (void)kick;
- (void)resume;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setFireDate:(id)a3;
- (void)suspend;
@end

@implementation HMFTimer

- (double)timeInterval
{
  return self->_timeInterval;
}

- (void)setDelegate:(id)a3
{
}

- (void)__handleExpiration
{
  v3 = (void *)MEMORY[0x19F3A87A0](self, a2);
  v4 = [[HMFOSTransaction alloc] initWithName:@"com.apple.hmftimer.handle-expiration"];
  os_unfair_lock_lock_with_options();
  if (self->_state == 2)
  {
    [(HMFTimer *)self __fire];
    os_unfair_lock_unlock(&self->_lock);
    dispatch_assert_queue_V2((dispatch_queue_t)self->_timerQueue);
    v5 = [(HMFTimer *)self delegate];
    [v5 timerDidFire:self];
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)suspend
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  __suspend(self);
  os_unfair_lock_unlock(p_lock);
}

- (void)resume
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  __resume(self);
  os_unfair_lock_unlock(p_lock);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (unint64_t)options
{
  return self->_options;
}

- (HMFTimerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMFTimerDelegate *)WeakRetained;
}

- (void)__fire
{
  if (([(HMFTimer *)self options] & 4) != 0)
  {
    __kick(self);
  }
  else
  {
    v3 = [MEMORY[0x1E4F1C9C8] date];
    fireDate = self->_fireDate;
    self->_fireDate = v3;

    __suspend(self);
  }
}

- (void)setDelegateQueue:(id)a3
{
  v4 = (OS_dispatch_queue *)a3;
  os_unfair_lock_lock_with_options();
  if (self->_timer) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"HMFTimer delegateQueue can only be set before activation (resume/fire)"];
  }
  delegateQueue = self->_delegateQueue;
  self->_delegateQueue = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
}

- (void)dealloc
{
  timer = self->_timer;
  if (timer && self->_state == 1) {
    dispatch_resume(timer);
  }
  v4.receiver = self;
  v4.super_class = (Class)HMFTimer;
  [(HMFTimer *)&v4 dealloc];
}

- (HMFTimer)initWithTimeInterval:(double)a3 options:(unint64_t)a4
{
  v5 = self;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3 <= 0.0)
  {
    v10 = (void *)MEMORY[0x19F3A87A0](self, a2, a4);
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier(0);
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      __int16 v19 = 2048;
      double v20 = a3;
      _os_log_impl(&dword_19D57B000, v11, OS_LOG_TYPE_ERROR, "%{public}@[HMFTimer] Expiration, %f, must be greater than 0", buf, 0x16u);
    }
    v13 = 0;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)HMFTimer;
    v7 = [(HMFTimer *)&v16 init];
    if (v7)
    {
      v7->_state = 1;
      v7->_timeInterval = a3;
      v7->_options = a4;
      if ((a4 & 2) != 0)
      {
        uint64_t v14 = 1000000;
      }
      else
      {
        double v8 = a3 * 1000000000.0;
        if ((a4 & 8) != 0) {
          double v9 = v8 * 0.5;
        }
        else {
          double v9 = v8 / 10.0;
        }
        uint64_t v14 = (uint64_t)v9;
      }
      v7->_leeway = v14;
    }
    v5 = v7;
    v13 = v5;
  }

  return v13;
}

- (HMFTimer)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  objc_super v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)shortDescription
{
  return @"Timer";
}

- (id)attributeDescriptions
{
  v15[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [HMFAttributeDescription alloc];
  objc_super v4 = HMFBooleanToString([(HMFTimer *)self isRunning]);
  v5 = [(HMFAttributeDescription *)v3 initWithName:@"Running" value:v4];
  v6 = [HMFAttributeDescription alloc];
  id v7 = NSNumber;
  [(HMFTimer *)self timeInterval];
  double v8 = objc_msgSend(v7, "numberWithDouble:");
  double v9 = [(HMFAttributeDescription *)v6 initWithName:@"Interval" value:v8];
  v15[1] = v9;
  v10 = [HMFAttributeDescription alloc];
  v11 = HMFBooleanToString(([(HMFTimer *)self options] >> 2) & 1);
  v12 = [(HMFAttributeDescription *)v10 initWithName:@"Repeating" value:v11];
  v15[2] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];

  return v13;
}

- (unint64_t)leeway
{
  return self->_leeway;
}

- (BOOL)isRunning
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_state == 2;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSDate)fireDate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  fireDate = self->_fireDate;
  if (fireDate)
  {
    v5 = fireDate;
  }
  else
  {
    v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }
  v6 = v5;
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)setFireDate:(id)a3
{
  objc_super v4 = (NSDate *)a3;
  os_unfair_lock_lock_with_options();
  fireDate = self->_fireDate;
  self->_fireDate = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (OS_dispatch_queue)delegateQueue
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_super v4 = self->_delegateQueue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_super v4 = self;
  v5 = v4;
  int64_t state = v4->_state;
  if (state != 3)
  {
    if (state == 1) {
      __resume(v4);
    }
    id v7 = [(HMFTimer *)v5 timer];
    dispatch_source_cancel(v7);

    v5->_int64_t state = 3;
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)kick
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  __kick(self);
  os_unfair_lock_unlock(p_lock);
}

- (void)fire
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  __activateIfNecessary(self);
  [(HMFTimer *)self __fire];
  os_unfair_lock_unlock(p_lock);
  timerQueue = self->_timerQueue;
  if ((self->_options & 0x10) != 0)
  {
    dispatch_qos_class_t v6 = QOS_CLASS_USER_INITIATED;
  }
  else
  {
    qos_class_t v5 = qos_class_self();
    if (v5 <= QOS_CLASS_UTILITY) {
      dispatch_qos_class_t v6 = QOS_CLASS_UTILITY;
    }
    else {
      dispatch_qos_class_t v6 = v5;
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __16__HMFTimer_fire__block_invoke;
  block[3] = &unk_1E5957698;
  block[4] = self;
  dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v6, 0, block);
  dispatch_async(timerQueue, v7);
}

void __16__HMFTimer_fire__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 timerDidFire:*(void *)(a1 + 32)];
}

@end