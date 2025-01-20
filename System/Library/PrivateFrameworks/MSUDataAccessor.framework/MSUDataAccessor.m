void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id MSUDASharedLogger()
{
  if (MSUDASharedLogger_pred != -1) {
    dispatch_once(&MSUDASharedLogger_pred, &__block_literal_global_63);
  }
  v0 = (void *)MSUDASharedLogger___instance;
  return v0;
}

void __MSUDASharedLogger_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MSUDataAccessor", "MSUDataAccessor");
  v1 = (void *)MSUDASharedLogger___instance;
  MSUDASharedLogger___instance = (uint64_t)v0;
}

void sub_2104E90DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  for (uint64_t i = 192; i != -24; i -= 24)
    __destructor_8_s8_s16((uint64_t)&a9 + i);
  _Unwind_Resume(a1);
}

void __destructor_8_s8_s16(uint64_t a1)
{
  v2 = *(void **)(a1 + 16);
}

id __copy_helper_block_e8_32s(uint64_t a1, uint64_t a2)
{
  return *(id *)(a2 + 32);
}

void __destroy_helper_block_e8_32s(uint64_t a1)
{
}

uint64_t lookupPathForPersonalizedData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2) {
    return 6000;
  }
  id v6 = +[MSUDataAccessor sharedDataAccessor];
  id v11 = 0;
  v7 = (void *)[v6 copyPathForPersonalizedData:a1 error:&v11];
  id v8 = v11;

  if (v8)
  {
    uint64_t v9 = [v8 code];
  }
  else
  {
    if (!v7) {
      return 6001;
    }
    if ([v7 getCString:a2 maxLength:a3 encoding:4]) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = 6001;
    }
  }

  return v9;
}

uint64_t lookupPathForPersistentData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2) {
    return 6000;
  }
  id v6 = +[MSUDataAccessor sharedDataAccessor];
  id v11 = 0;
  v7 = (void *)[v6 copyPathForPersistentData:a1 error:&v11];
  id v8 = v11;

  if (v8)
  {
    uint64_t v9 = [v8 code];
  }
  else
  {
    if (!v7) {
      return 6001;
    }
    if ([v7 getCString:a2 maxLength:a3 encoding:4]) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = 6001;
    }
  }

  return v9;
}

void sub_2104EA398(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2104EA580(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2104EAA74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
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

void __copy_helper_block_e8_32s40s48s56r64r(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)(a2 + 32);
  id v5 = *(id *)(a2 + 40);
  id v6 = *(id *)(a2 + 48);
  _Block_object_assign((void *)(a1 + 56), *(const void **)(a2 + 56), 8);
  v7 = *(const void **)(a2 + 64);
  _Block_object_assign((void *)(a1 + 64), v7, 8);
}

void __destroy_helper_block_e8_32s40s48s56r64r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 64), 8);
  _Block_object_dispose(*(const void **)(a1 + 56), 8);

  v2 = *(void **)(a1 + 32);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AF0](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA384(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B48](data, *(void *)&len, md);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x270EF49E8](*(void *)&mainPort, path);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x270ED8480](a1, *(void *)&a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x270EDBA30](in, uu);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}