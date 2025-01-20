@interface FBSMutableSceneIdentity
- (id)copyWithZone:(_NSZone *)a3;
- (void)setIdentifier:(id)a3;
- (void)setInternalWorkspaceIdentifier:(id)a3;
- (void)setWorkspaceIdentifier:(id)a3;
@end

@implementation FBSMutableSceneIdentity

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setInternalWorkspaceIdentifier:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    NSClassFromString(&cfstr_Nsstring.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSMutableSceneIdentity setInternalWorkspaceIdentifier:]();
      }
      [v6 UTF8String];
      _bs_set_crash_log_message();
    }
  }

  v4 = (NSString *)[v7 copy];
  internalWorkspaceIdentifier = self->super._internalWorkspaceIdentifier;
  self->super._internalWorkspaceIdentifier = v4;
}

- (void)setIdentifier:(id)a3
{
  id v8 = a3;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v8)
  {
    v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSMutableSceneIdentity setIdentifier:]();
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSMutableSceneIdentity setIdentifier:]();
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
  }

  v4 = (NSString *)[v8 copy];
  identifier = self->super._identifier;
  self->super._identifier = v4;
}

- (void)setWorkspaceIdentifier:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    NSClassFromString(&cfstr_Nsstring.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSMutableSceneIdentity setWorkspaceIdentifier:]();
      }
      [v6 UTF8String];
      _bs_set_crash_log_message();
    }
  }

  v4 = (NSString *)[v7 copy];
  workspaceIdentifier = self->super._workspaceIdentifier;
  self->super._workspaceIdentifier = v4;
}

- (void)setIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setWorkspaceIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setInternalWorkspaceIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end