void sub_2405B6444()
{
  NSObject *v0;

  v0 = _INLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    sub_2405B6494(v0);
  }
}

void sub_2405B6494(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2405B5000, log, OS_LOG_TYPE_DEBUG, "Offer teardown complete", v1, 2u);
}

uint64_t _INLogSystem()
{
  return MEMORY[0x270F87C70]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}