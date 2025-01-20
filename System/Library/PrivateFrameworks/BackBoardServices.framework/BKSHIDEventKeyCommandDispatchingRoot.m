@interface BKSHIDEventKeyCommandDispatchingRoot
+ (BOOL)supportsSecureCoding;
- (BKSHIDEventKeyCommandDispatchingRoot)initWithReason:(id)a3 seed:(unsigned int)a4 rule:(id)a5;
- (id)decodePayload:(id)a3;
@end

@implementation BKSHIDEventKeyCommandDispatchingRoot

- (BKSHIDEventKeyCommandDispatchingRoot)initWithReason:(id)a3 seed:(unsigned int)a4 rule:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if (!v10)
  {
    v14 = NSString;
    objc_opt_class();
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v17 = [v14 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"rule", v16];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v18 = NSStringFromSelector(a2);
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138544642;
      v32 = v18;
      __int16 v33 = 2114;
      v34 = v20;
      __int16 v35 = 2048;
      v36 = self;
      __int16 v37 = 2114;
      v38 = @"BKSHIDEventDeliveryRuleChangeTransaction.m";
      __int16 v39 = 1024;
      int v40 = 191;
      __int16 v41 = 2114;
      v42 = v17;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA357ACLL);
  }
  v11 = v10;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = NSString;
    v22 = (objc_class *)[v11 classForCoder];
    if (!v22) {
      v22 = (objc_class *)objc_opt_class();
    }
    v23 = NSStringFromClass(v22);
    objc_opt_class();
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    v26 = [v21 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"rule", v23, v25];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v27 = NSStringFromSelector(a2);
      v28 = (objc_class *)objc_opt_class();
      v29 = NSStringFromClass(v28);
      *(_DWORD *)buf = 138544642;
      v32 = v27;
      __int16 v33 = 2114;
      v34 = v29;
      __int16 v35 = 2048;
      v36 = self;
      __int16 v37 = 2114;
      v38 = @"BKSHIDEventDeliveryRuleChangeTransaction.m";
      __int16 v39 = 1024;
      int v40 = 191;
      __int16 v41 = 2114;
      v42 = v26;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA358ECLL);
  }

  v30.receiver = self;
  v30.super_class = (Class)BKSHIDEventKeyCommandDispatchingRoot;
  v12 = [(BKSHIDEventDeliveryRuleWrapper *)&v30 initWithReason:v9 seed:v6 payload:v11];

  return v12;
}

- (id)decodePayload:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"payload"];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end