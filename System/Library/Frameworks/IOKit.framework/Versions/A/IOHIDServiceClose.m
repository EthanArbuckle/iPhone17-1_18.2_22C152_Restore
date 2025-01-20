@interface IOHIDServiceClose
@end

@implementation IOHIDServiceClose

void ___IOHIDServiceClose_block_invoke(uint64_t a1)
{
  v2 = _IOHIDLogCategory(6u);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    ___IOHIDServiceClose_block_invoke_cold_1();
  }
  uint64_t v3 = *(void *)(a1 + 32);
  *(_DWORD *)(v3 + 224) |= 4u;
  if (*(void *)(v3 + 248))
  {
    CFArrayRemoveAllValues(*(CFMutableArrayRef *)(v3 + 248));
    uint64_t v3 = *(void *)(a1 + 32);
  }
  if (*(void *)(v3 + 256))
  {
    CFArrayRemoveAllValues(*(CFMutableArrayRef *)(v3 + 256));
    uint64_t v3 = *(void *)(a1 + 32);
  }
  CFRelease((CFTypeRef)v3);
}

void ___IOHIDServiceClose_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_18B46C000, v0, v1, "0x%llx: close completed", v2, v3, v4, v5, v6);
}

@end