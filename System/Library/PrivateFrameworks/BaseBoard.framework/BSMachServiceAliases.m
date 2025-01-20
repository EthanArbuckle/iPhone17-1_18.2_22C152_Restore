@interface BSMachServiceAliases
+ (id)environmentAliases;
- (BOOL)isEqual:(id)a3;
- (BSMachServiceAliases)init;
- (NSDictionary)environmentRepresentation;
- (id)_initWithAliases:(void *)a3 encoded:(char)a4 mutable:;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)resolveMachService:(id)a3;
- (unint64_t)hash;
@end

@implementation BSMachServiceAliases

void __42__BSMachServiceAliases_environmentAliases__block_invoke()
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v23 = [MEMORY[0x1E4F28F80] processInfo];
  id v21 = [v23 environment];
  uint64_t v0 = self;
  id v24 = v21;
  NSClassFromString(&cfstr_Nsdictionary.isa);
  if (!v24)
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__aliasesFromEnvironmentRepresentation_);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138544642;
      id v30 = v14;
      __int16 v31 = 2114;
      v32 = v16;
      __int16 v33 = 2048;
      uint64_t v34 = v0;
      __int16 v35 = 2114;
      v36 = @"BSMachServiceAliases.m";
      __int16 v37 = 1024;
      int v38 = 70;
      __int16 v39 = 2114;
      v40 = v13;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v13 UTF8String];
    __break(0);
    JUMPOUT(0x18AAC7CB4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSDictionaryClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__aliasesFromEnvironmentRepresentation_);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138544642;
      id v30 = v18;
      __int16 v31 = 2114;
      v32 = v20;
      __int16 v33 = 2048;
      uint64_t v34 = v0;
      __int16 v35 = 2114;
      v36 = @"BSMachServiceAliases.m";
      __int16 v37 = 1024;
      int v38 = 70;
      __int16 v39 = 2114;
      v40 = v17;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v17 UTF8String];
    __break(0);
    JUMPOUT(0x18AAC7DB8);
  }

  v1 = [MEMORY[0x1E4F1CA60] dictionary];
  v22 = objc_msgSend(v24, "bs_safeStringForKey:", @"BSMachServiceAliases");
  if (v22)
  {
    [v22 componentsSeparatedByString:@","];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:buf count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v26 != v4) {
            objc_enumerationMutation(v2);
          }
          v6 = [*(id *)(*((void *)&v25 + 1) + 8 * i) componentsSeparatedByString:@":"];
          if ([v6 count] == 2)
          {
            v7 = [v6 objectAtIndex:0];
            v8 = [v7 stringByRemovingPercentEncoding];

            v9 = [v6 objectAtIndex:1];
            v10 = [v9 stringByRemovingPercentEncoding];

            if ([v8 length] && objc_msgSend(v10, "length")) {
              [v1 setObject:v10 forKey:v8];
            }
          }
        }
        uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:buf count:16];
      }
      while (v3);
    }
  }
  v11 = -[BSMachServiceAliases _initWithAliases:encoded:mutable:]((id *)[BSMachServiceAliases alloc], v1, v22, 0);

  v12 = (void *)_MergedGlobals_16;
  _MergedGlobals_16 = (uint64_t)v11;
}

- (id)_initWithAliases:(void *)a3 encoded:(char)a4 mutable:
{
  id v8 = a2;
  id v9 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)BSMachServiceAliases;
    v10 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v10;
    if (v10)
    {
      *((_DWORD *)v10 + 6) = 0;
      objc_storeStrong(v10 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      *((unsigned char *)a1 + 28) = a4;
    }
  }

  return a1;
}

+ (id)environmentAliases
{
  if (qword_1EB21B178 != -1) {
    dispatch_once(&qword_1EB21B178, &__block_literal_global_14);
  }
  id v2 = (void *)_MergedGlobals_16;
  return v2;
}

- (id)resolveMachService:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v5)
  {
    v10 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_super v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138544642;
      id v19 = v11;
      __int16 v20 = 2114;
      id v21 = v13;
      __int16 v22 = 2048;
      id v23 = self;
      __int16 v24 = 2114;
      long long v25 = @"BSMachServiceAliases.m";
      __int16 v26 = 1024;
      int v27 = 106;
      __int16 v28 = 2114;
      v29 = v10;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v10 UTF8String];
    __break(0);
    JUMPOUT(0x18AAEADF8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138544642;
      id v19 = v15;
      __int16 v20 = 2114;
      id v21 = v17;
      __int16 v22 = 2048;
      id v23 = self;
      __int16 v24 = 2114;
      long long v25 = @"BSMachServiceAliases.m";
      __int16 v26 = 1024;
      int v27 = 106;
      __int16 v28 = 2114;
      v29 = v14;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v14 UTF8String];
    __break(0);
    JUMPOUT(0x18AAEAEFCLL);
  }

  if (self->_mutable) {
    os_unfair_lock_lock(&self->_lock);
  }
  v6 = [(NSMutableDictionary *)self->_lock_aliases objectForKey:v5];
  if (self->_mutable) {
    os_unfair_lock_unlock(&self->_lock);
  }
  if (v6) {
    v7 = v6;
  }
  else {
    v7 = v5;
  }
  id v8 = v7;

  return v8;
}

- (NSDictionary)environmentRepresentation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_lock_encoded;
  if (v4)
  {
    os_unfair_lock_unlock(p_lock);
LABEL_3:
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v4 forKey:@"BSMachServiceAliases"];

    goto LABEL_9;
  }
  if ([(NSMutableDictionary *)self->_lock_aliases count])
  {
    self;
    v6 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"+-.0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~"];
    v7 = [MEMORY[0x1E4F1CA48] array];
    lock_aliases = self->_lock_aliases;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __49__BSMachServiceAliases_environmentRepresentation__block_invoke;
    id v18 = &unk_1E5446030;
    id v9 = v7;
    id v19 = v9;
    id v10 = v6;
    id v20 = v10;
    [(NSMutableDictionary *)lock_aliases enumerateKeysAndObjectsUsingBlock:&v15];
    objc_msgSend(v9, "componentsJoinedByString:", @",", v15, v16, v17, v18);
    id v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    lock_encoded = self->_lock_encoded;
    self->_lock_encoded = v11;

    v13 = v11;
    os_unfair_lock_unlock(p_lock);
    uint64_t v4 = v13;
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
  id v5 = (void *)MEMORY[0x1E4F1CC08];
LABEL_9:
  return (NSDictionary *)v5;
}

- (BSMachServiceAliases)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"BSMachServiceAliases.m" lineNumber:26 description:@"-init is not allowed on BSMachServiceAliases"];

  return 0;
}

void __49__BSMachServiceAliases_environmentRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = NSString;
  v6 = *(void **)(a1 + 32);
  v7 = [a2 stringByAddingPercentEncodingWithAllowedCharacters:*(void *)(a1 + 40)];
  id v8 = [v10 stringByAddingPercentEncodingWithAllowedCharacters:*(void *)(a1 + 40)];
  id v9 = [v5 stringWithFormat:@"%@:%@", v7, v8];
  [v6 addObject:v9];
}

- (id)copy
{
  return [(BSMachServiceAliases *)self copyWithZone:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->_mutable)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v5 = [BSMutableMachServiceAliases alloc];
    v6 = (void *)[(NSMutableDictionary *)self->_lock_aliases mutableCopy];
    v7 = -[BSMachServiceAliases _initWithAliases:encoded:mutable:]((id *)&v5->super.super.isa, v6, self->_lock_encoded, 0);

    os_unfair_lock_unlock(p_lock);
    return v7;
  }
  else
  {
    return self;
  }
}

- (id)mutableCopy
{
  return [(BSMachServiceAliases *)self mutableCopyWithZone:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  if (self->_mutable) {
    os_unfair_lock_lock(&self->_lock);
  }
  uint64_t v4 = [BSMutableMachServiceAliases alloc];
  id v5 = (void *)[(NSMutableDictionary *)self->_lock_aliases mutableCopy];
  v6 = -[BSMachServiceAliases _initWithAliases:encoded:mutable:]((id *)&v4->super.super.isa, v5, self->_lock_encoded, 1);

  if (self->_mutable) {
    os_unfair_lock_unlock(&self->_lock);
  }
  return v6;
}

- (unint64_t)hash
{
  if (self->_mutable) {
    os_unfair_lock_lock(&self->_lock);
  }
  unint64_t v3 = [(NSMutableDictionary *)self->_lock_aliases hash];
  if (self->_mutable) {
    os_unfair_lock_unlock(&self->_lock);
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (BSMachServiceAliases *)a3;
  if (self == v4)
  {
    char v6 = 1;
    goto LABEL_22;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class() && v5 != objc_opt_class())
  {
    char v6 = 0;
    goto LABEL_22;
  }
  if (self >= v4)
  {
    if (v4->_mutable) {
      os_unfair_lock_lock(&v4->_lock);
    }
    if (self->_mutable) {
      os_unfair_lock_lock(&self->_lock);
    }
    char v6 = BSEqualDictionaries((CFDictionaryRef)self->_lock_aliases, (const __CFDictionary *)v4->_lock_aliases);
    if (v4->_mutable) {
      os_unfair_lock_unlock(&v4->_lock);
    }
    if (self->_mutable) {
      goto LABEL_23;
    }
  }
  else
  {
    if (self->_mutable) {
      os_unfair_lock_lock(&self->_lock);
    }
    if (v4->_mutable) {
      os_unfair_lock_lock(&v4->_lock);
    }
    char v6 = BSEqualDictionaries((CFDictionaryRef)self->_lock_aliases, (const __CFDictionary *)v4->_lock_aliases);
    if (self->_mutable) {
      os_unfair_lock_unlock(&self->_lock);
    }
    self = v4;
    if (v4->_mutable) {
LABEL_23:
    }
      os_unfair_lock_unlock(&self->_lock);
  }
LABEL_22:

  return v6;
}

- (id)description
{
  if (self->_mutable) {
    os_unfair_lock_lock(&self->_lock);
  }
  unint64_t v3 = [NSString stringWithFormat:@"<%@:%p> %@", objc_opt_class(), self, self->_lock_aliases];
  if (self->_mutable) {
    os_unfair_lock_unlock(&self->_lock);
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_encoded, 0);
  objc_storeStrong((id *)&self->_lock_aliases, 0);
}

@end