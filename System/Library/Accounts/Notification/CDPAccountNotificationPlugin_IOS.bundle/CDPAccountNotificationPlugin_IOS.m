void sub_240575D68(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x263EF8340];
  v4 = a3;
  v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_240574000, v5, OS_LOG_TYPE_DEFAULT, "Updated keychain sync with success: %{BOOL}d, error: %{public}@", (uint8_t *)v6, 0x12u);
  }
}

void sub_240575E2C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_240574000, log, OS_LOG_TYPE_ERROR, "No hasSOSActiveDeviceForAccount selector found - not updating SOSCCSetCompatibilityMode", v1, 2u);
}

void sub_240575E70(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 141558274;
  uint64_t v3 = 1752392040;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_240574000, a2, OS_LOG_TYPE_DEBUG, "No dataclass changes for %{mask.hash}@, skipping update.", (uint8_t *)&v2, 0x16u);
}

void sub_240575EFC(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_240574000, log, OS_LOG_TYPE_DEBUG, "Not processing Apple account, skipping update.", v1, 2u);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

uint64_t _CDPLogSystem()
{
  return MEMORY[0x270F18B68]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}