@interface _BSErrorConfiguration
- (_BSErrorConfiguration)init;
- (void)_setObject:(void *)a3 forKey:;
- (void)initWithDomain:(uint64_t)a3 code:;
- (void)setCodeDescription:(id)a3;
- (void)setFailureDescription:(id)a3;
- (void)setFailureReason:(id)a3;
- (void)setUnderlyingError:(id)a3;
- (void)setUnderlyingErrors:(id)a3;
- (void)setUserInfoValue:(id)a3 forKey:(id)a4;
@end

@implementation _BSErrorConfiguration

- (void)setFailureReason:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    NSClassFromString(&cfstr_Nsstring.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        v10 = (objc_class *)objc_opt_class();
        v11 = NSStringFromClass(v10);
        *(_DWORD *)buf = 138544642;
        *(void *)&buf[4] = v9;
        __int16 v13 = 2114;
        v14 = v11;
        __int16 v15 = 2048;
        v16 = self;
        __int16 v17 = 2114;
        v18 = @"NSError+BaseBoard.m";
        __int16 v19 = 1024;
        int v20 = 66;
        __int16 v21 = 2114;
        v22 = v8;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v8 UTF8String];
      __break(0);
      JUMPOUT(0x18AAF9338);
    }

    *(void *)buf = &v24;
    uint64_t v6 = [[NSString alloc] initWithFormat:v5 arguments:&v24];

    id v5 = (id)v6;
  }
  v7 = (void *)[v5 copy];
  -[_BSErrorConfiguration _setObject:forKey:]((uint64_t)self, v7, (void *)*MEMORY[0x1E4F28588]);
}

- (void)setFailureDescription:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (v10)
  {
    NSClassFromString(&cfstr_Nsstring.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        v8 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v8);
        *(_DWORD *)buf = 138544642;
        id v12 = v7;
        __int16 v13 = 2114;
        v14 = v9;
        __int16 v15 = 2048;
        v16 = self;
        __int16 v17 = 2114;
        v18 = @"NSError+BaseBoard.m";
        __int16 v19 = 1024;
        int v20 = 61;
        __int16 v21 = 2114;
        v22 = v6;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v6 UTF8String];
      __break(0);
      JUMPOUT(0x18AAF9564);
    }
  }

  id v5 = (void *)[v10 copy];
  -[_BSErrorConfiguration _setObject:forKey:]((uint64_t)self, v5, (void *)*MEMORY[0x1E4F28578]);
}

- (void)setCodeDescription:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (v10)
  {
    NSClassFromString(&cfstr_Nsstring.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        v8 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v8);
        *(_DWORD *)buf = 138544642;
        id v12 = v7;
        __int16 v13 = 2114;
        v14 = v9;
        __int16 v15 = 2048;
        v16 = self;
        __int16 v17 = 2114;
        v18 = @"NSError+BaseBoard.m";
        __int16 v19 = 1024;
        int v20 = 103;
        __int16 v21 = 2114;
        v22 = v6;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v6 UTF8String];
      __break(0);
      JUMPOUT(0x18AAF9794);
    }
  }

  id v5 = (void *)[v10 copy];
  -[_BSErrorConfiguration _setObject:forKey:]((uint64_t)self, v5, @"BSErrorCodeDescription");
}

- (void)initWithDomain:(uint64_t)a3 code:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    id v7 = v5;
    NSClassFromString(&cfstr_Nsstring.isa);
    if (!v7)
    {
      v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_initWithDomain_code_);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        v16 = (objc_class *)objc_opt_class();
        __int16 v17 = NSStringFromClass(v16);
        *(_DWORD *)buf = 138544642;
        id v24 = v15;
        __int16 v25 = 2114;
        v26 = v17;
        __int16 v27 = 2048;
        v28 = a1;
        __int16 v29 = 2114;
        v30 = @"NSError+BaseBoard.m";
        __int16 v31 = 1024;
        int v32 = 36;
        __int16 v33 = 2114;
        v34 = v14;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v14 UTF8String];
      __break(0);
      JUMPOUT(0x18AAF9A04);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_initWithDomain_code_);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        int v20 = (objc_class *)objc_opt_class();
        __int16 v21 = NSStringFromClass(v20);
        *(_DWORD *)buf = 138544642;
        id v24 = v19;
        __int16 v25 = 2114;
        v26 = v21;
        __int16 v27 = 2048;
        v28 = a1;
        __int16 v29 = 2114;
        v30 = @"NSError+BaseBoard.m";
        __int16 v31 = 1024;
        int v32 = 36;
        __int16 v33 = 2114;
        v34 = v18;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v18 UTF8String];
      __break(0);
      JUMPOUT(0x18AAF9B08);
    }

    v22.receiver = a1;
    v22.super_class = (Class)_BSErrorConfiguration;
    v8 = objc_msgSendSuper2(&v22, sel_init);
    if (v8)
    {
      uint64_t v9 = [v7 copy];
      id v10 = (void *)v8[1];
      v8[1] = v9;

      v8[2] = a3;
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v12 = (void *)v8[3];
      v8[3] = v11;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_setObject:(void *)a3 forKey:
{
  id v7 = a2;
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = *(void **)(a1 + 24);
    if (v7) {
      [v6 setObject:v7 forKey:v5];
    }
    else {
      [v6 removeObjectForKey:v5];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

- (_BSErrorConfiguration)init
{
  return (_BSErrorConfiguration *)-[_BSErrorConfiguration initWithDomain:code:](self, 0, 0);
}

- (void)setUserInfoValue:(id)a3 forKey:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v7 = a4;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v7)
  {
    id v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      id v12 = (objc_class *)objc_opt_class();
      __int16 v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138544642;
      id v27 = v11;
      __int16 v28 = 2114;
      __int16 v29 = v13;
      __int16 v30 = 2048;
      __int16 v31 = self;
      __int16 v32 = 2114;
      __int16 v33 = @"NSError+BaseBoard.m";
      __int16 v34 = 1024;
      int v35 = 79;
      __int16 v36 = 2114;
      v37 = v10;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v10 UTF8String];
    __break(0);
    JUMPOUT(0x18AB25F78);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      __int16 v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138544642;
      id v27 = v15;
      __int16 v28 = 2114;
      __int16 v29 = v17;
      __int16 v30 = 2048;
      __int16 v31 = self;
      __int16 v32 = 2114;
      __int16 v33 = @"NSError+BaseBoard.m";
      __int16 v34 = 1024;
      int v35 = 79;
      __int16 v36 = 2114;
      v37 = v14;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v14 UTF8String];
    __break(0);
    JUMPOUT(0x18AB2607CLL);
  }

  v8 = v25;
  if (v25)
  {
    char v9 = [(id)objc_opt_class() supportsSecureCoding];
    v8 = v25;
    if ((v9 & 1) == 0)
    {
      v18 = NSString;
      id v19 = (objc_class *)objc_opt_class();
      int v20 = NSStringFromClass(v19);
      __int16 v21 = [v18 stringWithFormat:@"%@ does not support secure coding. Putting this object in an error is a bad idea", v20];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v23 = (objc_class *)objc_opt_class();
        id v24 = NSStringFromClass(v23);
        *(_DWORD *)buf = 138544642;
        id v27 = v22;
        __int16 v28 = 2114;
        __int16 v29 = v24;
        __int16 v30 = 2048;
        __int16 v31 = self;
        __int16 v32 = 2114;
        __int16 v33 = @"NSError+BaseBoard.m";
        __int16 v34 = 1024;
        int v35 = 81;
        __int16 v36 = 2114;
        v37 = v21;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v21 UTF8String];
      __break(0);
      JUMPOUT(0x18AB26194);
    }
  }
  -[_BSErrorConfiguration _setObject:forKey:]((uint64_t)self, v8, v7);
}

- (void)setUnderlyingError:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (v9)
  {
    NSClassFromString(&cfstr_Nserror.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSErrorClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v6 = (id)objc_claimAutoreleasedReturnValue();
        id v7 = (objc_class *)objc_opt_class();
        v8 = NSStringFromClass(v7);
        *(_DWORD *)buf = 138544642;
        id v11 = v6;
        __int16 v12 = 2114;
        __int16 v13 = v8;
        __int16 v14 = 2048;
        id v15 = self;
        __int16 v16 = 2114;
        __int16 v17 = @"NSError+BaseBoard.m";
        __int16 v18 = 1024;
        int v19 = 87;
        __int16 v20 = 2114;
        __int16 v21 = v5;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v5 UTF8String];
      __break(0);
      JUMPOUT(0x18AB263FCLL);
    }
  }

  -[_BSErrorConfiguration _setObject:forKey:]((uint64_t)self, v9, (void *)*MEMORY[0x1E4F28A50]);
}

- (void)setUnderlyingErrors:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    NSClassFromString(&cfstr_Nsarray.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSArrayClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v21 = (objc_class *)objc_opt_class();
        uint64_t v22 = NSStringFromClass(v21);
        *(_DWORD *)buf = 138544642;
        id v29 = v20;
        __int16 v30 = 2114;
        __int16 v31 = v22;
        __int16 v32 = 2048;
        __int16 v33 = self;
        __int16 v34 = 2114;
        int v35 = @"NSError+BaseBoard.m";
        __int16 v36 = 1024;
        int v37 = 92;
        __int16 v38 = 2114;
        v39 = v19;
        _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      qword_1E911F420 = [v19 UTF8String];
      __break(0);
      JUMPOUT(0x18AB268E8);
    }
  }

  if (![v5 count])
  {

    id v5 = 0;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(id *)(*((void *)&v23 + 1) + 8 * v9);
        NSClassFromString(&cfstr_Nserror.isa);
        if (!v10)
        {
          id v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            id v12 = (id)objc_claimAutoreleasedReturnValue();
            __int16 v13 = (objc_class *)objc_opt_class();
            __int16 v14 = NSStringFromClass(v13);
            *(_DWORD *)buf = 138544642;
            id v29 = v12;
            __int16 v30 = 2114;
            __int16 v31 = v14;
            __int16 v32 = 2048;
            __int16 v33 = self;
            __int16 v34 = 2114;
            int v35 = @"NSError+BaseBoard.m";
            __int16 v36 = 1024;
            int v37 = 97;
            __int16 v38 = 2114;
            v39 = v11;
            _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          qword_1E911F420 = [v11 UTF8String];
          __break(0);
          JUMPOUT(0x18AB266E0);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSErrorClass]"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            id v16 = (id)objc_claimAutoreleasedReturnValue();
            __int16 v17 = (objc_class *)objc_opt_class();
            __int16 v18 = NSStringFromClass(v17);
            *(_DWORD *)buf = 138544642;
            id v29 = v16;
            __int16 v30 = 2114;
            __int16 v31 = v18;
            __int16 v32 = 2048;
            __int16 v33 = self;
            __int16 v34 = 2114;
            int v35 = @"NSError+BaseBoard.m";
            __int16 v36 = 1024;
            int v37 = 97;
            __int16 v38 = 2114;
            v39 = v15;
            _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
          }
          qword_1E911F420 = [v15 UTF8String];
          __break(0);
          JUMPOUT(0x18AB267E4);
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }

  -[_BSErrorConfiguration _setObject:forKey:]((uint64_t)self, v6, (void *)*MEMORY[0x1E4F28750]);
}

@end