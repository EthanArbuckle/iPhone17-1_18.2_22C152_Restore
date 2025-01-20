@interface FBSMutableSceneSettings
- (id)ignoreOcclusionReasons;
- (void)addPropagatedProperty:(SEL)a3;
- (void)addPropagatedSetting:(id)a3;
- (void)addPropagatedSettings:(id)a3;
- (void)removePropagatedProperty:(SEL)a3;
- (void)removePropagatedSetting:(id)a3;
- (void)removePropagatedSettings:(id)a3;
@end

@implementation FBSMutableSceneSettings

- (id)ignoreOcclusionReasons
{
  ignoreOcclusionReasons = self->super._ignoreOcclusionReasons;
  if (!ignoreOcclusionReasons)
  {
    v4 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v5 = self->super._ignoreOcclusionReasons;
    self->super._ignoreOcclusionReasons = v4;

    ignoreOcclusionReasons = self->super._ignoreOcclusionReasons;
  }

  return ignoreOcclusionReasons;
}

- (void)addPropagatedProperty:(SEL)a3
{
  v5 = objc_opt_class();
  uint64_t v6 = FBSSettingForSelector(v5, a3);
  if (!v6)
  {
    v7 = NSString;
    v8 = NSStringFromSelector(a3);
    v9 = [v7 stringWithFormat:@"no setting for %@", v8];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSMutableSceneSettings addPropagatedProperty:]();
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
  }
  id v10 = (id)v6;
  [(FBSMutableSceneSettings *)self addPropagatedSetting:v6];
}

- (void)removePropagatedProperty:(SEL)a3
{
  v5 = objc_opt_class();
  uint64_t v6 = FBSSettingForSelector(v5, a3);
  if (!v6)
  {
    v7 = NSString;
    v8 = NSStringFromSelector(a3);
    v9 = [v7 stringWithFormat:@"no setting for %@", v8];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSMutableSceneSettings removePropagatedProperty:]();
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
  }
  id v10 = (id)v6;
  [(FBSMutableSceneSettings *)self removePropagatedSetting:v6];
}

- (void)addPropagatedSetting:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"setting != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSMutableSceneSettings addPropagatedSetting:]();
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
  }
  id v7 = v4;
  v5 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
  [(FBSMutableSceneSettings *)self addPropagatedSettings:v5];
}

- (void)removePropagatedSetting:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"setting != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSMutableSceneSettings removePropagatedSetting:]();
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
  }
  id v7 = v4;
  v5 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
  [(FBSMutableSceneSettings *)self removePropagatedSettings:v5];
}

- (void)addPropagatedSettings:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [(FBSSettings *)self valueForProperty:sel_propagatedSettings expectedClass:objc_opt_class()];
    if (!v5)
    {
      v5 = objc_opt_new();
      [(FBSSettings *)self setValue:v5 forProperty:sel_propagatedSettings];
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(id *)(*((void *)&v15 + 1) + 8 * i);
          NSClassFromString(&cfstr_Fbssetting.isa);
          if (!v11)
          {
            v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              -[FBSMutableSceneSettings addPropagatedSettings:]();
            }
            [v13 UTF8String];
            _bs_set_crash_log_message();
          }
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSettingClass]"];
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
              -[FBSMutableSceneSettings addPropagatedSettings:]();
            }
            [v14 UTF8String];
            _bs_set_crash_log_message();
          }

          if (-[FBSSetting isLocal]((BOOL)v11))
          {
            v12 = FBLogCommon();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
              -[FBSMutableSceneSettings addPropagatedSettings:](v19, (uint64_t)v11, &v20, v12);
            }
          }
          else
          {
            v12 = -[FBSSetting name]((uint64_t)v11);
            [v5 setObject:v11 forKey:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v8);
    }
  }
}

- (void)removePropagatedSettings:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [(FBSSettings *)self valueForProperty:sel_propagatedSettings expectedClass:objc_opt_class()];
    if (v5)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v6 = v4;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v16 != v9) {
              objc_enumerationMutation(v6);
            }
            id v11 = *(id *)(*((void *)&v15 + 1) + 8 * i);
            NSClassFromString(&cfstr_Fbssetting.isa);
            if (!v11)
            {
              v13 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                -[FBSMutableSceneSettings removePropagatedSettings:]();
              }
              [v13 UTF8String];
              _bs_set_crash_log_message();
            }
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v14 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSettingClass]"];
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                -[FBSMutableSceneSettings removePropagatedSettings:]();
              }
              [v14 UTF8String];
              _bs_set_crash_log_message();
            }

            v12 = -[FBSSetting name]((uint64_t)v11);
            [v5 setObject:0 forKey:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v8);
      }
    }
  }
}

- (void)addPropagatedProperty:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)removePropagatedProperty:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)addPropagatedSetting:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)removePropagatedSetting:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)addPropagatedSettings:.cold.1()
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

- (void)addPropagatedSettings:(void *)a3 .cold.2(uint8_t *a1, uint64_t a2, void *a3, NSObject *a4)
{
  uint64_t v7 = -[FBSSetting name](a2);
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_19C680000, a4, OS_LOG_TYPE_ERROR, "cannot propagate local setting %@", a1, 0xCu);
}

- (void)removePropagatedSettings:.cold.1()
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