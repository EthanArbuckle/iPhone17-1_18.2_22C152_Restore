void sub_23F8484B8()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = [MEMORY[0x263F4A860] registration];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23F846000, v0, OS_LOG_TYPE_DEFAULT, "  Delete succeeded", v1, 2u);
  }
}

void sub_23F848528()
{
  v0 = [MEMORY[0x263F4A860] registration];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23F846000, v0, OS_LOG_TYPE_DEFAULT, "  Delete succeeded", v1, 2u);
  }
}

void sub_23F848598(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v4 = [MEMORY[0x263F4A860] registration];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = @"NO";
    uint64_t v6 = *(void *)(a1 + 32);
    if (a2) {
      v5 = @"YES";
    }
    int v7 = 138412546;
    v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_23F846000, v4, OS_LOG_TYPE_DEFAULT, "ProfileID save completed, success %@, account %@", (uint8_t *)&v7, 0x16u);
  }
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotificationWithOptions(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, CFOptionFlags options)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t IDSiCloudSignIn()
{
  return MEMORY[0x270F3C9F8]();
}

uint64_t IMAreEmailsLogicallyTheSame()
{
  return MEMORY[0x270F3CCB0]();
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

void objc_enumerationMutation(id obj)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}