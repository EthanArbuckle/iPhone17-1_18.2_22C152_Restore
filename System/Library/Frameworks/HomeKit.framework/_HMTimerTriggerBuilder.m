@interface _HMTimerTriggerBuilder
+ (void)initialize;
- (Class)class;
- (NSDate)fireDate;
- (NSDate)fireDateIfSet;
- (NSDateComponents)recurrence;
- (NSDateComponents)significantEventOffset;
- (NSString)significantEvent;
- (NSTimeZone)timeZone;
- (id)recurrenceCalendar;
- (void)_setSignificantEventOffset:(id)a3;
- (void)setFireDate:(id)a3;
- (void)setRecurrence:(id)a3;
- (void)setSignificantEvent:(id)a3;
- (void)setSignificantEventOffset:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)updateFireDate:(id)a3 completionHandler:(id)a4;
- (void)updateRecurrence:(id)a3 completionHandler:(id)a4;
- (void)updateSignificantEvent:(id)a3 completionHandler:(id)a4;
- (void)updateSignificantEventOffset:(id)a3 completionHandler:(id)a4;
- (void)updateTimeZone:(id)a3 completionHandler:(id)a4;
@end

@implementation _HMTimerTriggerBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_significantEventOffset, 0);
  objc_storeStrong((id *)&self->_significantEvent, 0);
  objc_storeStrong((id *)&self->_recurrence, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);

  objc_storeStrong((id *)&self->_fireDate, 0);
}

- (void)updateSignificantEventOffset:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v11 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMTimerTriggerBuilder updateSignificantEventOffset:completionHandler:]", @"completion"];
    v12 = (void *)MEMORY[0x19F3A64A0]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v19 = v15;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v16 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v11 userInfo:0];
    objc_exception_throw(v16);
  }
  v7 = v6;
  [(_HMTimerTriggerBuilder *)self _setSignificantEventOffset:v17];
  if (self) {
    context = self->super.super.super._context;
  }
  else {
    context = 0;
  }
  v9 = context;
  v10 = [(_HMContext *)v9 delegateCaller];
  [v10 callCompletion:v7 error:0];
}

- (void)_setSignificantEventOffset:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSDateComponents *)[v6 copy];
  significantEventOffset = self->_significantEventOffset;
  self->_significantEventOffset = v4;

  os_unfair_lock_unlock(&self->super.super.super._lock);
}

- (void)setSignificantEventOffset:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  id v9 = v4;
  if (v4 && (valid = HMIsValidSignificantEventOffset(v4), id v5 = v9, !valid))
  {
    v7 = (_HMTimerTriggerBuilder *)_HMFPreconditionFailure();
    [(_HMTimerTriggerBuilder *)v7 significantEventOffset];
  }
  else
  {
    [(_HMTimerTriggerBuilder *)self _setSignificantEventOffset:v5];
  }
}

- (NSDateComponents)significantEventOffset
{
  p_lock = &self->super.super.super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSDateComponents *)self->_significantEventOffset copy];
  os_unfair_lock_unlock(p_lock);

  return (NSDateComponents *)v4;
}

- (void)updateSignificantEvent:(id)a3 completionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMTimerTriggerBuilder updateSignificantEvent:completionHandler:]", @"completion"];
    v14 = (void *)MEMORY[0x19F3A64A0]();
    v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      uint64_t v23 = v13;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0];
    objc_exception_throw(v18);
  }
  v7 = v6;
  if (v19)
  {
    -[_HMTimerTriggerBuilder setSignificantEvent:](self, "setSignificantEvent:");
    if (self) {
      context = self->super.super.super._context;
    }
    else {
      context = 0;
    }
    id v9 = context;
    v10 = [(_HMContext *)v9 delegateCaller];
    [v10 callCompletion:v7 error:0];
  }
  else
  {
    if (self) {
      uint64_t v11 = self->super.super.super._context;
    }
    else {
      uint64_t v11 = 0;
    }
    id v9 = v11;
    v10 = [(_HMContext *)v9 delegateCaller];
    v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v10 callCompletion:v7 error:v12];
  }
}

- (void)setSignificantEvent:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock_with_options();
  if (v7)
  {
    id v4 = (NSString *)[v7 copy];
    significantEvent = (NSDateComponents *)self->_significantEvent;
    self->_significantEvent = v4;
  }
  else
  {
    id v6 = self->_significantEvent;
    self->_significantEvent = 0;

    significantEvent = self->_significantEventOffset;
    self->_significantEventOffset = 0;
  }

  os_unfair_lock_unlock(&self->super.super.super._lock);
}

- (NSString)significantEvent
{
  p_lock = &self->super.super.super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_significantEvent;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)updateRecurrence:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v11 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMTimerTriggerBuilder updateRecurrence:completionHandler:]", @"completion"];
    v12 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v19 = v15;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v16 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v11 userInfo:0];
    objc_exception_throw(v16);
  }
  id v7 = v6;
  [(_HMTimerTriggerBuilder *)self setRecurrence:v17];
  if (self) {
    context = self->super.super.super._context;
  }
  else {
    context = 0;
  }
  id v9 = context;
  v10 = [(_HMContext *)v9 delegateCaller];
  [v10 callCompletion:v7 error:0];
}

- (void)setRecurrence:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSDateComponents *)[v6 copy];
  recurrence = self->_recurrence;
  self->_recurrence = v4;

  os_unfair_lock_unlock(&self->super.super.super._lock);
}

- (NSDateComponents)recurrence
{
  p_lock = &self->super.super.super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSDateComponents *)self->_recurrence copy];
  os_unfair_lock_unlock(p_lock);

  return (NSDateComponents *)v4;
}

- (void)updateTimeZone:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v11 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMTimerTriggerBuilder updateTimeZone:completionHandler:]", @"completion"];
    v12 = (void *)MEMORY[0x19F3A64A0]();
    uint64_t v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v19 = v15;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v16 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v11 userInfo:0];
    objc_exception_throw(v16);
  }
  id v7 = v6;
  [(_HMTimerTriggerBuilder *)self setTimeZone:v17];
  if (self) {
    context = self->super.super.super._context;
  }
  else {
    context = 0;
  }
  id v9 = context;
  v10 = [(_HMContext *)v9 delegateCaller];
  [v10 callCompletion:v7 error:0];
}

- (void)setTimeZone:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSTimeZone *)[v6 copy];
  timeZone = self->_timeZone;
  self->_timeZone = v4;

  os_unfair_lock_unlock(&self->super.super.super._lock);
}

- (NSTimeZone)timeZone
{
  p_lock = &self->super.super.super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_timeZone;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)updateFireDate:(id)a3 completionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v6 = a4;
  if (!v6)
  {
    uint64_t v13 = [NSString stringWithFormat:@"%s: %@ cannot be nil", "-[_HMTimerTriggerBuilder updateFireDate:completionHandler:]", @"completion"];
    v14 = (void *)MEMORY[0x19F3A64A0]();
    v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      uint64_t v23 = v13;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);
    }
    id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0];
    objc_exception_throw(v18);
  }
  id v7 = v6;
  if (v19)
  {
    -[_HMTimerTriggerBuilder setFireDate:](self, "setFireDate:");
    if (self) {
      context = self->super.super.super._context;
    }
    else {
      context = 0;
    }
    id v9 = context;
    v10 = [(_HMContext *)v9 delegateCaller];
    [v10 callCompletion:v7 error:0];
  }
  else
  {
    if (self) {
      uint64_t v11 = self->super.super.super._context;
    }
    else {
      uint64_t v11 = 0;
    }
    id v9 = v11;
    v10 = [(_HMContext *)v9 delegateCaller];
    v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
    [v10 callCompletion:v7 error:v12];
  }
}

- (void)setFireDate:(id)a3
{
  id v8 = a3;
  os_unfair_lock_lock_with_options();
  if (v8)
  {
    id v4 = (NSDate *)[v8 copy];
    fireDate = self->_fireDate;
    self->_fireDate = v4;
  }
  else
  {
    id v6 = self->_fireDate;
    self->_fireDate = 0;

    timeZone = self->_timeZone;
    self->_timeZone = 0;

    fireDate = self->_recurrence;
    self->_recurrence = 0;
  }

  os_unfair_lock_unlock(&self->super.super.super._lock);
}

- (NSDate)fireDateIfSet
{
  p_lock = &self->super.super.super._lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_fireDate;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSDate)fireDate
{
  v2 = [(_HMTimerTriggerBuilder *)self fireDateIfSet];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }
  id v5 = v4;

  return (NSDate *)v5;
}

- (Class)class
{
  return (Class)objc_opt_class();
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v3 = objc_opt_class();
    objc_msgSend(a1, "adoptExternalCategoriesFromClasses:", v3, objc_opt_class(), 0);
  }
}

- (id)recurrenceCalendar
{
  return 0;
}

@end