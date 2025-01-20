@interface FBWorkspaceEventDispatcherSource
- (FBWorkspaceEventDispatcherSource)init;
- (RBSProcessHandle)processHandle;
- (id)_initWithProcessHandle:(id)a3 underlyingAssertion:(id)a4;
- (id)consumeRemnantsPassingTest:(id)a3;
- (id)dequeueSceneRequestsForTargetIdentifier:(id)a3;
- (void)dealloc;
- (void)enqueueSceneRequest:(id)a3;
- (void)invalidate;
- (void)noteHandshakeWithRemnants:(id)a3;
@end

@implementation FBWorkspaceEventDispatcherSource

- (RBSProcessHandle)processHandle
{
  return self->_processHandle;
}

- (id)consumeRemnantsPassingTest:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"test"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcherSource consumeRemnantsPassingTest:]();
    }
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6314688);
  }
  v5 = (unsigned int (**)(void, void))v4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_remnants = self->_lock_remnants;
  if (!lock_remnants)
  {
    v17 = 0;
    goto LABEL_30;
  }
  v29 = self;
  v30 = &self->_lock;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v8 = lock_remnants;
  uint64_t v9 = [(NSSet *)v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v9)
  {
    v11 = 0;
    v12 = 0;
    goto LABEL_21;
  }
  uint64_t v10 = v9;
  v11 = 0;
  v12 = 0;
  uint64_t v13 = *(void *)v32;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v32 != v13) { {
        objc_enumerationMutation(v8);
      }
      }
      uint64_t v15 = *(void *)(*((void *)&v31 + 1) + 8 * i);
      if (v5[2](v5, v15))
      {
        if (v11)
        {
          v16 = v11;
LABEL_13:
          [v16 addObject:v15];
          continue;
        }
        v11 = [MEMORY[0x1E4F1CA80] setWithObject:v15];
      }
      else
      {
        if (v12)
        {
          v16 = v12;
          goto LABEL_13;
        }
        v12 = [MEMORY[0x1E4F1CA80] setWithObject:v15];
      }
    }
    uint64_t v10 = [(NSSet *)v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
  }
  while (v10);
LABEL_21:

  v18 = (void *)[v12 copy];
  v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    id v20 = [MEMORY[0x1E4F1CAD0] set];
  }
  v21 = v20;
  p_lock = v30;

  if ((BSEqualObjects() & 1) == 0)
  {
    uint64_t v22 = [v21 copy];
    v23 = v29->_lock_remnants;
    v29->_lock_remnants = (NSSet *)v22;
  }
  v24 = (void *)[v11 copy];
  v25 = v24;
  if (v24)
  {
    id v26 = v24;
  }
  else
  {
    id v26 = [MEMORY[0x1E4F1CAD0] set];
  }
  v17 = v26;

LABEL_30:
  os_unfair_lock_unlock(p_lock);

  return v17;
}

- (void)noteHandshakeWithRemnants:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    NSClassFromString(&cfstr_Nsset.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSSetClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        -[FBWorkspaceEventDispatcherSource noteHandshakeWithRemnants:].cold.4();
      }
      }
      [v16 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1A6315210);
    }
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) { {
          objc_enumerationMutation(v5);
        }
        }
        id v10 = *(id *)(*((void *)&v17 + 1) + 8 * v9);
        NSClassFromString(&cfstr_Fbsceneremnant.isa);
        if (!v10)
        {
          uint64_t v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
            -[FBWorkspaceEventDispatcherSource noteHandshakeWithRemnants:]();
          }
          }
          [v13 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A63150F0);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSceneRemnantClass]"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
            -[FBWorkspaceEventDispatcherSource noteHandshakeWithRemnants:]();
          }
          }
          [v14 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A6315154);
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_remnants)
  {
    uint64_t v15 = [NSString stringWithFormat:@"double handshake detected"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcherSource noteHandshakeWithRemnants:]();
    }
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63151ACLL);
  }
  v11 = (NSSet *)[v5 copy];
  lock_remnants = self->_lock_remnants;
  self->_lock_remnants = v11;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)_initWithProcessHandle:(id)a3 underlyingAssertion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  NSClassFromString(&cfstr_Rbsprocesshand.isa);
  if (!v9)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcherSource _initWithProcessHandle:underlyingAssertion:]();
    }
    }
LABEL_23:
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6315940);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:RBSProcessHandleClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcherSource _initWithProcessHandle:underlyingAssertion:]();
    }
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63159A4);
  }

  if ((int)objc_msgSend(v9, "rbs_pid") <= 0)
  {
    v16 = [NSString stringWithFormat:@"invalid pid on handle=%@", v9];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcherSource _initWithProcessHandle:underlyingAssertion:]();
    }
    }
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6315A00);
  }
  id v10 = v8;
  NSClassFromString(&cfstr_Bssimpleassert.isa);
  if (!v10)
  {
    long long v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcherSource _initWithProcessHandle:underlyingAssertion:]();
    }
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6315A64);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:BSSimpleAssertionClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcherSource _initWithProcessHandle:underlyingAssertion:]();
    }
    }
    goto LABEL_23;
  }

  v18.receiver = self;
  v18.super_class = (Class)FBWorkspaceEventDispatcherSource;
  v11 = [(FBWorkspaceEventDispatcherSource *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_processHandle, a3);
    objc_storeStrong((id *)&v12->_underlyingAssertion, a4);
    v12->_lock._os_unfair_lock_opaque = 0;
  }

  return v12;
}

- (void)dealloc
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)enqueueSceneRequest:(id)a3
{
  id v14 = a3;
  NSClassFromString(&cfstr_Fbworkspacesce.isa);
  if (!v14)
  {
    v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcherSource enqueueSceneRequest:]();
    }
    }
LABEL_24:
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A636178CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBWorkspaceSceneRequestClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcherSource enqueueSceneRequest:]();
    }
    }
    [v12 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63617F0);
  }

  uint64_t v4 = [v14 targetIdentifier];
  if (!v4)
  {
    uint64_t v13 = [NSString stringWithFormat:@"missing targetIdentifier in request : %@", v14];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcherSource enqueueSceneRequest:]();
    }
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6361850);
  }
  uint64_t v5 = (void *)v4;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_remnants)
  {
    v11 = [NSString stringWithFormat:@"attempt to enqueue scene request before handshake"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcherSource enqueueSceneRequest:]();
    }
    }
    goto LABEL_24;
  }
  uint64_t v6 = [(NSMutableDictionary *)self->_lock_requestsByTargetIdentifier objectForKey:v5];
  if (v6)
  {
    uint64_t v7 = v6;
    [v6 addObject:v14];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] arrayWithObject:v14];
    lock_requestsByTargetIdentifier = self->_lock_requestsByTargetIdentifier;
    if (lock_requestsByTargetIdentifier)
    {
      [(NSMutableDictionary *)lock_requestsByTargetIdentifier setObject:v7 forKey:v5];
    }
    else
    {
      uint8_t v9 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v7 forKey:v5];
      id v10 = self->_lock_requestsByTargetIdentifier;
      self->_lock_requestsByTargetIdentifier = v9;
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (id)dequeueSceneRequestsForTargetIdentifier:(id)a3
{
  id v4 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v4)
  {
    uint8_t v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcherSource dequeueSceneRequestsForTargetIdentifier:]();
    }
    }
LABEL_15:
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A63619E0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint8_t v9 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBWorkspaceEventDispatcherSource dequeueSceneRequestsForTargetIdentifier:]();
    }
    }
    goto LABEL_15;
  }

  os_unfair_lock_lock(&self->_lock);
  uint64_t v5 = [(NSMutableDictionary *)self->_lock_requestsByTargetIdentifier objectForKey:v4];
  if (v5)
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_lock_requestsByTargetIdentifier count];
    lock_requestsByTargetIdentifier = self->_lock_requestsByTargetIdentifier;
    if (v6 == 1)
    {
      self->_lock_requestsByTargetIdentifier = 0;
    }
    else
    {
      [(NSMutableDictionary *)lock_requestsByTargetIdentifier removeObjectForKey:v4];
    }
  }
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (FBWorkspaceEventDispatcherSource)init
{
  id v4 = [NSString stringWithFormat:@"init is not allowed on FBWorkspaceEventDispatcherSource"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2114;
    v16 = @"FBWorkspaceEventDispatcherSource.m";
    __int16 v17 = 1024;
    int v18 = 136;
    __int16 v19 = 2114;
    long long v20 = v4;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (FBWorkspaceEventDispatcherSource *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)invalidate
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  [(BSSimpleAssertion *)self->_underlyingAssertion invalidate];
  os_unfair_lock_lock(&self->_lock);
  v3 = self->_lock_remnants;
  lock_remnants = self->_lock_remnants;
  self->_lock_remnants = 0;

  uint64_t v5 = self->_lock_requestsByTargetIdentifier;
  lock_requestsByTargetIdentifier = self->_lock_requestsByTargetIdentifier;
  self->_lock_requestsByTargetIdentifier = 0;

  os_unfair_lock_unlock(&self->_lock);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v7 = v3;
  uint64_t v8 = [(NSSet *)v7 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v35 != v10) { {
          objc_enumerationMutation(v7);
        }
        }
        [*(id *)(*((void *)&v34 + 1) + 8 * i) invalidate];
      }
      uint64_t v9 = [(NSSet *)v7 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v9);
  }
  v24 = v7;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = [(NSMutableDictionary *)v5 objectEnumerator];
  uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v31 != v14) { {
          objc_enumerationMutation(obj);
        }
        }
        v16 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v38 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v27;
          do
          {
            for (uint64_t k = 0; k != v19; ++k)
            {
              if (*(void *)v27 != v20) { {
                objc_enumerationMutation(v17);
              }
              }
              uint64_t v22 = *(void **)(*((void *)&v26 + 1) + 8 * k);
              v23 = FBSWorkspaceErrorCreate();
              [v22 invalidateWithError:v23];
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v38 count:16];
          }
          while (v19);
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v13);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processHandle, 0);
}

- (void)_initWithProcessHandle:underlyingAssertion:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithProcessHandle:underlyingAssertion:.cold.2()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithProcessHandle:underlyingAssertion:.cold.3()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)noteHandshakeWithRemnants:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)noteHandshakeWithRemnants:.cold.2()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)noteHandshakeWithRemnants:.cold.4()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)consumeRemnantsPassingTest:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)enqueueSceneRequest:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)enqueueSceneRequest:.cold.2()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)enqueueSceneRequest:.cold.3()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)dequeueSceneRequestsForTargetIdentifier:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end