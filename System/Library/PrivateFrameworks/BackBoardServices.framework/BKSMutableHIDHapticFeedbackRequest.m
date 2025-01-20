@interface BKSMutableHIDHapticFeedbackRequest
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDeviceType:(int64_t)a3;
- (void)setPattern:(id)a3;
- (void)setPowerSourceID:(id)a3;
- (void)setSenderID:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation BKSMutableHIDHapticFeedbackRequest

- (void)setTimestamp:(unint64_t)a3
{
  self->super._timestamp = a3;
}

- (void)setPowerSourceID:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v5 = (NSNumber *)a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = NSString;
      v8 = (objc_class *)[(NSNumber *)v5 classForCoder];
      if (!v8) {
        v8 = (objc_class *)objc_opt_class();
      }
      v9 = NSStringFromClass(v8);
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      v12 = [v7 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"powerSourceID", v9, v11];

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
        v23 = @"BKSHIDHapticFeedbackRequest.m";
        __int16 v24 = 1024;
        int v25 = 257;
        __int16 v26 = 2114;
        v27 = v12;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA652A0);
    }
  }

  powerSourceID = self->super._powerSourceID;
  self->super._powerSourceID = v5;
}

- (void)setSenderID:(unint64_t)a3
{
  self->super._senderID = a3;
}

- (void)setDeviceType:(int64_t)a3
{
  self->super._deviceType = a3;
}

- (void)setPattern:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  if (!v23)
  {
    v9 = NSStringFromClass(v6);
    v10 = [v5 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"pattern", v9];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v11 = NSStringFromSelector(a2);
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138544642;
      int v25 = v11;
      __int16 v26 = 2114;
      v27 = v13;
      __int16 v28 = 2048;
      v29 = self;
      __int16 v30 = 2114;
      v31 = @"BKSHIDHapticFeedbackRequest.m";
      __int16 v32 = 1024;
      int v33 = 241;
      __int16 v34 = 2114;
      v35 = v10;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v10 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA65484);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = NSString;
    v15 = (objc_class *)[v23 classForCoder];
    if (!v15) {
      v15 = (objc_class *)objc_opt_class();
    }
    v16 = NSStringFromClass(v15);
    v17 = (objc_class *)objc_opt_class();
    __int16 v18 = NSStringFromClass(v17);
    v19 = [v14 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"pattern", v16, v18];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = NSStringFromSelector(a2);
      v21 = (objc_class *)objc_opt_class();
      __int16 v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138544642;
      int v25 = v20;
      __int16 v26 = 2114;
      v27 = v22;
      __int16 v28 = 2048;
      v29 = self;
      __int16 v30 = 2114;
      v31 = @"BKSHIDHapticFeedbackRequest.m";
      __int16 v32 = 1024;
      int v33 = 241;
      __int16 v34 = 2114;
      v35 = v19;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA655BCLL);
  }

  v7 = (NSString *)[v23 copy];
  pattern = self->super._pattern;
  self->super._pattern = v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [BKSHIDHapticFeedbackRequest alloc];
  return -[BKSHIDHapticFeedbackRequest _initWithCopyOf:]((id *)&v4->super.isa, self);
}

@end