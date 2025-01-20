@interface BKSMutableMousePointerEventGlobalRoute
- (void)setContextID:(unsigned int)a3;
- (void)setOptions:(id)a3;
@end

@implementation BKSMutableMousePointerEventGlobalRoute

- (void)setOptions:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v5 = (BKSMousePointerGlobalContextOptions *)a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = NSString;
      v8 = (objc_class *)[(BKSMousePointerGlobalContextOptions *)v5 classForCoder];
      if (!v8) {
        v8 = (objc_class *)objc_opt_class();
      }
      v9 = NSStringFromClass(v8);
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      v12 = [v7 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"options", v9, v11];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v13 = NSStringFromSelector(a2);
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138544642;
        v17 = v13;
        __int16 v18 = 2114;
        v19 = v15;
        __int16 v20 = 2048;
        v21 = self;
        __int16 v22 = 2114;
        v23 = @"BKSMousePointerEventGlobalRoute.m";
        __int16 v24 = 1024;
        int v25 = 160;
        __int16 v26 = 2114;
        v27 = v12;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA5065CLL);
    }
  }

  options = self->super._options;
  self->super._options = v5;
}

- (void)setContextID:(unsigned int)a3
{
  self->super._contextID = a3;
}

@end