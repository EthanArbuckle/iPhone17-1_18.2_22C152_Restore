@interface IOHIDServiceUnscheduleAsync
@end

@implementation IOHIDServiceUnscheduleAsync

void ___IOHIDServiceUnscheduleAsync_block_invoke_90(uint64_t a1)
{
  v2 = _IOHIDLogCategory(6u);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    ___IOHIDServiceUnscheduleAsync_block_invoke_90_cold_1();
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void ___IOHIDServiceUnscheduleAsync_block_invoke(uint64_t a1)
{
}

void ___IOHIDServiceUnscheduleAsync_block_invoke_92(uint64_t a1)
{
  v2 = _IOHIDLogCategory(6u);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    ___IOHIDServiceUnscheduleAsync_block_invoke_92_cold_1();
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void ___IOHIDServiceUnscheduleAsync_block_invoke_90_cold_1()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_18B46C000, v0, v1, "0x%llx: unschedule from dispatch queue completed", v2, v3, v4, v5, v6);
}

void ___IOHIDServiceUnscheduleAsync_block_invoke_92_cold_1()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_18B46C000, v0, v1, "0x%llx: unschedule from runloop completed", v2, v3, v4, v5, v6);
}

@end