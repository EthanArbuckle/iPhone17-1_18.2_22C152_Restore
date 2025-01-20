@interface BKSHIDEventDiscreteDispatchingRule
+ (BOOL)supportsSecureCoding;
+ (id)ruleForDispatchingDiscreteEventsMatchingPredicate:(id)a3 toTarget:(id)a4;
- (BKSHIDEventDiscreteDispatchingPredicate)predicate;
- (BKSHIDEventDiscreteDispatchingRule)init;
- (BKSHIDEventDiscreteDispatchingRule)initWithCoder:(id)a3;
- (BKSHIDEventDispatchingTarget)target;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)_initWithPredicate:(id)a3 target:(id)a4;
- (unint64_t)hash;
- (unint64_t)predicateEventTypeMask;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSHIDEventDiscreteDispatchingRule

- (BKSHIDEventDiscreteDispatchingPredicate)predicate
{
  return self->_predicate;
}

- (BKSHIDEventDispatchingTarget)target
{
  return self->_target;
}

- (unint64_t)predicateEventTypeMask
{
  return self->_predicateEventTypeMask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v6 = a3;
  id v4 = (id)[v6 appendObject:self->_predicate withName:0];
  [v6 appendRightArrow];
  id v5 = (id)[v6 appendObject:self->_target withName:0 skipIfNil:0];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BKSHIDEventDiscreteDispatchingRule *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class() && BSEqualObjects()) {
      char v6 = BSEqualObjects();
    }
    else {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(BKSHIDEventDiscreteDispatchingPredicate *)self->_predicate hash];
  return [(BKSHIDEventDispatchingTarget *)self->_target hash] ^ v3;
}

- (BKSHIDEventDiscreteDispatchingRule)initWithCoder:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predicate"];
    if (v12)
    {
      v8 = (void *)v12;
      v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"target"];
      self = (BKSHIDEventDiscreteDispatchingRule *)[(BKSHIDEventDiscreteDispatchingRule *)self _initWithPredicate:v8 target:v13];

      v11 = self;
      goto LABEL_6;
    }
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F281F8];
    uint64_t v22 = *MEMORY[0x1E4F28588];
    v17 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventDiscreteDispatchingRule: invalid predicate : %@", 0];
    v23[0] = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    v19 = [v15 errorWithDomain:v16 code:4866 userInfo:v18];
    [v4 failWithError:v19];

    v8 = 0;
  }
  else
  {
    char v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F281F8];
    uint64_t v20 = *MEMORY[0x1E4F28588];
    v8 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventDiscreteDispatchingRule: subclasses are not allowed : %@", objc_opt_class(), v20];
    v21 = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    v10 = [v6 errorWithDomain:v7 code:4866 userInfo:v9];
    [v4 failWithError:v10];
  }
  v11 = 0;
LABEL_6:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  predicate = self->_predicate;
  id v5 = a3;
  [v5 encodeObject:predicate forKey:@"predicate"];
  [v5 encodeObject:self->_target forKey:@"target"];
}

- (id)_initWithPredicate:(id)a3 target:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = objc_opt_class();
  if (v9 != objc_opt_class())
  {
    v21 = [NSString stringWithFormat:@"BKSHIDEventDiscreteDispatchingRule cannot be subclassed"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = NSStringFromSelector(a2);
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      *(_DWORD *)buf = 138544642;
      v32 = v22;
      __int16 v33 = 2114;
      v34 = v24;
      __int16 v35 = 2048;
      v36 = self;
      __int16 v37 = 2114;
      v38 = @"BKSHIDEventDiscreteDispatchingRule.m";
      __int16 v39 = 1024;
      int v40 = 36;
      __int16 v41 = 2114;
      v42 = v21;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA2CC28);
  }
  v29.receiver = self;
  v29.super_class = (Class)BKSHIDEventDiscreteDispatchingRule;
  v10 = [(BKSHIDEventDiscreteDispatchingRule *)&v29 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    predicate = v10->_predicate;
    v10->_predicate = (BKSHIDEventDiscreteDispatchingPredicate *)v11;

    uint64_t v13 = [v8 copy];
    target = v10->_target;
    v10->_target = (BKSHIDEventDispatchingTarget *)v13;

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v15 = objc_msgSend(v7, "descriptors", 0);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          v10->_predicateEventTypeMask |= 1 << [*(id *)(*((void *)&v25 + 1) + 8 * v19++) hidEventType];
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v17);
    }
  }
  return v10;
}

- (BKSHIDEventDiscreteDispatchingRule)init
{
  id v4 = [NSString stringWithFormat:@"-init is not allowed on BKSHIDEventDiscreteDispatchingRule"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    char v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    uint64_t v16 = @"BKSHIDEventDiscreteDispatchingRule.m";
    __int16 v17 = 1024;
    int v18 = 31;
    __int16 v19 = 2114;
    uint64_t v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSHIDEventDiscreteDispatchingRule *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)ruleForDispatchingDiscreteEventsMatchingPredicate:(id)a3 toTarget:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  if (!v9)
  {
    v14 = NSString;
    __int16 v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v15);
    __int16 v17 = [v14 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"predicate", v16];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v18 = NSStringFromSelector(a2);
      __int16 v19 = (objc_class *)objc_opt_class();
      uint64_t v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138544642;
      int v40 = v18;
      __int16 v41 = 2114;
      v42 = v20;
      __int16 v43 = 2048;
      id v44 = a1;
      __int16 v45 = 2114;
      v46 = @"BKSHIDEventDiscreteDispatchingRule.m";
      __int16 v47 = 1024;
      int v48 = 51;
      __int16 v49 = 2114;
      v50 = v17;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA2CF60);
  }
  v10 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = NSString;
    uint64_t v22 = (objc_class *)[v10 classForCoder];
    if (!v22) {
      uint64_t v22 = (objc_class *)objc_opt_class();
    }
    v23 = NSStringFromClass(v22);
    v24 = (objc_class *)objc_opt_class();
    long long v25 = NSStringFromClass(v24);
    long long v26 = [v21 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"predicate", v23, v25];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      long long v27 = NSStringFromSelector(a2);
      long long v28 = (objc_class *)objc_opt_class();
      objc_super v29 = NSStringFromClass(v28);
      *(_DWORD *)buf = 138544642;
      int v40 = v27;
      __int16 v41 = 2114;
      v42 = v29;
      __int16 v43 = 2048;
      id v44 = a1;
      __int16 v45 = 2114;
      v46 = @"BKSHIDEventDiscreteDispatchingRule.m";
      __int16 v47 = 1024;
      int v48 = 51;
      __int16 v49 = 2114;
      v50 = v26;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA2D09CLL);
  }

  id v11 = v8;
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v30 = NSString;
      v31 = (objc_class *)[v11 classForCoder];
      if (!v31) {
        v31 = (objc_class *)objc_opt_class();
      }
      v32 = NSStringFromClass(v31);
      __int16 v33 = (objc_class *)objc_opt_class();
      v34 = NSStringFromClass(v33);
      __int16 v35 = [v30 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"target", v32, v34];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v36 = NSStringFromSelector(a2);
        __int16 v37 = (objc_class *)objc_opt_class();
        v38 = NSStringFromClass(v37);
        *(_DWORD *)buf = 138544642;
        int v40 = v36;
        __int16 v41 = 2114;
        v42 = v38;
        __int16 v43 = 2048;
        id v44 = a1;
        __int16 v45 = 2114;
        v46 = @"BKSHIDEventDiscreteDispatchingRule.m";
        __int16 v47 = 1024;
        int v48 = 52;
        __int16 v49 = 2114;
        v50 = v35;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v35 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA2D1D8);
    }
  }

  id v12 = [[BKSHIDEventDiscreteDispatchingRule alloc] _initWithPredicate:v10 target:v11];
  return v12;
}

@end