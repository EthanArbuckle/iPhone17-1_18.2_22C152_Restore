@interface BLTCaptureBug
@end

@implementation BLTCaptureBug

uint64_t ___BLTCaptureBug_block_invoke()
{
  _BLTCaptureBug__diagnosticReporter = (uint64_t)objc_alloc_init(MEMORY[0x263F7C080]);
  return MEMORY[0x270F9A758]();
}

void ___BLTCaptureBug_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = blt_general_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_222F4C000, v3, OS_LOG_TYPE_DEFAULT, "Received response from Diagnostic Reporter - %@", (uint8_t *)&v4, 0xCu);
  }
}

@end