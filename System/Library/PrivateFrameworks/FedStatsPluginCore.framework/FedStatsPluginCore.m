void sub_24DF76BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t checkDediscoV2Params(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [a1 objectForKey:*MEMORY[0x263F3A268]];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 objectForKey:*MEMORY[0x263F3A270]];
    v6 = v5;
    if (v5)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "containsString:", @"apple", (void)v14))
            {
              if (a2)
              {
                +[FedStatsPluginError errorWithCode:100 description:@"Helper in Dedisco Server configuration cannot be 1st party."];
                uint64_t v12 = 0;
                *a2 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                uint64_t v12 = 0;
              }
              goto LABEL_20;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
      uint64_t v12 = 1;
LABEL_20:
    }
    else if (a2)
    {
      +[FedStatsPluginError errorWithCode:100 description:@"Dedisco Server configuration is missing helper servers."];
      uint64_t v12 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else if (a2)
  {
    +[FedStatsPluginError errorWithCode:100 description:@"Dedisco configuration is missing Server configuration."];
    uint64_t v12 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

uint64_t checkPrivateRelay(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if (![v8 hasSuffix:@"with-private-relay"])
  {
    int v12 = [v8 hasSuffix:@"without-private-relay"];
    v13 = +[FedStatsPluginLog logger];
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if (v12)
    {
      if (v14) {
        checkPrivateRelay_cold_2();
      }

      if (([v7 containsString:@"privacyProxy = 0"] & 1) == 0) {
        goto LABEL_10;
      }
    }
    else
    {
      if (v14) {
        checkPrivateRelay_cold_3();
      }
    }
    uint64_t v11 = 1;
    goto LABEL_17;
  }
  uint64_t v10 = +[FedStatsPluginLog logger];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    checkPrivateRelay_cold_1();
  }

  if ([v7 containsString:@"privacyProxy = 1"])
  {
    uint64_t v11 = checkDediscoV2Params(v9, a4);
    goto LABEL_17;
  }
LABEL_10:
  if (a4)
  {
    +[FedStatsPluginError errorWithCode:100 description:@"The SQL query does not filter against only private relay signal on the table."];
    uint64_t v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v11 = 0;
  }
LABEL_17:

  return v11;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

unsigned char *OUTLINED_FUNCTION_1(unsigned char *result, unsigned char *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return objc_opt_class();
}

void checkPrivateRelay_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_24DF73000, v0, v1, "The client ID is associated with explicit use-case with private relay.", v2, v3, v4, v5, v6);
}

void checkPrivateRelay_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_24DF73000, v0, v1, "The client ID is associated with explicit use-case without private relay.", v2, v3, v4, v5, v6);
}

void checkPrivateRelay_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_24DF73000, v0, v1, "The client ID is not associated with private relay.", v2, v3, v4, v5, v6);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

uint64_t INSupportedMediaCategories()
{
  return MEMORY[0x270EF52A8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

int uname(utsname *a1)
{
  return MEMORY[0x270EDB998](a1);
}