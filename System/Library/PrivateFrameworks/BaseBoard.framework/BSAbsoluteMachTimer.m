@interface BSAbsoluteMachTimer
- (BOOL)isScheduled;
- (BSAbsoluteMachTimer)initWithIdentifier:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)identifier;
- (double)timeRemaining;
- (void)cancel;
- (void)dealloc;
- (void)invalidate;
- (void)scheduleRepeatingWithFireInterval:(double)a3 repeatInterval:(double)a4 leewayInterval:(double)a5 queue:(id)a6 handler:(id)a7;
- (void)scheduleWithFireInterval:(double)a3 leewayInterval:(double)a4 queue:(id)a5 handler:(id)a6;
@end

@implementation BSAbsoluteMachTimer

- (void).cxx_destruct
{
}

- (void)invalidate
{
}

- (void)dealloc
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  -[BSDispatchTimer cancel]((os_unfair_lock_s *)self->_timer);
  if ((-[BSDispatchTimer hasBeenInvalidated]((os_unfair_lock_s *)self->_timer) & 1) == 0)
  {
    v4 = NSString;
    timer = self->_timer;
    if (timer) {
      timer = (BSDispatchTimer *)timer->_identifier;
    }
    v6 = timer;
    v7 = [v4 stringWithFormat:@"must invalidate timer \"%@\" before dealloc", v6];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138544642;
      id v13 = v8;
      __int16 v14 = 2114;
      v15 = v10;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2114;
      v19 = @"BSAbsoluteMachTimer.m";
      __int16 v20 = 1024;
      int v21 = 30;
      __int16 v22 = 2114;
      v23 = v7;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v7 UTF8String];
    __break(0);
    JUMPOUT(0x18AAE1A58);
  }
  v11.receiver = self;
  v11.super_class = (Class)BSAbsoluteMachTimer;
  [(BSAbsoluteMachTimer *)&v11 dealloc];
}

- (void)scheduleWithFireInterval:(double)a3 leewayInterval:(double)a4 queue:(id)a5 handler:(id)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v40 = a5;
  id v11 = a6;
  if ((*(uint64_t *)&a3 <= -1 || ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
    && (unint64_t)(*(void *)&a3 - 1) >= 0xFFFFFFFFFFFFFLL
    && (*(void *)&a3 & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    __int16 v22 = objc_msgSend(NSString, "stringWithFormat:", @"invalid fireInterval %f", *(void *)&a3);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      *(_DWORD *)buf = 138544642;
      id v42 = v24;
      __int16 v43 = 2114;
      v44 = v26;
      __int16 v45 = 2048;
      v46 = self;
      __int16 v47 = 2114;
      v48 = @"BSAbsoluteMachTimer.m";
      __int16 v49 = 1024;
      int v50 = 61;
      __int16 v51 = 2114;
      v52 = v22;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v22 UTF8String];
    __break(0);
    JUMPOUT(0x18AAE7494);
  }
  if ((*(uint64_t *)&a4 <= -1 || ((*(void *)&a4 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
    && (unint64_t)(*(void *)&a4 - 1) >= 0xFFFFFFFFFFFFFLL
    && (*(void *)&a4 & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    v27 = objc_msgSend(NSString, "stringWithFormat:", @"invalid leeway %f", *(void *)&a4);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      *(_DWORD *)buf = 138544642;
      id v42 = v29;
      __int16 v43 = 2114;
      v44 = v31;
      __int16 v45 = 2048;
      v46 = self;
      __int16 v47 = 2114;
      v48 = @"BSAbsoluteMachTimer.m";
      __int16 v49 = 1024;
      int v50 = 62;
      __int16 v51 = 2114;
      v52 = v27;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v27 UTF8String];
    __break(0);
    JUMPOUT(0x18AAE7590);
  }
  if (!v40)
  {
    v32 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"queue"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      v34 = (objc_class *)objc_opt_class();
      v35 = NSStringFromClass(v34);
      *(_DWORD *)buf = 138544642;
      id v42 = v33;
      __int16 v43 = 2114;
      v44 = v35;
      __int16 v45 = 2048;
      v46 = self;
      __int16 v47 = 2114;
      v48 = @"BSAbsoluteMachTimer.m";
      __int16 v49 = 1024;
      int v50 = 63;
      __int16 v51 = 2114;
      v52 = v32;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v32 UTF8String];
    __break(0);
    JUMPOUT(0x18AAE7694);
  }
  if (!v11)
  {
    v36 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v37 = (id)objc_claimAutoreleasedReturnValue();
      v38 = (objc_class *)objc_opt_class();
      v39 = NSStringFromClass(v38);
      *(_DWORD *)buf = 138544642;
      id v42 = v37;
      __int16 v43 = 2114;
      v44 = v39;
      __int16 v45 = 2048;
      v46 = self;
      __int16 v47 = 2114;
      v48 = @"BSAbsoluteMachTimer.m";
      __int16 v49 = 1024;
      int v50 = 64;
      __int16 v51 = 2114;
      v52 = v36;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v36 UTF8String];
    __break(0);
    JUMPOUT(0x18AAE7798);
  }
  timer = self->_timer;
  if (a3 >= 9223372040.0)
  {
    int64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (a3 <= -9223372040.0)
  {
    int64_t v19 = 0x8000000000000000;
  }
  else
  {
    int64_t v19 = (uint64_t)(a3 * 1000000000.0);
  }
  dispatch_time_t v20 = dispatch_time(0, v19);
  if (a4 >= 9223372040.0)
  {
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (a4 <= -9223372040.0)
  {
    uint64_t v21 = 0x8000000000000000;
  }
  else
  {
    uint64_t v21 = (uint64_t)(a4 * 1000000000.0);
  }
  -[BSDispatchTimer scheduleWithFireTime:repeatNanoseconds:leewayNanoseconds:queue:weakContext:handler:]((uint64_t)timer, v20, -1, v21, v40, self, v11);
}

- (BSAbsoluteMachTimer)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BSAbsoluteMachTimer;
  v5 = [(BSAbsoluteMachTimer *)&v9 init];
  if (v5)
  {
    uint64_t v6 = +[BSDispatchTimer timerWithIdentifier:]((uint64_t)BSDispatchTimer, v4);
    timer = v5->_timer;
    v5->_timer = (BSDispatchTimer *)v6;
  }
  return v5;
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

- (void)scheduleRepeatingWithFireInterval:(double)a3 repeatInterval:(double)a4 leewayInterval:(double)a5 queue:(id)a6 handler:(id)a7
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v52 = a6;
  id v13 = a7;
  if ((*(uint64_t *)&a3 <= -1 || ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
    && (unint64_t)(*(void *)&a3 - 1) >= 0xFFFFFFFFFFFFFLL
    && (*(void *)&a3 & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    id v29 = objc_msgSend(NSString, "stringWithFormat:", @"invalid fireInterval %f", *(void *)&a3);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      v32 = (objc_class *)objc_opt_class();
      id v33 = NSStringFromClass(v32);
      *(_DWORD *)buf = 138544642;
      id v54 = v31;
      __int16 v55 = 2114;
      v56 = v33;
      __int16 v57 = 2048;
      v58 = self;
      __int16 v59 = 2114;
      v60 = @"BSAbsoluteMachTimer.m";
      __int16 v61 = 1024;
      int v62 = 78;
      __int16 v63 = 2114;
      v64 = v29;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v29 UTF8String];
    __break(0);
    JUMPOUT(0x18AB098A0);
  }
  if ((*(uint64_t *)&a4 <= -1 || ((*(void *)&a4 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
    && (unint64_t)(*(void *)&a4 - 1) >= 0xFFFFFFFFFFFFFLL
    && (*(void *)&a4 & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    v34 = objc_msgSend(NSString, "stringWithFormat:", @"invalid repeatInterval %f", *(void *)&a4);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      id v37 = (objc_class *)objc_opt_class();
      v38 = NSStringFromClass(v37);
      *(_DWORD *)buf = 138544642;
      id v54 = v36;
      __int16 v55 = 2114;
      v56 = v38;
      __int16 v57 = 2048;
      v58 = self;
      __int16 v59 = 2114;
      v60 = @"BSAbsoluteMachTimer.m";
      __int16 v61 = 1024;
      int v62 = 79;
      __int16 v63 = 2114;
      v64 = v34;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v34 UTF8String];
    __break(0);
    JUMPOUT(0x18AB0999CLL);
  }
  if ((*(uint64_t *)&a5 <= -1 || ((*(void *)&a5 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
    && (unint64_t)(*(void *)&a5 - 1) >= 0xFFFFFFFFFFFFFLL
    && (*(void *)&a5 & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    v39 = objc_msgSend(NSString, "stringWithFormat:", @"invalid leeway %f", *(void *)&a5);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v41 = (id)objc_claimAutoreleasedReturnValue();
      id v42 = (objc_class *)objc_opt_class();
      __int16 v43 = NSStringFromClass(v42);
      *(_DWORD *)buf = 138544642;
      id v54 = v41;
      __int16 v55 = 2114;
      v56 = v43;
      __int16 v57 = 2048;
      v58 = self;
      __int16 v59 = 2114;
      v60 = @"BSAbsoluteMachTimer.m";
      __int16 v61 = 1024;
      int v62 = 80;
      __int16 v63 = 2114;
      v64 = v39;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v39 UTF8String];
    __break(0);
    JUMPOUT(0x18AB09A98);
  }
  if (!v52)
  {
    v44 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"queue"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v45 = (id)objc_claimAutoreleasedReturnValue();
      v46 = (objc_class *)objc_opt_class();
      __int16 v47 = NSStringFromClass(v46);
      *(_DWORD *)buf = 138544642;
      id v54 = v45;
      __int16 v55 = 2114;
      v56 = v47;
      __int16 v57 = 2048;
      v58 = self;
      __int16 v59 = 2114;
      v60 = @"BSAbsoluteMachTimer.m";
      __int16 v61 = 1024;
      int v62 = 81;
      __int16 v63 = 2114;
      v64 = v44;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v44 UTF8String];
    __break(0);
    JUMPOUT(0x18AB09B9CLL);
  }
  if (!v13)
  {
    v48 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"handler"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v49 = (id)objc_claimAutoreleasedReturnValue();
      int v50 = (objc_class *)objc_opt_class();
      __int16 v51 = NSStringFromClass(v50);
      *(_DWORD *)buf = 138544642;
      id v54 = v49;
      __int16 v55 = 2114;
      v56 = v51;
      __int16 v57 = 2048;
      v58 = self;
      __int16 v59 = 2114;
      v60 = @"BSAbsoluteMachTimer.m";
      __int16 v61 = 1024;
      int v62 = 82;
      __int16 v63 = 2114;
      v64 = v48;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v48 UTF8String];
    __break(0);
    JUMPOUT(0x18AB09CA0);
  }
  if (a3 >= 9223372040.0)
  {
    int64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (a3 <= -9223372040.0)
  {
    int64_t v23 = 0x8000000000000000;
  }
  else
  {
    int64_t v23 = (uint64_t)(a3 * 1000000000.0);
  }
  timer = self->_timer;
  dispatch_time_t v25 = dispatch_time(0, v23);
  if (a4 >= 9223372040.0)
  {
    uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (a4 <= -9223372040.0)
  {
    uint64_t v26 = 0x8000000000000000;
  }
  else
  {
    uint64_t v26 = (uint64_t)(a4 * 1000000000.0);
  }
  if (a5 >= 9223372040.0)
  {
    uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (a5 <= -9223372040.0)
  {
    uint64_t v27 = 0x8000000000000000;
  }
  else
  {
    uint64_t v27 = (uint64_t)(a5 * 1000000000.0);
  }
  if (v26 <= 1) {
    uint64_t v28 = 1;
  }
  else {
    uint64_t v28 = v26;
  }
  -[BSDispatchTimer scheduleWithFireTime:repeatNanoseconds:leewayNanoseconds:queue:weakContext:handler:]((uint64_t)timer, v25, v28, v27, v52, self, v13);
}

- (void)cancel
{
}

@end