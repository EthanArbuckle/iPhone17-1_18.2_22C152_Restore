BOOL AMUIAmbientPresentationStateIsPresented(uint64_t a1)
{
  return a1 == 2;
}

BOOL AMUIAmbientDisplayStyleIsRedMode(uint64_t a1)
{
  return a1 == 1;
}

__CFString *AMUIAmbientDisplayStyleString(uint64_t a1)
{
  v1 = @"unknown";
  if (a1 == 1) {
    v1 = @"red-mode";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"normal";
  }
}

id AMUIServicesLogGeneral()
{
  if (AMUIServicesLogGeneral_onceToken != -1) {
    dispatch_once(&AMUIServicesLogGeneral_onceToken, &__block_literal_global);
  }
  v0 = (void *)AMUIServicesLogGeneral___logObj;
  return v0;
}

uint64_t __AMUIServicesLogGeneral_block_invoke()
{
  AMUIServicesLogGeneral___logObj = (uint64_t)os_log_create("com.apple.ambient.AmbientUIServices", "General");
  return MEMORY[0x270F9A758]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}