void sub_252AAAA3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
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

id _IPDefaultLog()
{
  if (_IPDefaultLog_onceToken != -1) {
    dispatch_once(&_IPDefaultLog_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)_IPDefaultLog_log;

  return v0;
}

id _IPServerLog()
{
  if (_IPServerLog_onceToken != -1) {
    dispatch_once(&_IPServerLog_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)_IPServerLog_log;

  return v0;
}

id _IPClientLog()
{
  if (_IPClientLog_onceToken != -1) {
    dispatch_once(&_IPClientLog_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)_IPClientLog_log;

  return v0;
}

id IPServerExportedInterface()
{
  if (IPServerExportedInterface_onceToken != -1) {
    dispatch_once(&IPServerExportedInterface_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)IPServerExportedInterface_interface;

  return v0;
}

uint64_t __IPServerExportedInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2702FED68];
  v1 = (void *)IPServerExportedInterface_interface;
  IPServerExportedInterface_interface = v0;

  [(id)IPServerExportedInterface_interface setClass:objc_opt_class() forSelector:sel_actionBarrier_ argumentIndex:0 ofReply:1];
  [(id)IPServerExportedInterface_interface setClass:objc_opt_class() forSelector:sel_registerAsProgressObserver_ argumentIndex:0 ofReply:1];
  v2 = (void *)IPServerExportedInterface_interface;
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_getActiveInstallations_ argumentIndex:0 ofReply:1];

  [(id)IPServerExportedInterface_interface setClass:objc_opt_class() forSelector:sel_getActiveInstallations_ argumentIndex:1 ofReply:1];
  v6 = (void *)IPServerExportedInterface_interface;
  v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v6 setClasses:v9 forSelector:sel_getAllInstallableStates_ argumentIndex:0 ofReply:1];

  [(id)IPServerExportedInterface_interface setClass:objc_opt_class() forSelector:sel_getAllInstallableStates_ argumentIndex:1 ofReply:1];
  [(id)IPServerExportedInterface_interface setClass:objc_opt_class() forSelector:sel_getProgressForIdentity_completion_ argumentIndex:0 ofReply:0];
  [(id)IPServerExportedInterface_interface setClass:objc_opt_class() forSelector:sel_getProgressForIdentity_completion_ argumentIndex:0 ofReply:1];
  v10 = (void *)IPServerExportedInterface_interface;
  uint64_t v11 = objc_opt_class();

  return [v10 setClass:v11 forSelector:sel_getProgressForIdentity_completion_ argumentIndex:1 ofReply:1];
}

id IPClientExportedInterface()
{
  if (IPClientExportedInterface_onceToken != -1) {
    dispatch_once(&IPClientExportedInterface_onceToken, &__block_literal_global_62);
  }
  uint64_t v0 = (void *)IPClientExportedInterface_interface;

  return v0;
}

uint64_t __IPClientExportedInterface_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2702FF5E0];
  v1 = (void *)IPClientExportedInterface_interface;
  IPClientExportedInterface_interface = v0;

  [(id)IPClientExportedInterface_interface setClass:objc_opt_class() forSelector:sel_installableForIdentity_progressChanged_ argumentIndex:0 ofReply:0];
  [(id)IPClientExportedInterface_interface setClass:objc_opt_class() forSelector:sel_installableForIdentity_progressChanged_ argumentIndex:1 ofReply:0];
  v2 = (void *)IPClientExportedInterface_interface;
  uint64_t v3 = objc_opt_class();

  return [v2 setClass:v3 forSelector:sel_installableForIdentity_progressEndedForReason_ argumentIndex:0 ofReply:0];
}

void sub_252AABEA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_252AACF8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_252AAD0B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_252AAD208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_252AAD344(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_252AAD6D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_252AAD8A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_252AAD9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_252AADB18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_252AADC4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_252AAE5AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_252AAE748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_252AAEEF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_252AAF89C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void IPDoWithLock(os_unfair_lock_s *a1, void *a2)
{
  uint64_t v3 = a2;
  os_unfair_lock_lock(a1);
  v3[2](v3);

  os_unfair_lock_unlock(a1);
}

id defaultBehaviorQueue()
{
  if (defaultBehaviorQueue_onceToken != -1) {
    dispatch_once(&defaultBehaviorQueue_onceToken, &__block_literal_global_138);
  }
  uint64_t v0 = (void *)defaultBehaviorQueue_queue;

  return v0;
}

uint64_t __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x2533C8180](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_252AB09F8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_252AB101C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_252AB1228(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_252AB18B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_252AB1BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_252AB1FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_252AB21E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_252AB2484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Unwind_Resume(a1);
}

void __defaultBehaviorQueue_block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.InstallProgress.IPGlobalInstallableStateSourceDefaultBehavior.default", v2);
  uint64_t v1 = (void *)defaultBehaviorQueue_queue;
  defaultBehaviorQueue_queue = (uint64_t)v0;
}

void __defaultConnectionProvider_block_invoke()
{
  if (_os_feature_enabled_impl())
  {
    dispatch_queue_t v0 = &__block_literal_global_146;
  }
  else
  {
    uint64_t v1 = objc_alloc_init(IPLocalNullXPCServer);
    v2 = (void *)_block_invoke_localNullServer;
    _block_invoke_localNullServer = (uint64_t)v1;

    dispatch_queue_t v0 = &__block_literal_global_153;
  }
  uint64_t v3 = (void *)defaultConnectionProvider_provider;
  defaultConnectionProvider_provider = (uint64_t)v0;
}

id __defaultConnectionProvider_block_invoke_2()
{
  dispatch_queue_t v0 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.InstallProgress.xpc" options:0];

  return v0;
}

id __defaultConnectionProvider_block_invoke_3()
{
  dispatch_queue_t v0 = (void *)[(id)_block_invoke_localNullServer newClientConnection];

  return v0;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id _IPMakeNSErrorImpl(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  v10 = (objc_class *)MEMORY[0x263EFF9A0];
  id v11 = a1;
  id v12 = objc_alloc_init(v10);
  uint64_t v13 = v12;
  if (v9) {
    [v12 addEntriesFromDictionary:v9];
  }
  v14 = [NSString stringWithUTF8String:a3];
  [v13 setObject:v14 forKeyedSubscript:@"_IPFunction"];

  v15 = [NSNumber numberWithInt:a4];
  [v13 setObject:v15 forKeyedSubscript:@"_IPLine"];

  v16 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:v11 code:a2 userInfo:v13];

  return v16;
}

uint64_t OUTLINED_FUNCTION_0_1(uint64_t a1)
{
  return MEMORY[0x270EF2BB8](v2, v1, a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t IPProgressPhaseForLSInstallPhase(unint64_t a1)
{
  if (a1 > 4) {
    return 0;
  }
  else {
    return qword_252ABA2C8[a1];
  }
}

uint64_t LSInstallPhaseForIPProgressPhase(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return -1;
  }
  else {
    return qword_252ABA2F0[a1 - 1];
  }
}

uint64_t IPXPCCopyDescription(uint64_t a1)
{
  if (a1) {
    uint64_t v1 = (char *)MEMORY[0x2533C82E0]();
  }
  else {
    uint64_t v1 = 0;
  }
  id v2 = [NSString alloc];
  if (v1) {
    uint64_t v3 = v1;
  }
  else {
    uint64_t v3 = "(null)";
  }
  uint64_t v4 = [v2 initWithUTF8String:v3];
  free(v1);
  return v4;
}

id IPDecodeDictionaryWithKeyClassAndValueClass(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), a3, a4, 0);
  id v10 = v7;
  id v11 = v9;
  id v12 = [v10 decodeObjectOfClasses:v11 forKey:v8];
  uint64_t v13 = v12;
  if (v12 && (IPObjectIsKindOfClasses(v12, v11) & 1) == 0)
  {

    v14 = _IPMakeNSErrorImpl((void *)*MEMORY[0x263F07F70], 4864, (uint64_t)"IPDecodeObjectOfClasses", 61, 0);
    [v10 failWithError:v14];

    uint64_t v13 = 0;
  }

  if (v13)
  {
    v15 = [MEMORY[0x263EFFA08] setWithObject:a3];
    v16 = [MEMORY[0x263EFFA08] setWithObject:a4];
    id v17 = v13;
    unint64_t v18 = v15;
    unint64_t v19 = v16;
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 1;
    if (_NSIsNSDictionary())
    {
      if (v18 | v19)
      {
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __IPIsDictionaryWithKeysAndValuesOfClasses_block_invoke;
        v24[3] = &unk_26538FBA0;
        id v25 = (id)v18;
        id v26 = (id)v19;
        v27 = &v28;
        [v17 enumerateKeysAndObjectsUsingBlock:v24];
      }
    }
    else
    {
      *((unsigned char *)v29 + 24) = 0;
    }
    int v20 = *((unsigned __int8 *)v29 + 24);
    _Block_object_dispose(&v28, 8);

    if (v20)
    {
      id v21 = v17;
      goto LABEL_13;
    }
    v22 = _IPMakeNSErrorImpl((void *)*MEMORY[0x263F07F70], 4864, (uint64_t)"IPDecodeDictionaryWithKeyClassAndValueClass", 77, 0);
    [v10 failWithError:v22];
  }
  id v21 = 0;
LABEL_13:

  return v21;
}

void sub_252AB64A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t IPObjectIsKindOfClasses(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a1;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = a2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_opt_isKindOfClass())
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

void __IPIsDictionaryWithKeysAndValuesOfClasses_block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v12 = a2;
  id v7 = a3;
  id v8 = (void *)a1[4];
  if (v8) {
    int v9 = IPObjectIsKindOfClasses(v12, v8) ^ 1;
  }
  else {
    int v9 = 0;
  }
  long long v10 = (void *)a1[5];
  if (v10) {
    int v11 = IPObjectIsKindOfClasses(v7, v10) ^ 1;
  }
  else {
    int v11 = 0;
  }
  if ((v9 | v11) == 1)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    *a4 = 1;
  }
}

id IPLSIdentityFromMIIdentity(void *a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = objc_alloc(MEMORY[0x263F01878]);
  uint64_t v5 = [v3 bundleID];
  uint64_t v6 = (void *)[v4 initWithBundleIdentifier:v5 allowPlaceholder:1 error:a2];

  if (v6)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v36 = v6;
    id v7 = [v6 identities];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v10 = 0;
      uint64_t v11 = *(void *)v39;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v38 + 1) + 8 * v12);
        if ([v13 personaType] == 3 || objc_msgSend(v13, "personaType") == 1)
        {
          id v14 = v13;

          id v10 = v14;
        }
        v15 = [v13 personaUniqueString];
        v16 = [v3 personaUniqueString];
        char v17 = [v15 isEqualToString:v16];

        if (v17) {
          break;
        }
        if (v9 == ++v12)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v38 objects:v43 count:16];
          if (v9) {
            goto LABEL_4;
          }
          goto LABEL_21;
        }
      }
      id v18 = v13;

      uint64_t v6 = v36;
      if (v18) {
        goto LABEL_38;
      }
    }
    else
    {
      id v10 = 0;
LABEL_21:

      uint64_t v6 = v36;
    }
    v27 = _IPDefaultLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      IPLSIdentityFromMIIdentity_cold_2();
    }

    id v10 = v10;
    id v18 = v10;
  }
  else
  {
    unint64_t v19 = _IPDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v3;
      _os_log_impl(&dword_252AA9000, v19, OS_LOG_TYPE_DEFAULT, "No record found for identity %@; manually creating one from constituent values",
        buf,
        0xCu);
    }

    uint64_t v37 = 0;
    id v20 = v3;
    id v21 = (void *)MEMORY[0x263F01860];
    v22 = [v20 personaUniqueString];
    id v42 = 0;
    LODWORD(v21) = [v21 personaWithUniqueString:v22 getPersonaType:&v37 error:&v42];
    id v23 = v42;

    if (v21)
    {
      id v10 = [v20 personaUniqueString];
      id v24 = 0;
      id v25 = 0;
      int v26 = 1;
    }
    else
    {
      uint64_t v28 = _IPDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = [v20 personaUniqueString];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v29;
        __int16 v45 = 2112;
        id v46 = v23;
        _os_log_impl(&dword_252AA9000, v28, OS_LOG_TYPE_DEFAULT, "Got error looking up persona unique string %@ (%@), falling back to personal", buf, 0x16u);
      }
      *(void *)buf = v23;
      id v25 = [MEMORY[0x263F841C0] personaAttributesForPersonaType:0 withError:buf];
      id v30 = *(id *)buf;

      if (v25)
      {
        id v10 = [v25 userPersonaUniqueString];
        id v24 = 0;
        int v26 = 1;
        uint64_t v37 = 1;
        id v23 = v30;
      }
      else
      {
        id v24 = v30;
        id v10 = 0;
        int v26 = 0;
        id v23 = v24;
      }
      uint64_t v6 = 0;
    }

    id v31 = v24;
    if (v26)
    {
      id v32 = objc_alloc(MEMORY[0x263F01860]);
      v33 = [v20 bundleID];
      id v18 = (id)[v32 initWithBundleIdentifier:v33 URL:0 personaUniqueString:v10 personaType:v37];
    }
    else
    {
      v34 = _IPDefaultLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        IPLSIdentityFromMIIdentity_cold_1();
      }

      id v18 = 0;
      if (a2) {
        *a2 = v31;
      }
    }
  }
LABEL_38:

  return v18;
}

void IPLSIdentityFromMIIdentity_cold_1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_252AA9000, v0, v1, "could not resolve persona of %@: %@");
}

void IPLSIdentityFromMIIdentity_cold_2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_252AA9000, v0, v1, "falling back to identity %@ for %@");
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x270EE57C8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x270EDBF50]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDBF90](bytes, length);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x270EDC048]();
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x270EDC0D8]();
}

uint64_t xpc_event_publisher_activate()
{
  return MEMORY[0x270EDC198]();
}

uint64_t xpc_event_publisher_create()
{
  return MEMORY[0x270EDC1A0]();
}

uint64_t xpc_event_publisher_fire()
{
  return MEMORY[0x270EDC1A8]();
}

uint64_t xpc_event_publisher_fire_with_reply()
{
  return MEMORY[0x270EDC1B0]();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return MEMORY[0x270EDC1B8]();
}

uint64_t xpc_event_publisher_set_handler()
{
  return MEMORY[0x270EDC1C0]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x270EDC290]();
}

uint64_t xpc_set_event()
{
  return MEMORY[0x270EDC398]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x270EDC430](value);
}