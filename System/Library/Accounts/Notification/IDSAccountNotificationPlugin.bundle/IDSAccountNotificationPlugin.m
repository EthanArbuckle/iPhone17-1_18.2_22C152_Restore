uint64_t sub_2405B0564(void *a1)
{
  return MEMORY[0x270F3C9F8](a1[4], a1[5], 0, a1[6], a1[7], 0);
}

uint64_t sub_2405B0628(uint64_t a1)
{
  return MEMORY[0x270F3C9F0](*(void *)(a1 + 32));
}

uint64_t sub_2405B0804(uint64_t a1)
{
  return MEMORY[0x270F3CA08](*(void *)(a1 + 32), 0, *(void *)(a1 + 40), 0, 0, 0);
}

uint64_t sub_2405B09B8(uint64_t a1)
{
  return MEMORY[0x270F3C9C8](*(void *)(a1 + 32), 0, *(void *)(a1 + 40), 0, 0, 0);
}

uint64_t sub_2405B0A80(uint64_t a1)
{
  return MEMORY[0x270F3C9C0](*(void *)(a1 + 32));
}

void sub_2405B18C0(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_2405AF000, a2, OS_LOG_TYPE_FAULT, "Failed to get an account type for IDS identifier { identifier: %@ }", (uint8_t *)&v2, 0xCu);
}

void sub_2405B1938(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2405AF000, a2, OS_LOG_TYPE_ERROR, "Failed loading existing accounts { error: %@}}", (uint8_t *)&v2, 0xCu);
}

uint64_t IDSGameCenterSignOut()
{
  return MEMORY[0x270F3C9D0]();
}

uint64_t IDSUpdateUser()
{
  return MEMORY[0x270F3C9E8]();
}

uint64_t IDSiCloudSignOut()
{
  return MEMORY[0x270F3CA00]();
}

uint64_t IDSiTunesSignOut()
{
  return MEMORY[0x270F3CA10]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}