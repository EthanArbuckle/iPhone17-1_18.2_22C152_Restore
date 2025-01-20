@interface BKSMutableHIDEventDeferringPredicate
+ (id)new;
- (BKSMutableHIDEventDeferringPredicate)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDisplay:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setToken:(id)a3;
@end

@implementation BKSMutableHIDEventDeferringPredicate

- (BKSMutableHIDEventDeferringPredicate)init
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    v8 = [NSString stringWithFormat:@"BKSMutableHIDEventDeferringPredicate cannot be subclassed"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v9 = NSStringFromSelector(a2);
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      int v12 = 138544642;
      v13 = v9;
      __int16 v14 = 2114;
      v15 = v11;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2114;
      v19 = @"BKSHIDEventDeferringPredicate.m";
      __int16 v20 = 1024;
      int v21 = 138;
      __int16 v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v12, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA0FD18);
  }
  v5 = +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment];
  v6 = [(BKSHIDEventDeferringPredicate *)self _initWithEnvironment:v5 display:0 token:0];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[BKSHIDEventDeferringPredicate allocWithZone:a3];
  environment = self->super._environment;
  display = self->super._display;
  token = self->super._token;
  return [(BKSHIDEventDeferringPredicate *)v4 _initWithEnvironment:environment display:display token:token];
}

+ (id)new
{
  return objc_alloc_init(BKSMutableHIDEventDeferringPredicate);
}

- (void)setToken:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = NSString;
      v8 = (objc_class *)[v16 classForCoder];
      if (!v8) {
        v8 = (objc_class *)objc_opt_class();
      }
      v9 = NSStringFromClass(v8);
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      int v12 = [v7 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"token", v9, v11];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v13 = NSStringFromSelector(a2);
        __int16 v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138544642;
        __int16 v18 = v13;
        __int16 v19 = 2114;
        __int16 v20 = v15;
        __int16 v21 = 2048;
        __int16 v22 = self;
        __int16 v23 = 2114;
        uint64_t v24 = @"BKSHIDEventDeferringPredicate.m";
        __int16 v25 = 1024;
        int v26 = 156;
        __int16 v27 = 2114;
        v28 = v12;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA21D78);
    }
  }

  v5 = (BKSHIDEventDeferringToken *)[v16 copy];
  token = self->super._token;
  self->super._token = v5;
}

- (void)setEnvironment:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  if (!v23)
  {
    v7 = NSString;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = [v7 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"environment", v9];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v11 = NSStringFromSelector(a2);
      int v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138544642;
      __int16 v25 = v11;
      __int16 v26 = 2114;
      __int16 v27 = v13;
      __int16 v28 = 2048;
      uint64_t v29 = self;
      __int16 v30 = 2114;
      v31 = @"BKSHIDEventDeferringPredicate.m";
      __int16 v32 = 1024;
      int v33 = 144;
      __int16 v34 = 2114;
      v35 = v10;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA22244);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v14 = NSString;
    v15 = (objc_class *)[v23 classForCoder];
    if (!v15) {
      v15 = (objc_class *)objc_opt_class();
    }
    id v16 = NSStringFromClass(v15);
    v17 = (objc_class *)objc_opt_class();
    __int16 v18 = NSStringFromClass(v17);
    __int16 v19 = [v14 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"environment", v16, v18];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = NSStringFromSelector(a2);
      __int16 v21 = (objc_class *)objc_opt_class();
      __int16 v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138544642;
      __int16 v25 = v20;
      __int16 v26 = 2114;
      __int16 v27 = v22;
      __int16 v28 = 2048;
      uint64_t v29 = self;
      __int16 v30 = 2114;
      v31 = @"BKSHIDEventDeferringPredicate.m";
      __int16 v32 = 1024;
      int v33 = 144;
      __int16 v34 = 2114;
      v35 = v19;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA22380);
  }

  v5 = (BKSHIDEventDeferringEnvironment *)[v23 copy];
  environment = self->super._environment;
  self->super._environment = v5;
}

- (void)setDisplay:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = NSString;
      v8 = (objc_class *)[v16 classForCoder];
      if (!v8) {
        v8 = (objc_class *)objc_opt_class();
      }
      v9 = NSStringFromClass(v8);
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      int v12 = [v7 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"display", v9, v11];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v13 = NSStringFromSelector(a2);
        __int16 v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138544642;
        __int16 v18 = v13;
        __int16 v19 = 2114;
        __int16 v20 = v15;
        __int16 v21 = 2048;
        __int16 v22 = self;
        __int16 v23 = 2114;
        uint64_t v24 = @"BKSHIDEventDeferringPredicate.m";
        __int16 v25 = 1024;
        int v26 = 150;
        __int16 v27 = 2114;
        __int16 v28 = v12;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA22580);
    }
  }

  v5 = (BKSHIDEventDisplay *)[v16 copy];
  display = self->super._display;
  self->super._display = v5;
}

@end