@interface BSWallclockTimer
- (BOOL)isScheduled;
- (BSWallclockTimer)initWithIdentifier:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)identifier;
- (double)timeRemaining;
- (void)cancel;
- (void)dealloc;
- (void)invalidate;
- (void)scheduleForDate:(id)a3 leewayInterval:(double)a4 queue:(id)a5 handler:(id)a6;
@end

@implementation BSWallclockTimer

- (BSWallclockTimer)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BSWallclockTimer;
  v5 = [(BSWallclockTimer *)&v9 init];
  if (v5)
  {
    uint64_t v6 = +[BSDispatchTimer timerWithIdentifier:]((uint64_t)BSDispatchTimer, v4);
    timer = v5->_timer;
    v5->_timer = (BSDispatchTimer *)v6;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  -[BSDispatchTimer cancel]((os_unfair_lock_s *)self->_timer);
  if ((-[BSDispatchTimer hasBeenInvalidated]((os_unfair_lock_s *)self->_timer) & 1) == 0)
  {
    id v4 = NSString;
    timer = self->_timer;
    if (timer) {
      timer = (BSDispatchTimer *)timer->_identifier;
    }
    uint64_t v6 = timer;
    v7 = [v4 stringWithFormat:@"must invalidate timer \"%@\" before dealloc", v6];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_super v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138544642;
      id v13 = v8;
      __int16 v14 = 2114;
      v15 = v10;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2114;
      v19 = @"BSWallclockTimer.m";
      __int16 v20 = 1024;
      int v21 = 29;
      __int16 v22 = 2114;
      v23 = v7;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v7 UTF8String];
    __break(0);
    JUMPOUT(0x18AB11DECLL);
  }
  v11.receiver = self;
  v11.super_class = (Class)BSWallclockTimer;
  [(BSWallclockTimer *)&v11 dealloc];
}

- (NSString)identifier
{
  timer = self->_timer;
  if (timer) {
    return timer->_identifier;
  }
  else {
    return 0;
  }
}

- (BOOL)isScheduled
{
  return -[BSDispatchTimer isScheduled]((os_unfair_lock_s *)self->_timer);
}

- (double)timeRemaining
{
  return -[BSDispatchTimer timeRemaining]((uint64_t)self->_timer);
}

- (NSString)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  -[BSDispatchTimer appendDescriptionToBuilder:forDebugging:]((uint64_t)self->_timer, v3, 0);
  id v4 = [v3 build];

  return (NSString *)v4;
}

- (NSString)debugDescription
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  -[BSDispatchTimer appendDescriptionToBuilder:forDebugging:]((uint64_t)self->_timer, v3, 1);
  id v4 = [v3 build];

  return (NSString *)v4;
}

- (void)scheduleForDate:(id)a3 leewayInterval:(double)a4 queue:(id)a5 handler:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = v13;
  if ((*(uint64_t *)&a4 <= -1 || ((*(void *)&a4 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
    && (unint64_t)(*(void *)&a4 - 1) >= 0xFFFFFFFFFFFFFLL
    && (*(void *)&a4 & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    v23 = objc_msgSend(NSString, "stringWithFormat:", @"invalid leeway %f", *(void *)&a4);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      *(_DWORD *)when = 138544642;
      *(void *)&when[4] = v25;
      *(_WORD *)&when[12] = 2114;
      *(void *)&when[14] = v27;
      __int16 v38 = 2048;
      v39 = self;
      __int16 v40 = 2114;
      v41 = @"BSWallclockTimer.m";
      __int16 v42 = 1024;
      int v43 = 60;
      __int16 v44 = 2114;
      v45 = v23;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", when, 0x3Au);
    }
    qword_1E911F420 = [v23 UTF8String];
    __break(0);
    JUMPOUT(0x18AB121FCLL);
  }
  if (!v12)
  {
    v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"queue != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      *(_DWORD *)when = 138544642;
      *(void *)&when[4] = v29;
      *(_WORD *)&when[12] = 2114;
      *(void *)&when[14] = v31;
      __int16 v38 = 2048;
      v39 = self;
      __int16 v40 = 2114;
      v41 = @"BSWallclockTimer.m";
      __int16 v42 = 1024;
      int v43 = 61;
      __int16 v44 = 2114;
      v45 = v28;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", when, 0x3Au);
    }
    qword_1E911F420 = [v28 UTF8String];
    __break(0);
    JUMPOUT(0x18AB12300);
  }
  if (!v13)
  {
    v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      v34 = (objc_class *)objc_opt_class();
      v35 = NSStringFromClass(v34);
      *(_DWORD *)when = 138544642;
      *(void *)&when[4] = v33;
      *(_WORD *)&when[12] = 2114;
      *(void *)&when[14] = v35;
      __int16 v38 = 2048;
      v39 = self;
      __int16 v40 = 2114;
      v41 = @"BSWallclockTimer.m";
      __int16 v42 = 1024;
      int v43 = 62;
      __int16 v44 = 2114;
      v45 = v32;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", when, 0x3Au);
    }
    qword_1E911F420 = [v32 UTF8String];
    __break(0);
    JUMPOUT(0x18AB12404);
  }
  float64_t __y = 0.0;
  [v11 timeIntervalSince1970];
  long double v19 = modf(v18, (long double *)&__y);
  v20.f64[0] = __y;
  v20.f64[1] = v19 * 1000000000.0;
  *(int64x2_t *)when = vcvtq_s64_f64(vminnmq_f64(vmaxnmq_f64(v20, (float64x2_t)vdupq_n_s64(0xC3E0000000000000)), (float64x2_t)vdupq_n_s64(0x43E0000000000000uLL)));
  dispatch_time_t v21 = dispatch_walltime((const timespec *)when, 0);
  if (a4 >= 9223372040.0)
  {
    uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (a4 <= -9223372040.0)
  {
    uint64_t v22 = 0x8000000000000000;
  }
  else
  {
    uint64_t v22 = (uint64_t)(a4 * 1000000000.0);
  }
  -[BSDispatchTimer scheduleWithFireTime:repeatNanoseconds:leewayNanoseconds:queue:weakContext:handler:]((uint64_t)self->_timer, v21, -1, v22, v12, self, v14);
}

- (void)cancel
{
}

- (void)invalidate
{
}

- (void).cxx_destruct
{
}

@end