@interface FBSMutableSceneClientSettings
- (void)_applySafeValuesFromUntrustedSettings:(id)a3;
- (void)addLayer:(id)a3;
- (void)removeAllLayers;
- (void)removeLayer:(id)a3;
@end

@implementation FBSMutableSceneClientSettings

- (void)addLayer:(id)a3
{
  id v9 = a3;
  NSClassFromString(&cfstr_Fbsscenelayer.isa);
  if (!v9)
  {
    v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSMutableSceneClientSettings addLayer:]();
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneLayerClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSMutableSceneClientSettings addLayer:]();
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
  }

  v4 = [(FBSSettings *)self valueForProperty:sel_layers expectedClass:objc_opt_class()];
  if (!v4)
  {
    v4 = objc_opt_new();
    [(FBSSettings *)self setValue:v4 forProperty:sel_layers];
  }
  v5 = [v9 capture];
  v6 = [v5 stringRepresentation];
  [v4 setObject:v5 forKey:v6];
}

- (void)removeLayer:(id)a3
{
  id v8 = a3;
  NSClassFromString(&cfstr_Fbsscenelayer.isa);
  if (!v8)
  {
    v6 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSMutableSceneClientSettings removeLayer:]();
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:FBSSceneLayerClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[FBSMutableSceneClientSettings removeLayer:]();
    }
    [v7 UTF8String];
    _bs_set_crash_log_message();
  }

  v4 = [(FBSSettings *)self valueForProperty:sel_layers expectedClass:objc_opt_class()];
  if (v4)
  {
    v5 = [v8 stringRepresentation];
    [v4 setObject:0 forKey:v5];
  }
}

- (void)removeAllLayers
{
}

- (void)_applySafeValuesFromUntrustedSettings:(id)a3
{
  id v4 = a3;
  [v4 preferredLevel];
  -[FBSMutableSceneClientSettings setPreferredLevel:](self, "setPreferredLevel:");
  -[FBSMutableSceneClientSettings setPreferredInterfaceOrientation:](self, "setPreferredInterfaceOrientation:", [v4 preferredInterfaceOrientation]);
  v5 = [v4 preferredSceneHostIdentifier];
  [(FBSMutableSceneClientSettings *)self setPreferredSceneHostIdentifier:v5];

  v6 = [v4 preferredSceneHostIdentity];
  [(FBSMutableSceneClientSettings *)self setPreferredSceneHostIdentity:v6];

  -[FBSSettings _legacyOtherSettings]((uint64_t)self);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v10 removeAllSettings];
  v7 = -[FBSSettings _legacyOtherSettings]((uint64_t)v4);
  [v10 applySettings:v7];

  id v8 = -[FBSSettings _legacyLocalSettings]((uint64_t)self);
  [v8 removeAllSettings];
  id v9 = -[FBSSettings _legacyLocalSettings]((uint64_t)v4);

  [v8 applySettings:v9];
}

- (void)addLayer:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)removeLayer:.cold.1()
{
  OUTLINED_FUNCTION_19();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_18();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_11(&dword_19C680000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end