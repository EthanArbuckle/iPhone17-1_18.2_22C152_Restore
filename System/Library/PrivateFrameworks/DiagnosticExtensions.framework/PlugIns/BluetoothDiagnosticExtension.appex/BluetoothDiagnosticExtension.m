uint64_t getBoolValue(uint64_t *a1, uint64_t *a2, char *a3)
{
  void *v6;
  uint64_t *v7;
  __CFString *v8;
  void *v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  uint64_t v15;
  uint8_t v17[16];

  if (*((char *)a1 + 23) >= 0) {
    v7 = a1;
  }
  else {
    v7 = (uint64_t *)*a1;
  }
  v8 = +[NSString stringWithUTF8String:v7];
  v9 = (void *)CFPreferencesCopyAppValue(v8, @"com.apple.MobileBluetooth.debug");

  if ((!v9 || ![v9 count]) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ERROR: Either Dictionary is empty or null", v17, 2u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (*((char *)a2 + 23) >= 0) {
      v10 = a2;
    }
    else {
      v10 = (uint64_t *)*a2;
    }
    v11 = +[NSString stringWithUTF8String:v10];
    v12 = [v9 objectForKey:v11];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = v12;
      if (([v13 isEqualToString:@"TRUE"] & 1) != 0
        || ([v13 isEqualToString:@"YES"] & 1) != 0)
      {
        v14 = 1;
LABEL_16:
        *a3 = v14;

LABEL_20:
        v15 = 1;
LABEL_26:

        goto LABEL_27;
      }
      if (([v13 isEqualToString:@"FALSE"] & 1) != 0
        || ([v13 isEqualToString:@"NO"] & 1) != 0)
      {
        v14 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *a3 = [v12 BOOLValue];
        goto LABEL_20;
      }
    }
    v15 = 0;
    goto LABEL_26;
  }
  v15 = 0;
LABEL_27:

  return v15;
}

void sub_100002308(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t getIntValue(uint64_t *a1, uint64_t *a2, _DWORD *a3)
{
  if (*((char *)a1 + 23) >= 0) {
    v7 = a1;
  }
  else {
    v7 = (uint64_t *)*a1;
  }
  v8 = +[NSString stringWithUTF8String:v7];
  v9 = (void *)CFPreferencesCopyAppValue(v8, @"com.apple.MobileBluetooth.debug");

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (*((char *)a2 + 23) >= 0) {
      v10 = a2;
    }
    else {
      v10 = (uint64_t *)*a2;
    }
    v11 = +[NSString stringWithUTF8String:v10];
    v12 = [v9 objectForKey:v11];

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      *a3 = [v12 intValue];
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

void sub_100002464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100002C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,void *__p,uint64_t a51,int a52,__int16 a53,char a54,char a55,void *a56,uint64_t a57,int a58,__int16 a59,char a60,char a61)
{
  _Unwind_Resume(a1);
}

void sub_100002E94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int64_t sub_100002EA8(id a1, DEAttachmentItem *a2, DEAttachmentItem *a3)
{
  v4 = a2;
  v5 = [(DEAttachmentItem *)a3 modificationDate];
  v6 = [(DEAttachmentItem *)v4 modificationDate];
  id v7 = [v5 compare:v6];

  return (int64_t)v7;
}

void sub_100002F18(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void *sub_100002F44(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100002FF8();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_100002FF8()
{
}

void sub_100003010(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10000306C(exception, a1);
}

void sub_100003058(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_10000306C(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_fileModificationDate(void *a1, const char *a2, ...)
{
  return [a1 fileModificationDate];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_filesize(void *a1, const char *a2, ...)
{
  return [a1 filesize];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return [a1 modificationDate];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}