@interface FBSceneClientHandshake
- (FBSceneClientHandshake)init;
- (FBSceneClientProcess)process;
- (NSSet)remnants;
- (RBSProcessHandle)handle;
- (id)_initWithHandle:(id)a3 remnants:(id)a4;
- (id)description;
@end

@implementation FBSceneClientHandshake

- (RBSProcessHandle)handle
{
  return [(_FBSceneClientProcess *)self->_process handle];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_process, 0);
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(_FBSceneClientProcess *)self->_process handle];
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p; %@ remnants=%i>",
    v4,
    self,
    v5,
  v6 = [(NSSet *)self->_remnants count]);

  return v6;
}

- (FBSceneClientProcess)process
{
  return (FBSceneClientProcess *)self->_process;
}

- (id)_initWithHandle:(id)a3 remnants:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  NSClassFromString(&cfstr_Rbsprocesshand.isa);
  if (!v8)
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneClientHandshake _initWithHandle:remnants:]();
    }
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6314AE0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:RBSProcessHandleClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneClientHandshake _initWithHandle:remnants:]();
    }
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6314B44);
  }

  id v9 = v7;
  NSClassFromString(&cfstr_Nsset.isa);
  if (!v9)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneClientHandshake _initWithHandle:remnants:]();
    }
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6314BA8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSSetClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
      -[FBSceneClientHandshake _initWithHandle:remnants:]();
    }
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A6314C0CLL);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v30 != v13) { {
          objc_enumerationMutation(v10);
        }
        }
        id v15 = *(id *)(*((void *)&v29 + 1) + 8 * v14);
        NSClassFromString(&cfstr_Fbsceneremnant.isa);
        if (!v15)
        {
          v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
            -[FBSceneClientHandshake _initWithHandle:remnants:]();
          }
          }
          [v22 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A6314A18);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSceneRemnantClass]"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
            -[FBSceneClientHandshake _initWithHandle:remnants:]();
          }
          }
          [v23 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1A6314A7CLL);
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v12);
  }

  v28.receiver = self;
  v28.super_class = (Class)FBSceneClientHandshake;
  v16 = [(FBSceneClientHandshake *)&v28 init];
  if (v16)
  {
    v17 = [[_FBSceneClientProcess alloc] _initWithHandle:v8];
    process = v16->_process;
    v16->_process = v17;

    uint64_t v19 = [v10 copy];
    remnants = v16->_remnants;
    v16->_remnants = (NSSet *)v19;
  }
  return v16;
}

- (NSSet)remnants
{
  return self->_remnants;
}

- (FBSceneClientHandshake)init
{
  uint64_t v4 = [NSString stringWithFormat:@"-init is not allowed on FBSceneClientHandshake"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    v16 = @"FBSceneClientHandshake.m";
    __int16 v17 = 1024;
    int v18 = 25;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (FBSceneClientHandshake *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)_initWithHandle:remnants:.cold.1()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithHandle:remnants:.cold.2()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithHandle:remnants:.cold.3()
{
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1A62FC000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end