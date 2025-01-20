id sub_100003780()
{
  void *v0;
  uint64_t vars8;

  if (qword_100008198 != -1) {
    dispatch_once(&qword_100008198, &stru_1000041B0);
  }
  v0 = (void *)qword_100008190;
  return v0;
}

void sub_1000037D4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.tailspin", "library");
  v2 = (void *)qword_100008190;
  qword_100008190 = (uint64_t)v1;

  id v3 = (id)qword_100008190;
  if (!v3) {
    sub_1000038B4();
  }
}

uint64_t sub_100003834(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result = snprintf(byte_1000081A0, 0x400uLL, "%d ", a1);
  if ((result - 1) <= 0x3FE) {
    uint64_t result = vsnprintf(&byte_1000081A0[result], 1024 - result, a2, &a9);
  }
  qword_100008158 = (uint64_t)byte_1000081A0;
  return result;
}

void sub_1000038B4()
{
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

uint64_t tailspin_config_create_with_current_state()
{
  return _tailspin_config_create_with_current_state();
}

uint64_t tailspin_config_free()
{
  return _tailspin_config_free();
}

uint64_t tailspin_dump_output_with_options_sync()
{
  return _tailspin_dump_output_with_options_sync();
}

uint64_t tailspin_enabled_get()
{
  return _tailspin_enabled_get();
}

mode_t umask(mode_t a1)
{
  return _umask(a1);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}