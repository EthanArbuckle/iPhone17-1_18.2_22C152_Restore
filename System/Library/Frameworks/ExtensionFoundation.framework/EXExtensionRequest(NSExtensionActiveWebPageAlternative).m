@interface EXExtensionRequest(NSExtensionActiveWebPageAlternative)
@end

@implementation EXExtensionRequest(NSExtensionActiveWebPageAlternative)

- (void)applyActiveWebPageAlternativeIfNeededForExtension:()NSExtensionActiveWebPageAlternative .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = [a1 inputItems];
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_191F29000, a3, OS_LOG_TYPE_DEBUG, "Applying active web page alternative to items: %@ matching rule %@", (uint8_t *)&v6, 0x16u);
}

- (void)applyActiveWebPageAlternativeIfNeededForExtension:()NSExtensionActiveWebPageAlternative .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_191F29000, log, OS_LOG_TYPE_DEBUG, "Input items match active web page alternative.", v1, 2u);
}

@end