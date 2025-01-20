@interface INUIExtensionHostContext
@end

@implementation INUIExtensionHostContext

void __64___INUIExtensionHostContext__errorHandlingExtensionContextProxy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *MEMORY[0x263F0F810];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[_INUIExtensionHostContext _errorHandlingExtensionContextProxy]_block_invoke";
    __int16 v6 = 2114;
    id v7 = v2;
    _os_log_error_impl(&dword_20A3EB000, v3, OS_LOG_TYPE_ERROR, "%s Unable to retrieve extension context: %{public}@", (uint8_t *)&v4, 0x16u);
  }
}

@end