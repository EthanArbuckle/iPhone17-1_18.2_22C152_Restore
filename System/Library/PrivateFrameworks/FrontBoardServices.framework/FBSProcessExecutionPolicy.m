@interface FBSProcessExecutionPolicy
+ (id)policyForStrategy:(id)a3 withProvisions:(id)a4;
- (FBSProcessExecutionStrategy)strategy;
- (NSArray)provisions;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setProvisions:(id)a3;
- (void)setStrategy:(id)a3;
@end

@implementation FBSProcessExecutionPolicy

+ (id)policyForStrategy:(id)a3 withProvisions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  NSClassFromString(&cfstr_Fbsprocessexec_2.isa);
  if (!v9)
  {
    v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSProcessExecutionPolicy policyForStrategy:withProvisions:](a2);
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSProcessExecutionStrategyClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[FBSProcessExecutionPolicy policyForStrategy:withProvisions:](a2);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
  }

  id v10 = v8;
  if (v10)
  {
    NSClassFromString(&cfstr_Nsarray.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSArrayClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        +[FBSProcessExecutionPolicy policyForStrategy:withProvisions:](a2);
      }
      [v15 UTF8String];
      _bs_set_crash_log_message();
    }
  }

  id v11 = objc_alloc_init((Class)a1);
  [v11 setStrategy:v9];
  [v11 setProvisions:v10];

  return v11;
}

- (void)setProvisions:(id)a3
{
  if (self->_provisions != a3)
  {
    v4 = (objc_class *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    v6 = (NSArray *)[[v4 alloc] initWithArray:v5 copyItems:1];

    provisions = self->_provisions;
    self->_provisions = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)description
{
  return (NSString *)[(FBSProcessExecutionPolicy *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(FBSProcessExecutionPolicy *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[off_1E58F44F0 builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(FBSProcessExecutionPolicy *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSProcessExecutionPolicy *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__FBSProcessExecutionPolicy_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E58F4AB0;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __67__FBSProcessExecutionPolicy_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) strategy];
  id v4 = (id)[v2 appendObject:v3 withName:@"strategy"];

  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) provisions];
  [v5 appendArraySection:v6 withName:@"provisions" skipIfEmpty:1];
}

- (FBSProcessExecutionStrategy)strategy
{
  return self->_strategy;
}

- (void)setStrategy:(id)a3
{
}

- (NSArray)provisions
{
  return self->_provisions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisions, 0);

  objc_storeStrong((id *)&self->_strategy, 0);
}

+ (void)policyForStrategy:(const char *)a1 withProvisions:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)policyForStrategy:(const char *)a1 withProvisions:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end