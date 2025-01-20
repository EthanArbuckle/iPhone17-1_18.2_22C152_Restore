@interface MapDataToChangeTokens
@end

@implementation MapDataToChangeTokens

void ___MapDataToChangeTokens_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263EFD838]) initWithData:v6];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
  }
  else
  {
    ASLoggingInitialize();
    v8 = *MEMORY[0x263F23AA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_ERROR)) {
      ___MapDataToChangeTokens_block_invoke_cold_1((uint64_t)v6, v8);
    }
  }
}

void ___MapDataToChangeTokens_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2474C9000, a2, OS_LOG_TYPE_ERROR, "Found a change token with an unexpected type: %@", (uint8_t *)&v2, 0xCu);
}

@end