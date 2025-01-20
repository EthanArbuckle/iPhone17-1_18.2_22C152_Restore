@interface SFContentBlockerManager(SFPrivate)
- (void)_saveContentBlockerRecompilationInformation;
@end

@implementation SFContentBlockerManager(SFPrivate)

+ (void)_createContentExtensionsDirectoryWithURL:()SFPrivate .cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_0(&dword_1A690B000, v3, v4, "Failed to exclude ContentExtensions directory from backup: %{public}@", v5);
}

- (void)_saveContentBlockerRecompilationInformation
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_0(&dword_1A690B000, v3, v4, "Failed to create data to save recompilation information: %{public}@", v5);
}

@end