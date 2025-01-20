void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

BOOL OUTLINED_FUNCTION_1()
{
  return initialized == 0;
}

intptr_t btaLock()
{
  if (btaLock_onceToken != -1) {
    dispatch_once(&btaLock_onceToken, &__block_literal_global);
  }
  v0 = initSem;
  return dispatch_semaphore_wait(v0, 0xFFFFFFFFFFFFFFFFLL);
}

dispatch_semaphore_t __btaLock_block_invoke()
{
  dispatch_semaphore_t result = dispatch_semaphore_create(1);
  initSem = (uint64_t)result;
  return result;
}

intptr_t btaUnlock()
{
  return dispatch_semaphore_signal((dispatch_semaphore_t)initSem);
}

intptr_t BackgroundTaskAgentInit(char *__s, NSObject *a2, uint64_t a3)
{
  if (!__s)
  {
    BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v8) {
      BackgroundTaskAgentInit_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    __assert_rtn("BackgroundTaskAgentInit", "BackgroundTaskAgent.m", 80, "clientName != ((void *)0)");
  }
  if (gClientName) {
    free((void *)gClientName);
  }
  size_t v6 = strlen(__s);
  gClientName = (uint64_t)malloc_type_malloc(v6 + 1, 0x100004077774924uLL);
  strcpy((char *)gClientName, __s);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __BackgroundTaskAgentInit_block_invoke;
  handler[3] = &unk_264324CD0;
  handler[4] = a3;
  btaLock();
  initialized = 1;
  xpc_set_event_stream_handler("com.apple.backgroundtaskagent", a2, handler);
  return dispatch_semaphore_signal((dispatch_semaphore_t)initSem);
}

void __BackgroundTaskAgentInit_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x21D46ABC0](a2);
  if (v4 == MEMORY[0x263EF8720])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __BackgroundTaskAgentInit_block_invoke_cold_1(a2);
    }
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    if (xpc_dictionary_get_BOOL(a2, "BackgroundTaskAgentMessage"))
    {
      xpc_dictionary_set_value(a2, "BackgroundTaskAgentMessage", 0);
      uint64_t v13 = (const char *)*MEMORY[0x263EF86C8];
      xpc_object_t value = xpc_dictionary_get_value(a2, (const char *)*MEMORY[0x263EF86C8]);
      if (value)
      {
        uint64_t v15 = value;
        if (MEMORY[0x21D46ABC0]() == MEMORY[0x263EF8798])
        {
          string_ptr = xpc_string_get_string_ptr(v15);
          xpc_retain(v15);
          xpc_dictionary_set_value(a2, v13, 0);
          if (xpc_dictionary_get_int64(a2, "BackgroundTaskAgentJobStatusKey") == 1
            || xpc_dictionary_get_BOOL(a2, "BackgroundTaskAgentJobExpiredKey"))
          {
            BackgroundTaskAgentRemoveJob((uint64_t)string_ptr);
          }
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        xpc_release(v15);
      }
      else
      {
        v24 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
        v24();
      }
    }
    else
    {
      BOOL v16 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v16) {
        __BackgroundTaskAgentInit_block_invoke_cold_2(v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }
  }
  else
  {
    BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v5) {
      __BackgroundTaskAgentInit_block_invoke_cold_3(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

uint64_t BackgroundTaskAgentRemoveJob(uint64_t a1)
{
  btaLock();
  if (!initialized)
  {
    BOOL v3 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (!v3 || BackgroundTaskAgentRemoveJob_cold_3(v3, v4, v5, v6, v7, v8, v9, v10)) {
      BackgroundTaskAgentRemoveJob_cold_1();
    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)initSem);
  if (!a1)
  {
    BOOL v11 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v11) {
      BackgroundTaskAgentRemoveJob_cold_2(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    __assert_rtn("BackgroundTaskAgentRemoveJob", "BackgroundTaskAgent.m", 158, "jobName != ((void *)0)");
  }
  return xpc_set_event();
}

uint64_t BackgroundTaskAgentAddJob(uint64_t a1, void *a2)
{
  btaLock();
  if (!initialized)
  {
    BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (!v5 || BackgroundTaskAgentAddJob_cold_3(v5, v6, v7, v8, v9, v10, v11, v12)) {
      BackgroundTaskAgentAddJob_cold_1();
    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)initSem);
  if (!a1)
  {
    BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v13) {
      BackgroundTaskAgentAddJob_cold_2(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    __assert_rtn("BackgroundTaskAgentAddJob", "BackgroundTaskAgent.m", 139, "jobName != ((void *)0)");
  }
  if (MEMORY[0x21D46ABC0](a2) == MEMORY[0x263EF8708]) {
    xpc_dictionary_set_string(a2, "BackgroundTaskAgentClientName", (const char *)gClientName);
  }
  return xpc_set_event();
}

void *BackgroundTaskAgentCopyJob()
{
  btaLock();
  if (!initialized)
  {
    BOOL v3 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (!v3 || BackgroundTaskAgentCopyJob_cold_2(v3, v4, v5, v6, v7, v8, v9, v10)) {
      BackgroundTaskAgentCopyJob_cold_1();
    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)initSem);
  v0 = (void *)xpc_copy_event();
  v1 = v0;
  if (v0 && !xpc_dictionary_get_count(v0))
  {
    xpc_release(v1);
    return 0;
  }
  return v1;
}

void BackgroundTaskAgentInit_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __BackgroundTaskAgentInit_block_invoke_cold_1(void *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  string = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x263EF86B0]);
  int v2 = 136315138;
  BOOL v3 = string;
  _os_log_error_impl(&dword_21844D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "BackgroundTaskAgent XPC Event Handler - Error: %s", (uint8_t *)&v2, 0xCu);
}

void __BackgroundTaskAgentInit_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21844D000, &_os_log_internal, a3, "BackgroundTaskAgent XPC Event Handler - Event Type = XPC_TYPE_DICTIONARY, Not a BACKGROUND_TASK_AGENT_MESSAGE", a5, a6, a7, a8, 0);
}

void __BackgroundTaskAgentInit_block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void BackgroundTaskAgentRemoveJob_cold_1()
{
  __assert_rtn("BackgroundTaskAgentRemoveJob", "BackgroundTaskAgent.m", 156, "initialized == 1");
}

void BackgroundTaskAgentRemoveJob_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

BOOL BackgroundTaskAgentRemoveJob_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return OUTLINED_FUNCTION_1();
}

void BackgroundTaskAgentAddJob_cold_1()
{
  __assert_rtn("BackgroundTaskAgentAddJob", "BackgroundTaskAgent.m", 137, "initialized == 1");
}

void BackgroundTaskAgentAddJob_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

BOOL BackgroundTaskAgentAddJob_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return OUTLINED_FUNCTION_1();
}

void BackgroundTaskAgentCopyJob_cold_1()
{
  __assert_rtn("BackgroundTaskAgentCopyJob", "BackgroundTaskAgent.m", 171, "initialized == 1");
}

BOOL BackgroundTaskAgentCopyJob_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return OUTLINED_FUNCTION_1();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x270EDB5C0](__dst, __src);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t xpc_copy_event()
{
  return MEMORY[0x270EDBF60]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x270EDC058](xdict);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDC2B8](object);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x270EDC398]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}