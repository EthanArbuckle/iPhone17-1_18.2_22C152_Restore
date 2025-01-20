@interface SetProperty
@end

@implementation SetProperty

void __endpoint_SetProperty_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR)) {
    __endpoint_SetProperty_block_invoke_cold_1();
  }
  [*(id *)(a1 + 32) invalidate];
}

void __endpoint_SetProperty_block_invoke_67(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR)) {
    __endpoint_SetProperty_block_invoke_67_cold_1();
  }
  [*(id *)(a1 + 32) invalidate];
}

void __endpoint_SetProperty_block_invoke_69(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR)) {
    __endpoint_SetProperty_block_invoke_69_cold_1();
  }
  [*(id *)(a1 + 32) invalidate];
}

void __endpoint_SetProperty_block_invoke_70(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && os_log_type_enabled((os_log_t)BluetoothEndpointManagerLogComponent, OS_LOG_TYPE_ERROR)) {
    __endpoint_SetProperty_block_invoke_70_cold_1();
  }
  [*(id *)(a1 + 32) invalidate];
}

void __endpoint_SetProperty_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227451000, v0, v1, "Error setting listening mode", v2, v3, v4, v5, v6);
}

void __endpoint_SetProperty_block_invoke_67_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227451000, v0, v1, "Error setting conversationDetect mode", v2, v3, v4, v5, v6);
}

void __endpoint_SetProperty_block_invoke_69_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227451000, v0, v1, "Error setting setSpatialAudioAllowed", v2, v3, v4, v5, v6);
}

void __endpoint_SetProperty_block_invoke_70_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227451000, v0, v1, "Error setting setSpatialAudioMode", v2, v3, v4, v5, v6);
}

@end