@interface BKSSimplerAssertion
+ (id)assertionWithDescription:(id)a3 invalidationBlock:(id)a4;
+ (id)new;
- (BKSSimplerAssertion)init;
- (NSString)description;
- (void)dealloc;
- (void)invalidate;
@end

@implementation BKSSimplerAssertion

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationBlock, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)invalidate
{
  if ((atomic_exchange(&self->_invalid._Value, 1u) & 1) == 0)
  {
    (*((void (**)(void))self->_invalidationBlock + 2))();
    id invalidationBlock = self->_invalidationBlock;
    self->_id invalidationBlock = 0;
  }
}

- (NSString)description
{
  return self->_identifier;
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((atomic_exchange(&self->_invalid._Value, 1u) & 1) == 0)
  {
    v4 = [NSString stringWithFormat:@"Client code must invalidate <%@:%p> (%@) before dealloc", objc_opt_class(), self, self->_identifier];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v5 = NSStringFromSelector(a2);
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138544642;
      v10 = v5;
      __int16 v11 = 2114;
      v12 = v7;
      __int16 v13 = 2048;
      v14 = self;
      __int16 v15 = 2114;
      v16 = @"BKSSimplerAssertion.m";
      __int16 v17 = 1024;
      int v18 = 58;
      __int16 v19 = 2114;
      v20 = v4;
      _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18AA49550);
  }
  v8.receiver = self;
  v8.super_class = (Class)BKSSimplerAssertion;
  [(BKSSimplerAssertion *)&v8 dealloc];
}

- (BKSSimplerAssertion)init
{
  v4 = [NSString stringWithFormat:@"cannot -init"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    v16 = @"BKSSimplerAssertion.m";
    __int16 v17 = 1024;
    int v18 = 36;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (BKSSimplerAssertion *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)assertionWithDescription:(id)a3 invalidationBlock:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v7 = [BKSSimplerAssertion alloc];
  id v8 = v6;
  id v9 = v5;
  if (v7)
  {
    v34.receiver = v7;
    v34.super_class = (Class)BKSSimplerAssertion;
    v7 = objc_msgSendSuper2(&v34, sel_init);
    if (v7)
    {
      id v10 = v8;
      __int16 v11 = NSString;
      objc_opt_class();
      v12 = (objc_class *)objc_opt_class();
      if (!v10)
      {
        v16 = NSStringFromClass(v12);
        __int16 v17 = [v11 stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"string", v16];

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          int v18 = NSStringFromSelector(sel__initWithIdentifier_invalidationBlock_);
          __int16 v19 = (objc_class *)objc_opt_class();
          v20 = NSStringFromClass(v19);
          *(_DWORD *)buf = 138544642;
          v36 = v18;
          __int16 v37 = 2114;
          v38 = v20;
          __int16 v39 = 2048;
          v40 = v7;
          __int16 v41 = 2114;
          v42 = @"BKSSimplerAssertion.m";
          __int16 v43 = 1024;
          int v44 = 43;
          __int16 v45 = 2114;
          v46 = v17;
          _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v17 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18AA498B0);
      }
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v21 = NSString;
        v22 = (objc_class *)[v10 classForCoder];
        if (!v22) {
          v22 = (objc_class *)objc_opt_class();
        }
        v23 = NSStringFromClass(v22);
        objc_opt_class();
        v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        v26 = [v21 stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"string", v23, v25];

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v27 = NSStringFromSelector(sel__initWithIdentifier_invalidationBlock_);
          v28 = (objc_class *)objc_opt_class();
          v29 = NSStringFromClass(v28);
          *(_DWORD *)buf = 138544642;
          v36 = v27;
          __int16 v37 = 2114;
          v38 = v29;
          __int16 v39 = 2048;
          v40 = v7;
          __int16 v41 = 2114;
          v42 = @"BKSSimplerAssertion.m";
          __int16 v43 = 1024;
          int v44 = 43;
          __int16 v45 = 2114;
          v46 = v26;
          _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v26 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18AA499ECLL);
      }

      if (!v9)
      {
        v30 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"block != ((void *)0)"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v31 = NSStringFromSelector(sel__initWithIdentifier_invalidationBlock_);
          v32 = (objc_class *)objc_opt_class();
          v33 = NSStringFromClass(v32);
          *(_DWORD *)buf = 138544642;
          v36 = v31;
          __int16 v37 = 2114;
          v38 = v33;
          __int16 v39 = 2048;
          v40 = v7;
          __int16 v41 = 2114;
          v42 = @"BKSSimplerAssertion.m";
          __int16 v43 = 1024;
          int v44 = 44;
          __int16 v45 = 2114;
          v46 = v30;
          _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v30 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18AA49AE0);
      }
      objc_storeStrong((id *)&v7->_identifier, a3);
      uint64_t v13 = [v9 copy];
      id invalidationBlock = v7->_invalidationBlock;
      v7->_id invalidationBlock = (id)v13;
    }
  }

  return v7;
}

+ (id)new
{
  v4 = [NSString stringWithFormat:@"cannot +new"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    id v14 = a1;
    __int16 v15 = 2114;
    v16 = @"BKSSimplerAssertion.m";
    __int16 v17 = 1024;
    int v18 = 31;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

@end