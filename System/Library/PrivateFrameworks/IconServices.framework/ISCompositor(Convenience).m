@interface ISCompositor(Convenience)
- (void)clearResources;
@end

@implementation ISCompositor(Convenience)

- (void)setRecipe:()Convenience .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AE771000, log, OS_LOG_TYPE_ERROR, "Failed to set recipe on custom element", v1, 2u);
}

- (void)setResource:()Convenience named:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AE771000, a2, OS_LOG_TYPE_ERROR, "Failed to set resource named '%@' on custom element", (uint8_t *)&v2, 0xCu);
}

- (void)addResourcesFromDictionary:()Convenience .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 allKeys];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1AE771000, a2, OS_LOG_TYPE_ERROR, "Failed to set resource names '%@' on custom element", (uint8_t *)&v4, 0xCu);
}

- (void)clearResources
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AE771000, log, OS_LOG_TYPE_ERROR, "Failed to clear resources from custom element", v1, 2u);
}

@end