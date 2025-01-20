void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x270ED8090](dso, log, type, format, buf, *(void *)&size);
}

uint64_t getWFVoiceShortcutClientLogObject()
{
  return MEMORY[0x270F84930]();
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}