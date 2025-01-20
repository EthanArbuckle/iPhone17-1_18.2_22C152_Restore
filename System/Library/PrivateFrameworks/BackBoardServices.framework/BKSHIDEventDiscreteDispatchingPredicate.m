@interface BKSHIDEventDiscreteDispatchingPredicate
+ (BOOL)supportsSecureCoding;
- (BKSHIDEventDiscreteDispatchingPredicate)init;
- (BKSHIDEventDiscreteDispatchingPredicate)initWithCoder:(id)a3;
- (BOOL)containsDescriptor:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)specifiesDescriptor:(id)a3;
- (NSSet)descriptors;
- (NSSet)displays;
- (NSSet)senderDescriptors;
- (NSString)description;
- (id)_initWithSourceDescriptors:(id)a3 descriptors:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSHIDEventDiscreteDispatchingPredicate

- (NSSet)senderDescriptors
{
  return self->_senderDescriptors;
}

- (BOOL)specifiesDescriptor:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSSet *)self->_descriptors containsObject:v4])
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v6 = self->_fuzzyDescriptors;
    uint64_t v5 = [(NSSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v6);
          }
          if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "describes:", v4, (void)v10))
          {
            LOBYTE(v5) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v5 = [(NSSet *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fuzzyDescriptors, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_senderDescriptors, 0);
}

- (NSSet)descriptors
{
  return self->_descriptors;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  senderDescriptors = self->_senderDescriptors;
  id v12 = v4;
  if (senderDescriptors)
  {
    if ([(NSSet *)senderDescriptors count])
    {
      v6 = [(NSSet *)self->_senderDescriptors allObjects];
      id v7 = (id)[v12 appendObject:v6 withName:@"senders"];

      goto LABEL_7;
    }
    v8 = @"(match none)";
    v9 = v12;
  }
  else
  {
    v8 = @"(match all)";
    v9 = v4;
  }
  id v10 = (id)[v9 appendObject:v8 withName:@"senders"];
LABEL_7:
  id v11 = (id)[v12 appendObject:self->_descriptors withName:@"events"];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BKSHIDEventDiscreteDispatchingPredicate *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if ((v5 == objc_opt_class() || (uint64_t v6 = objc_opt_class(), v6 == objc_opt_class())) && BSEqualObjects()) {
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
  uint64_t v3 = [(NSSet *)self->_senderDescriptors hash];
  return v3 ^ [(NSSet *)self->_descriptors hash] ^ 0x1A0E1;
}

- (BKSHIDEventDiscreteDispatchingPredicate)initWithCoder:(id)a3
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class() || (uint64_t v6 = objc_opt_class(), v6 == objc_opt_class()))
  {
    id v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v14 forKey:@"senderDescriptors"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (objc_msgSend(v9, "bs_containsObjectPassingTest:", &__block_literal_global_22_8285))
      {
        uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = *MEMORY[0x1E4F281F8];
        uint64_t v42 = *MEMORY[0x1E4F28588];
        id v10 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventDiscreteDispatchingPredicate: senderDescriptors contains non-BKSHIDEventSenderDescriptor elements : %@", v9];
        v43[0] = v10;
        v17 = (void *)MEMORY[0x1E4F1C9E8];
        v18 = (void **)v43;
        v19 = &v42;
LABEL_9:
        v20 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:1];
        v21 = [v15 errorWithDomain:v16 code:4866 userInfo:v20];
        [v4 failWithError:v21];

LABEL_15:
        goto LABEL_16;
      }
    }
    else if (v9)
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F281F8];
      uint64_t v40 = *MEMORY[0x1E4F28588];
      id v10 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventDiscreteDispatchingPredicate: senderDescriptors not of class NSSet : %@", v9];
      v41 = v10;
      v17 = (void *)MEMORY[0x1E4F1C9E8];
      v18 = &v41;
      v19 = &v40;
      goto LABEL_9;
    }
    v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    id v10 = [v4 decodeObjectOfClasses:v24 forKey:@"descriptors"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!objc_msgSend(v10, "bs_containsObjectPassingTest:", &__block_literal_global_33))
      {
        self = (BKSHIDEventDiscreteDispatchingPredicate *)[(BKSHIDEventDiscreteDispatchingPredicate *)self _initWithSourceDescriptors:v9 descriptors:v10];
        v32 = self;
        goto LABEL_17;
      }
      v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F281F8];
      uint64_t v38 = *MEMORY[0x1E4F28588];
      v20 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventDiscreteDispatchingPredicate: descriptors contains non-BKSHIDEventDescriptor elements : %@", v10];
      v39 = v20;
      v27 = (void *)MEMORY[0x1E4F1C9E8];
      v28 = &v39;
      v29 = &v38;
    }
    else
    {
      v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F281F8];
      uint64_t v36 = *MEMORY[0x1E4F28588];
      v20 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventDiscreteDispatchingPredicate: descriptors not of class NSSet : %@", v10];
      v37 = v20;
      v27 = (void *)MEMORY[0x1E4F1C9E8];
      v28 = &v37;
      v29 = &v36;
    }
    v30 = [v27 dictionaryWithObjects:v28 forKeys:v29 count:1];
    v31 = [v25 errorWithDomain:v26 code:4866 userInfo:v30];
    [v4 failWithError:v31];

    goto LABEL_15;
  }
  char v7 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F281F8];
  uint64_t v34 = *MEMORY[0x1E4F28588];
  v9 = [NSString stringWithFormat:@"Failed to decode BKSHIDEventDiscreteDispatchingPredicate: subclasses are not allowed : %@", objc_opt_class()];
  v35 = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  id v11 = [v7 errorWithDomain:v8 code:4866 userInfo:v10];
  [v4 failWithError:v11];

LABEL_16:
  v32 = 0;
LABEL_17:

  return v32;
}

BOOL __57__BKSHIDEventDiscreteDispatchingPredicate_initWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

BOOL __57__BKSHIDEventDiscreteDispatchingPredicate_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void)encodeWithCoder:(id)a3
{
  senderDescriptors = self->_senderDescriptors;
  id v5 = a3;
  [v5 encodeObject:senderDescriptors forKey:@"senderDescriptors"];
  [v5 encodeObject:self->_descriptors forKey:@"descriptors"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[BKSMutableHIDEventDiscreteDispatchingPredicate allocWithZone:a3];
  senderDescriptors = self->_senderDescriptors;
  descriptors = self->_descriptors;
  return [(BKSHIDEventDiscreteDispatchingPredicate *)v4 _initWithSourceDescriptors:senderDescriptors descriptors:descriptors];
}

- (BOOL)containsDescriptor:(id)a3
{
  return [(NSSet *)self->_descriptors containsObject:a3];
}

- (NSSet)displays
{
  return (NSSet *)[(NSSet *)self->_senderDescriptors bs_map:&__block_literal_global_8304];
}

id __51__BKSHIDEventDiscreteDispatchingPredicate_displays__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 associatedDisplay];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[BKSHIDEventDisplay nullDisplay];
  }
  id v5 = v4;

  return v5;
}

- (id)_initWithSourceDescriptors:(id)a3 descriptors:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = objc_opt_class();
  if (v9 != objc_opt_class())
  {
    uint64_t v10 = objc_opt_class();
    if (v10 != objc_opt_class())
    {
      v27 = [NSString stringWithFormat:@"BKSHIDEventDiscreteDispatchingPredicate cannot be subclassed"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v28 = NSStringFromSelector(a2);
        v29 = (objc_class *)objc_opt_class();
        v30 = NSStringFromClass(v29);
        *(_DWORD *)buf = 138544642;
        uint64_t v38 = v28;
        __int16 v39 = 2114;
        uint64_t v40 = v30;
        __int16 v41 = 2048;
        uint64_t v42 = self;
        __int16 v43 = 2114;
        v44 = @"BKSHIDEventDiscreteDispatchingPredicate.m";
        __int16 v45 = 1024;
        int v46 = 43;
        __int16 v47 = 2114;
        v48 = v27;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v27 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA5ADF8);
    }
  }
  v35.receiver = self;
  v35.super_class = (Class)BKSHIDEventDiscreteDispatchingPredicate;
  id v11 = [(BKSHIDEventDiscreteDispatchingPredicate *)&v35 init];
  if (v11)
  {
    uint64_t v12 = [v7 copy];
    senderDescriptors = v11->_senderDescriptors;
    v11->_senderDescriptors = (NSSet *)v12;

    v14 = (void *)[v8 copy];
    uint64_t v15 = v14;
    if (v14)
    {
      uint64_t v16 = v14;
    }
    else
    {
      uint64_t v16 = [MEMORY[0x1E4F1CAD0] set];
    }
    descriptors = v11->_descriptors;
    v11->_descriptors = v16;

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v18 = v8;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      v21 = 0;
      uint64_t v22 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v18);
          }
          v24 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if (objc_msgSend(v24, "requiresFuzzyMatching", (void)v31))
          {
            if (!v21) {
              v21 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
            }
            [(NSSet *)v21 addObject:v24];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v20);
    }
    else
    {
      v21 = 0;
    }

    fuzzyDescriptors = v11->_fuzzyDescriptors;
    v11->_fuzzyDescriptors = v21;
  }
  return v11;
}

- (BKSHIDEventDiscreteDispatchingPredicate)init
{
  id v4 = [NSString stringWithFormat:@"-init is not allowed on BKSHIDEventDiscreteDispatchingPredicate"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    uint64_t v16 = @"BKSHIDEventDiscreteDispatchingPredicate.m";
    __int16 v17 = 1024;
    int v18 = 38;
    __int16 v19 = 2114;
    uint64_t v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSHIDEventDiscreteDispatchingPredicate *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

@end