uint64_t _AsyncKVOSequenceProtocol<>.changes<A>(for:options:bufferingPolicy:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned char *v10;
  unsigned char v12[16];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  sub_2183640B0();
  v7 = sub_2183640F0();
  v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v10 = &v12[-v9];
  swift_checkMetadataState();
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v8 + 16))(v10, a3, v7);
  v13 = v3;
  v14 = a1;
  v15 = a2;
  return sub_218364120();
}

uint64_t sub_2183605F0(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  v18[0] = a4;
  uint64_t v6 = *a3;
  uint64_t v7 = *(void *)(*MEMORY[0x263F8EA20] + *a3 + 8);
  sub_2183640B0();
  uint64_t v8 = sub_218364110();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)v18 - v10;
  v18[1] = a2;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)v18 - v10, a1, v8);
  unint64_t v12 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v13 = swift_allocObject();
  uint64_t v14 = *(void *)(v6 + *MEMORY[0x263F8EA20]);
  *(void *)(v13 + 16) = v14;
  *(void *)(v13 + 24) = v7;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v13 + v12, v11, v8);
  uint64_t v15 = sub_2183640C0();
  swift_release();
  v16 = (void *)swift_allocObject();
  v16[2] = v14;
  v16[3] = v7;
  v16[4] = v15;
  return sub_2183640E0();
}

uint64_t sub_2183607FC(uint64_t a1)
{
  return sub_2183605F0(a1, *(void *)(v1 + 16), *(uint64_t **)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_218360808(uint64_t a1)
{
  uint64_t v2 = sub_2183640B0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  v5 = (char *)&v11 - v4;
  uint64_t v6 = sub_2183640D0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v11 - v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  sub_218364110();
  sub_218364100();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_218360988()
{
  sub_2183640B0();
  uint64_t v1 = sub_218364110();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_218360A28(uint64_t a1, uint64_t a2)
{
  sub_2183640B0();
  sub_218364110();
  return sub_218360808(a2);
}

uint64_t sub_218360AB8()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_218360AF0()
{
  return sub_2183640A0();
}

id _readStringDate(void *a1)
{
  if (a1)
  {
    uint64_t v1 = (objc_class *)MEMORY[0x263F08790];
    id v2 = a1;
    id v3 = objc_alloc_init(v1);
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
    [v3 setLocale:v4];
    [v3 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    uint64_t v5 = [v3 dateFromString:v2];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

uint64_t __ASFLogHandleForCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.appstorefoundation", "Default");
  uint64_t v1 = (void *)ASFLogHandleForCategory_logHandles_0;
  ASFLogHandleForCategory_logHandles_0 = (uint64_t)v0;

  ASFLogHandleForCategory_logHandles_1 = (uint64_t)os_log_create("com.apple.appstorefoundation", "Signpost");
  return MEMORY[0x270F9A758]();
}

void sub_218363AE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __readIdentifier_block_invoke(uint64_t result, unsigned char *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a4)
  {
    **(unsigned char **)(result + 40) = *a2 >> 6;
    if ((~*a2 & 0x1F) != 0)
    {
      **(void **)(result + 48) = 1;
      uint64_t v5 = *a2 & 0x1F;
    }
    else
    {
      uint64_t v5 = 0xFFFFLL;
    }
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v5;
  }
  *a5 = 1;
  return result;
}

void __readLength_block_invoke(uint64_t a1, unsigned char *a2, uint64_t a3, unint64_t a4, unsigned char *a5)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a4)
  {
    if (((char)*a2 & 0x80000000) == 0)
    {
      **(void **)(a1 + 40) = 1;
      uint64_t v6 = *a2;
LABEL_4:
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v6;
      goto LABEL_18;
    }
    unint64_t v7 = *a2 & 0x7F;
    if (a4 <= v7)
    {
      **(void **)(a1 + 40) = 1;
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      goto LABEL_18;
    }
    if (v7 <= 8)
    {
      if (v7)
      {
        uint64_t v8 = 0;
        uint64_t v6 = 0;
        do
        {
          if (v8) {
            v6 <<= 8;
          }
          v6 |= a2[++v8];
        }
        while (v7 != v8);
      }
      else
      {
        uint64_t v6 = 0;
      }
      **(void **)(a1 + 40) = (v7 + 1);
      goto LABEL_4;
    }
    if (ASFLogHandleForCategory_onceToken_0 != -1) {
      dispatch_once(&ASFLogHandleForCategory_onceToken_0, &__block_literal_global_0);
    }
    uint64_t v9 = ASFLogHandleForCategory_logHandles_0_0;
    if (os_log_type_enabled((os_log_t)ASFLogHandleForCategory_logHandles_0_0, OS_LOG_TYPE_ERROR))
    {
      v10[0] = 67109120;
      v10[1] = v7;
      _os_log_error_impl(&dword_21835E000, v9, OS_LOG_TYPE_ERROR, "Byte count would result in overflow: %d", (uint8_t *)v10, 8u);
    }
  }
LABEL_18:
  *a5 = 1;
}

uint64_t __ASFLogHandleForCategory_block_invoke_0()
{
  os_log_t v0 = os_log_create("com.apple.appstorefoundation", "Default");
  uint64_t v1 = (void *)ASFLogHandleForCategory_logHandles_0_0;
  ASFLogHandleForCategory_logHandles_0_0 = (uint64_t)v0;

  ASFLogHandleForCategory_logHandles_1_0 = (uint64_t)os_log_create("com.apple.appstorefoundation", "Signpost");
  return MEMORY[0x270F9A758]();
}

uint64_t sub_2183640A0()
{
  return MEMORY[0x270EEF760]();
}

uint64_t sub_2183640B0()
{
  return MEMORY[0x270EEF9E8]();
}

uint64_t sub_2183640C0()
{
  return MEMORY[0x270EEFA78]();
}

uint64_t sub_2183640D0()
{
  return MEMORY[0x270FA1F28]();
}

uint64_t sub_2183640E0()
{
  return MEMORY[0x270FA1F30]();
}

uint64_t sub_2183640F0()
{
  return MEMORY[0x270FA1F38]();
}

uint64_t sub_218364100()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_218364110()
{
  return MEMORY[0x270FA1F58]();
}

uint64_t sub_218364120()
{
  return MEMORY[0x270FA1F90]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFRelease(CFTypeRef cf)
{
}

void NSLog(NSString *format, ...)
{
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x270EFD7E0](allocator, data);
}

uint64_t SecCmsContentInfoGetContent()
{
  return MEMORY[0x270EFD870]();
}

uint64_t SecCmsContentInfoGetContentTypeTag()
{
  return MEMORY[0x270EFD878]();
}

uint64_t SecCmsDecoderCreate()
{
  return MEMORY[0x270EFD880]();
}

uint64_t SecCmsDecoderDestroy()
{
  return MEMORY[0x270EFD888]();
}

uint64_t SecCmsDecoderFinish()
{
  return MEMORY[0x270EFD890]();
}

uint64_t SecCmsDecoderUpdate()
{
  return MEMORY[0x270EFD898]();
}

uint64_t SecCmsMessageContentLevel()
{
  return MEMORY[0x270EFD8A0]();
}

uint64_t SecCmsMessageContentLevelCount()
{
  return MEMORY[0x270EFD8A8]();
}

uint64_t SecCmsMessageDestroy()
{
  return MEMORY[0x270EFD8B0]();
}

uint64_t SecCmsMessageGetContent()
{
  return MEMORY[0x270EFD8B8]();
}

uint64_t SecCmsSignedDataGetCertificateList()
{
  return MEMORY[0x270EFD8C0]();
}

SecPolicyRef SecPolicyCreateWithProperties(CFTypeRef policyIdentifier, CFDictionaryRef properties)
{
  return (SecPolicyRef)MEMORY[0x270EFDBC0](policyIdentifier, properties);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x270EFDD40](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x270EFDD60](trust, error);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x270EFDDE0](trust, policies);
}

OSStatus SecTrustSetVerifyDate(SecTrustRef trust, CFDateRef verifyDate)
{
  return MEMORY[0x270EFDDF8](trust, verifyDate);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}