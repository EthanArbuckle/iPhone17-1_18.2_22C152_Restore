@interface FBSSettings(FBSSceneExtension)
@end

@implementation FBSSettings(FBSSceneExtension)

- (void)valueForProperty:()FBSSceneExtension expectedClass:.cold.1()
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

- (void)valueForProperty:()FBSSceneExtension expectedClass:.cold.2(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_15(&dword_19C680000, v2, v3, "no setting found for %@", v4, v5, v6, v7, 2u);
}

@end