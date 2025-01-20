@interface BKSHIDEventKeyCommandsDispatchingRule
+ (BOOL)supportsSecureCoding;
+ (id)ruleForDispatchingKeyCommandsMatchingPredicate:(id)a3 toTargets:(id)a4;
- (BKSHIDEventKeyCommandsDispatchingPredicate)predicate;
- (BKSHIDEventKeyCommandsDispatchingRule)init;
- (BKSHIDEventKeyCommandsDispatchingRule)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)targets;
- (NSString)debugDescription;
- (id)_initWithPredicate:(id)a3 targets:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSHIDEventKeyCommandsDispatchingRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targets, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

- (NSArray)targets
{
  return self->_targets;
}

- (BKSHIDEventKeyCommandsDispatchingPredicate)predicate
{
  return self->_predicate;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(BKSHIDEventKeyCommandsDispatchingRule *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__BKSHIDEventKeyCommandsDispatchingRule_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E5441BB0;
  id v5 = v4;
  id v10 = v5;
  v11 = self;
  id v6 = (id)[v5 modifyBody:v9];
  id v7 = v5;

  return v7;
}

id __79__BKSHIDEventKeyCommandsDispatchingRule_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"predicate"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BKSHIDEventKeyCommandsDispatchingRule *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_targets withName:@"targets" skipIfNil:0];
  return v3;
}

- (id)succinctDescription
{
  v2 = [(BKSHIDEventKeyCommandsDispatchingRule *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (NSString)debugDescription
{
  return (NSString *)[(BKSHIDEventKeyCommandsDispatchingRule *)self descriptionWithMultilinePrefix:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BKSHIDEventKeyCommandsDispatchingRule *)a3;
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
  unint64_t v3 = [(BKSHIDEventKeyCommandsDispatchingPredicate *)self->_predicate hash];
  return [(NSArray *)self->_targets hash] ^ v3;
}

- (BKSHIDEventKeyCommandsDispatchingRule)initWithCoder:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predicate"];
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v13 forKey:@"targets"];

    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (!objc_msgSend(v9, "bs_containsObjectPassingTest:", &__block_literal_global_29))
      {
        self = (BKSHIDEventKeyCommandsDispatchingRule *)[(BKSHIDEventKeyCommandsDispatchingRule *)self _initWithPredicate:v8 targets:v9];
        v22 = self;
        goto LABEL_10;
      }
      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F281F8];
      uint64_t v28 = *MEMORY[0x1E4F28588];
      v16 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventKeyCommandsDispatchingRule: targets contains non-BKSHIDEventDispatchingTarget elements : %@", v9];
      v29[0] = v16;
      v17 = (void *)MEMORY[0x1E4F1C9E8];
      v18 = (void **)v29;
      v19 = &v28;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F281F8];
      uint64_t v26 = *MEMORY[0x1E4F28588];
      v16 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventKeyCommandsDispatchingRule: invalid predicate or set of targets : predicate=%@ targets=%@", v8, v9];
      v27 = v16;
      v17 = (void *)MEMORY[0x1E4F1C9E8];
      v18 = &v27;
      v19 = &v26;
    }
    v20 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:1];
    v21 = [v14 errorWithDomain:v15 code:4866 userInfo:v20];
    [v4 failWithError:v21];
  }
  else
  {
    char v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F281F8];
    uint64_t v24 = *MEMORY[0x1E4F28588];
    v8 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventKeyCommandsDispatchingRule: subclasses are not allowed : %@", objc_opt_class()];
    v25 = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v10 = [v6 errorWithDomain:v7 code:4866 userInfo:v9];
    [v4 failWithError:v10];
  }
  v22 = 0;
LABEL_10:

  return v22;
}

BOOL __55__BKSHIDEventKeyCommandsDispatchingRule_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void)encodeWithCoder:(id)a3
{
  predicate = self->_predicate;
  id v5 = a3;
  [v5 encodeObject:predicate forKey:@"predicate"];
  [v5 encodeObject:self->_targets forKey:@"targets"];
}

- (id)_initWithPredicate:(id)a3 targets:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = objc_opt_class();
  if (v9 != objc_opt_class())
  {
    v16 = [NSString stringWithFormat:@"BKSHIDEventKeyCommandsDispatchingRule cannot be subclassed"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v17 = NSStringFromSelector(a2);
      v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138544642;
      v22 = v17;
      __int16 v23 = 2114;
      uint64_t v24 = v19;
      __int16 v25 = 2048;
      uint64_t v26 = self;
      __int16 v27 = 2114;
      uint64_t v28 = @"BKSHIDEventKeyCommandsDispatchingRule.m";
      __int16 v29 = 1024;
      int v30 = 32;
      __int16 v31 = 2114;
      v32 = v16;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA3EAE4);
  }
  v20.receiver = self;
  v20.super_class = (Class)BKSHIDEventKeyCommandsDispatchingRule;
  id v10 = [(BKSHIDEventKeyCommandsDispatchingRule *)&v20 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    predicate = v10->_predicate;
    v10->_predicate = (BKSHIDEventKeyCommandsDispatchingPredicate *)v11;

    uint64_t v13 = [v8 copy];
    targets = v10->_targets;
    v10->_targets = (NSArray *)v13;
  }
  return v10;
}

- (BKSHIDEventKeyCommandsDispatchingRule)init
{
  id v4 = [NSString stringWithFormat:@"-init is not allowed on BKSHIDEventKeyCommandsDispatchingRule"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    char v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    v16 = @"BKSHIDEventKeyCommandsDispatchingRule.m";
    __int16 v17 = 1024;
    int v18 = 27;
    __int16 v19 = 2114;
    objc_super v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSHIDEventKeyCommandsDispatchingRule *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)ruleForDispatchingKeyCommandsMatchingPredicate:(id)a3 toTargets:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  if (!v9)
  {
    __int16 v15 = NSString;
    v16 = (objc_class *)objc_opt_class();
    __int16 v17 = NSStringFromClass(v16);
    int v18 = [v15 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"predicate", v17];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = NSStringFromSelector(a2);
      objc_super v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138544642;
      v52 = v19;
      __int16 v53 = 2114;
      v54 = v21;
      __int16 v55 = 2048;
      id v56 = a1;
      __int16 v57 = 2114;
      v58 = @"BKSHIDEventKeyCommandsDispatchingRule.m";
      __int16 v59 = 1024;
      int v60 = 43;
      __int16 v61 = 2114;
      v62 = v18;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA3EE30);
  }
  id v10 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = NSString;
    __int16 v23 = (objc_class *)[v10 classForCoder];
    if (!v23) {
      __int16 v23 = (objc_class *)objc_opt_class();
    }
    uint64_t v24 = NSStringFromClass(v23);
    __int16 v25 = (objc_class *)objc_opt_class();
    uint64_t v26 = NSStringFromClass(v25);
    __int16 v27 = [v22 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"predicate", v24, v26];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = NSStringFromSelector(a2);
      __int16 v29 = (objc_class *)objc_opt_class();
      int v30 = NSStringFromClass(v29);
      *(_DWORD *)buf = 138544642;
      v52 = v28;
      __int16 v53 = 2114;
      v54 = v30;
      __int16 v55 = 2048;
      id v56 = a1;
      __int16 v57 = 2114;
      v58 = @"BKSHIDEventKeyCommandsDispatchingRule.m";
      __int16 v59 = 1024;
      int v60 = 43;
      __int16 v61 = 2114;
      v62 = v27;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA3EF6CLL);
  }

  id v11 = v8;
  if (!v11)
  {
    __int16 v31 = NSString;
    v32 = (objc_class *)objc_opt_class();
    uint64_t v33 = NSStringFromClass(v32);
    v34 = [v31 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"targets", v33];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v35 = NSStringFromSelector(a2);
      v36 = (objc_class *)objc_opt_class();
      v37 = NSStringFromClass(v36);
      *(_DWORD *)buf = 138544642;
      v52 = v35;
      __int16 v53 = 2114;
      v54 = v37;
      __int16 v55 = 2048;
      id v56 = a1;
      __int16 v57 = 2114;
      v58 = @"BKSHIDEventKeyCommandsDispatchingRule.m";
      __int16 v59 = 1024;
      int v60 = 44;
      __int16 v61 = 2114;
      v62 = v34;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v34 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA3F084);
  }
  uint64_t v12 = v11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v38 = NSString;
    v39 = (objc_class *)[v12 classForCoder];
    if (!v39) {
      v39 = (objc_class *)objc_opt_class();
    }
    v40 = NSStringFromClass(v39);
    v41 = (objc_class *)objc_opt_class();
    v42 = NSStringFromClass(v41);
    v43 = [v38 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"targets", v40, v42];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v44 = NSStringFromSelector(a2);
      v45 = (objc_class *)objc_opt_class();
      v46 = NSStringFromClass(v45);
      *(_DWORD *)buf = 138544642;
      v52 = v44;
      __int16 v53 = 2114;
      v54 = v46;
      __int16 v55 = 2048;
      id v56 = a1;
      __int16 v57 = 2114;
      v58 = @"BKSHIDEventKeyCommandsDispatchingRule.m";
      __int16 v59 = 1024;
      int v60 = 44;
      __int16 v61 = 2114;
      v62 = v43;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v43 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA3F1C0);
  }

  if (objc_msgSend(v12, "bs_containsObjectPassingTest:", &__block_literal_global_3499))
  {
    v47 = [NSString stringWithFormat:@"targets contains non-BKSHIDEventDispatchingTarget elements : %@", v12];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v48 = NSStringFromSelector(a2);
      v49 = (objc_class *)objc_opt_class();
      v50 = NSStringFromClass(v49);
      *(_DWORD *)buf = 138544642;
      v52 = v48;
      __int16 v53 = 2114;
      v54 = v50;
      __int16 v55 = 2048;
      id v56 = a1;
      __int16 v57 = 2114;
      v58 = @"BKSHIDEventKeyCommandsDispatchingRule.m";
      __int16 v59 = 1024;
      int v60 = 47;
      __int16 v61 = 2114;
      v62 = v47;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v47 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA3F2B0);
  }
  id v13 = [[BKSHIDEventKeyCommandsDispatchingRule alloc] _initWithPredicate:v10 targets:v12];

  return v13;
}

BOOL __98__BKSHIDEventKeyCommandsDispatchingRule_ruleForDispatchingKeyCommandsMatchingPredicate_toTargets___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

@end