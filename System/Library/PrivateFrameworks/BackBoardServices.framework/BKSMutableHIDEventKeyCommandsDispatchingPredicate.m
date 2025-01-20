@interface BKSMutableHIDEventKeyCommandsDispatchingPredicate
+ (id)new;
- (BKSMutableHIDEventKeyCommandsDispatchingPredicate)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDisplays:(id)a3;
- (void)setSenderDescriptors:(id)a3;
@end

@implementation BKSMutableHIDEventKeyCommandsDispatchingPredicate

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[BKSHIDEventKeyCommandsDispatchingPredicate allocWithZone:a3];
  senderDescriptors = self->super._senderDescriptors;
  return [(BKSHIDEventKeyCommandsDispatchingPredicate *)v4 _initWithSenderDescriptors:senderDescriptors];
}

- (void)setSenderDescriptors:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v21 = NSString;
      v22 = (objc_class *)[v5 classForCoder];
      if (!v22) {
        v22 = (objc_class *)objc_opt_class();
      }
      v23 = NSStringFromClass(v22);
      v24 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v24);
      v26 = [v21 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"senderDescriptors", v23, v25];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v27 = NSStringFromSelector(a2);
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        *(_DWORD *)buf = 138544642;
        v36 = v27;
        __int16 v37 = 2114;
        v38 = v29;
        __int16 v39 = 2048;
        v40 = self;
        __int16 v41 = 2114;
        v42 = @"BKSHIDEventKeyCommandsDispatchingPredicate.m";
        __int16 v43 = 1024;
        int v44 = 176;
        __int16 v45 = 2114;
        v46 = v26;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v26 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA52690);
    }

    v6 = [MEMORY[0x1E4F1CA80] set];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v17 = [NSString stringWithFormat:@"set contains non-BKSHIDEventSenderDescriptor elements : %@", v7];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              v18 = NSStringFromSelector(a2);
              v19 = (objc_class *)objc_opt_class();
              v20 = NSStringFromClass(v19);
              *(_DWORD *)buf = 138544642;
              v36 = v18;
              __int16 v37 = 2114;
              v38 = v20;
              __int16 v39 = 2048;
              v40 = self;
              __int16 v41 = 2114;
              v42 = @"BKSHIDEventKeyCommandsDispatchingPredicate.m";
              __int16 v43 = 1024;
              int v44 = 180;
              __int16 v45 = 2114;
              v46 = v17;
              _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
            }
            [v17 UTF8String];
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x18AA52554);
          }
          v13 = (void *)[v12 copy];
          [v6 addObject:v13];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v9);
    }

    v14 = (NSSet *)[v6 copy];
    senderDescriptors = self->super._senderDescriptors;
    self->super._senderDescriptors = v14;
  }
  else
  {
    v16 = self->super._senderDescriptors;
    self->super._senderDescriptors = 0;
  }
}

- (void)setDisplays:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  if (v19)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = NSString;
      id v7 = (objc_class *)[v19 classForCoder];
      if (!v7) {
        id v7 = (objc_class *)objc_opt_class();
      }
      uint64_t v8 = NSStringFromClass(v7);
      uint64_t v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      v11 = [v6 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"displays", v8, v10];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v12 = NSStringFromSelector(a2);
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138544642;
        v21 = v12;
        __int16 v22 = 2114;
        v23 = v14;
        __int16 v24 = 2048;
        v25 = self;
        __int16 v26 = 2114;
        v27 = @"BKSHIDEventKeyCommandsDispatchingPredicate.m";
        __int16 v28 = 1024;
        int v29 = 160;
        __int16 v30 = 2114;
        long long v31 = v11;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v11 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA528B8);
    }

    if (objc_msgSend(v19, "bs_containsObjectPassingTest:", &__block_literal_global_119))
    {
      v15 = [NSString stringWithFormat:@"displays contains non-BKSHIDEventDisplay elements : %@", v19];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v16 = NSStringFromSelector(a2);
        v17 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v17);
        *(_DWORD *)buf = 138544642;
        v21 = v16;
        __int16 v22 = 2114;
        v23 = v18;
        __int16 v24 = 2048;
        v25 = self;
        __int16 v26 = 2114;
        v27 = @"BKSHIDEventKeyCommandsDispatchingPredicate.m";
        __int16 v28 = 1024;
        int v29 = 164;
        __int16 v30 = 2114;
        long long v31 = v15;
        _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v15 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x18AA529ACLL);
    }
  }
  id v5 = objc_msgSend(v19, "bs_map:", &__block_literal_global_126);
  [(BKSMutableHIDEventKeyCommandsDispatchingPredicate *)self setSenderDescriptors:v5];
}

BKSMutableHIDEventSenderDescriptor *__65__BKSMutableHIDEventKeyCommandsDispatchingPredicate_setDisplays___block_invoke_123(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_alloc_init(BKSMutableHIDEventSenderDescriptor);
  [(BKSMutableHIDEventSenderDescriptor *)v3 setAssociatedDisplay:v2];

  return v3;
}

BOOL __65__BKSMutableHIDEventKeyCommandsDispatchingPredicate_setDisplays___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (BKSMutableHIDEventKeyCommandsDispatchingPredicate)init
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    uint64_t v8 = [NSString stringWithFormat:@"BKSMutableHIDEventKeyCommandsDispatchingPredicate cannot be subclassed"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = NSStringFromSelector(a2);
      uint64_t v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      int v12 = 138544642;
      v13 = v9;
      __int16 v14 = 2114;
      v15 = v11;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2114;
      id v19 = @"BKSHIDEventKeyCommandsDispatchingPredicate.m";
      __int16 v20 = 1024;
      int v21 = 153;
      __int16 v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v12, 0x3Au);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA52BE8);
  }
  id v5 = [MEMORY[0x1E4F1CAD0] set];
  v6 = [(BKSHIDEventKeyCommandsDispatchingPredicate *)self _initWithSenderDescriptors:v5];

  return v6;
}

+ (id)new
{
  return objc_alloc_init(BKSMutableHIDEventKeyCommandsDispatchingPredicate);
}

@end