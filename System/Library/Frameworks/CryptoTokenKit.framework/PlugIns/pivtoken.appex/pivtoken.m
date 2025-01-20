id sub_100002FCC()
{
  void *v0;
  uint64_t vars8;

  if (qword_10000D140 != -1) {
    dispatch_once(&qword_10000D140, &stru_1000082E8);
  }
  v0 = (void *)qword_10000D148;

  return v0;
}

void sub_10000384C(id a1)
{
  qword_10000D148 = (uint64_t)os_log_create("com.apple.CryptoTokenKit", "pivtoken");

  _objc_release_x1();
}

id sub_100003FF0()
{
  if (qword_10000D150 != -1) {
    dispatch_once(&qword_10000D150, &stru_100008358);
  }
  v0 = (void *)qword_10000D158;

  return v0;
}

void sub_1000043D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000043F4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004404(uint64_t a1)
{
}

void sub_10000440C(uint64_t a1, void *a2)
{
  id v10 = a2;
  if ([v10 tag] == (id)112)
  {
    uint64_t v3 = [v10 value];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  else if ([v10 tag] == (id)113)
  {
    v6 = [v10 value];
    id v7 = [v6 length];

    if (v7)
    {
      id v8 = [v10 value];
      char v9 = *(unsigned char *)[v8 bytes];

      if (v9) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
    }
  }
}

void sub_1000052AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1000052EC(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  if ([v10 tag] == (id)52)
  {
    v6 = [v10 value];
    uint64_t v7 = [v6 hexString];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    char v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a4 = 1;
  }
}

void sub_100005380(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if ([v9 tag] == (id)193)
  {
    v6 = [v9 value];
    id v7 = [v6 length];

    if (v7)
    {
      id v8 = [v9 value];
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(unsigned __int8 *)[v8 bytes];

      *a4 = 1;
    }
  }
}

void sub_100005498(id a1)
{
  qword_10000D158 = (uint64_t)os_log_create("com.apple.CryptoTokenKit", "pivtoken");

  _objc_release_x1();
}

void sub_1000054DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100005504(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100005520(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "attempt to evaluate unsupported constraint %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100005598(int a1, uint64_t a2, os_log_t log)
{
  v3[0] = 67109378;
  v3[1] = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "expecting response with tag 0x%x, got %@", (uint8_t *)v3, 0x12u);
}

void sub_100005620(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005658()
{
  sub_1000054F8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "reading card object %{public}@", v1, 0xCu);
}

void sub_1000056CC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005748(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005780(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000057B8()
{
  sub_1000054F8();
  sub_1000054DC((void *)&_mh_execute_header, v0, v1, "failed to read key management identity (%{public}@)", v2, v3, v4, v5, v6);
}

void sub_100005820()
{
  sub_1000054F8();
  sub_1000054DC((void *)&_mh_execute_header, v0, v1, "failed to read digital signature identity (%{public}@)", v2, v3, v4, v5, v6);
}

void sub_100005888()
{
  sub_1000054F8();
  sub_1000054DC((void *)&_mh_execute_header, v0, v1, "failed to read card authentication identity (%{public}@)", v2, v3, v4, v5, v6);
}

void sub_1000058F0()
{
  sub_1000054F8();
  sub_1000054DC((void *)&_mh_execute_header, v0, v1, "failed to read PIV authentication identity (%{public}@)", v2, v3, v4, v5, v6);
}

void sub_100005958()
{
  sub_1000054F8();
  sub_1000054DC((void *)&_mh_execute_header, v0, v1, "failed to read Key History Object (%{public}@)", v2, v3, v4, v5, v6);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return _SecCertificateCreateWithData(allocator, data);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int inflate(z_streamp strm, int flush)
{
  return _inflate(strm, flush);
}

int inflateEnd(z_streamp strm)
{
  return _inflateEnd(strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return _inflateInit2_(strm, windowBits, version, stream_size);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_PINFormat(void *a1, const char *a2, ...)
{
  return [a1 PINFormat];
}

id objc_msgSend_algID(void *a1, const char *a2, ...)
{
  return [a1 algID];
}

id objc_msgSend_authState(void *a1, const char *a2, ...)
{
  return [a1 authState];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_canDecrypt(void *a1, const char *a2, ...)
{
  return [a1 canDecrypt];
}

id objc_msgSend_canPerformKeyExchange(void *a1, const char *a2, ...)
{
  return [a1 canPerformKeyExchange];
}

id objc_msgSend_canSign(void *a1, const char *a2, ...)
{
  return [a1 canSign];
}

id objc_msgSend_cla(void *a1, const char *a2, ...)
{
  return [a1 cla];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_constraints(void *a1, const char *a2, ...)
{
  return [a1 constraints];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_getWindowSize(void *a1, const char *a2, ...)
{
  return [a1 getWindowSize];
}

id objc_msgSend_hexString(void *a1, const char *a2, ...)
{
  return [a1 hexString];
}

id objc_msgSend_inflate(void *a1, const char *a2, ...)
{
  return [a1 inflate];
}

id objc_msgSend_keyID(void *a1, const char *a2, ...)
{
  return [a1 keyID];
}

id objc_msgSend_keySizeInBits(void *a1, const char *a2, ...)
{
  return [a1 keySizeInBits];
}

id objc_msgSend_keyType(void *a1, const char *a2, ...)
{
  return [a1 keyType];
}

id objc_msgSend_keychainContents(void *a1, const char *a2, ...)
{
  return [a1 keychainContents];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_objectID(void *a1, const char *a2, ...)
{
  return [a1 objectID];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_smartCard(void *a1, const char *a2, ...)
{
  return [a1 smartCard];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return [a1 tag];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedCharValue];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}