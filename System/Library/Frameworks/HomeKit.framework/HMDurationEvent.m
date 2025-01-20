@interface HMDurationEvent
+ (BOOL)supportsSecureCoding;
+ (id)createWithDictionary:(id)a3 home:(id)a4;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMDurationEvent)initWithCoder:(id)a3;
- (HMDurationEvent)initWithDict:(id)a3 duration:(double)a4;
- (HMDurationEvent)initWithDuration:(NSTimeInterval)duration;
- (NSTimeInterval)duration;
- (id)_serializeForAdd;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)_updateFromDictionary:(id)a3;
- (void)setDuration:(double)a3;
- (void)setOffset:(double)a3;
- (void)updateDuration:(double)a3 completionHandler:(id)a4;
@end

@implementation HMDurationEvent

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    os_unfair_lock_lock_with_options();
    double duration = self->_duration;
    [v6 duration];
    BOOL v9 = duration != v8;
    if (duration != v8)
    {
      [v6 duration];
      self->_double duration = v10;
    }
    os_unfair_lock_unlock(&self->super.super._lock);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (HMDurationEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDurationEvent;
  v5 = [(HMEvent *)&v9 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDurationEventDuration"];
    [v6 doubleValue];
    v5->_double duration = v7;
  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [HMMutableDurationEvent alloc];
  [(HMDurationEvent *)self duration];

  return -[HMDurationEvent initWithDuration:](v4, "initWithDuration:");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)createWithDictionary:(id)a3 home:(id)a4
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "hmf_numberForKey:", @"kDurationEventDuration");
  id v6 = [HMDurationEvent alloc];
  [v5 doubleValue];
  double v7 = -[HMDurationEvent initWithDict:duration:](v6, "initWithDict:duration:", v4);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [HMDurationEvent alloc];
  [(HMDurationEvent *)self duration];

  return -[HMDurationEvent initWithDuration:](v4, "initWithDuration:");
}

- (void)updateDuration:(double)a3 completionHandler:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *))a4;
  uint64_t v7 = [(HMEvent *)self context];
  if (!v6)
  {
    uint64_t v24 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[HMDurationEvent updateDuration:completionHandler:]", @"completion"];
    v25 = (void *)MEMORY[0x19F3A64A0]();
    v26 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v33 = v28;
      __int16 v34 = 2112;
      v35 = (const char *)v24;
      _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v29 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v24 userInfo:0];
    objc_exception_throw(v29);
  }
  double v8 = (void *)v7;
  if (v7)
  {
    uint64_t v9 = [(HMDurationEvent *)self duration];
    if (vabdd_f64(v10, a3) >= 0.001)
    {
      v30 = @"kDurationEventDuration";
      v18 = [NSNumber numberWithDouble:a3];
      v31 = v18;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      [(HMEvent *)self _updateEventWithPayload:v23 completionHandler:v6];
    }
    else
    {
      v11 = (void *)MEMORY[0x19F3A64A0](v9);
      v12 = self;
      v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = HMFGetLogIdentifier();
        v15 = [NSNumber numberWithDouble:a3];
        v16 = NSNumber;
        [(HMDurationEvent *)v12 duration];
        v17 = objc_msgSend(v16, "numberWithDouble:");
        *(_DWORD *)buf = 138543874;
        v33 = v14;
        __int16 v34 = 2112;
        v35 = v15;
        __int16 v36 = 2112;
        v37 = v17;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_INFO, "%{public}@Duration is already approximately %@ (%@)", buf, 0x20u);
      }
      v18 = [v8 delegateCaller];
      [v18 callCompletion:v6 error:0];
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x19F3A64A0]();
    v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v33 = v22;
      __int16 v34 = 2080;
      v35 = "-[HMDurationEvent updateDuration:completionHandler:]";
      _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);
    }
    v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:12];
    v6[2](v6, v18);
  }
}

- (void)_updateFromDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMDurationEvent;
  id v4 = a3;
  [(HMEvent *)&v6 _updateFromDictionary:v4];
  v5 = objc_msgSend(v4, "hmf_numberForKey:", @"kDurationEventDuration", v6.receiver, v6.super_class);

  if (v5)
  {
    [v5 doubleValue];
    -[HMDurationEvent setDuration:](self, "setDuration:");
  }
}

- (id)_serializeForAdd
{
  v9.receiver = self;
  v9.super_class = (Class)HMDurationEvent;
  v3 = [(HMEvent *)&v9 _serializeForAdd];
  id v4 = (void *)[v3 mutableCopy];

  v5 = NSNumber;
  [(HMDurationEvent *)self duration];
  objc_super v6 = objc_msgSend(v5, "numberWithDouble:");
  [v4 setObject:v6 forKeyedSubscript:@"kDurationEventDuration"];

  uint64_t v7 = (void *)[v4 copy];

  return v7;
}

- (void)setOffset:(double)a3
{
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  self->_double duration = a3;

  os_unfair_lock_unlock(p_lock);
}

- (NSTimeInterval)duration
{
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  double duration = self->_duration;
  os_unfair_lock_unlock(p_lock);
  return duration;
}

- (HMDurationEvent)initWithDict:(id)a3 duration:(double)a4
{
  v6.receiver = self;
  v6.super_class = (Class)HMDurationEvent;
  result = [(HMEvent *)&v6 initWithDict:a3];
  if (result) {
    result->_double duration = a4;
  }
  return result;
}

- (HMDurationEvent)initWithDuration:(NSTimeInterval)duration
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"kEventUUIDKey";
  v5 = [MEMORY[0x1E4F29128] UUID];
  v9[1] = @"kEventTriggerEndEvent";
  v10[0] = v5;
  v10[1] = MEMORY[0x1E4F1CC38];
  objc_super v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  uint64_t v7 = [(HMDurationEvent *)self initWithDict:v6 duration:duration];

  return v7;
}

@end