@interface BSMutableMachServiceAliases
+ (id)new;
- (void)setService:(id)a3 forAlias:(id)a4;
@end

@implementation BSMutableMachServiceAliases

+ (id)new
{
  v2 = [BSMutableMachServiceAliases alloc];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = -[BSMachServiceAliases _initWithAliases:encoded:mutable:]((id *)&v2->super.super.isa, v3, 0, 1);

  return v4;
}

- (void)setService:(id)a3 forAlias:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v6 = a4;
  if (self)
  {
    if (!self->super._mutable)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:sel__setService_forAlias_, self, @"BSMachServiceAliases.m", 91, @"cannot mutate an immutable : %@", self object file lineNumber description];
    }
    lock_encoded = (NSString *)v33;
    NSClassFromString(&cfstr_Nsstring.isa);
    if (!lock_encoded)
    {
      v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__setService_forAlias_);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        v17 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v17);
        *(_DWORD *)buf = 138544642;
        id v35 = v16;
        __int16 v36 = 2114;
        v37 = v18;
        __int16 v38 = 2048;
        v39 = self;
        __int16 v40 = 2114;
        v41 = @"BSMachServiceAliases.m";
        __int16 v42 = 1024;
        int v43 = 92;
        __int16 v44 = 2114;
        v45 = v15;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v15 UTF8String];
      __break(0);
      JUMPOUT(0x18AB1ACC8);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__setService_forAlias_);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        v22 = NSStringFromClass(v21);
        *(_DWORD *)buf = 138544642;
        id v35 = v20;
        __int16 v36 = 2114;
        v37 = v22;
        __int16 v38 = 2048;
        v39 = self;
        __int16 v40 = 2114;
        v41 = @"BSMachServiceAliases.m";
        __int16 v42 = 1024;
        int v43 = 92;
        __int16 v44 = 2114;
        v45 = v19;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v19 UTF8String];
      __break(0);
      JUMPOUT(0x18AB1ADCCLL);
    }

    id v8 = v6;
    NSClassFromString(&cfstr_Nsstring.isa);
    if (!v8)
    {
      v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__setService_forAlias_);
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        v25 = (objc_class *)objc_opt_class();
        v26 = NSStringFromClass(v25);
        *(_DWORD *)buf = 138544642;
        id v35 = v24;
        __int16 v36 = 2114;
        v37 = v26;
        __int16 v38 = 2048;
        v39 = self;
        __int16 v40 = 2114;
        v41 = @"BSMachServiceAliases.m";
        __int16 v42 = 1024;
        int v43 = 93;
        __int16 v44 = 2114;
        v45 = v23;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v23 UTF8String];
      __break(0);
      JUMPOUT(0x18AB1AED0);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel__setService_forAlias_);
        id v28 = (id)objc_claimAutoreleasedReturnValue();
        v29 = (objc_class *)objc_opt_class();
        v30 = NSStringFromClass(v29);
        *(_DWORD *)buf = 138544642;
        id v35 = v28;
        __int16 v36 = 2114;
        v37 = v30;
        __int16 v38 = 2048;
        v39 = self;
        __int16 v40 = 2114;
        v41 = @"BSMachServiceAliases.m";
        __int16 v42 = 1024;
        int v43 = 93;
        __int16 v44 = 2114;
        v45 = v27;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v27 UTF8String];
      __break(0);
      JUMPOUT(0x18AB1AFD4);
    }

    if (![(NSString *)lock_encoded length])
    {
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:sel__setService_forAlias_ object:self file:@"BSMachServiceAliases.m" lineNumber:94 description:@"machService cannot be empty"];
    }
    if (![v8 length])
    {
      v32 = [MEMORY[0x1E4F28B00] currentHandler];
      [v32 handleFailureInMethod:sel__setService_forAlias_ object:self file:@"BSMachServiceAliases.m" lineNumber:95 description:@"machService cannot be empty"];
    }
    os_unfair_lock_lock(&self->super._lock);
    uint64_t v9 = [(NSMutableDictionary *)self->super._lock_aliases objectForKey:v8];
    v10 = (void *)v9;
    if ((NSString *)v9 != lock_encoded)
    {
      if (v9)
      {
        char v11 = [(NSString *)lock_encoded isEqual:v9];

        if (v11) {
          goto LABEL_17;
        }
      }
      lock_aliases = self->super._lock_aliases;
      v13 = (void *)[(NSString *)lock_encoded copy];
      [(NSMutableDictionary *)lock_aliases setObject:v13 forKey:v8];

      lock_encoded = self->super._lock_encoded;
      self->super._lock_encoded = 0;
    }

LABEL_17:
    os_unfair_lock_unlock(&self->super._lock);
  }
}

@end