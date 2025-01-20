@interface FBSSettingsDiffInspector
- (FBSSettingsDiffInspector)init;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_observeSetting:(void *)a3 withBlock:;
- (void)dealloc;
- (void)inspectDiff:(id)a3 withContext:(void *)a4;
- (void)observeOtherSetting:(unint64_t)a3 withBlock:(id)a4;
- (void)observeProperty:(SEL)a3 withBlock:(id)a4;
- (void)observeSetting:(id)a3 withBlock:(id)a4;
- (void)removeAllObservers;
@end

@implementation FBSSettingsDiffInspector

void __52__FBSSettingsDiffInspector_inspectDiff_withContext___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:a2];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __52__FBSSettingsDiffInspector_inspectDiff_withContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForSetting:a2];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v7 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)inspectDiff:(id)a3 withContext:(void *)a4
{
  id v6 = a3;
  if (self->_iteratingObservers)
  {
    long long v8 = [NSString stringWithFormat:@"can't start iterating in the middle of an iteration"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSSettingsDiffInspector inspectDiff:withContext:]();
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
  }
  long long v7 = v6;
  self->_iteratingObservers = 1;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__FBSSettingsDiffInspector_inspectDiff_withContext___block_invoke;
  v10[3] = &unk_1E58F6190;
  v10[4] = self;
  v10[5] = a4;
  [v6 inspectChangesWithBlock:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__FBSSettingsDiffInspector_inspectDiff_withContext___block_invoke_2;
  v9[3] = &unk_1E58F61B8;
  v9[4] = self;
  v9[5] = a4;
  [v7 inspectOtherChangesWithBlock:v9];
  self->_iteratingObservers = 0;
}

- (void)observeSetting:(id)a3 withBlock:(id)a4
{
}

- (void)_observeSetting:(void *)a3 withBlock:
{
  id v5 = a2;
  id v6 = a3;
  long long v7 = v6;
  if (a1)
  {
    if (!v5)
    {
      v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"setting != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSSettingsDiffInspector _observeSetting:withBlock:]();
      }
      [v17 UTF8String];
      _bs_set_crash_log_message();
    }
    if (!v6)
    {
      v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"observer != ((void *)0)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSSettingsDiffInspector _observeSetting:withBlock:]();
      }
      [v18 UTF8String];
      _bs_set_crash_log_message();
    }
    if (*(unsigned char *)(a1 + 24))
    {
      v19 = [NSString stringWithFormat:@"can't add observers in the middle of an iteration"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSSettingsDiffInspector _observeSetting:withBlock:]();
      }
      [v19 UTF8String];
      _bs_set_crash_log_message();
    }
    long long v8 = (void *)[v6 copy];
    if (-[FBSSetting isLegacy]((BOOL)v5))
    {
      uint64_t v9 = -[FBSSetting legacySetting]((uint64_t)v5);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __54__FBSSettingsDiffInspector__observeSetting_withBlock___block_invoke;
      v20[3] = &unk_1E58F61E0;
      id v21 = v8;
      [(id)a1 observeOtherSetting:v9 withBlock:v20];
    }
    long long v10 = *(void **)(a1 + 8);
    v11 = -[FBSSetting name]((uint64_t)v5);
    uint64_t v12 = [v10 objectForKey:v11];

    if (v12)
    {
      v13 = (void *)MEMORY[0x19F3991F0](v8);
      [v12 addObject:v13];
    }
    else
    {
      id v14 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v15 = (void *)MEMORY[0x19F3991F0](v8);
      uint64_t v12 = [v14 initWithObjects:v15];

      v16 = *(void **)(a1 + 8);
      v13 = -[FBSSetting name]((uint64_t)v5);
      [v16 setObject:v12 forKey:v13];
    }
  }
}

- (void)observeOtherSetting:(unint64_t)a3 withBlock:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    if (self->_iteratingObservers)
    {
      long long v10 = [NSString stringWithFormat:@"can't add observers in the middle of an iteration"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[FBSSettingsDiffInspector observeOtherSetting:withBlock:]();
      }
      [v10 UTF8String];
      _bs_set_crash_log_message();
    }
    id v11 = v6;
    long long v7 = (void *)[v6 copy];
    long long v8 = [(BSMutableSettings *)self->_otherSettingsObserverInfo objectForSetting:a3];
    if (v8)
    {
      uint64_t v9 = v8;
      [v8 addObject:v7];
    }
    else
    {
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:v7];
      [(BSMutableSettings *)self->_otherSettingsObserverInfo setObject:v9 forSetting:a3];
    }

    id v6 = v11;
  }
}

- (FBSSettingsDiffInspector)init
{
  v8.receiver = self;
  v8.super_class = (Class)FBSSettingsDiffInspector;
  v2 = [(FBSSettingsDiffInspector *)&v8 init];
  if (v2)
  {
    uint64_t v3 = (BSMutableKeyedSettings *)objc_alloc_init((Class)off_1E58F4528);
    observerInfo = v2->_observerInfo;
    v2->_observerInfo = v3;

    id v5 = (BSMutableSettings *)objc_alloc_init((Class)off_1E58F4540);
    otherSettingsObserverInfo = v2->_otherSettingsObserverInfo;
    v2->_otherSettingsObserverInfo = v5;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherSettingsObserverInfo, 0);

  objc_storeStrong((id *)&self->_observerInfo, 0);
}

- (void)dealloc
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)removeAllObservers
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

uint64_t __54__FBSSettingsDiffInspector__observeSetting_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)description
{
  return [(FBSSettingsDiffInspector *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(FBSSettingsDiffInspector *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[off_1E58F44F0 builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(FBSSettingsDiffInspector *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FBSSettingsDiffInspector *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__FBSSettingsDiffInspector_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E58F4AB0;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __66__FBSSettingsDiffInspector_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"observerInfo"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"otherSettingsObserverInfo"];
}

- (void)observeProperty:(SEL)a3 withBlock:(id)a4
{
  uint64_t v6 = objc_opt_class();

  MEMORY[0x1F40E7228](self, a2, v6);
}

- (void)inspectDiff:withContext:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_observeSetting:withBlock:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_observeSetting:withBlock:.cold.2()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_observeSetting:withBlock:.cold.3()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)observeOtherSetting:withBlock:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_18();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end