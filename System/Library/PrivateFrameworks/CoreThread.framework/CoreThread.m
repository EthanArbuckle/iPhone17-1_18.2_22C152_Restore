id THLogHandleForCategory(int a1)
{
  void *v2;
  uint64_t vars8;

  if (THLogHandleForCategory_onceToken != -1) {
    dispatch_once(&THLogHandleForCategory_onceToken, &__block_literal_global);
  }
  v2 = (void *)THLogHandleForCategory_logHandles[a1];
  return v2;
}

uint64_t __THLogHandleForCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.thread", "unspecified");
  v1 = (void *)THLogHandleForCategory_logHandles[0];
  THLogHandleForCategory_logHandles[0] = (uint64_t)v0;

  qword_267F42ED0 = (uint64_t)os_log_create("com.apple.thread", "credentials");
  return MEMORY[0x270F9A758]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}