@interface BKSMutableHIDEventDeferringChainObserverPredicate
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDisplay:(id)a3;
- (void)setEnvironment:(id)a3;
@end

@implementation BKSMutableHIDEventDeferringChainObserverPredicate

- (void)setEnvironment:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v5 = (BKSHIDEventDeferringEnvironment *)a3;
  if (!v5)
  {
    v8 = NSString;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = [v8 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"environment", v10];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v12 = NSStringFromSelector(a2);
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138544642;
      v25 = v12;
      __int16 v26 = 2114;
      v27 = v14;
      __int16 v28 = 2048;
      v29 = self;
      __int16 v30 = 2114;
      v31 = @"BKSHIDEventDeferringChainObserverPredicate.m";
      __int16 v32 = 1024;
      int v33 = 170;
      __int16 v34 = 2114;
      v35 = v11;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA2E008);
  }
  v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = NSString;
    v16 = (objc_class *)[(BKSHIDEventDeferringEnvironment *)v6 classForCoder];
    if (!v16) {
      v16 = (objc_class *)objc_opt_class();
    }
    v17 = NSStringFromClass(v16);
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    v20 = [v15 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"environment", v17, v19];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v21 = NSStringFromSelector(a2);
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138544642;
      v25 = v21;
      __int16 v26 = 2114;
      v27 = v23;
      __int16 v28 = 2048;
      v29 = self;
      __int16 v30 = 2114;
      v31 = @"BKSHIDEventDeferringChainObserverPredicate.m";
      __int16 v32 = 1024;
      int v33 = 170;
      __int16 v34 = 2114;
      v35 = v20;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA2E144);
  }

  environment = self->super._environment;
  self->super._environment = v6;
}

- (void)setDisplay:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v5 = (BKSHIDEventDisplay *)a3;
  if (!v5)
  {
    v8 = NSString;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = [v8 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"display", v10];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v12 = NSStringFromSelector(a2);
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138544642;
      v25 = v12;
      __int16 v26 = 2114;
      v27 = v14;
      __int16 v28 = 2048;
      v29 = self;
      __int16 v30 = 2114;
      v31 = @"BKSHIDEventDeferringChainObserverPredicate.m";
      __int16 v32 = 1024;
      int v33 = 164;
      __int16 v34 = 2114;
      v35 = v11;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA2E30CLL);
  }
  v6 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = NSString;
    v16 = (objc_class *)[(BKSHIDEventDisplay *)v6 classForCoder];
    if (!v16) {
      v16 = (objc_class *)objc_opt_class();
    }
    v17 = NSStringFromClass(v16);
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    v20 = [v15 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"display", v17, v19];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v21 = NSStringFromSelector(a2);
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138544642;
      v25 = v21;
      __int16 v26 = 2114;
      v27 = v23;
      __int16 v28 = 2048;
      v29 = self;
      __int16 v30 = 2114;
      v31 = @"BKSHIDEventDeferringChainObserverPredicate.m";
      __int16 v32 = 1024;
      int v33 = 164;
      __int16 v34 = 2114;
      v35 = v20;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA2E448);
  }

  display = self->super._display;
  self->super._display = v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [BKSHIDEventDeferringChainObserverPredicate alloc];
  return -[BKSHIDEventDeferringChainObserverPredicate _initWithCopyOf:]((id *)&v4->super.isa, self);
}

@end