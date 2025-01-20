id sub_2405EA688()
{
  void *v0;
  uint64_t vars8;

  if (qword_26AFC74A0 != -1) {
    dispatch_once(&qword_26AFC74A0, &unk_26F4B7F60);
  }
  v0 = (void *)qword_26AFC7498;
  return v0;
}

uint64_t sub_2405EA6DC()
{
  qword_26AFC7498 = (uint64_t)os_log_create("com.apple.sharing", "Accounts");
  return MEMORY[0x270F9A758]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}