@interface BKSHIDEventDeferringRule
+ (BOOL)supportsSecureCoding;
+ (id)ruleForDeferringEventsMatchingPredicate:(id)a3 toTarget:(id)a4 withReason:(id)a5 seed:(unsigned int)a6 pid:(int)a7;
- (BKSHIDEventDeferringPredicate)predicate;
- (BKSHIDEventDeferringRule)init;
- (BKSHIDEventDeferringRule)initWithCoder:(id)a3;
- (BKSHIDEventDeferringTarget)target;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)reason;
- (_BKSHIDEventDeferringRuleIdentity)identity;
- (id)_initWithPredicate:(id)a3 target:(id)a4 reason:(id)a5 identity:(id)a6;
- (int64_t)mostRecentFirstCompare:(id)a3;
- (int64_t)weightedDeferringRuleCompare:(id)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSHIDEventDeferringRule

- (BKSHIDEventDeferringTarget)target
{
  return self->_target;
}

- (unint64_t)hash
{
  return [(_BKSHIDEventDeferringRuleIdentity *)self->_identity hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BKSHIDEventDeferringRule *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects())
    {
      char v6 = BSEqualObjects();
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (BKSHIDEventDeferringRule)initWithCoder:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predicate"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"target"];
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reason"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ident"];
    v13 = (void *)v12;
    if (v8 && v9 && v10 && v12)
    {
      self = (BKSHIDEventDeferringRule *)[(BKSHIDEventDeferringRule *)self _initWithPredicate:v8 target:v9 reason:v10 identity:v12];
      v11 = self;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F281F8];
      uint64_t v22 = *MEMORY[0x1E4F28588];
      v16 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventDeferringRule: invalid predicate, target or reason : predicate=%@ target=%@ reason=%@", v8, v9, v10];
      v23[0] = v16;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      v18 = [v14 errorWithDomain:v15 code:4866 userInfo:v17];
      [v4 failWithError:v18];

      v11 = 0;
    }
  }
  else
  {
    char v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F281F8];
    uint64_t v20 = *MEMORY[0x1E4F28588];
    v8 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventDeferringRule: subclasses are not allowed : %@", objc_opt_class()];
    v21 = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    v10 = [v6 errorWithDomain:v7 code:4866 userInfo:v9];
    [v4 failWithError:v10];
    v11 = 0;
  }

  return v11;
}

- (id)_initWithPredicate:(id)a3 target:(id)a4 reason:(id)a5 identity:(id)a6
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = v11;
  if (!v15)
  {
    v31 = NSString;
    v32 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v32);
    v34 = [v31 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"predicate", v33];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v35 = NSStringFromSelector(a2);
      v36 = (objc_class *)objc_opt_class();
      v37 = NSStringFromClass(v36);
      *(_DWORD *)buf = 138544642;
      v83 = v35;
      __int16 v84 = 2114;
      v85 = v37;
      __int16 v86 = 2048;
      v87 = self;
      __int16 v88 = 2114;
      v89 = @"BKSHIDEventDeferringRule.m";
      __int16 v90 = 1024;
      int v91 = 115;
      __int16 v92 = 2114;
      v93 = v34;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v34 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA0F4BCLL);
  }
  v16 = v15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v38 = NSString;
    v39 = (objc_class *)[v16 classForCoder];
    if (!v39) {
      v39 = (objc_class *)objc_opt_class();
    }
    v40 = NSStringFromClass(v39);
    v41 = (objc_class *)objc_opt_class();
    v42 = NSStringFromClass(v41);
    v43 = [v38 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"predicate", v40, v42];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v44 = NSStringFromSelector(a2);
      v45 = (objc_class *)objc_opt_class();
      v46 = NSStringFromClass(v45);
      *(_DWORD *)buf = 138544642;
      v83 = v44;
      __int16 v84 = 2114;
      v85 = v46;
      __int16 v86 = 2048;
      v87 = self;
      __int16 v88 = 2114;
      v89 = @"BKSHIDEventDeferringRule.m";
      __int16 v90 = 1024;
      int v91 = 115;
      __int16 v92 = 2114;
      v93 = v43;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v43 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA0F5F8);
  }

  id v17 = v12;
  if (!v17)
  {
    v47 = NSString;
    v48 = (objc_class *)objc_opt_class();
    v49 = NSStringFromClass(v48);
    v50 = [v47 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"target", v49];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v51 = NSStringFromSelector(a2);
      v52 = (objc_class *)objc_opt_class();
      v53 = NSStringFromClass(v52);
      *(_DWORD *)buf = 138544642;
      v83 = v51;
      __int16 v84 = 2114;
      v85 = v53;
      __int16 v86 = 2048;
      v87 = self;
      __int16 v88 = 2114;
      v89 = @"BKSHIDEventDeferringRule.m";
      __int16 v90 = 1024;
      int v91 = 116;
      __int16 v92 = 2114;
      v93 = v50;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v50 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA0F710);
  }
  v18 = v17;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v54 = NSString;
    v55 = (objc_class *)[v18 classForCoder];
    if (!v55) {
      v55 = (objc_class *)objc_opt_class();
    }
    v56 = NSStringFromClass(v55);
    v57 = (objc_class *)objc_opt_class();
    v58 = NSStringFromClass(v57);
    v59 = [v54 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"target", v56, v58];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v60 = NSStringFromSelector(a2);
      v61 = (objc_class *)objc_opt_class();
      v62 = NSStringFromClass(v61);
      *(_DWORD *)buf = 138544642;
      v83 = v60;
      __int16 v84 = 2114;
      v85 = v62;
      __int16 v86 = 2048;
      v87 = self;
      __int16 v88 = 2114;
      v89 = @"BKSHIDEventDeferringRule.m";
      __int16 v90 = 1024;
      int v91 = 116;
      __int16 v92 = 2114;
      v93 = v59;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v59 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA0F84CLL);
  }

  id v19 = v13;
  uint64_t v20 = NSString;
  v21 = (objc_class *)objc_opt_class();
  if (!v19)
  {
    v63 = NSStringFromClass(v21);
    v64 = [v20 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"reason", v63];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v65 = NSStringFromSelector(a2);
      v66 = (objc_class *)objc_opt_class();
      v67 = NSStringFromClass(v66);
      *(_DWORD *)buf = 138544642;
      v83 = v65;
      __int16 v84 = 2114;
      v85 = v67;
      __int16 v86 = 2048;
      v87 = self;
      __int16 v88 = 2114;
      v89 = @"BKSHIDEventDeferringRule.m";
      __int16 v90 = 1024;
      int v91 = 117;
      __int16 v92 = 2114;
      v93 = v64;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v64 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA0F954);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v68 = NSString;
    v69 = (objc_class *)[v19 classForCoder];
    if (!v69) {
      v69 = (objc_class *)objc_opt_class();
    }
    v70 = NSStringFromClass(v69);
    v71 = (objc_class *)objc_opt_class();
    v72 = NSStringFromClass(v71);
    v73 = [v68 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"reason", v70, v72];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v74 = NSStringFromSelector(a2);
      v75 = (objc_class *)objc_opt_class();
      v76 = NSStringFromClass(v75);
      *(_DWORD *)buf = 138544642;
      v83 = v74;
      __int16 v84 = 2114;
      v85 = v76;
      __int16 v86 = 2048;
      v87 = self;
      __int16 v88 = 2114;
      v89 = @"BKSHIDEventDeferringRule.m";
      __int16 v90 = 1024;
      int v91 = 117;
      __int16 v92 = 2114;
      v93 = v73;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v73 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA0FA8CLL);
  }

  uint64_t v22 = objc_opt_class();
  if (v22 != objc_opt_class())
  {
    v77 = [NSString stringWithFormat:@"BKSHIDEventDeferringRule cannot be subclassed"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v78 = NSStringFromSelector(a2);
      v79 = (objc_class *)objc_opt_class();
      v80 = NSStringFromClass(v79);
      *(_DWORD *)buf = 138544642;
      v83 = v78;
      __int16 v84 = 2114;
      v85 = v80;
      __int16 v86 = 2048;
      v87 = self;
      __int16 v88 = 2114;
      v89 = @"BKSHIDEventDeferringRule.m";
      __int16 v90 = 1024;
      int v91 = 118;
      __int16 v92 = 2114;
      v93 = v77;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v77 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA0FB74);
  }
  v81.receiver = self;
  v81.super_class = (Class)BKSHIDEventDeferringRule;
  v23 = [(BKSHIDEventDeferringRule *)&v81 init];
  if (v23)
  {
    uint64_t v24 = [v16 copy];
    predicate = v23->_predicate;
    v23->_predicate = (BKSHIDEventDeferringPredicate *)v24;

    uint64_t v26 = [v18 copy];
    target = v23->_target;
    v23->_target = (BKSHIDEventDeferringTarget *)v26;

    uint64_t v28 = [v19 copy];
    reason = v23->_reason;
    v23->_reason = (NSString *)v28;

    objc_storeStrong((id *)&v23->_identity, a6);
  }

  return v23;
}

- (int64_t)weightedDeferringRuleCompare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  char v6 = [(BKSHIDEventDeferringRule *)v5 predicate];
  id v7 = [v4 predicate];
  id v8 = v6;
  self;
  v9 = [v8 display];
  BOOL v10 = v9 != 0;

  id v11 = [v8 token];

  unint64_t v12 = (v11 != 0) | (unint64_t)(2 * v10);
  id v13 = [v7 display];
  BOOL v14 = v13 != 0;

  id v15 = [v7 token];

  unint64_t v16 = (v15 != 0) | (unint64_t)(2 * v14);
  BOOL v17 = v12 > v16;
  if (v12 == v16) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = -1;
  }
  if (v17) {
    int64_t v19 = 1;
  }
  else {
    int64_t v19 = v18;
  }
  if (!v19)
  {
    if ([v8 isEqual:v7])
    {
      uint64_t v20 = [(BKSHIDEventDeferringRule *)v5 identity];
      unsigned int v21 = [v20 seed];

      uint64_t v22 = [v4 identity];
      unsigned int v23 = [v22 seed];

      if (v21 <= v23) {
        int64_t v19 = v21 < v23;
      }
      else {
        int64_t v19 = -1;
      }
    }
    else
    {
      int64_t v19 = 0;
    }
  }

  return v19;
}

- (BKSHIDEventDeferringPredicate)predicate
{
  return self->_predicate;
}

- (_BKSHIDEventDeferringRuleIdentity)identity
{
  return self->_identity;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  identity = self->_identity;
  id v8 = a3;
  id v5 = (id)[v8 appendObject:identity withName:0];
  id v6 = (id)[v8 appendObject:self->_predicate withName:0];
  [v8 appendRightArrow];
  id v7 = (id)[v8 appendObject:self->_target withName:0];
  [v8 appendString:self->_reason withName:@"reason"];
}

- (void)encodeWithCoder:(id)a3
{
  predicate = self->_predicate;
  id v5 = a3;
  [v5 encodeObject:predicate forKey:@"predicate"];
  [v5 encodeObject:self->_target forKey:@"target"];
  [v5 encodeObject:self->_reason forKey:@"reason"];
  [v5 encodeObject:self->_identity forKey:@"ident"];
}

+ (id)ruleForDeferringEventsMatchingPredicate:(id)a3 toTarget:(id)a4 withReason:(id)a5 seed:(unsigned int)a6 pid:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  BOOL v14 = [[_BKSHIDEventDeferringRuleIdentity alloc] initWithSeed:v8 pid:v7];
  id v15 = [[BKSHIDEventDeferringRule alloc] _initWithPredicate:v13 target:v12 reason:v11 identity:v14];

  return v15;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (int64_t)mostRecentFirstCompare:(id)a3
{
  id v4 = a3;
  id v5 = [(BKSHIDEventDeferringRule *)self identity];
  unsigned int v6 = [v5 seed];

  uint64_t v7 = [v4 identity];

  unsigned int v8 = [v7 seed];
  if (v6 > v8) {
    return -1;
  }
  else {
    return v6 != v8;
  }
}

- (BKSHIDEventDeferringRule)init
{
  id v4 = [NSString stringWithFormat:@"-init is not allowed on BKSHIDEventDeferringRule"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    unsigned int v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    BOOL v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    BOOL v14 = self;
    __int16 v15 = 2114;
    unint64_t v16 = @"BKSHIDEventDeferringRule.m";
    __int16 v17 = 1024;
    int v18 = 110;
    __int16 v19 = 2114;
    uint64_t v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSHIDEventDeferringRule *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

@end