void sub_2404D9F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_2404D9FC8(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_2404DA83C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_2404DA854(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

void sub_2404DA86C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_2404DA8AC()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_2404DA884();
  sub_2404DA86C(&dword_2404D8000, v0, (uint64_t)v0, "\"%@ will get full access to account type %@\"", v1);
}

void sub_2404DA91C()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  sub_2404DA884();
  sub_2404DA86C(&dword_2404D8000, v0, (uint64_t)v0, "\"%@ will get default access to account type %@\"", v1);
}

void sub_2404DA98C(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2404D8000, a2, OS_LOG_TYPE_DEBUG, "\"Client %@ does not have any special entitlements. Prompting user...\"", (uint8_t *)&v2, 0xCu);
}

void sub_2404DAA04()
{
  sub_2404DA89C();
  sub_2404DA854(v1, v2, v3, 5.778e-34);
  sub_2404DA86C(&dword_2404D8000, v6, v4, "\"Unentitled client %@ requesting access to account type %@ which no longer supports access dialogs.\"", v5);
}

void sub_2404DAA4C()
{
  sub_2404DA89C();
  sub_2404DA854(v1, v2, v3, 5.778e-34);
  _os_log_error_impl(&dword_2404D8000, v5, OS_LOG_TYPE_ERROR, "\"Unentitled client %@ requesting access to account type %@ which doesn't support access dialogs. *** Please file a bug ***\"", v4, 0x16u);
}

void sub_2404DAA9C()
{
  sub_2404DA89C();
  sub_2404DA854(v1, v2, v3, 5.778e-34);
  sub_2404DA86C(&dword_2404D8000, v6, v4, "\"%@ has an existing authorization entry: %@\"", v5);
}

void sub_2404DAAE4(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  os_log_t v5 = [a2 identifier];
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  v10 = v5;
  sub_2404DA86C(&dword_2404D8000, a3, v6, "\"%@ is losing accessing to account type %@\"", (uint8_t *)&v7);
}

void sub_2404DAB90(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 identifier];
  int v4 = 138412290;
  os_log_t v5 = v3;
  _os_log_debug_impl(&dword_2404D8000, a2, OS_LOG_TYPE_DEBUG, "\"Revoking access to all clients of account type %@\"", (uint8_t *)&v4, 0xCu);
}

uint64_t ACDLogAccessRequest()
{
  return MEMORY[0x270F0A560]();
}

uint64_t _ACDLogSystem()
{
  return MEMORY[0x270F0A578]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}