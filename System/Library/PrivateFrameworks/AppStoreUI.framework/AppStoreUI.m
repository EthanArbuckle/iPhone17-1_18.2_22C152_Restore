uint64_t __ASPurchaseBatchErrorEqual(void *a1, uint64_t a2)
{
  if ISErrorIsEqual() && (ISErrorIsEqual()) {
    return 1;
  }
  else {
    return [a1 isEqual:a2 compareUserInfo:1];
  }
}

uint64_t ASAppStoreUIBundle()
{
  v0 = (void *)MEMORY[0x263F086E0];
  uint64_t v1 = objc_opt_class();
  return [v0 bundleForClass:v1];
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t ISErrorIsEqual()
{
  return MEMORY[0x270F88B00]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t SSFileLog()
{
  return MEMORY[0x270F78EC8]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x270ED80B0]();
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}