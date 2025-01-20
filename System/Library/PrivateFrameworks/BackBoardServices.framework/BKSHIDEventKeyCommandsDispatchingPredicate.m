@interface BKSHIDEventKeyCommandsDispatchingPredicate
+ (BOOL)supportsSecureCoding;
- (BKSHIDEventKeyCommandsDispatchingPredicate)init;
- (BKSHIDEventKeyCommandsDispatchingPredicate)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSSet)displays;
- (NSSet)senderDescriptors;
- (NSString)debugDescription;
- (id)_initWithSenderDescriptors:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSHIDEventKeyCommandsDispatchingPredicate

- (void).cxx_destruct
{
}

- (NSSet)senderDescriptors
{
  return self->_senderDescriptors;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(BKSHIDEventKeyCommandsDispatchingPredicate *)self succinctDescriptionBuilder];
  v6 = [(NSSet *)self->_senderDescriptors allObjects];
  [v5 appendArraySection:v6 withName:@"senders" multilinePrefix:v4 skipIfEmpty:0];

  return v5;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BKSHIDEventKeyCommandsDispatchingPredicate *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)succinctDescription
{
  v2 = [(BKSHIDEventKeyCommandsDispatchingPredicate *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (NSString)debugDescription
{
  return (NSString *)[(BKSHIDEventKeyCommandsDispatchingPredicate *)self descriptionWithMultilinePrefix:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BKSHIDEventKeyCommandsDispatchingPredicate *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class() || (uint64_t v6 = objc_opt_class(), v6 == objc_opt_class())) {
      char v7 = BSEqualObjects();
    }
    else {
      char v7 = 0;
    }
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return [(NSSet *)self->_senderDescriptors hash] ^ 0x1E833;
}

- (BKSHIDEventKeyCommandsDispatchingPredicate)initWithCoder:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
    uint64_t v6 = objc_opt_class();
    if (v6 != objc_opt_class())
    {
      char v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = *MEMORY[0x1E4F281F8];
      uint64_t v24 = *MEMORY[0x1E4F28588];
      v9 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventKeyCommandsDispatchingPredicate: subclasses are not allowed : %@", objc_opt_class()];
      v25 = v9;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      v11 = [v7 errorWithDomain:v8 code:4866 userInfo:v10];
      [v4 failWithError:v11];

LABEL_11:
      v20 = 0;
      goto LABEL_12;
    }
  }
  v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v14 forKey:@"senders"];

  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F281F8];
      uint64_t v26 = *MEMORY[0x1E4F28588];
      v10 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventKeyCommandsDispatchingPredicate: displays not of class NSSet : %@", v9];
      v27 = v10;
      v17 = (void *)MEMORY[0x1E4F1C9E8];
      v18 = &v27;
      v19 = &v26;
      goto LABEL_10;
    }
  }
  if (objc_msgSend(v9, "bs_containsObjectPassingTest:", &__block_literal_global_18_7293))
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F281F8];
    uint64_t v28 = *MEMORY[0x1E4F28588];
    v10 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventKeyCommandsDispatchingPredicate: senders contains non-BKSHIDEventSenderDescriptor elements : %@", v9];
    v29[0] = v10;
    v17 = (void *)MEMORY[0x1E4F1C9E8];
    v18 = (void **)v29;
    v19 = &v28;
LABEL_10:
    v21 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:1];
    v22 = [v15 errorWithDomain:v16 code:4866 userInfo:v21];
    [v4 failWithError:v22];

    goto LABEL_11;
  }
  self = (BKSHIDEventKeyCommandsDispatchingPredicate *)[(BKSHIDEventKeyCommandsDispatchingPredicate *)self _initWithSenderDescriptors:v9];
  v20 = self;
LABEL_12:

  return v20;
}

BOOL __60__BKSHIDEventKeyCommandsDispatchingPredicate_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[BKSMutableHIDEventKeyCommandsDispatchingPredicate allocWithZone:a3];
  senderDescriptors = self->_senderDescriptors;
  return [(BKSHIDEventKeyCommandsDispatchingPredicate *)v4 _initWithSenderDescriptors:senderDescriptors];
}

- (NSSet)displays
{
  return (NSSet *)[(NSSet *)self->_senderDescriptors bs_map:&__block_literal_global_7306];
}

id __54__BKSHIDEventKeyCommandsDispatchingPredicate_displays__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 associatedDisplay];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[BKSHIDEventDisplay nullDisplay];
  }
  uint64_t v5 = v4;

  return v5;
}

- (id)_initWithSenderDescriptors:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  if (v6 != objc_opt_class())
  {
    uint64_t v7 = objc_opt_class();
    if (v7 != objc_opt_class())
    {
      v12 = [NSString stringWithFormat:@"BKSHIDEventKeyCommandsDispatchingPredicate cannot be subclassed"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = NSStringFromSelector(a2);
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138544642;
        v18 = v13;
        __int16 v19 = 2114;
        v20 = v15;
        __int16 v21 = 2048;
        v22 = self;
        __int16 v23 = 2114;
        uint64_t v24 = @"BKSHIDEventKeyCommandsDispatchingPredicate.m";
        __int16 v25 = 1024;
        int v26 = 31;
        __int16 v27 = 2114;
        uint64_t v28 = v12;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA53220);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)BKSHIDEventKeyCommandsDispatchingPredicate;
  uint64_t v8 = [(BKSHIDEventKeyCommandsDispatchingPredicate *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v5 copy];
    senderDescriptors = v8->_senderDescriptors;
    v8->_senderDescriptors = (NSSet *)v9;
  }
  return v8;
}

- (BKSHIDEventKeyCommandsDispatchingPredicate)init
{
  id v4 = [NSString stringWithFormat:@"-init is not allowed on BKSHIDEventKeyCommandsDispatchingPredicate"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    objc_super v16 = @"BKSHIDEventKeyCommandsDispatchingPredicate.m";
    __int16 v17 = 1024;
    int v18 = 26;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSHIDEventKeyCommandsDispatchingPredicate *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

@end