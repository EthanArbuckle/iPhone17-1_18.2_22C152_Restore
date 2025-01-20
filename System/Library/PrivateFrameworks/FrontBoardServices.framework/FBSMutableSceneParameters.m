@interface FBSMutableSceneParameters
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setSpecification:(id)a3;
- (void)applyClientSettings:(id)a3;
- (void)applyParameters:(id)a3;
- (void)applySettings:(id)a3;
- (void)setDisplay:(id)a3;
- (void)setSettings:(id)a3;
- (void)updateClientSettingsWithBlock:(id)a3;
- (void)updateSettingsWithBlock:(id)a3;
@end

@implementation FBSMutableSceneParameters

- (void)setSettings:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FBSMutableSceneParameters;
  [(FBSSceneParameters *)&v8 setSettings:a3];
  v4 = [(FBSSceneParameters *)self settings];
  v5 = [v4 displayConfiguration];
  if (v5)
  {
  }
  else
  {
    displayConfiguration = self->_displayConfiguration;

    if (displayConfiguration)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __41__FBSMutableSceneParameters_setSettings___block_invoke;
      v7[3] = &unk_1E58F5D60;
      v7[4] = self;
      [(FBSMutableSceneParameters *)self updateSettingsWithBlock:v7];
    }
  }
}

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[FBSSceneParameters allocWithZone:a3];

  return [(FBSSceneParameters *)v4 initWithParameters:self];
}

uint64_t __41__FBSMutableSceneParameters_setSettings___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDisplayConfiguration:*(void *)(*(void *)(a1 + 32) + 32)];
}

- (void)_setSpecification:(id)a3
{
}

- (void)updateSettingsWithBlock:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)FBSMutableSceneParameters;
  [(FBSSceneParameters *)&v3 updateSettingsWithBlock:a3];
}

- (void)updateClientSettingsWithBlock:(id)a3
{
  if (a3)
  {
    v4 = (void (**)(id, id))a3;
    v5 = [(FBSSceneParameters *)self clientSettings];
    id v6 = (id)[v5 mutableCopy];

    v4[2](v4, v6);
    [(FBSSceneParameters *)self setClientSettings:v6];
  }
}

- (void)applySettings:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    NSClassFromString(&cfstr_Fbsscenesettin_0.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneSettingsClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSMutableSceneParameters applySettings:]();
      }
      [v5 UTF8String];
      _bs_set_crash_log_message();
    }

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__FBSMutableSceneParameters_applySettings___block_invoke;
    v6[3] = &unk_1E58F5D60;
    id v7 = v4;
    [(FBSMutableSceneParameters *)self updateSettingsWithBlock:v6];
  }
}

void __43__FBSMutableSceneParameters_applySettings___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)applyClientSettings:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    NSClassFromString(&cfstr_Fbssceneclient.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneClientSettingsClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSMutableSceneParameters applyClientSettings:]();
      }
      [v5 UTF8String];
      _bs_set_crash_log_message();
    }

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__FBSMutableSceneParameters_applyClientSettings___block_invoke;
    v6[3] = &unk_1E58F4FA0;
    id v7 = v4;
    [(FBSMutableSceneParameters *)self updateClientSettingsWithBlock:v6];
  }
}

void __49__FBSMutableSceneParameters_applyClientSettings___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)applyParameters:(id)a3
{
  id v8 = a3;
  uint64_t v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    id v7 = [NSString stringWithFormat:@"mismatched specifications"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSMutableSceneParameters applyParameters:]();
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
  }
  v5 = [v8 settings];
  [(FBSMutableSceneParameters *)self applySettings:v5];

  id v6 = [v8 clientSettings];
  [(FBSMutableSceneParameters *)self applyClientSettings:v6];
}

- (void)setDisplay:(id)a3
{
  id v3 = a3;
  BSEqualObjects();
}

uint64_t __40__FBSMutableSceneParameters_setDisplay___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDisplayConfiguration:*(void *)(*(void *)(a1 + 32) + 32)];
}

- (void)applySettings:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)applyClientSettings:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)applyParameters:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end