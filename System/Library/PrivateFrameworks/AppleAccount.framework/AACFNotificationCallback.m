@interface AACFNotificationCallback
@end

@implementation AACFNotificationCallback

void ___AACFNotificationCallback_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29238] valueWithPointer:*(void *)(a1 + 32)];
  v3 = _AALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    v8 = v2;
    _os_log_impl(&dword_1A11D8000, v3, OS_LOG_TYPE_DEFAULT, "Dismissing notification for key: %@", (uint8_t *)&v7, 0xCu);
  }

  v4 = _AANotificationHandlerMap();
  v5 = [v4 objectForKeyedSubscript:v2];

  v6 = _AANotificationHandlerMap();
  [v6 removeObjectForKey:v2];

  if (v5) {
    v5[2](v5, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end