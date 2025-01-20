@interface LSApplicationWorkspace(DeprecatedURLQueries)
- (void)publicURLSchemes;
@end

@implementation LSApplicationWorkspace(DeprecatedURLQueries)

- (void)publicURLSchemes
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  getprogname();
  sel_getName(a1);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_5_0(&dword_182959000, a2, v4, "Process %{public}s is using -%{public}s, which is no longer functional.", v5);
}

@end