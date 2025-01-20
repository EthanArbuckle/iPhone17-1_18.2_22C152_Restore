uint64_t AUSandboxPlatformInitWithBundleIdentifier(NSObject *a1)
{
  NSObject *v1;
  char v3[1024];
  uint64_t v4;

  v4 = *MEMORY[0x263EF8340];
  if (a1) {
    v1 = a1;
  }
  else {
    v1 = &_os_log_internal;
  }
  bzero(v3, 0x400uLL);
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      AUSandboxPlatformInitWithBundleIdentifier_cold_2();
    }
    return 1;
  }
  if (!confstr(65537, v3, 0x400uLL))
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      AUSandboxPlatformInitWithBundleIdentifier_cold_1();
    }
    return 1;
  }
  return 0;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_23BCEECE0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_23BCEEEE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCSVoiceTriggerRTModelClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CSVoiceTriggerRTModel");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCSVoiceTriggerRTModelClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCSVoiceTriggerRTModelClass_block_invoke_cold_1();
    CoreSpeechLibrary();
  }
}

void CoreSpeechLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!CoreSpeechLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __CoreSpeechLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_264E10A98;
    uint64_t v3 = 0;
    CoreSpeechLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!CoreSpeechLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __CoreSpeechLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreSpeechLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCSCoreSpeechServicesClass_block_invoke(uint64_t a1)
{
  CoreSpeechLibrary();
  Class result = objc_getClass("CSCoreSpeechServices");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCSCoreSpeechServicesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (iAUPServer *)__getCSCoreSpeechServicesClass_block_invoke_cold_1();
    return (Class)[(iAUPServer *)v3 initInstanceWithByteEscape:v5];
  }
  return result;
}

void __45__iAUPServer_setHSModel_fallbackModel_error___block_invoke(id *a1)
{
  if (a1[4]) {
    long long v2 = "valid";
  }
  else {
    long long v2 = "nil";
  }
  if (a1[5]) {
    uint64_t v3 = "valid";
  }
  else {
    uint64_t v3 = "nil";
  }
  NSLog(&cfstr_SNewmodelSFall.isa, "-[iAUPServer setHSModel:fallbackModel:error:]_block_invoke", v2, v3, a1[6]);
  SEL v4 = a1[7];
  if (v4[4] != 5)
  {
    NSLog(&cfstr_HsCallbackInva.isa, objc_msgSend(v4, "serverStateString:"));
    goto LABEL_53;
  }
  if (a1[6]) {
    goto LABEL_9;
  }
  id v5 = a1[4];
  BOOL v6 = v5
    && [v5 modelData]
    && [a1[4] modelHash]
    && [a1[4] modelLocale] != 0;
  id v7 = a1[5];
  BOOL v8 = v7 && [v7 modelHash] && objc_msgSend(a1[5], "modelLocale") != 0;
  BOOL v34 = v8;
  BOOL v32 = v6;
  if (v6)
  {
    uint64_t v9 = objc_msgSend((id)objc_msgSend(a1[4], "modelHash"), "lengthOfBytesUsingEncoding:", 1);
    uint64_t v10 = objc_msgSend((id)objc_msgSend(a1[4], "modelLocale"), "lengthOfBytesUsingEncoding:", 1);
    uint64_t v33 = objc_msgSend((id)objc_msgSend(a1[4], "modelData"), "length");
    *((void *)a1[7] + 4) = -[FirmwareBundle initWithData:hashData:signatureData:certData:]([FirmwareBundle alloc], "initWithData:hashData:signatureData:certData:", [a1[4] modelData], objc_msgSend(a1[4], "digest"), objc_msgSend(a1[4], "signature"), objc_msgSend(a1[4], "certificate"));
    v11 = (void *)*((void *)a1[7] + 4);
    if (!v11)
    {
      NSLog(&cfstr_HsCallbackFail.isa, v30);
      goto LABEL_9;
    }
    size_t v35 = v10;
    size_t v36 = v9;
    uint64_t v12 = (v9 + v10 + 4);
    if ([v11 firmwareImage]) {
      v13 = "valid";
    }
    else {
      v13 = "nil";
    }
    v31 = v13;
    uint64_t v14 = [*((id *)a1[7] + 4) firmwareImageSize];
    if ([*((id *)a1[7] + 4) hash]) {
      v15 = "valid";
    }
    else {
      v15 = "nil";
    }
    if ([*((id *)a1[7] + 4) signature]) {
      v16 = "valid";
    }
    else {
      v16 = "nil";
    }
    if ([*((id *)a1[7] + 4) certificate]) {
      v17 = "valid";
    }
    else {
      v17 = "nil";
    }
    NSLog(&cfstr_Fimrwarebundle.isa, v31, v14, v15, v16, v17, [*((id *)a1[7] + 4) productIDCode], objc_msgSend(*((id *)a1[7] + 4), "firmwareImageBaseAddress"));
    if (!v34) {
      goto LABEL_35;
    }
  }
  else
  {
    size_t v35 = 0;
    size_t v36 = 0;
    uint64_t v33 = 0;
    uint64_t v12 = 2;
    if (!v8)
    {
LABEL_35:
      size_t v18 = 0;
      size_t v19 = 0;
      uint64_t v20 = 0;
      goto LABEL_38;
    }
  }
  size_t v18 = objc_msgSend((id)objc_msgSend(a1[5], "modelHash"), "lengthOfBytesUsingEncoding:", 1);
  size_t v19 = objc_msgSend((id)objc_msgSend(a1[5], "modelLocale"), "lengthOfBytesUsingEncoding:", 1);
  uint64_t v20 = objc_msgSend((id)objc_msgSend(a1[5], "modelData"), "length");
  uint64_t v12 = (v18 + v19 + v12 + 2);
LABEL_38:
  if ([a1[4] modelData]) {
    v21 = "valid";
  }
  else {
    v21 = "nil";
  }
  NSLog(&cfstr_SNewmodelDataL.isa, "-[iAUPServer setHSModel:fallbackModel:error:]_block_invoke", v33, v21, v35, [a1[4] modelLocale], v36, objc_msgSend(a1[4], "modelHash"));
  if ([a1[5] modelData]) {
    v22 = "valid";
  }
  else {
    v22 = "nil";
  }
  NSLog(&cfstr_SFbmodelDataLu.isa, "-[iAUPServer setHSModel:fallbackModel:error:]_block_invoke", v20, v22, v19, [a1[5] modelLocale], v18, objc_msgSend(a1[5], "modelHash"));
  NSLog(&cfstr_SReturnpayload.isa, "-[iAUPServer setHSModel:fallbackModel:error:]_block_invoke", v12);
  v23 = malloc_type_calloc(v12, 1uLL, 0x97229F3EuLL);
  if (!v23)
  {
    NSLog(&cfstr_HsCallbackErro.isa, v12);
LABEL_9:
    [a1[7] setServerState:3];
    __int16 v37 = 0;
    objc_msgSend(a1[7], "sendCommand:payload:payload_length:", 99, &v37, 2);
    objc_msgSend(*((id *)a1[7] + 1), "handleSessionError:message:", objc_msgSend(a1[6], "code"), @"Failed to retrieve HS Asset Info");
    goto LABEL_53;
  }
  v24 = v23;
  unsigned char *v23 = 0;
  unsigned int v25 = 2;
  if (v34) {
    char v26 = 2;
  }
  else {
    char v26 = 0;
  }
  v23[1] = v26 | v32;
  if (v32)
  {
    v23[2] = v35;
    memcpy(v23 + 3, (const void *)objc_msgSend((id)objc_msgSend(a1[4], "modelLocale"), "cStringUsingEncoding:", 1), v35);
    v24[(v35 + 3)] = v36;
    memcpy(&v24[(v35 + 4)], (const void *)objc_msgSend((id)objc_msgSend(a1[4], "modelHash"), "cStringUsingEncoding:", 1), v36);
    unsigned int v25 = v35 + 4 + v36;
  }
  if (v34)
  {
    uint64_t v27 = v25 + 1;
    v24[v25] = v19;
    memcpy(&v24[v27], (const void *)objc_msgSend((id)objc_msgSend(a1[5], "modelLocale"), "cStringUsingEncoding:", 1), v19);
    int v28 = v27 + v19;
    uint64_t v29 = (v27 + v19 + 1);
    v24[v28] = v18;
    memcpy(&v24[v29], (const void *)objc_msgSend((id)objc_msgSend(a1[5], "modelHash"), "cStringUsingEncoding:", 1), v18);
    LOWORD(v25) = v29 + v18;
  }
  objc_msgSend(a1[7], "sendCommand:payload:payload_length:", 97, v24, (unsigned __int16)v25);
  [a1[7] setServerState:6];
  free(v24);
LABEL_53:

  *((void *)a1[7] + 5) = 0;
}

void sub_23BCF35C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23BCF36DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23BCF386C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ConstructError(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = (id)[[NSString alloc] initWithFormat:a3 arguments:&a9];
  v11 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
  if (v10)
  {
    NSLog(&stru_26EF25E08.isa, v10);
    [v11 setObject:v10 forKey:*MEMORY[0x263F08320]];
  }
  return [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.MobileAccessoryUpdater.EAFirmwareUpdater" code:a2 userInfo:v11];
}

void sub_23BCF7410(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23BCF7C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_23BCF7F94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t generateSHA256HashForDataAtLocationAsData(uint64_t a1, uint64_t a2)
{
  return generateHashForDataAtLocationAsData(a1, 10, a2);
}

uint64_t generateHashForDataAtLocationAsData(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = (void *)[MEMORY[0x263F08840] fileHandleForReadingFromURL:a1 error:a3];
  uint64_t result = 0;
  if (a2 && v5)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = CCDigestInit();
    do
    {
      BOOL v8 = (void *)MEMORY[0x23ECD37D0](v7);
      uint64_t v9 = objc_msgSend(v5, "uarpReadDataUpToLength:error:", 0x4000, a3, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27,
                     v28,
                     v29,
                     v30,
                     v31,
                     v32,
                     v33,
                     v34,
                     v35,
                     v36,
                     v37,
                     v38,
                     v39,
                     v40,
                     v41,
                     (void)v42);
      [v9 bytes];
      [v9 length];
      CCDigestUpdate();
      unint64_t v10 = [v9 length];
    }
    while (v10 >> 14);
    uint64_t OutputSize = CCDigestGetOutputSize();
    uint64_t v12 = (char *)&v13 - ((MEMORY[0x270FA5388]() + 15) & 0xFFFFFFFFFFFFFFF0);
    CCDigestFinal();
    if ([v5 uarpCloseAndReturnError:a3]) {
      return [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v12 length:OutputSize];
    }
    else {
      return 0;
    }
  }
  return result;
}

id generateSHA256HashForDataAtLocation(uint64_t a1, uint64_t a2)
{
  return generateHashForDataAtLocation(a1, 10, a2);
}

id generateHashForDataAtLocation(uint64_t a1, int a2, uint64_t a3)
{
  HashForDataAtLocationAsData = (void *)generateHashForDataAtLocationAsData(a1, a2, a3);
  if (!HashForDataAtLocationAsData) {
    return 0;
  }
  SEL v4 = HashForDataAtLocationAsData;
  uint64_t v5 = [HashForDataAtLocationAsData bytes];
  id v6 = objc_alloc_init(MEMORY[0x263F089D8]);
  if ([v4 length])
  {
    unint64_t v7 = 0;
    do
      objc_msgSend(v6, "appendFormat:", @"%02x", *(unsigned __int8 *)(v5 + v7++));
    while (v7 < [v4 length]);
  }
  return v6;
}

void *generateBase64HashForDataAtLocation(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result = (void *)generateHashForDataAtLocationAsData(a1, a2, a3);
  if (result)
  {
    return (void *)[result base64EncodedStringWithOptions:0];
  }
  return result;
}

void AUSandboxPlatformInitWithBundleIdentifier_cold_1()
{
  __error();
  OUTLINED_FUNCTION_0(&dword_23BCED000, v0, v1, "failed to initialize temporary directory: %d", v2, v3, v4, v5, 0);
}

void AUSandboxPlatformInitWithBundleIdentifier_cold_2()
{
  __error();
  OUTLINED_FUNCTION_0(&dword_23BCED000, v0, v1, "failed to set temporary directory suffix: %d", v2, v3, v4, v5, 0);
}

uint64_t __getCSVoiceTriggerRTModelClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCSCoreSpeechServicesClass_block_invoke_cold_1(v0);
}

uint64_t __getCSCoreSpeechServicesClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[FirmwareBundle initWithURL:hashData:signatureData:certData:](v0);
}

uint64_t CCDigestFinal()
{
  return MEMORY[0x270ED7988]();
}

uint64_t CCDigestGetOutputSize()
{
  return MEMORY[0x270ED7990]();
}

uint64_t CCDigestInit()
{
  return MEMORY[0x270ED7998]();
}

uint64_t CCDigestUpdate()
{
  return MEMORY[0x270ED79B0]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return MEMORY[0x270ED8150]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76318]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccdigest_init()
{
  return MEMORY[0x270ED8A48]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x270ED8A50]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x270ED8D70]();
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x270ED8F50](*(void *)&a1, a2, a3);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

uint64_t metadataTLVGetNext()
{
  return MEMORY[0x270F4A888]();
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

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t parseSuperBinaryAndPayloadHeaders()
{
  return MEMORY[0x270F4A890]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

uint64_t updateSuperBinaryPayload()
{
  return MEMORY[0x270F4A898]();
}