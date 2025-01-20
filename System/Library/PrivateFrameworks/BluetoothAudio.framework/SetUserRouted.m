@interface SetUserRouted
@end

@implementation SetUserRouted

void __endpoint_SetUserRouted_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = BluetoothEndpointManagerLogComponent;
    if (os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR)) {
      __endpoint_SetUserRouted_block_invoke_cold_1(a1, (uint64_t)v3, v4);
    }
  }
  [*(id *)(a1 + 32) invalidate];
}

void __endpoint_SetUserRouted_block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 40);
  int v4 = *(unsigned __int8 *)(a1 + 48);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_227451000, log, OS_LOG_TYPE_ERROR, "Set UserRouted failed: device %@, value %d, error %@", (uint8_t *)&v5, 0x1Cu);
}

@end