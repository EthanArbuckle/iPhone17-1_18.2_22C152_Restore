@interface MLRExtensionPrincipalClass
- (void)beginRequestWithExtensionContext:(id)a3;
@end

@implementation MLRExtensionPrincipalClass

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[MLRExtensionPrincipalClass beginRequestWithExtensionContext:]((uint64_t)v3, v4);
    }
  }
}

- (void)beginRequestWithExtensionContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138412290;
  uint64_t v4 = objc_opt_class();
  _os_log_error_impl(&dword_21C376000, a2, OS_LOG_TYPE_ERROR, "Failed to get correct context with context class=%@", (uint8_t *)&v3, 0xCu);
}

@end