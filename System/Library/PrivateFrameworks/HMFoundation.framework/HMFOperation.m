@interface HMFOperation
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (HMFActivity)activity;
- (HMFOperation)init;
- (HMFOperation)initWithTimeout:(double)a3;
- (HMFTimer)timer;
- (NSArray)attributeDescriptions;
- (NSDate)timeoutDate;
- (NSError)error;
- (NSString)shortDescription;
- (NSUUID)identifier;
- (OS_dispatch_queue)underlyingQueue;
- (id)logIdentifier;
- (void)cancel;
- (void)cancelWithError:(id)a3;
- (void)finish;
- (void)main;
- (void)setActivity:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)start;
- (void)timerDidFire:(id)a3;
@end

@implementation HMFOperation

- (void)finish
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"isExecuting", @"isFinished", 0);
  [(HMFOperation *)self _willChangeValuesForKeys:v3];

  os_unfair_lock_lock_with_options();
  if (([(HMFOperation *)self isCancelled] & 1) == 0 && !self->_finished)
  {
    v4 = (void *)MEMORY[0x19F3A87A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = HMFGetLogIdentifier(v5);
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      _os_log_impl(&dword_19D57B000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Finishing operation", buf, 0xCu);
    }
    error = v5->_error;
    v5->_error = 0;

    if (v5->_executing)
    {
      v5->_executing = 0;
      self->_finished = 1;
    }
    [(HMFActivity *)v5->_activity invalidate];
  }
  os_unfair_lock_unlock(&self->_lock);
  v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"isExecuting", @"isFinished", 0);
  [(HMFOperation *)self _didChangeValuesForKeys:v9];
}

- (id)logIdentifier
{
  v2 = [(HMFOperation *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (HMFOperation)initWithTimeout:(double)a3
{
  v17.receiver = self;
  v17.super_class = (Class)HMFOperation;
  v4 = [(HMFOperation *)&v17 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
    identifier = v4->_identifier;
    v4->_identifier = (NSUUID *)v5;

    v7 = (const char *)HMFDispatchQueueName(v4, 0);
    dispatch_queue_t v8 = dispatch_queue_create(v7, 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = voucher_copy();
    voucher = v4->_voucher;
    v4->_voucher = (OS_voucher *)v10;

    uint64_t v12 = [(HMFOperation *)v4 identifier];
    v13 = [v12 UUIDString];
    [(HMFOperation *)v4 setName:v13];

    if (a3 > 0.0)
    {
      v14 = [[HMFTimer alloc] initWithTimeInterval:0 options:a3];
      timer = v4->_timer;
      v4->_timer = v14;

      [(HMFTimer *)v4->_timer setDelegate:v4];
    }
  }
  return v4;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 296, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

uint64_t __21__HMFOperation_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) main];
}

- (BOOL)isFinished
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_finished;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isExecuting
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_executing;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"executing"] & 1) != 0
    || ([v4 isEqualToString:@"isExecuting"] & 1) != 0
    || ([v4 isEqualToString:@"finished"] & 1) != 0
    || ([v4 isEqualToString:@"isFinished"] & 1) != 0)
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___HMFOperation;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

- (void)start
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"isExecuting", @"isFinished", 0);
  [(HMFOperation *)self _willChangeValuesForKeys:v3];

  uint64_t v4 = os_unfair_lock_lock_with_options();
  if (self->_executing)
  {
    v31 = (void *)MEMORY[0x19F3A87A0](v4);
    v32 = self;
    HMFGetOSLogHandle();
    v33 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = HMFGetLogIdentifier(v32);
      *(_DWORD *)buf = 138543362;
      v41 = v34;
      _os_log_impl(&dword_19D57B000, v33, OS_LOG_TYPE_ERROR, "%{public}@Operation is already executing", buf, 0xCu);
    }
LABEL_24:

    id v37 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Operation is already executing." userInfo:0];
    objc_exception_throw(v37);
  }
  if (([(HMFOperation *)self isReady] & 1) == 0)
  {
    v31 = (void *)MEMORY[0x19F3A87A0]();
    v35 = self;
    HMFGetOSLogHandle();
    v33 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v36 = HMFGetLogIdentifier(v35);
      *(_DWORD *)buf = 138543362;
      v41 = v36;
      _os_log_impl(&dword_19D57B000, v33, OS_LOG_TYPE_ERROR, "%{public}@Operation is not ready", buf, 0xCu);
    }
    goto LABEL_24;
  }
  if (self->_finished || [(HMFOperation *)self isCancelled])
  {
    unsigned __int8 v5 = (void *)MEMORY[0x19F3A87A0]();
    v6 = self;
    HMFGetOSLogHandle();
    objc_super v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      dispatch_queue_t v8 = HMFGetLogIdentifier(v6);
      *(_DWORD *)buf = 138543362;
      v41 = v8;
      _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_INFO, "%{public}@Operation is already complete, aborting.", buf, 0xCu);
    }
    if (!self->_finished)
    {
      self->_finished = 1;
      v9 = (void *)MEMORY[0x19F3A87A0]();
      uint64_t v10 = v6;
      HMFGetOSLogHandle();
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = HMFGetLogIdentifier(v10);
        *(_DWORD *)buf = 138543362;
        v41 = v12;
        _os_log_impl(&dword_19D57B000, v11, OS_LOG_TYPE_INFO, "%{public}@Cancelled operation was not marked finished, marking finished", buf, 0xCu);
      }
    }
  }
  else
  {
    activity = self->_activity;
    if (!activity)
    {
      v14 = self->_voucher;
      voucher_adopt();
      v15 = NSString;
      v16 = [(HMFOperation *)self identifier];
      objc_super v17 = [v16 UUIDString];
      v18 = [v15 stringWithFormat:@"Operation:%@", v17];

      v19 = [[HMFActivity alloc] initWithName:v18];
      v20 = self->_activity;
      self->_activity = v19;

      [(HMFActivity *)self->_activity end];
      activity = self->_activity;
    }
    [(HMFActivity *)activity begin];
    v21 = (void *)MEMORY[0x19F3A87A0]([(HMFActivity *)self->_activity markWithReason:@"Starting operation"]);
    v22 = self;
    HMFGetOSLogHandle();
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = HMFGetLogIdentifier(v22);
      *(_DWORD *)buf = 138543362;
      v41 = v24;
      _os_log_impl(&dword_19D57B000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Starting operation", buf, 0xCu);
    }
    self->_executing = 1;
    v25 = [(HMFOperation *)v22 timer];
    [v25 resume];

    v26 = self->_activity;
    if (v22->_qosWasSet)
    {
      uint64_t v27 = [(HMFOperation *)v22 qualityOfService];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __21__HMFOperation_start__block_invoke;
      v39[3] = &unk_1E5957698;
      v39[4] = v22;
      v28 = [(HMFActivity *)v26 blockWithQualityOfService:v27 block:v39];
    }
    else
    {
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __21__HMFOperation_start__block_invoke_2;
      v38[3] = &unk_1E5957698;
      v38[4] = v22;
      v28 = [(HMFActivity *)v26 blockWithBlock:v38];
    }
    v29 = v28;
    dispatch_async((dispatch_queue_t)v22->_queue, v28);
    [(HMFActivity *)self->_activity end];
  }
  os_unfair_lock_unlock(&self->_lock);
  v30 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"isExecuting", @"isFinished", 0);
  [(HMFOperation *)self _didChangeValuesForKeys:v30];
}

- (HMFTimer)timer
{
  return self->_timer;
}

- (OS_dispatch_queue)underlyingQueue
{
  return self->_queue;
}

- (void)setQualityOfService:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMFOperation;
  -[HMFOperation setQualityOfService:](&v7, sel_setQualityOfService_);
  queue = self->_queue;
  v6 = dispatch_get_global_queue(a3, 0);
  dispatch_set_target_queue(queue, v6);

  self->_qosWasSet = 1;
}

- (void)setActivity:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = os_unfair_lock_lock_with_options();
    if (self->_executing || self->_finished)
    {
      objc_super v7 = (void *)MEMORY[0x19F3A87A0](v6);
      dispatch_queue_t v8 = self;
      HMFGetOSLogHandle();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = HMFGetLogIdentifier(v8);
        int v13 = 138543362;
        v14 = v10;
        _os_log_impl(&dword_19D57B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Cannot set an activity once an operation has started executing", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      if (!self->_activity)
      {
        objc_storeStrong((id *)&self->_activity, a3);
        goto LABEL_7;
      }
      objc_super v7 = (void *)MEMORY[0x19F3A87A0]();
      v11 = self;
      HMFGetOSLogHandle();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = HMFGetLogIdentifier(v11);
        int v13 = 138543362;
        v14 = v12;
        _os_log_impl(&dword_19D57B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Cannot set an activity once an activity has been set", (uint8_t *)&v13, 0xCu);
      }
    }

LABEL_7:
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (HMFOperation)init
{
  return [(HMFOperation *)self initWithTimeout:0.0];
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (NSError)error
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_error;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSDate)timeoutDate
{
  v2 = [(HMFOperation *)self timer];
  v3 = [v2 fireDate];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }
  uint64_t v6 = v5;

  return (NSDate *)v6;
}

uint64_t __21__HMFOperation_start__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) main];
}

- (void)main
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x19F3A87A0](self, a2);
  uint64_t v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = HMFGetLogIdentifier(v4);
    int v7 = 138543362;
    dispatch_queue_t v8 = v6;
    _os_log_impl(&dword_19D57B000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Subclasses should override main", (uint8_t *)&v7, 0xCu);
  }
}

- (void)cancel
{
  id v3 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:12];
  [(HMFOperation *)self cancelWithError:v3];
}

- (void)cancelWithError:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  if (!self->_finished) {
    objc_storeStrong((id *)&self->_error, a3);
  }
  os_unfair_lock_unlock(&self->_lock);
  v13.receiver = self;
  v13.super_class = (Class)HMFOperation;
  [(HMFOperation *)&v13 cancel];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"isExecuting", @"isFinished", 0);
  [(HMFOperation *)self _willChangeValuesForKeys:v6];

  uint64_t v7 = os_unfair_lock_lock_with_options();
  if (!self->_finished)
  {
    dispatch_queue_t v8 = (void *)MEMORY[0x19F3A87A0](v7);
    uint64_t v9 = self;
    HMFGetOSLogHandle();
    uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = HMFGetLogIdentifier(v9);
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_19D57B000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Cancelling with error: %@", buf, 0x16u);
    }
    if (v9->_executing)
    {
      v9->_executing = 0;
      self->_finished = 1;
    }
    [(HMFActivity *)v9->_activity invalidate];
  }
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"isExecuting", @"isFinished", 0);
  [(HMFOperation *)self _didChangeValuesForKeys:v12];
}

- (HMFActivity)activity
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_activity;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

+ (id)logCategory
{
  if (_MergedGlobals_3_16 != -1) {
    dispatch_once(&_MergedGlobals_3_16, &__block_literal_global_43);
  }
  v2 = (void *)qword_1EB4EEBC0;
  return v2;
}

uint64_t __27__HMFOperation_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle(@"Operation", @"com.apple.HMFoundation");
  uint64_t v1 = qword_1EB4EEBC0;
  qword_1EB4EEBC0 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();
  return (NSString *)[v2 shortDescription];
}

- (NSArray)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = [HMFAttributeDescription alloc];
  uint64_t v4 = [(HMFOperation *)self identifier];
  id v5 = [(HMFAttributeDescription *)v3 initWithName:@"Identifier" value:v4];
  v8[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return (NSArray *)v6;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3A87A0]();
  uint64_t v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    dispatch_queue_t v8 = HMFGetLogIdentifier(v6);
    int v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_19D57B000, v7, OS_LOG_TYPE_INFO, "%{public}@Operation timed out, cancelling", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v9 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:13];
  [(HMFOperation *)v6 cancelWithError:v9];
}

@end