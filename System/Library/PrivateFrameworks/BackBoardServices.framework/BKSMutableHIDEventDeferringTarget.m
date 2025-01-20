@interface BKSMutableHIDEventDeferringTarget
+ (id)new;
- (BKSMutableHIDEventDeferringTarget)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setPid:(int)a3;
- (void)setToken:(id)a3;
@end

@implementation BKSMutableHIDEventDeferringTarget

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[BKSHIDEventDeferringTarget allocWithZone:a3];
  uint64_t pid = self->super._pid;
  token = self->super._token;
  return [(BKSHIDEventDeferringTarget *)v4 _initWithPID:pid token:token];
}

- (BKSMutableHIDEventDeferringTarget)init
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    v7 = [NSString stringWithFormat:@"BKSMutableHIDEventDeferringTarget cannot be subclassed"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v8 = NSStringFromSelector(a2);
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      int v11 = 138544642;
      v12 = v8;
      __int16 v13 = 2114;
      v14 = v10;
      __int16 v15 = 2048;
      v16 = self;
      __int16 v17 = 2114;
      v18 = @"BKSHIDEventDeferringTarget.m";
      __int16 v19 = 1024;
      int v20 = 148;
      __int16 v21 = 2114;
      v22 = v7;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA1DB90);
  }
  uint64_t v5 = getpid();
  return (BKSMutableHIDEventDeferringTarget *)[(BKSHIDEventDeferringTarget *)self _initWithPID:v5 token:0];
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
      int v11 = NSStringFromClass(v10);
      v12 = [v7 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"token", v9, v11];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        __int16 v13 = NSStringFromSelector(a2);
        v14 = (objc_class *)objc_opt_class();
        __int16 v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138544642;
        v18 = v13;
        __int16 v19 = 2114;
        int v20 = v15;
        __int16 v21 = 2048;
        v22 = self;
        __int16 v23 = 2114;
        v24 = @"BKSHIDEventDeferringTarget.m";
        __int16 v25 = 1024;
        int v26 = 160;
        __int16 v27 = 2114;
        v28 = v12;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA1E294);
    }
  }

  uint64_t v5 = (BKSHIDEventDeferringToken *)[v16 copy];
  token = self->super._token;
  self->super._token = v5;
}

- (void)setPid:(int)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3 <= 0)
  {
    uint64_t v5 = [NSString stringWithFormat:@"invalid pid"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v6 = NSStringFromSelector(a2);
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      int v9 = 138544642;
      v10 = v6;
      __int16 v11 = 2114;
      v12 = v8;
      __int16 v13 = 2048;
      v14 = self;
      __int16 v15 = 2114;
      id v16 = @"BKSHIDEventDeferringTarget.m";
      __int16 v17 = 1024;
      int v18 = 154;
      __int16 v19 = 2114;
      int v20 = v5;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA1EDACLL);
  }
  self->super._uint64_t pid = a3;
}

+ (id)new
{
  return objc_alloc_init(BKSMutableHIDEventDeferringTarget);
}

@end