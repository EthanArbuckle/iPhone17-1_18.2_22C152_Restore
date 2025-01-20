@interface FBSWorkspaceSceneRemnant
+ (BOOL)supportsBSXPCSecureCoding;
- (FBSSceneIdentity)identity;
- (FBSSceneParameters)parameters;
- (FBSWorkspaceSceneRemnant)init;
- (FBSWorkspaceSceneRemnant)initWithBSXPCCoder:(id)a3;
- (id)_initWithIdentity:(id)a3 parameters:(id)a4;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation FBSWorkspaceSceneRemnant

- (FBSWorkspaceSceneRemnant)init
{
  v4 = [NSString stringWithFormat:@"-init is not allowed on FBSWorkspaceSceneRemnant"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v8 = 138544642;
    v9 = v5;
    __int16 v10 = 2114;
    v11 = v7;
    __int16 v12 = 2048;
    v13 = self;
    __int16 v14 = 2114;
    v15 = @"FBSWorkspaceSceneRemnant.m";
    __int16 v16 = 1024;
    int v17 = 25;
    __int16 v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_19C680000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
  }
  [v4 UTF8String];
  _bs_set_crash_log_message();
}

- (id)_initWithIdentity:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  NSClassFromString(&cfstr_Fbssceneidenti_0.isa);
  if (!v8)
  {
    int v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSWorkspaceSceneRemnant _initWithIdentity:parameters:]();
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __int16 v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneIdentityClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSWorkspaceSceneRemnant _initWithIdentity:parameters:]();
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
  }

  if (([v8 isValid] & 1) == 0)
  {
    v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[identity isValid]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSWorkspaceSceneRemnant _initWithIdentity:parameters:].cold.6();
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
  }
  v9 = [v8 internalWorkspaceIdentifier];
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v9)
  {
    v20 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSWorkspaceSceneRemnant _initWithIdentity:parameters:]();
    }
    [v20 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSWorkspaceSceneRemnant _initWithIdentity:parameters:]();
    }
    [v21 UTF8String];
    _bs_set_crash_log_message();
  }

  id v10 = v7;
  NSClassFromString(&cfstr_Fbssceneparame.isa);
  if (!v10)
  {
    v22 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSWorkspaceSceneRemnant _initWithIdentity:parameters:]();
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneParametersClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSWorkspaceSceneRemnant _initWithIdentity:parameters:]();
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
  }

  v24.receiver = self;
  v24.super_class = (Class)FBSWorkspaceSceneRemnant;
  v11 = [(FBSWorkspaceSceneRemnant *)&v24 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identity = v11->_identity;
    v11->_identity = (FBSSceneIdentity *)v12;

    uint64_t v14 = [v10 copy];
    parameters = v11->_parameters;
    v11->_parameters = (FBSSceneParameters *)v14;
  }
  return v11;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  identity = self->_identity;
  id v5 = a3;
  [v5 encodeObject:identity forKey:@"i"];
  [v5 encodeObject:self->_parameters forKey:@"p"];
}

- (FBSWorkspaceSceneRemnant)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FBSWorkspaceSceneRemnant;
  id v5 = [(FBSWorkspaceSceneRemnant *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"i"];
    identity = v5->_identity;
    v5->_identity = (FBSSceneIdentity *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"p"];
    parameters = v5->_parameters;
    v5->_parameters = (FBSSceneParameters *)v8;
  }
  return v5;
}

- (FBSSceneIdentity)identity
{
  return self->_identity;
}

- (FBSSceneParameters)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_identity, 0);
}

- (void)_initWithIdentity:parameters:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithIdentity:parameters:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithIdentity:parameters:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_initWithIdentity:parameters:.cold.6()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end