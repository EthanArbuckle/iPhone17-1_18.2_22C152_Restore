@interface IOHIDEventSystemConnectionScheduleAsync
@end

@implementation IOHIDEventSystemConnectionScheduleAsync

void ___IOHIDEventSystemConnectionScheduleAsync_block_invoke_3(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 120));
  *(void *)(*(void *)(a1 + 32) + 120) = 0;
  v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

void ___IOHIDEventSystemConnectionScheduleAsync_block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(_DWORD *)(v1 + 448))
  {
    int v2 = iohideventsystem_client_refresh(*(_DWORD *)(v1 + 40), 144);
    v3 = _IOHIDLogCategory(9u);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(v1 + 168);
      int v5 = 136315394;
      uint64_t v6 = v4;
      __int16 v7 = 1024;
      int v8 = v2;
      _os_log_impl(&dword_18B46C000, v3, OS_LOG_TYPE_DEFAULT, "%s: Sent client refresh msg, status:%#x", (uint8_t *)&v5, 0x12u);
    }
    __IOHIDEventSystemConnectionCheckServerStatus(v2, v1);
  }
}

@end