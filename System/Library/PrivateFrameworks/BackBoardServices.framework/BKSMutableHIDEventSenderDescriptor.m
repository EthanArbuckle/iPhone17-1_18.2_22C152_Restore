@interface BKSMutableHIDEventSenderDescriptor
+ (id)new;
- (BKSMutableHIDEventSenderDescriptor)init;
- (void)setAssociatedDisplay:(id)a3;
- (void)setAuthenticated:(BOOL)a3;
- (void)setHardwareType:(int64_t)a3;
- (void)setPrimaryPage:(unsigned int)a3 primaryUsage:(unsigned int)a4;
- (void)setSenderID:(unint64_t)a3;
@end

@implementation BKSMutableHIDEventSenderDescriptor

- (void)setAuthenticated:(BOOL)a3
{
  self->super._authenticated = a3;
}

- (void)setSenderID:(unint64_t)a3
{
  self->super._senderID = a3;
}

- (void)setHardwareType:(int64_t)a3
{
  self->super._hardwareType = a3;
}

- (BKSMutableHIDEventSenderDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)BKSMutableHIDEventSenderDescriptor;
  return (BKSMutableHIDEventSenderDescriptor *)[(BKSHIDEventSenderDescriptor *)&v3 _initWithHardwareType:0 associatedDisplay:0 authenticated:0 primaryPage:0 primaryUsage:0 senderID:0];
}

- (void)setPrimaryPage:(unsigned int)a3 primaryUsage:(unsigned int)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a3 && a4)
  {
    v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"primaryPage != 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v7 = NSStringFromSelector(a2);
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138544642;
      v11 = v7;
      __int16 v12 = 2114;
      v13 = v9;
      __int16 v14 = 2048;
      v15 = self;
      __int16 v16 = 2114;
      v17 = @"BKSHIDEventSenderDescriptor.m";
      __int16 v18 = 1024;
      int v19 = 449;
      __int16 v20 = 2114;
      v21 = v6;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA1F050);
  }
  self->super._primaryPage = a3;
  self->super._primaryUsage = a4;
}

- (void)setAssociatedDisplay:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v5 = (BKSHIDEventDisplay *)a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = NSString;
      v8 = (objc_class *)[(BKSHIDEventDisplay *)v5 classForCoder];
      if (!v8) {
        v8 = (objc_class *)objc_opt_class();
      }
      v9 = NSStringFromClass(v8);
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      __int16 v12 = [v7 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"associatedDisplay", v9, v11];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v13 = NSStringFromSelector(a2);
        __int16 v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138544642;
        v17 = v13;
        __int16 v18 = 2114;
        int v19 = v15;
        __int16 v20 = 2048;
        v21 = self;
        __int16 v22 = 2114;
        v23 = @"BKSHIDEventSenderDescriptor.m";
        __int16 v24 = 1024;
        int v25 = 441;
        __int16 v26 = 2114;
        v27 = v12;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA22068);
    }
  }

  associatedDisplay = self->super._associatedDisplay;
  self->super._associatedDisplay = v5;
}

+ (id)new
{
  id v2 = objc_alloc((Class)a1);
  return (id)[v2 _initWithHardwareType:0 associatedDisplay:0 authenticated:0 primaryPage:0 primaryUsage:0 senderID:0];
}

@end