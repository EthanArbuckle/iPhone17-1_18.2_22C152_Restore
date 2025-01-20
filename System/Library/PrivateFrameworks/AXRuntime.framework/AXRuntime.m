uint64_t _AXNextIgnoredNotification()
{
  return AXIgnoredNotification;
}

uint64_t _AXCreateAXUIElementWithElement(void *a1)
{
  return __AXCreateAXUIElementWithElement(a1, 0, 0);
}

uint64_t mshHash(unsigned int *a1)
{
  return *a1;
}

void AXPidSuspend(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = AXRuntimeLogPID();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [NSNumber numberWithInt:a1];
    *(_DWORD *)buf = 138412546;
    v12 = v5;
    __int16 v13 = 2112;
    v14 = @"<redacted>";
    _os_log_impl(&dword_1BA657000, v4, OS_LOG_TYPE_INFO, "Client requesting suspension of PID:%@ Name:%@", buf, 0x16u);
  }
  v6 = objc_msgSend(NSNumber, "numberWithInt:", a1, @"pid");
  v10[0] = v6;
  v10[1] = @"suspended";
  v9[1] = @"suspended-status";
  v9[2] = @"display-type";
  v7 = [NSNumber numberWithInt:a2];
  v10[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  AXPushNotificationToSystemForBroadcast();
}

void __AXBroadcastNotificationToAllClients_block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = CFDictionaryGetValue((CFDictionaryRef)ObserverDictionary, (const void *)*(int *)(a1 + 40));
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 32), "addObject:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void AXBroadcastNotificationToAllClients(int a1, int a2, CFTypeRef cf)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (_AXInitializeObserverAccess_onceToken == -1)
  {
    if (!cf) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&_AXInitializeObserverAccess_onceToken, &__block_literal_global_6);
  if (cf) {
LABEL_3:
  }
    CFRetain(cf);
LABEL_4:
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __AXBroadcastNotificationToAllClients_block_invoke;
  v18 = &unk_1E6220768;
  int v20 = a1;
  id v19 = v5;
  AX_PERFORM_WITH_LOCK();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v19;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "observer", (void)v11);
        _AXUIElementPostNotification();
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v21 count:16];
    }
    while (v8);
  }

  if (cf) {
    CFRelease(cf);
  }
}

uint64_t _AXUIElementPostNotification()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  int v6 = v5;
  uint64_t v7 = (const void *)v0;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  long long v31 = 0uLL;
  BOOL v30 = 0;
  int length_4 = 0;
  uint64_t v8 = AXRuntimeLogNotifications();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[8] = 2112;
    *(void *)&buf[10] = v2;
    _os_log_impl(&dword_1BA657000, v8, OS_LOG_TYPE_INFO, "Sending notification to client: %d, %@", buf, 0x12u);
  }

  if (v4)
  {
    if (!v7) {
      return 4294942095;
    }
  }
  else
  {
    uint64_t v4 = AXUIElementSharedSystemWide();
    if (!v7) {
      return 4294942095;
    }
  }
  int v9 = _AXUIElementValidate(v4, &v30, &v31, &length_4);
  if (v9 < 0) {
    return 4294942095;
  }
  long long v14 = v31;
  if (_AXUIElementPostNotification_registerOnce != -1) {
    dispatch_once(&_AXUIElementPostNotification_registerOnce, &__block_literal_global_356);
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
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
  memset(buf, 0, sizeof(buf));
  unsigned int length = 0;
  v27 = 0;
  int v26 = 0;
  if (v2)
  {
    uint64_t result = AXSerializeWrapper(v2, 1, buf, &length, &v27, &v26);
    if (result) {
      return result;
    }
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    uint64_t v25 = 0;
    if (!length) {
      goto LABEL_17;
    }
    CFDataRef v11 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], buf, length);
    long long v12 = v23;
  }
  else
  {
    CFDataRef v11 = 0;
    long long v12 = &v22;
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
  }
  v12[3] = (uint64_t)v11;
LABEL_17:
  getpid();
  CFRetain(v7);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = ___AXUIElementPostNotification_block_invoke_2;
  aBlock[3] = &unk_1E621FF50;
  aBlock[4] = &v22;
  aBlock[5] = v7;
  unsigned int v18 = length;
  int v19 = v9;
  long long v16 = v14;
  v17 = v27;
  int v20 = v6;
  int v21 = v26;
  long long v13 = _Block_copy(aBlock);
  dispatch_async((dispatch_queue_t)_AXUIElementPostNotification_DifferentQueue, v13);

  _Block_object_dispose(&v22, 8);
  return 0;
}

void sub_1BA659034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AXPidUnsuspend(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = AXRuntimeLogPID();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = [NSNumber numberWithInt:a1];
    *(_DWORD *)buf = 138412546;
    long long v12 = v5;
    __int16 v13 = 2112;
    long long v14 = @"<redacted>";
    _os_log_impl(&dword_1BA657000, v4, OS_LOG_TYPE_INFO, "Client requesting unsuspension of PID:%@ Name:%@", buf, 0x16u);
  }
  int v6 = objc_msgSend(NSNumber, "numberWithInt:", a1, @"pid");
  v10[0] = v6;
  v10[1] = @"resumed";
  v9[1] = @"suspended-status";
  v9[2] = @"display-type";
  uint64_t v7 = [NSNumber numberWithInt:a2];
  v10[2] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  AXPushNotificationToSystemForBroadcast();
}

uint64_t mshMIGPerform(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  mach_msg_return_t v26;
  FILE *v27;
  pid_t v28;
  mach_port_t previous;
  mach_port_mscount_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a4 + 32);
  int v7 = *(_DWORD *)(a1 + 20);
  int v8 = *(_DWORD *)(v6 + 8);
  unsigned int v9 = 36;
  if (*(_DWORD *)(v6 + 12) <= v7 || v7 < v8)
  {
    CFDataRef v11 = 0;
  }
  else
  {
    uint64_t v12 = v6 + 40 * (v7 - v8);
    CFDataRef v11 = *(void (**)(uint64_t, mach_msg_header_t *))(v12 + 40);
    if (*(_DWORD *)(v12 + 64) <= 0x24u) {
      unsigned int v9 = 36;
    }
    else {
      unsigned int v9 = *(_DWORD *)(v12 + 64);
    }
  }
  MEMORY[0x1F4188790]();
  long long v14 = (mach_msg_header_t *)((char *)&previous - v13);
  bzero((char *)&previous - v13, v15);
  if (v9 > 0x2000)
  {
    long long v14 = (mach_msg_header_t *)malloc_type_malloc(v9, 0x381CB9CDuLL);
    int v7 = *(_DWORD *)(a1 + 20);
  }
  v14->msgh_bits = *(_DWORD *)a1 & 0x1F;
  mach_port_t v16 = *(_DWORD *)(a1 + 8);
  v14->msgh_size = 36;
  v14->mach_port_t msgh_remote_port = v16;
  v14->msgh_local_port = 0;
  v14->msgh_id = v7 + 100;
  if (v11)
  {
    uint64_t v17 = *(void *)(a4 + 8);
    if ((*(unsigned char *)(a4 + 4) & 2) != 0) {
      *(_DWORD *)(a1 + 12) = v17;
    }
    *(void *)(a1 + *(unsigned int *)(a1 + 4) + 52) = v17;
    v11(a1, v14);
    if ((v14->msgh_bits & 0x80000000) != 0)
    {
LABEL_33:
      if (v14->msgh_remote_port)
      {
        if ((v14->msgh_bits & 0x1F) == 0x12) {
          mach_msg_option_t v25 = 1;
        }
        else {
          mach_msg_option_t v25 = 17;
        }
        int v26 = mach_msg(v14, v25, v14->msgh_size, 0, 0, 0, 0);
        if ((v26 - 268435459) >= 2)
        {
          if (v26)
          {
            v27 = (FILE *)*MEMORY[0x1E4F143C8];
            v28 = getpid();
            fprintf(v27, "%d: badly generated MIG reply for port %x\n", v28, *(_DWORD *)a4);
          }
        }
        else
        {
          mach_msg_destroy(v14);
        }
      }
      goto LABEL_42;
    }
LABEL_28:
    mach_port_t msgh_remote_port = v14[1].msgh_remote_port;
    if (msgh_remote_port)
    {
      if (msgh_remote_port == -305)
      {
        v14->mach_port_t msgh_remote_port = 0;
        goto LABEL_42;
      }
      if ((*(_DWORD *)a1 & 0x80000000) != 0)
      {
        *(_DWORD *)(a1 + 8) = 0;
        mach_msg_destroy((mach_msg_header_t *)a1);
      }
    }
    goto LABEL_33;
  }
  int v18 = *(_DWORD *)(a1 + 20);
  if (v18 == 71)
  {
    v23 = *(void (**)(uint64_t, void))(a4 + 24);
    if (v23) {
      v23(a1, *(void *)(a4 + 8));
    }
  }
  else
  {
    if (v18 != 70)
    {
      *(void *)&v14[1].msgh_bits = *MEMORY[0x1E4F14068];
      v14[1].mach_port_t msgh_remote_port = -303;
      goto LABEL_28;
    }
    int v19 = *(uint64_t (**)(void))(a4 + 16);
    if (v19)
    {
      long long v31 = *(_DWORD *)(a1 + 32);
      if (*(unsigned __int8 *)(a1 + 28) != *(unsigned __int8 *)(MEMORY[0x1E4F14068] + 4)) {
        long long v31 = bswap32(v31);
      }
      mach_port_mscount_t v20 = v19();
      long long v31 = v20;
      if (v20)
      {
        previous = 0;
        mach_port_name_t v21 = *(_DWORD *)a4;
        ipc_space_t v22 = *MEMORY[0x1E4F14960];
        mach_port_request_notification(*MEMORY[0x1E4F14960], v21, 70, v20, v21, 0x15u, &previous);
        if (previous) {
          mach_port_mod_refs(v22, previous, 2u, -1);
        }
      }
      else
      {
        *(void *)(a4 + 16) = 0;
      }
    }
  }
LABEL_42:
  if (v9 > 0x2000) {
    free(v14);
  }
  return 0;
}

uint64_t _XBroadcastNotification(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v4 = *(unsigned int *)(result + 4);
  if (v4 < 0x54 || v4 > 0x1054) {
    goto LABEL_3;
  }
  if (*(unsigned char *)(result + 39) != 1) {
    goto LABEL_18;
  }
  unsigned int v6 = *(_DWORD *)(result + 76);
  if (v6 > 0x1000)
  {
LABEL_2:
    int v3 = -304;
    goto LABEL_3;
  }
  int v3 = -304;
  if ((int)v4 - 84 < v6) {
    goto LABEL_3;
  }
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  if (v4 != v7 + 84) {
    goto LABEL_3;
  }
  uint64_t v8 = result + v7;
  unsigned int v9 = *(_DWORD *)(result + 40);
  if (v9 != *(_DWORD *)(v8 + 80))
  {
LABEL_18:
    int v3 = -300;
    goto LABEL_3;
  }
  long long v10 = (_DWORD *)(((v4 + 3) & 0x1FFFFFFFCLL) + result);
  if (!*v10 && v10[1] > 0x1Fu)
  {
    uint64_t result = _AXXMIGBroadcastNotification(*(unsigned int *)(result + 12), *(unsigned int *)(result + 52), *(unsigned int *)(result + 56), *(void *)(result + 60), *(void *)(result + 68), result + 80, v6, *(void **)(result + 28), v9);
    *(_DWORD *)(a2 + 32) = result;
    return result;
  }
  int v3 = -309;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _AXXMIGBroadcastNotification(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7, void *a8, unsigned int a9)
{
  CFTypeRef cf = 0;
  int v14 = AXUnserializeWrapper(a6, a7, (uint64_t)a8, a9, (uint64_t)&cf);
  if (v14) {
    BOOL v15 = v14 == -25212;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    uint64_t v23 = 5;
    goto LABEL_14;
  }
  Internal = (const void *)_AXUIElementCreateInternal(a2, a4, a5);
  uint64_t v17 = (void (*)(uint64_t, uint64_t, const void *, CFTypeRef, uint64_t))gSystemWideServerBroadcastRelayerCallback;
  if (gSystemWideServerBroadcastRelayerCallback)
  {
    CFTypeRef v18 = cf;
    uint64_t v19 = gSystemWideServerBroadcastRelayerCallbackInfo;
    uint64_t v20 = a3;
    uint64_t v21 = a2;
    ipc_space_t v22 = Internal;
LABEL_10:
    v17(v20, v21, v22, v18, v19);
    goto LABEL_11;
  }
  uint64_t v17 = (void (*)(uint64_t, uint64_t, const void *, CFTypeRef, uint64_t))gNotificationBypassCallback;
  if (gNotificationBypassCallback)
  {
    CFTypeRef v18 = cf;
    uint64_t v20 = a3;
    uint64_t v21 = a2;
    ipc_space_t v22 = Internal;
    uint64_t v19 = 0;
    goto LABEL_10;
  }
LABEL_11:
  if (Internal) {
    CFRelease(Internal);
  }
  uint64_t v23 = 0;
LABEL_14:
  if (cf) {
    CFRelease(cf);
  }
  if (a8 && a9) {
    munmap(a8, a9);
  }
  return v23;
}

uint64_t __AXCreateAXUIElementWithElement(void *a1, int a2, int a3)
{
  id v5 = a1;
  unsigned int v6 = v5;
  if (v5)
  {
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 == AXUIElementGetTypeID())
    {
      uint64_t AppElementWithPid = (uint64_t)CFRetain(v6);
LABEL_17:
      uint64_t v9 = AppElementWithPid;
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (ApplicationElementRetrieval
        && (ApplicationElementRetrieval(),
            uint64_t v13 = objc_claimAutoreleasedReturnValue(),
            v13,
            v13 == v6))
      {
        pid_t v16 = getpid();
        uint64_t AppElementWithPid = _AXUIElementCreateAppElementWithPid(v16);
      }
      else
      {
        uint64_t v14 = _AXIsInElementCache((uint64_t)v6);
        uint64_t v15 = v14;
        if (!a2 && !v14) {
          uint64_t v15 = _AXAddToElementCache(v6);
        }
        uint64_t AppElementWithPid = _AXUIElementCreateWithID((uint64_t)v6, v15);
      }
      goto LABEL_17;
    }
    id v10 = v6;
    uint64_t v11 = [v10 uuidHash];
    if (a3) {
      uint64_t v12 = getpid();
    }
    else {
      uint64_t v12 = [v10 remotePid];
    }
    uint64_t v9 = _AXUIElementCreateWithPIDAndID(v12, v11, 9999);
  }
  else
  {
    uint64_t v9 = 0;
  }
LABEL_18:

  return v9;
}

uint64_t _AXUIElementCreateInternal(int a1, uint64_t a2, uint64_t a3)
{
  if ((__AXUIElementInitialized & 1) == 0) {
    __AXUIElementInitialize();
  }
  uint64_t result = _CFRuntimeCreateInstance();
  if (result)
  {
    if (sSystemWideServerPID == a1) {
      int v7 = 0;
    }
    else {
      int v7 = a1;
    }
    *(_DWORD *)(result + 16) = v7;
    *(void *)(result + 20) = a2;
    *(void *)(result + 28) = a3;
    *(_DWORD *)(result + 36) = 0;
  }
  return result;
}

CFTypeID AXUIElementGetTypeID(void)
{
  if ((__AXUIElementInitialized & 1) == 0) {
    __AXUIElementInitialize();
  }
  return __kAXUIElementTypeID;
}

uint64_t _AXUIElementCreateAppElementWithPid(int a1)
{
  return _AXUIElementCreateInternal(a1, 0, kAXApplicationUID);
}

uint64_t AXUnserializeWrapper(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5)
{
  if (a2)
  {
    unsigned int v6 = a2;
    if (AXInitSerializationStyle_onceToken == -1) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
  if (!a4) {
    return 4294942084;
  }
  if (AXInitSerializationStyle_onceToken != -1)
  {
    a1 = a3;
    unsigned int v6 = a4;
LABEL_13:
    dispatch_once(&AXInitSerializationStyle_onceToken, &__block_literal_global_106);
    goto LABEL_7;
  }
  unsigned int v6 = a4;
  a1 = a3;
LABEL_7:
  unint64_t v8 = atomic_load(&AXCurrentSerializationStyle);
  uint64_t v9 = AXSerializationImplementations[2 * v8 + 1];
  return ((uint64_t (*)(void, void, uint64_t, void, uint64_t))v9)(0, 0, a1, v6, a5);
}

uint64_t AXUnserializeCFType3(uint64_t a1, uint64_t a2, unsigned int *a3, unint64_t a4, uint64_t a5)
{
  if (InitSmuggledTypes_onceToken != -1) {
    dispatch_once(&InitSmuggledTypes_onceToken, &__block_literal_global_58);
  }
  if (a4 >= 4)
  {
    unint64_t v8 = bswap32(*a3);
    if (v8 <= a4)
    {
      if (!a5)
      {
        id v12 = 0;
        goto LABEL_11;
      }
      *(void *)a5 = 0;
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a3 + 1 length:v8 - 4 freeWhenDone:0];
      id v21 = 0;
      id v10 = [MEMORY[0x1E4F28F98] propertyListWithData:v9 options:0 format:0 error:&v21];
      id v11 = v21;
      if (v11)
      {
        id v12 = v11;

LABEL_9:
        a5 = 4294942095;
LABEL_11:

        return a5;
      }
      id v20 = 0;
      uint64_t v14 = [v10 _axRecursivelyReconstitutedRepresentationFromPropertyListWithError:&v20];
      id v12 = v20;
      if (v14) {
        id v15 = v14;
      }
      *(void *)a5 = v14;

      if (!v12)
      {
        a5 = 0;
        goto LABEL_11;
      }
      pid_t v16 = [v12 domain];
      int v17 = [v16 isEqual:@"AXSerialize3ErrorDomain"];

      if (v17)
      {
        uint64_t v18 = [v12 code];
        if ((unint64_t)(v18 - 1) < 5) {
          goto LABEL_9;
        }
        if (v18)
        {
          uint64_t v19 = AXRuntimeLogSerialization();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            AXSerializeCFType3_cold_1(v19);
          }

          abort();
        }
      }
      a5 = 4294942096;
      goto LABEL_11;
    }
  }
  return 4294942095;
}

void _AXBroadcastEventProcessNotification(int a1, uint64_t a2, const void *a3, const void *a4)
{
  int v6 = a2;
  *(void *)&v13[5] = *MEMORY[0x1E4F143B8];
  if (_AXPidIsSuspended(a2) && a1 != 1021 && a1 != 4002)
  {
    unint64_t v8 = AXRuntimeLogNotifications();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      v13[0] = v6;
      LOWORD(v13[1]) = 2048;
      *(void *)((char *)&v13[1] + 2) = a1;
      _os_log_impl(&dword_1BA657000, v8, OS_LOG_TYPE_INFO, "Pid is suspended and notification is not acceptable: pid: %d, %ld", buf, 0x12u);
    }

    uint64_t v9 = AXRuntimeLogNotifications();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)uint64_t v13 = a1;
      _os_log_impl(&dword_1BA657000, v9, OS_LOG_TYPE_INFO, "Don't broadcast notification: %ld", buf, 0xCu);
    }

    return;
  }
  if (_AXBroadcastEventProcessNotification_registerOnce != -1)
  {
    dispatch_once(&_AXBroadcastEventProcessNotification_registerOnce, &__block_literal_global_65);
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (a4) {
LABEL_9:
  }
    CFRetain(a4);
LABEL_10:
  if (a3) {
    CFRetain(a3);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___AXBroadcastEventProcessNotification_block_invoke_2;
  block[3] = &__block_descriptor_52_e5_v8__0l;
  int v11 = a1;
  block[4] = a3;
  block[5] = a4;
  dispatch_async((dispatch_queue_t)_AXBroadcastEventProcessNotification_replayQueue, block);
}

void AXSetPipPid(uint64_t a1)
{
  v4[2] = *MEMORY[0x1E4F143B8];
  _PipPid = a1;
  v3[0] = @"pid";
  uint64_t v1 = [NSNumber numberWithInt:a1];
  v3[1] = @"pipPid";
  v4[0] = v1;
  v4[1] = MEMORY[0x1E4F1CC38];
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];

  AXPushNotificationToSystemForBroadcast();
}

uint64_t AXPushNotificationToSystemForBroadcast()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = v0;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!_AXSApplicationAccessibilityEnabled() && !_AXSAutomationEnabled())
  {
    if (_AXSAccessibilityNeedsMiniServer())
    {
      if ((v5 - 1021) > 0x3A || ((1 << (v5 + 3)) & 0x400000000000081) == 0) {
        goto LABEL_24;
      }
    }
    else if (v5 != 1021 || (gAXAccessibilityTurnedOnOnce & 1) == 0)
    {
LABEL_24:
      id v15 = AXRuntimeLogNotifications();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LODWORD(length_4[0]) = 67109120;
        DWORD1(length_4[0]) = v5;
        _os_log_impl(&dword_1BA657000, v15, OS_LOG_TYPE_INFO, "Not posting notification: (%d) because app ax and automation are off", (uint8_t *)length_4, 8u);
      }

      return 4294942092;
    }
  }
  memset(length_4, 0, 512);
  unsigned int length = 0;
  *(void *)&v27[1] = 0;
  v27[0] = 0;
  int v6 = sSystemWideServerPID;
  pid_t v7 = getpid();
  if (!v2
    || v6 == v7
    || (uint64_t result = AXSerializeWrapper(v2, 1, length_4, &length, (void **)&v27[1], v27), !result))
  {
    int v9 = sSystemWideServerPID;
    if (v9 == getpid())
    {
      id v10 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))gSystemWideServerBroadcastRelayerCallback;
      if (gSystemWideServerBroadcastRelayerCallback)
      {
        uint64_t v11 = getpid();
        v10(v5, v11, v4, v2, gSystemWideServerBroadcastRelayerCallbackInfo);
      }
    }
    else if (gNotificationBypassCallback)
    {
      cf[0] = 0;
      AXUnserializeWrapper((uint64_t)length_4, length, *(uint64_t *)&v27[1], v27[0], (uint64_t)cf);
      id v12 = (void (*)(uint64_t, uint64_t, uint64_t, CFTypeRef, void))gNotificationBypassCallback;
      uint64_t v13 = getpid();
      v12(v5, v13, v4, cf[0], 0);
      if (cf[0])
      {
        CFRelease(cf[0]);
        cf[0] = 0;
      }
      if (v27[0]) {
        munmap(*(void **)&v27[1], v27[0]);
      }
    }
    else
    {
      if (AXPushNotificationToSystemForBroadcast_registerOnce != -1) {
        dispatch_once(&AXPushNotificationToSystemForBroadcast_registerOnce, &__block_literal_global_1);
      }
      if (length) {
        CFDataRef v14 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UInt8 *)length_4, length);
      }
      else {
        CFDataRef v14 = 0;
      }
      cf[0] = 0;
      cf[1] = 0;
      BOOL v25 = 0;
      int v24 = 0;
      _AXUIElementValidate(v4, &v25, cf, &v24);
      CFTypeRef v17 = cf[0];
      CFTypeRef v16 = cf[1];
      int v18 = _AXGetPortFromCache(sSystemWideServerPID, "com.apple.iphone.axserver-systemwide");
      if (!v18) {
        return 4294942081;
      }
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __AXPushNotificationToSystemForBroadcast_block_invoke_2;
      v19[3] = &__block_descriptor_80_e5_v8__0l;
      unsigned int v20 = length;
      int v21 = v18;
      v19[4] = v14;
      v19[5] = v17;
      v19[6] = v16;
      v19[7] = *(void *)&v27[1];
      int v22 = v5;
      unsigned int v23 = v27[0];
      dispatch_async((dispatch_queue_t)AXPushNotificationToSystemForBroadcast_broadcast_queue, v19);
    }
    return 0;
  }
  return result;
}

uint64_t _AXUIElementValidate(uint64_t a1, BOOL *a2, _OWORD *a3, int *a4)
{
  if (!a1 || CFGetTypeID((CFTypeRef)a1) != __kAXUIElementTypeID) {
    return 0xFFFFFFFFLL;
  }
  *a2 = *(_DWORD *)(a1 + 16) == 0;
  *a3 = *(_OWORD *)(a1 + 20);
  int v8 = *(_DWORD *)(a1 + 36);
  if (!v8) {
    int v8 = sGlobalTimeout;
  }
  *a4 = v8;
  uint64_t result = *(unsigned int *)(a1 + 16);
  if (result == 2147483637)
  {
    return _AXKeyboardAppPid();
  }
  return result;
}

uint64_t AXSerializeWrapper(uint64_t a1, uint64_t a2, void *a3, _DWORD *a4, void **a5, _DWORD *a6)
{
  pthread_key_t v12 = gSerializeBufferKey;
  if (!gSerializeBufferKey)
  {
    Internal = (const void *)_AXUIElementCreateInternal(0, 0, 0);
    CFRelease(Internal);
    pthread_key_t v12 = gSerializeBufferKey;
    if (!gSerializeBufferKey)
    {
      unsigned int v20 = AXRuntimeLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        AXSerializeWrapper_cold_1(v20);
      }

      return 4294942092;
    }
  }
  CFDataRef v14 = pthread_getspecific(v12);
  if (!v14)
  {
    id v15 = mmap(0, 0x1000uLL, 3, 4098, -1, 0);
    if (v15 == (void *)-1) {
      CFTypeRef v16 = 0;
    }
    else {
      CFTypeRef v16 = v15;
    }
    pthread_setspecific(gSerializeBufferKey, v16);
    __src = v16;
    if (v16) {
      goto LABEL_9;
    }
    return 4294942092;
  }
  __src = v14;
LABEL_9:
  size_t __n = 0;
  size_t v23 = 4096;
  if (AXInitSerializationStyle_onceToken != -1) {
    dispatch_once(&AXInitSerializationStyle_onceToken, &__block_literal_global_106);
  }
  unint64_t v17 = atomic_load(&AXCurrentSerializationStyle);
  uint64_t v18 = ((uint64_t (*)(uint64_t, void, uint64_t, void **, size_t *, size_t *))AXSerializationImplementations[2 * v17])(a1, 0, a2, &__src, &__n, &v23);
  if (!v18)
  {
    int v19 = __n;
    if (__n <= 0x1000)
    {
      memcpy(a3, __src, __n);
      *a4 = v19;
      return v18;
    }
    *a5 = __src;
    *a6 = v23;
    goto LABEL_16;
  }
  if (v23 != 4096)
  {
    munmap(__src, v23);
LABEL_16:
    pthread_setspecific(gSerializeBufferKey, 0);
  }
  return v18;
}

uint64_t _AXGetPortFromCache(uint64_t a1, const char *a2)
{
  kern_return_t v8;
  kern_return_t v9;
  NSObject *v10;
  mach_port_t v11;
  CFMachPortRef v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  mach_port_t *v20;
  uint64_t v21;
  int v22;
  unsigned char context[44];
  uint8_t buf[72];
  uint64_t v25;

  BOOL v25 = *MEMORY[0x1E4F143B8];
  if ((a1 & 0x80000000) != 0) {
    return 0;
  }
  int v19 = 0;
  unsigned int v20 = (mach_port_t *)&v19;
  int v21 = 0x2020000000;
  int v22 = 0;
  id v15 = 0;
  CFTypeRef v16 = &v15;
  unint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  if (gAllowsSuspendedAppServer || !_AXPidIsSuspended(a1))
  {
    AX_PERFORM_WITH_LOCK();
    if (!v16[3])
    {
      memset(buf, 0, 60);
      if (a2)
      {
        strncpy((char *)buf, a2, 0x3BuLL);
        int v8 = bootstrap_look_up(*MEMORY[0x1E4F14638], (const char *)buf, v20 + 6);
      }
      else
      {
        int v8 = bootstrap_look_up2();
      }
      int v9 = v8;
      if (v8)
      {
        id v10 = AXRuntimeLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          uint64_t v13 = bootstrap_strerror(v9);
          CFDataRef v14 = [MEMORY[0x1E4F29060] callStackSymbols];
          *(_DWORD *)context = 67110146;
          *(_DWORD *)&context[4] = v9;
          *(_WORD *)&context[8] = 2080;
          *(void *)&context[10] = v13;
          *(_WORD *)&context[18] = 2112;
          *(void *)&context[20] = @"com.apple.iphone.axserver";
          *(_WORD *)&context[28] = 1024;
          *(_DWORD *)&context[30] = a1;
          *(_WORD *)&context[34] = 2112;
          *(void *)&context[36] = v14;
          _os_log_error_impl(&dword_1BA657000, v10, OS_LOG_TYPE_ERROR, "AX Lookup problem - errorCode:%d error:%s portName:'%@' PID:%d %@", context, 0x2Cu);
        }
      }
      uint64_t v11 = v20[6];
      if (v11)
      {
        *(void *)context = 0;
        memset(&context[16], 0, 24);
        *(void *)&context[8] = a1;
        pthread_key_t v12 = CFMachPortCreateWithPort(0, v11, 0, (CFMachPortContext *)context, 0);
        v16[3] = (uint64_t)v12;
        if (v12)
        {
          AX_PERFORM_WITH_LOCK();
          CFRelease((CFTypeRef)v16[3]);
        }
      }
    }
    uint64_t v4 = v20[6];
  }
  else
  {
    uint64_t v5 = AXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = [NSNumber numberWithInt:a1];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = a2;
      _os_log_impl(&dword_1BA657000, v5, OS_LOG_TYPE_INFO, "Asking for port/pid but its suspended: %@, %s", buf, 0x16u);
    }
    uint64_t v4 = 0;
  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v4;
}

void sub_1BA65A7D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t _AXPidIsSuspended(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];
  char v4 = [v3 hasPrefix:*MEMORY[0x1E4F482D8]];

  if (v4)
  {
    uint64_t v5 = &unk_1F1423F68;
  }
  else
  {
    uint64_t v5 = _allDisplayTypes();
  }
  uint64_t IsSuspendedInternal = _AXPidIsSuspendedInternal(a1, v5);

  return IsSuspendedInternal;
}

uint64_t _AXPidIsSuspendedInternal(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (_PipPid == a1)
  {
    uint64_t v4 = 0;
  }
  else
  {
    os_unfair_lock_lock(&gAXSuspendedPidsLock);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v33;
LABEL_5:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(void **)(*((void *)&v32 + 1) + 8 * v8);
        id v10 = +[AXPidSuspensionInfo shared];
        uint64_t v11 = objc_msgSend(v10, "suspendedPidsForDisplay:", objc_msgSend(v9, "intValue"));

        pthread_key_t v12 = [NSNumber numberWithInt:a1];
        int v13 = [v11 containsObject:v12];

        if (!v13) {
          break;
        }
        if (v6 == ++v8)
        {
          uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
          if (v6) {
            goto LABEL_5;
          }
          uint64_t v4 = 1;
          CFDataRef v14 = &gAXSuspendedPidsLock;
          goto LABEL_24;
        }
      }
    }

    os_unfair_lock_unlock(&gAXSuspendedPidsLock);
    CFDataRef v14 = &gAXTimeoutProbationPidsLock;
    os_unfair_lock_lock(&gAXTimeoutProbationPidsLock);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v15 = obj;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      id v26 = v3;
      uint64_t v18 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v15);
          }
          unsigned int v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          int v21 = +[AXPidSuspensionInfo shared];
          int v22 = objc_msgSend(v21, "timeoutProbationPidsForDisplay:", objc_msgSend(v20, "intValue"));

          size_t v23 = [NSNumber numberWithInt:a1];
          int v24 = [v22 containsObject:v23];

          if (!v24)
          {
            uint64_t v4 = 0;
            goto LABEL_22;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v17) {
          continue;
        }
        break;
      }
      uint64_t v4 = 1;
LABEL_22:
      id v3 = v26;
      CFDataRef v14 = &gAXTimeoutProbationPidsLock;
    }
    else
    {
      uint64_t v4 = 0;
    }
LABEL_24:

    os_unfair_lock_unlock(v14);
  }

  return v4;
}

id _allDisplayTypes()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  if (_displayMonitor_onceToken != -1) {
    dispatch_once(&_displayMonitor_onceToken, &__block_literal_global_67);
  }
  uint64_t v0 = objc_msgSend((id)_displayMonitor_DisplayMonitor, "connectedIdentities", (void)v7);
  uint64_t v1 = [v0 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v8 != v3) {
          objc_enumerationMutation(v0);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isCarDisplay])
        {

          uint64_t v5 = [&unk_1F1423F80 arrayByAddingObjectsFromArray:&unk_1F1423F98];
          goto LABEL_13;
        }
      }
      uint64_t v2 = [v0 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }

  uint64_t v5 = &unk_1F1423F80;
LABEL_13:
  return v5;
}

uint64_t AXSerializeCFType3(void *a1, uint64_t a2, uint64_t a3, void **a4, size_t *a5, size_t *a6)
{
  if (InitSmuggledTypes_onceToken != -1) {
    dispatch_once(&InitSmuggledTypes_onceToken, &__block_literal_global_58);
  }
  id v28 = 0;
  long long v10 = [a1 _axRecursivelyPropertyListCoercedRepresentationWithError:&v28];
  id v11 = v28;
  uint64_t v12 = v11;
  if (v10)
  {
    id v27 = 0;
    int v13 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v10 format:200 options:0 error:&v27];
    id v14 = v27;

    if (v13)
    {
      if ((unint64_t)[v13 length] <= 0xFFFFFFFA)
      {
        size_t v19 = [v13 length] + 4;
        if (*a6 >= v19)
        {
          int v22 = *a4;
        }
        else
        {
          size_t v20 = *MEMORY[0x1E4F14B00] + v19 / *MEMORY[0x1E4F14B00] * *MEMORY[0x1E4F14B00];
          int v21 = mmap(0, v20, 3, 4098, -1, 0);
          if (v21 == (_DWORD *)-1)
          {
            uint64_t v15 = 4294942096;
            goto LABEL_16;
          }
          int v22 = v21;
          munmap(*a4, *a6);
          *a4 = v22;
          *a6 = v20;
        }
        *int v22 = bswap32(v19);
        size_t v23 = (char *)*a4 + 4;
        id v24 = v13;
        memcpy(v23, (const void *)[v24 bytes], objc_msgSend(v24, "length"));
        uint64_t v15 = 0;
        *a5 = v19;
      }
      else
      {
        uint64_t v15 = 4294942082;
      }
    }
    else
    {
      uint64_t v15 = 4294942095;
    }
LABEL_16:

    uint64_t v12 = v14;
    goto LABEL_20;
  }
  uint64_t v16 = [v11 domain];
  int v17 = [v16 isEqual:@"AXSerialize3ErrorDomain"];

  if (!v17)
  {
LABEL_19:
    uint64_t v15 = 4294942096;
    goto LABEL_20;
  }
  uint64_t v18 = [v12 code];
  if ((unint64_t)(v18 - 1) >= 5)
  {
    if (v18)
    {
      id v26 = AXRuntimeLogSerialization();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        AXSerializeCFType3_cold_1(v26);
      }

      abort();
    }
    goto LABEL_19;
  }
  uint64_t v15 = 4294942095;
LABEL_20:

  return v15;
}

uint64_t _XPostNotification(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v4 = *(unsigned int *)(result + 4);
  if (v4 < 0x5C || v4 > 0x105C) {
    goto LABEL_3;
  }
  if (*(unsigned char *)(result + 39) != 1) {
    goto LABEL_18;
  }
  unsigned int v6 = *(_DWORD *)(result + 76);
  if (v6 > 0x1000)
  {
LABEL_2:
    int v3 = -304;
    goto LABEL_3;
  }
  int v3 = -304;
  if ((int)v4 - 92 < v6) {
    goto LABEL_3;
  }
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  if (v4 != v7 + 92) {
    goto LABEL_3;
  }
  uint64_t v8 = result + v7;
  unsigned int v9 = *(_DWORD *)(result + 40);
  if (v9 != *(_DWORD *)(v8 + 80))
  {
LABEL_18:
    int v3 = -300;
    goto LABEL_3;
  }
  long long v10 = (_DWORD *)(((v4 + 3) & 0x1FFFFFFFCLL) + result);
  if (!*v10 && v10[1] > 0x1Fu)
  {
    uint64_t result = _AXXMIGPostNotification(*(_DWORD *)(result + 12), *(_DWORD *)(result + 52), *(void *)(result + 56), *(void *)(result + 64), *(unsigned int *)(result + 72), result + 80, v6, *(void **)(result + 28), v9, *(void *)(v8 + 84));
    *(_DWORD *)(a2 + 32) = result;
    return result;
  }
  int v3 = -309;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _AXXMIGPostNotification(unsigned int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7, void *a8, unsigned int a9, uint64_t a10)
{
  CFTypeRef cf = 0;
  Internal = (const void *)_AXUIElementCreateInternal(a2, a3, a4);
  int v16 = AXUnserializeWrapper(a6, a7, (uint64_t)a8, a9, (uint64_t)&cf);
  if (v16 != -25212 && v16 != 0)
  {
    uint64_t v20 = 5;
    if (!Internal) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  if (a5 == 1021)
  {
    uint64_t v18 = AXRuntimeLogPID();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v22 = 0;
      _os_log_impl(&dword_1BA657000, v18, OS_LOG_TYPE_INFO, "Did receive kAXPidStatusChangedNotification", v22, 2u);
    }

    _AXManagePidState((void *)cf);
  }
  if (Internal)
  {
    os_unfair_lock_lock(&gAXObserverLock);
    Value = (void (**)(const void *, const void *, uint64_t, CFTypeRef, uint64_t))CFDictionaryGetValue((CFDictionaryRef)gObserverCache, (const void *)a1);
    os_unfair_lock_unlock(&gAXObserverLock);
    if (Value) {
      Value[5](Value, Internal, a5, cf, a10);
    }
    uint64_t v20 = 0;
LABEL_15:
    CFRelease(Internal);
    goto LABEL_17;
  }
  uint64_t v20 = 0;
LABEL_17:
  if (cf) {
    CFRelease(cf);
  }
  if (a8 && a9) {
    munmap(a8, a9);
  }
  return v20;
}

void _AXManagePidState(void *a1)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(a1))
    {
      int v3 = a1;
      uint64_t v4 = [(__CFString *)v3 objectForKey:@"pid"];
      uint64_t v5 = v4;
      if (!v4 || ![(__CFString *)v4 intValue])
      {
LABEL_43:

        return;
      }
      unsigned int v6 = [(__CFString *)v3 valueForKey:@"display-type"];
      unsigned int v46 = [v6 intValue];

      unsigned int v7 = AXRuntimeLogPID();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        long long v57 = v3;
        __int16 v58 = 1024;
        LODWORD(v59) = v46;
        _os_log_impl(&dword_1BA657000, v7, OS_LOG_TYPE_INFO, "pid status change recorded: %@ for display type: %d", buf, 0x12u);
      }

      uint64_t v8 = [(__CFString *)v3 objectForKey:@"suspended-status"];
      if ([v8 isEqualToString:@"suspended"])
      {
        int v9 = 1;
      }
      else
      {
        long long v10 = [(__CFString *)v3 objectForKey:@"suspended"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = [(__CFString *)v3 objectForKey:@"suspended"];
          int v9 = [v11 BOOLValue];
        }
        else
        {
          int v9 = 0;
        }
      }
      uint64_t v12 = [(__CFString *)v3 objectForKey:@"tentative-suspended"];
      int v13 = [v12 isEqualToString:@"suspended"];

      id v14 = [(__CFString *)v3 objectForKey:@"pipPid"];
      int v15 = [v14 BOOLValue];

      if (v15) {
        _PipPid = [(__CFString *)v5 intValue];
      }
      os_unfair_lock_lock(&gAXSuspendedPidsLock);
      int v16 = +[AXPidSuspensionInfo shared];
      int v17 = [v16 tentativeSuspendedPidsForDisplay:v46];

      if (v9)
      {
        if ([v17 containsObject:v5])
        {
          [v17 removeObject:v5];
          uint64_t v18 = AXRuntimeLogPID();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            long long v57 = v5;
            _os_log_impl(&dword_1BA657000, v18, OS_LOG_TYPE_INFO, "Got confimration that tentative pid should be suspended: %@", buf, 0xCu);
          }
        }
      }
      else if (!v13)
      {
        _AXRemoveSuspendedPid([(__CFString *)v5 intValue], v46);
        os_unfair_lock_unlock(&gAXSuspendedPidsLock);
LABEL_36:
        long long v39 = AXRuntimeLogPID();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          long long v40 = @"resume";
          if (v9) {
            long long v40 = @"suspend";
          }
          *(_DWORD *)buf = 138412802;
          if (v13) {
            long long v40 = @"tentative-suspend";
          }
          long long v57 = v40;
          __int16 v58 = 2112;
          long long v59 = v5;
          __int16 v60 = 1024;
          unsigned int v61 = v46;
          _os_log_impl(&dword_1BA657000, v39, OS_LOG_TYPE_INFO, "Did %@ pid: %@ on Display %d", buf, 0x1Cu);
        }

        goto LABEL_43;
      }
      int v42 = v13;
      int v43 = v9;
      long long v44 = v5;
      long long v45 = v3;
      uint64_t v19 = [(__CFString *)v5 intValue];
      uint64_t v20 = +[AXPidSuspensionInfo shared];
      int v21 = [v20 suspendedPidsForDisplay:v46];
      int v22 = [NSNumber numberWithInt:v19];
      [v21 addObject:v22];

      size_t v23 = AXRuntimeLogPID();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v57) = v19;
        _os_log_impl(&dword_1BA657000, v23, OS_LOG_TYPE_INFO, "Adding suspended pid: %d", buf, 8u);
      }

      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v24 = +[AXPidSuspensionInfo shared];
      BOOL v25 = [v24 associatedRemotePidsForDisplay:v46];
      id v26 = [NSNumber numberWithInt:v19];
      id v27 = [v25 objectForKey:v26];

      uint64_t v28 = [v27 countByEnumeratingWithState:&v50 objects:buf count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v51 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = *(void *)(*((void *)&v50 + 1) + 8 * i);
            long long v33 = AXRuntimeLogPID();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long v54 = 67109120;
              int v55 = v19;
              _os_log_impl(&dword_1BA657000, v33, OS_LOG_TYPE_INFO, "Adding Associated suspended pid: %d", v54, 8u);
            }

            long long v34 = +[AXPidSuspensionInfo shared];
            long long v35 = [v34 suspendedPidsForDisplay:v46];
            [v35 addObject:v32];
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v50 objects:buf count:16];
        }
        while (v29);
      }

      os_unfair_lock_unlock(&gAXSuspendedPidsLock);
      int v13 = v42;
      if (v42)
      {
        os_unfair_lock_lock(&gAXSuspendedPidsLock);
        long long v36 = +[AXPidSuspensionInfo shared];
        long long v37 = [v36 tentativeSuspendedPidsForDisplay:v46];

        uint64_t v5 = v44;
        [v37 addObject:v44];
        os_unfair_lock_unlock(&gAXSuspendedPidsLock);
        dispatch_time_t v38 = dispatch_time(0, 2000000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = ___AXManagePidState_block_invoke;
        block[3] = &unk_1E6220768;
        long long v48 = v44;
        unsigned int v49 = v46;
        dispatch_after(v38, MEMORY[0x1E4F14428], block);

        int v17 = v37;
        int v3 = v45;
        int v9 = v43;
      }
      else
      {
        uint64_t v5 = v44;
        int v3 = v45;
        int v9 = v43;
        int v17 = v41;
      }
      goto LABEL_36;
    }
  }
}

void _AXRemoveSuspendedPid(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = AXRuntimeLogPID();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v25) = a1;
    _os_log_impl(&dword_1BA657000, v4, OS_LOG_TYPE_INFO, "Removing suspended PID: %d", buf, 8u);
  }

  uint64_t v5 = +[AXPidSuspensionInfo shared];
  unsigned int v6 = [v5 suspendedPidsForDisplay:a2];
  unsigned int v7 = [NSNumber numberWithInt:a1];
  [v6 removeObject:v7];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = +[AXPidSuspensionInfo shared];
  int v9 = [v8 associatedRemotePidsForDisplay:a2];
  long long v10 = [NSNumber numberWithInt:a1];
  id v11 = [v9 objectForKey:v10];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        int v17 = AXRuntimeLogPID();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v25 = v16;
          _os_log_impl(&dword_1BA657000, v17, OS_LOG_TYPE_INFO, "Removing associated remote PID: %@", buf, 0xCu);
        }

        uint64_t v18 = +[AXPidSuspensionInfo shared];
        uint64_t v19 = [v18 suspendedPidsForDisplay:a2];
        [v19 removeObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v13);
  }
}

uint64_t __AXPushNotificationToSystemForBroadcast_block_invoke_2()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v11 = 0u;
  CFDataRef v1 = *(const __CFData **)(v0 + 32);
  if (v1)
  {
    v43.unsigned int length = *(unsigned int *)(v0 + 64);
    v43.location = 0;
    CFDataGetBytes(v1, v43, buffer);
  }
  uint64_t v2 = *(unsigned int *)(v0 + 68);
  uint64_t v3 = getpid();
  int v4 = _AXMIGBroadcastNotification(v2, v3, *(unsigned int *)(v0 + 72), *(void *)(v0 + 40), *(void *)(v0 + 48), (uint64_t)buffer, *(unsigned int *)(v0 + 64), *(void *)(v0 + 56), *(_DWORD *)(v0 + 76));
  if (v4)
  {
    int v5 = v4;
    unsigned int v6 = AXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __AXPushNotificationToSystemForBroadcast_block_invoke_2_cold_1((int *)(v0 + 72), v5, v6);
    }
  }
  unsigned int v7 = *(const void **)(v0 + 32);
  if (v7) {
    CFRelease(v7);
  }
  size_t v8 = *(unsigned int *)(v0 + 76);
  if (v8) {
    munmap(*(void **)(v0 + 56), v8);
  }
  return _AXReleasePortFromCache(*(unsigned int *)(v0 + 68));
}

uint64_t _AXReleasePortFromCache(uint64_t result)
{
  if (result) {
    return AX_PERFORM_WITH_LOCK();
  }
  return result;
}

uint64_t _AXMIGBroadcastNotification(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  mach_port_t v9 = MEMORY[0x1F4188790]();
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  long long v54 = 0u;
  memset(v55, 0, sizeof(v55));
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  long long v39 = 0u;
  long long v38 = 0u;
  long long v37 = 0u;
  long long v36 = 0u;
  long long v35 = 0u;
  long long v34 = 0u;
  long long v33 = 0u;
  long long v32 = 0u;
  long long v31 = 0u;
  long long v30 = 0u;
  long long v29 = 0u;
  long long v28 = 0u;
  uint64_t v27 = 0;
  memset(&msg.msgh_size, 0, 20);
  int v23 = 1;
  uint64_t v24 = v11;
  int v25 = 16777472;
  int v26 = a9;
  uint64_t v27 = *MEMORY[0x1E4F14068];
  *(void *)&long long v28 = __PAIR64__(v13, v12);
  *((void *)&v28 + 1) = v14;
  *(void *)&long long v29 = v15;
  if (v10 > 0x1000) {
    return 4294966989;
  }
  unsigned int v17 = v10;
  mach_port_t v18 = v9;
  __memcpy_chk();
  uint64_t v19 = (v17 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v20 = v19 + 84;
  *(_DWORD *)((char *)&msg + v19 + 80) = a9;
  msg.msgh_bits = -2147483629;
  msg.mach_port_t msgh_remote_port = v18;
  DWORD2(v29) = v17;
  msg.msgh_id = 860011;
  *(void *)&msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v16 = mach_msg(&msg, 1, v20, 0, 0, 0, 0);
  if ((v16 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v16;
}

void *serializeBufferDestructor(void *result)
{
  if (result) {
    return (void *)munmap(result, 0x1000uLL);
  }
  return result;
}

uint64_t _AXMIGPostNotification(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10)
{
  mach_port_t v10 = MEMORY[0x1F4188790]();
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  long long v55 = 0u;
  memset(v56, 0, sizeof(v56));
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v42 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  long long v39 = 0u;
  long long v38 = 0u;
  long long v37 = 0u;
  long long v36 = 0u;
  long long v35 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  *(_OWORD *)&v30[16] = 0u;
  long long v31 = 0u;
  uint64_t v29 = 0;
  *(_OWORD *)long long v30 = 0u;
  memset(&msg.msgh_size, 0, 20);
  int v25 = 1;
  uint64_t v26 = v12;
  int v27 = 16777472;
  int v28 = a9;
  uint64_t v29 = *MEMORY[0x1E4F14068];
  *(_DWORD *)long long v30 = v13;
  *(void *)&v30[4] = v14;
  *(void *)&v30[12] = v15;
  *(_DWORD *)&v30[20] = v16;
  if (v11 > 0x1000) {
    return 4294966989;
  }
  unsigned int v18 = v11;
  mach_port_t v19 = v10;
  __memcpy_chk();
  uint64_t v20 = (v18 + 3) & 0xFFFFFFFC;
  long long v21 = (char *)&msg + v20;
  mach_msg_size_t v22 = v20 + 92;
  *((_DWORD *)v21 + 20) = a9;
  *(void *)(v21 + 84) = a10;
  msg.msgh_bits = -2147483629;
  msg.mach_port_t msgh_remote_port = v19;
  *(_DWORD *)&v30[24] = v18;
  msg.msgh_id = 860012;
  *(void *)&msg.msgh_local_port = 0;
  if (MEMORY[0x1E4F14B18]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v17 = mach_msg(&msg, 1, v22, 0, 0, 0, 0);
  if ((v17 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v17;
}

uint64_t _AXIsInElementCache(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = 0;
  int v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v6 = 0;
  AX_PERFORM_WITH_LOCK();
  uint64_t v1 = v4[3];
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_1BA65D2A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _copyAttributeValueCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v10 = MEMORY[0x1BA9ED840](0);
  if (!a4) {
    return 4294942095;
  }
  uint64_t v11 = v10;
  id v12 = a5;
  int v13 = [v12 attributeCallback];
  uint64_t v14 = v13[2](v13, a1, a2, a3);

  uint64_t v15 = [v12 outgoingValuePreprocessor];
  if (v15)
  {
    int v16 = [v12 outgoingValuePreprocessor];
    uint64_t v17 = ((void (**)(void, uint64_t, void *))v16)[2](v16, a3, v14);

    uint64_t v14 = (void *)v17;
  }

  unsigned int v18 = AXConvertOutgoingValue(a3, v14);

  if (v18) {
    CFTypeRef v19 = CFRetain(v18);
  }
  else {
    CFTypeRef v19 = 0;
  }
  *a4 = v19;
  MEMORY[0x1BA9ED830](v11);

  return 0;
}

uint64_t _setAttributeValueCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v10 = MEMORY[0x1BA9ED840](0);
  id v11 = a5;
  id v12 = AXConvertIncomingValue(a4);
  int v13 = [v11 setAttributeCallback];

  ((void (**)(void, uint64_t, uint64_t, uint64_t, void *))v13)[2](v13, a1, a2, a3, v12);
  MEMORY[0x1BA9ED830](v10);

  return 0;
}

uint64_t _serverPerformActionCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = MEMORY[0x1BA9ED840](0);
  mach_port_t v9 = [a4 performActionCallback];
  LODWORD(a3) = v9[2](v9, a1, a2, a3, 0, 0);

  if (a3) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 4294942096;
  }
  MEMORY[0x1BA9ED830](v8);
  return v10;
}

uint64_t _performActionWithValueCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  uint64_t v12 = MEMORY[0x1BA9ED840](0);
  int v13 = [a5 performActionCallback];
  uint64_t v14 = AXConvertIncomingValue(a4);
  LODWORD(a6) = ((uint64_t (**)(void, uint64_t, uint64_t, uint64_t, void *, uint64_t))v13)[2](v13, a1, a2, a3, v14, a6);

  if (a6) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = 4294942096;
  }
  MEMORY[0x1BA9ED830](v12);
  return v15;
}

uint64_t _copyElementAtPositionCallback(uint64_t a1, uint64_t a2, float a3, float a4, uint64_t a5, uint64_t a6, uint64_t *a7, void *a8)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = MEMORY[0x1BA9ED840](0);
  id v16 = a8;
  uint64_t v17 = [v16 hitTestCallback];

  if (v17)
  {
    unsigned int v18 = [v16 hitTestCallback];
    CFTypeRef v19 = v18[2](v18, a1, a2, a6, a3, a4);

    uint64_t v20 = __AXCreateAXUIElementWithElement(v19, 0, 0);
    if (v20)
    {
      uint64_t v21 = 0;
      *a7 = v20;
    }
    else
    {
      mach_msg_size_t v22 = AXLogUIA();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v24 = 138412290;
        int v25 = v19;
        _os_log_impl(&dword_1BA657000, v22, OS_LOG_TYPE_INFO, "Returning invalid element for copy element: %@", (uint8_t *)&v24, 0xCu);
      }

      uint64_t v21 = 4294942094;
    }
    MEMORY[0x1BA9ED830](v15);
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

uint64_t _copyParameterizedAttributeValueCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  uint64_t v12 = (void *)MEMORY[0x1BA9EDE10]();
  if (a5)
  {
    id v13 = a6;
    uint64_t v14 = AXConvertIncomingValue(a4);
    if (v14
      || ([v13 parameterizedAttributeCallback],
          uint64_t v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          v15))
    {
      id v16 = [v13 parameterizedAttributeCallback];
      uint64_t v17 = ((void (**)(void, uint64_t, uint64_t, uint64_t, void *))v16)[2](v16, a1, a2, a3, v14);

      unsigned int v18 = [v13 outgoingValuePreprocessor];
      if (v18)
      {
        CFTypeRef v19 = [v13 outgoingValuePreprocessor];
        uint64_t v20 = ((void (**)(void, uint64_t, void *))v19)[2](v19, a3, v17);

        uint64_t v17 = (void *)v20;
      }

      uint64_t v21 = AXConvertOutgoingValue(a3, v17);

      if (v21)
      {
        id v22 = (id)v21;

        uint64_t v21 = 0;
      }
      else
      {
        id v22 = 0;
      }
    }
    else
    {
      id v22 = 0;
      uint64_t v21 = 4294942095;
    }
    *a5 = v22;
  }
  else
  {
    uint64_t v21 = 4294942095;
  }
  return v21;
}

uint64_t _copyMultipleAttributeValuesCallback(uint64_t a1, uint64_t a2, const __CFArray *a3, uint64_t a4, __CFArray **a5, void *a6)
{
  mach_port_t v9 = (void *)MEMORY[0x1BA9EDE10]();
  if (a3 && (CFIndex Count = CFArrayGetCount(a3)) != 0)
  {
    CFIndex v11 = Count;
    int v25 = a5;
    context = v9;
    id v12 = a6;
    theArray = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v11, MEMORY[0x1E4F1D510]);
    if (v11 >= 1)
    {
      for (CFIndex i = 0; i != v11; ++i)
      {
        uint64_t v14 = (void *)MEMORY[0x1BA9EDE10]();
        uint64_t v15 = objc_msgSend((id)CFArrayGetValueAtIndex(a3, i), "unsignedIntValue");
        id v16 = [v12 attributeCallback];
        uint64_t v17 = v16[2](v16, a1, a2, v15);

        unsigned int v18 = [v12 outgoingValuePreprocessor];
        if (v18)
        {
          CFTypeRef v19 = [v12 outgoingValuePreprocessor];
          uint64_t v20 = ((void (**)(void, uint64_t, void *))v19)[2](v19, v15, v17);

          uint64_t v17 = (void *)v20;
        }

        uint64_t v21 = AXConvertOutgoingValue(v15, v17);

        if (v21)
        {
          CFArraySetValueAtIndex(theArray, i, v21);
        }
        else
        {
          int valuePtr = -25205;
          AXValueRef v22 = AXValueCreate(kAXValueTypeAXError, &valuePtr);
          CFArraySetValueAtIndex(theArray, i, v22);
          CFRelease(v22);
        }
      }
    }
    *int v25 = theArray;

    uint64_t v23 = 0;
    mach_port_t v9 = context;
  }
  else
  {
    uint64_t v23 = 4294942095;
  }
  return v23;
}

void _axNotificationObserverDiedHandler(uint64_t a1)
{
  id v3 = +[AXSimpleRuntimeManager sharedManager];
  uint64_t v2 = [v3 clientObserverCallback];
  v2[2](v2, a1);
}

void *_AXSetApplicationElementHandler(void *result)
{
  ApplicationElementRetrieval = result;
  return result;
}

id AXSimpleRuntimeApplicationElementRetrieval()
{
  uint64_t v0 = +[AXSimpleRuntimeManager sharedManager];
  uint64_t v1 = [v0 applicationElementCallback];
  uint64_t v2 = v1[2]();

  return v2;
}

id _UIAXElementForAXUIElementRef(uint64_t a1)
{
  uint64_t v1 = (void *)_AXUIElementIDForElement(a1);
  return _AXElementForAXUIElementUniqueId(v1, v2);
}

id _AXElementForAXUIElementUniqueId(void *a1, uint64_t a2)
{
  if (a2 == kAXApplicationUID)
  {
    if (ApplicationElementRetrieval)
    {
      ApplicationElementRetrieval();
      id v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v2 = 0;
    }
  }
  else if (a2 == 9999)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = ___AXElementForAXUIElementUniqueId_block_invoke;
    v5[3] = &__block_descriptor_40_e25_B16__0__AXRemoteElement_8l;
    v5[4] = a1;
    id v2 = +[AXRemoteElement remoteElementForBlock:v5];
  }
  else if (a2 == kAXLookingGlassUID || (id v2 = (id)_AXIsInElementCache((uint64_t)a1)) != 0)
  {
    id v2 = a1;
  }
  return v2;
}

void *__AXRuntimeApplicationElement()
{
  return ApplicationElementRetrieval;
}

uint64_t _AXRetrieveExistingAXUIElementWithElement(void *a1)
{
  return __AXCreateAXUIElementWithElement(a1, 1, 0);
}

uint64_t _AXCreateAXUIElementWithElementUsingLocalRemoteElement(void *a1)
{
  return __AXCreateAXUIElementWithElement(a1, 0, 1);
}

uint64_t _AXRequestingClientForSelfMachMessage()
{
  if (_OverrideClientType) {
    return _OverrideClientType;
  }
  else {
    return 7;
  }
}

uint64_t AXOverrideRequestingClientType(uint64_t a1)
{
  uint64_t result = _AXDetermineRequestingClient();
  _OverrideClientType = a1;
  return result;
}

uint64_t _AXDetermineRequestingClient()
{
  if (_AXDetermineRequestingClient_onceToken != -1) {
    dispatch_once(&_AXDetermineRequestingClient_onceToken, &__block_literal_global_79);
  }
  uint64_t result = _OverrideClientType;
  if (!_OverrideClientType)
  {
    uint64_t result = _DefaultClientType;
    if (_DefaultClientType == 9999)
    {
      if (_AXSHoverTextEnabled())
      {
        return 15;
      }
      else if (_AXSWatchControlEnabled())
      {
        return 14;
      }
      else
      {
        uint64_t v1 = AXRuntimeLogCommon();
        if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
          _AXDetermineRequestingClient_cold_1(v1);
        }

        return 0;
      }
    }
  }
  return result;
}

Boolean AXAPIEnabled(void)
{
  return 1;
}

BOOL AXAttributeAllowsRequeryWhenRemoteElementFails(uint64_t a1)
{
  BOOL result = 1;
  if ((unint64_t)(a1 - 3000) > 0x32 || ((1 << (a1 + 72)) & 0x4000009800205) == 0) {
    return a1 == 2231 || a1 == 2600;
  }
  return result;
}

BOOL _AXCallingFromSameApp(int a1, int a2)
{
  pid_t v4 = getpid();
  if (v4 == a1) {
    return 1;
  }
  pid_t v6 = v4;
  BOOL result = 0;
  if (!a1)
  {
    if (a2) {
      return v6 == sSystemWideServerPID;
    }
  }
  return result;
}

void _AXUIElementSetMachPortForNextMessage(mach_port_name_t name)
{
  kern_return_t v3;
  NSObject *v4;
  uint8_t v5[16];

  if (name)
  {
    id v2 = (ipc_space_t *)MEMORY[0x1E4F14960];
    id v3 = mach_port_mod_refs(*MEMORY[0x1E4F14960], name, 0, 1);
    if (v3 == 17) {
      id v3 = mach_port_mod_refs(*v2, name, 4u, 1);
    }
    if (v3)
    {
      pid_t v4 = AXRuntimeLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl(&dword_1BA657000, v4, OS_LOG_TYPE_INFO, "Could not set next mach port because it was already dead", v5, 2u);
      }
    }
    else
    {
      AXUIElementMachPortForNextMessage = name;
    }
  }
}

uint64_t AXUIElementCopyAttributeValueRecursive()
{
  id v3 = (const __AXUIElement *)MEMORY[0x1F4188790]();
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  unsigned int v35 = 0;
  long long v34 = 0;
  unsigned int v33 = 0;
  uint64_t result = 4294942095;
  if (!v0) {
    return result;
  }
  if (!v3) {
    return result;
  }
  uint64_t v5 = v1;
  if (!v1) {
    return result;
  }
  pid_t v6 = v2;
  CFStringRef v7 = v0;
  AXError v37 = kAXErrorSuccess;
  unsigned __int8 v36 = 0;
  memset(v41, 0, 512);
  unsigned int v32 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  *uint64_t v1 = 0;
  uint64_t v8 = _AXUIElementValidate(v3, &v36, &v30, &v32);
  uint64_t v9 = v30;
  uint64_t v10 = v31;
  int v11 = v36;
  pid_t v12 = getpid();
  if (v12 == v8 || !v8 && v11 && v12 == sSystemWideServerPID)
  {
    if (_OverrideClientType) {
      uint64_t v13 = _OverrideClientType;
    }
    else {
      uint64_t v13 = 7;
    }
    if (getSelfAuditToken_onceToken != -1) {
      dispatch_once(&getSelfAuditToken_onceToken, &__block_literal_global_97);
    }
    v29[0] = getSelfAuditToken_auditToken;
    v29[1] = unk_1EB39E668;
    int v14 = _AXXMIGCopyAttributeValue(0, v8, v9, v10, (int)v7, v13, v41, &v35, &v34, &v33, (int *)&v37, v29);
    if (v14) {
      goto LABEL_14;
    }
    goto LABEL_27;
  }
  uint64_t v15 = AXUIElementMachPortForNextMessage;
  if (AXUIElementMachPortForNextMessage)
  {
    AXUIElementMachPortForNextMessage = 0;
    goto LABEL_26;
  }
  if (v36)
  {
    if (_SystemWideServerPortName_onceToken != -1) {
      dispatch_once(&_SystemWideServerPortName_onceToken, &__block_literal_global_99);
    }
    id v16 = (const char *)_SystemWideServerPortName___portName;
  }
  else
  {
    id v16 = 0;
  }
  uint64_t v15 = _AXGetPortFromCache(v8, v16);
  if (v15)
  {
LABEL_26:
    uint64_t v17 = v32;
    uint64_t v18 = _AXDetermineRequestingClient();
    int v14 = _AXMIGCopyAttributeValue(v15, v17, v8, v9, v10, (uint64_t)v7, v18, (uint64_t)v41, &v35, &v34, &v33, &v37);
    _AXReleasePortFromCache(v15);
    _AXUIElementSetLastGlobalError(v37);
    if (v14)
    {
LABEL_14:
      if (v14 != 268451843 && v14 != 268435460) {
        return 4294942092;
      }
      _AXIPCToPidTimedOut(v8);
      return 4294942080;
    }
LABEL_27:
    AXError v19 = v37;
    if (v37 == kAXErrorSuccess)
    {
      AXError v19 = AXUnserializeWrapper((uint64_t)v41, v35, (uint64_t)v34, v33, (uint64_t)v5);
      AXError v37 = v19;
    }
    if (v33 && v34)
    {
      munmap(v34, v33);
      AXError v19 = v37;
    }
    uint64_t v20 = (void *)*v5;
    if (*v5 && v19 == kAXErrorSuccess)
    {
      if (!shouldHandleRemoteElementCallthroughForAttribute((uint64_t)v7)) {
        goto LABEL_40;
      }
      char v28 = 0;
      uint64_t v21 = _AXHandleRemoteElementCallthrough(v20, v3, (unint64_t)v7, 0, 0, &v28, v6);
      if (v21)
      {
        AXValueRef v22 = v21;
        CFRelease(*v5);
        CFTypeRef *v5 = v22;
      }
      else if (v28 && AXAttributeAllowsRequeryWhenRemoteElementFails((uint64_t)v7))
      {
        long long v38 = @"IgnoreRemoteElement";
        CFTypeRef v39 = *v5;
        *(void *)buf = 0;
        AXError v37 = AXUIElementCopyParameterizedAttributeValue(v3, v7, (CFTypeRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1], (CFTypeRef *)buf);
        if (v37 || !*(void *)buf)
        {
          if (*(void *)buf)
          {
            CFRelease(*(CFTypeRef *)buf);
            *(void *)buf = 0;
          }
          if (*v5)
          {
            CFRelease(*v5);
            CFTypeRef *v5 = 0;
          }
          AXError v37 = kAXErrorFailure;
        }
        else
        {
          CFRelease(*v5);
          CFTypeRef *v5 = *(CFTypeRef *)buf;
        }
      }
      AXError v19 = v37;
    }
    if (v19 && v19 != kAXErrorNoValue) {
      return v37;
    }
LABEL_40:
    int v23 = v36;
    pid_t v24 = getpid();
    if (v24 != v8
      && (v8 || !v23 || v24 != sSystemWideServerPID)
      && +[AXClientSideValueTransformer canTransformAttribute:v7])
    {
      int v25 = +[AXClientSideValueTransformer transformValue:*v5 forAttribute:v7 withElement:v3];
      if (v25)
      {
        if (*v5)
        {
          CFRelease(*v5);
          CFTypeRef *v5 = 0;
        }
        CFTypeRef *v5 = v25;
        AXError v37 = kAXErrorSuccess;
      }
    }
    return v37;
  }
  uint64_t v26 = AXRuntimeLogPID();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    int v27 = [NSNumber numberWithInt:v8];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v27;
    _os_log_impl(&dword_1BA657000, v26, OS_LOG_TYPE_INFO, "Unable to CopyAttribute, no port for %@", buf, 0xCu);
  }
  return 4294942081;
}

void _AXIPCToPidTimedOut(uint64_t a1)
{
  if ((int)a1 >= 1 && getpid() != a1 && !_AXSAutomationEnabled())
  {
    _AXPutPidOnTimeoutProbation(a1, 1);
    _AXPutPidOnTimeoutProbation(a1, 0);
  }
}

uint64_t shouldHandleRemoteElementCallthroughForAttribute(uint64_t a1)
{
  uint64_t result = 0;
  if (a1 <= 5000)
  {
    if (a1 == 2011 || a1 == 2310 || a1 == 3051) {
      return result;
    }
    return 1;
  }
  unint64_t v3 = a1 - 5001;
  if (v3 > 0x18 || ((1 << v3) & 0x1000003) == 0) {
    return 1;
  }
  return result;
}

void *_AXHandleRemoteElementCallthrough(void *cf, const __AXUIElement *a2, unint64_t a3, void *a4, char a5, unsigned char *a6, __CFSet *a7)
{
  if (cf)
  {
    CFTypeID v14 = CFGetTypeID(cf);
    if (v14 == AXUIElementGetTypeID())
    {
      if (_AXIsRemoteElement((const __AXUIElement *)cf, a2))
      {
        if (!a7) {
          goto LABEL_7;
        }
        if (!CFSetContainsValue(a7, cf))
        {
          CFSetAddValue(a7, cf);
LABEL_7:
          *a6 = 1;
          char v38 = 0;
          pid_t pid = 0;
          v36[0] = 0;
          v36[1] = 0;
          int v15 = _AXUIElementValidate(cf, &v38, v36, &pid);
          if (v15 < 0)
          {
            uint64_t v26 = -v15;
            uint64_t v27 = _AXUIElementIDForElement((uint64_t)cf);
            uint64_t v29 = (const void *)_AXUIElementCreateWithPIDAndID(v26, v27, v28);
            uint64_t v30 = +[AXUIMLElement cachedElementForParent:v29];
            uint64_t v31 = v30;
            if (v30) {
              unsigned int v32 = v30;
            }
            else {
              unsigned int v32 = [[AXUIMLElement alloc] initWithParentElement:v29];
            }
            long long v34 = v32;
            if (v29) {
              CFRelease(v29);
            }
            if (a5) {
              uint64_t v35 = [(AXUIMLElement *)v34 copyAttributeValue:a3 parameter:a4];
            }
            else {
              uint64_t v35 = [(AXUIMLElement *)v34 copyAttributeValue:a3];
            }
            uint64_t v24 = v35;
          }
          else
          {
            id v16 = _UIAXElementForAXUIElementRef((uint64_t)cf);
            int v17 = [v16 remotePid];
            if (v17 == getpid() && ([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
            {
              unsigned int v33 = AXRuntimeLogCommon();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
                _AXHandleRemoteElementCallthrough_cold_1(v33);
              }

              uint64_t v24 = 0;
            }
            else
            {
              _AXUIElementSetMachPortForNextMessage([v16 machPort]);
              if (a5)
              {
                v36[0] = 0;
                int v18 = AXUIElementCopyParameterizedAttributeValueRecursive();
                if (v18 != -25212 && v18 && (a3 - 95252 < 3 || a3 - 92501 <= 1))
                {
                  pid_t pid = 0;
                  AXUIElementGetPid(a2, &pid);
                  uint64_t v19 = pid;
                  uint64_t v20 = _AXUIElementIDForElement((uint64_t)cf);
                  AXValueRef v22 = (const void *)_AXUIElementCreateWithPIDAndID(v19, v20, v21);
                  AXUIElementCopyParameterizedAttributeValueRecursive();
                  CFRelease(v22);
                }
              }
              else
              {
                v36[0] = 0;
                AXUIElementCopyAttributeValueRecursive(cf, a3, v36, a7);
              }
              uint64_t v24 = v36[0];
            }
          }
          return (void *)v24;
        }
      }
      return 0;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v23 = [a4 objectForKey:@"elementCount"];
    uint64_t v24 = (uint64_t)_AXHandleRemoteElementCallthroughForArray(cf, a2, a3, v23);

    return (void *)v24;
  }
  return _AXHandleRemoteElementCallthroughForArray(cf, a2, a3, a4);
}

AXError AXUIElementCopyParameterizedAttributeValue(AXUIElementRef element, CFStringRef parameterizedAttribute, CFTypeRef parameter, CFTypeRef *result)
{
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D548]);
  AXError v5 = AXUIElementCopyParameterizedAttributeValueRecursive();
  CFRelease(Mutable);
  return v5;
}

AXError AXUIElementCopyAttributeValue(AXUIElementRef element, CFStringRef attribute, CFTypeRef *value)
{
  CFMutableSetRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D548]);
  AXError v4 = AXUIElementCopyAttributeValueRecursive();
  CFRelease(Mutable);
  return v4;
}

uint64_t AXUIElementCopyParameterizedAttributeValueRecursive()
{
  unint64_t v3 = (const void *)MEMORY[0x1F4188790]();
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  unsigned int v48 = 0;
  size_t v46 = 0;
  long long v47 = 0;
  long long v45 = 0;
  unsigned int v44 = 0;
  uint64_t result = 4294942095;
  if (v1)
  {
    if (v3)
    {
      AXError v5 = v2;
      if (v2)
      {
        uint64_t v6 = v1;
        uint64_t v7 = v0;
        CFTypeRef *v2 = 0;
        if (v0 == 91503 && _AXSMossdeepEnabled())
        {
          AXUIElementSharedSystemApp();
          AXUIElementPerformFencedActionWithValue();
        }
        unsigned int v50 = 0;
        unsigned __int8 v49 = 0;
        memset(v54, 0, 512);
        memset(v53, 0, 512);
        int v43 = 0;
        uint64_t v41 = 0;
        uint64_t v42 = 0;
        uint64_t v8 = _AXUIElementValidate(v3, &v49, &v41, &v43);
        if ((v8 & 0x80000000) != 0)
        {
          CFTypeRef v19 = *v5;
          if (!*v5)
          {
            if ((unint64_t)(v7 - 92501) < 2 || v7 == 95252)
            {
              CFMutableSetRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
              CFTypeRef *v5 = Mutable;
              CFArrayAppendValue(Mutable, v3);
              CFTypeRef v19 = *v5;
            }
            else
            {
              CFTypeRef v19 = 0;
            }
          }
          uint64_t v29 = _AXHandleRemoteElementCallthrough(v19);
          if (v29)
          {
            CFRelease(*v5);
            CFTypeRef *v5 = (CFTypeRef)v29;
          }
          if (getpid() != v8
            && +[AXClientSideValueTransformer canTransformAttribute:v7])
          {
            uint64_t v29 = +[AXClientSideValueTransformer transformValue:*v5 forAttribute:v7 withElement:v3];
          }
          if (v29)
          {
            CFRelease(*v5);
            CFTypeRef *v5 = (CFTypeRef)v29;
          }
          return v50;
        }
        uint64_t result = AXSerializeWrapper(v6, 1, v53, &v46, &v45, &v44);
        unsigned int v50 = result;
        if (result) {
          return result;
        }
        uint64_t v9 = v41;
        uint64_t v10 = v42;
        int v11 = v49;
        pid_t v12 = getpid();
        if (v12 == v8 || !v8 && v11 && v12 == sSystemWideServerPID)
        {
          unsigned int v13 = v46;
          CFTypeID v14 = v45;
          unsigned int v15 = v44;
          if (_OverrideClientType) {
            uint64_t v16 = _OverrideClientType;
          }
          else {
            uint64_t v16 = 7;
          }
          if (getSelfAuditToken_onceToken != -1)
          {
            int v39 = v46;
            AXError v37 = v45;
            dispatch_once(&getSelfAuditToken_onceToken, &__block_literal_global_97);
            CFTypeID v14 = v37;
            unsigned int v13 = v39;
          }
          v40[0] = getSelfAuditToken_auditToken;
          v40[1] = unk_1EB39E668;
          int v17 = _AXXMIGCopyParameterizedAttributeValue(0, v8, v9, v10, v7, (uint64_t)v53, v13, v14, v15, v16, v54, &v48, &v47, (_DWORD *)&v46 + 1, (int *)&v50, v40);
          if (v17)
          {
LABEL_19:
            if (v17 == 268451843 || v17 == 268435460)
            {
              _AXIPCToPidTimedOut(v8);
              unsigned int v18 = -25216;
            }
            else
            {
              unsigned int v18 = -25204;
            }
            unsigned int v50 = v18;
LABEL_32:
            if (v15) {
              munmap(v45, v15);
            }
            if (HIDWORD(v46) && v47) {
              munmap(v47, HIDWORD(v46));
            }
            unsigned int v22 = v50;
            if (!v50)
            {
              if (!*v5) {
                goto LABEL_43;
              }
              uint64_t v23 = _AXHandleRemoteElementCallthrough(*v5);
              if (v23)
              {
                uint64_t v24 = (const void *)v23;
                CFRelease(*v5);
                CFTypeRef *v5 = v24;
              }
              unsigned int v22 = v50;
              if (!v50) {
                goto LABEL_43;
              }
            }
            if (v22 == -25212)
            {
LABEL_43:
              int v25 = v49;
              pid_t v26 = getpid();
              if (v26 != v8 && (v8 || !v25 || v26 != sSystemWideServerPID))
              {
                if (+[AXClientSideValueTransformer canTransformAttribute:v7])
                {
                  uint64_t v27 = +[AXClientSideValueTransformer transformValue:*v5 forAttribute:v7 withElement:v3];
                  if (v27)
                  {
                    uint64_t v28 = (const void *)v27;
                    CFRelease(*v5);
                    CFTypeRef *v5 = v28;
                    return 0;
                  }
                }
              }
            }
            return v50;
          }
        }
        else
        {
          if (v49)
          {
            if (_SystemWideServerPortName_onceToken != -1) {
              dispatch_once(&_SystemWideServerPortName_onceToken, &__block_literal_global_99);
            }
            uint64_t v21 = (const char *)_SystemWideServerPortName___portName;
          }
          else
          {
            uint64_t v21 = 0;
          }
          uint64_t v30 = _AXGetPortFromCache(v8, v21);
          if (!v30)
          {
            unsigned int v33 = AXRuntimeLogPID();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              long long v34 = [NSNumber numberWithInt:v8];
              *(_DWORD *)buf = 138412290;
              long long v52 = v34;
              _os_log_impl(&dword_1BA657000, v33, OS_LOG_TYPE_INFO, "Unable to CopyParam, no port for %@", buf, 0xCu);
            }
            unsigned int v50 = -25215;
            unsigned int v15 = v44;
            goto LABEL_32;
          }
          uint64_t v31 = v30;
          unsigned int v15 = v44;
          int v36 = v43;
          int v38 = v46;
          uint64_t v35 = v45;
          uint64_t v32 = _AXDetermineRequestingClient();
          int v17 = _AXMIGCopyParameterizedAttributeValue(v31, v36, v8, v9, v10, v7, (int)v53, v38, (uint64_t)v35, v15, v32, v54, &v48, (uint64_t *)&v47, (_DWORD *)&v46 + 1, &v50);
          _AXReleasePortFromCache(v31);
          _AXUIElementSetLastGlobalError(v50);
          if (v17) {
            goto LABEL_19;
          }
        }
        if (!v50) {
          unsigned int v50 = AXUnserializeWrapper((uint64_t)v54, v48, (uint64_t)v47, HIDWORD(v46), (uint64_t)v5);
        }
        goto LABEL_32;
      }
    }
  }
  return result;
}

uint64_t AXUIElementPerformActionWithValue()
{
  return AXUIElementPerformFencedActionWithValue();
}

uint64_t AXUIElementSharedSystemApp()
{
  uint64_t result = SystemApp;
  if (!SystemApp)
  {
    if (AXUIElementSharedSystemWide_onceToken != -1) {
      dispatch_once(&AXUIElementSharedSystemWide_onceToken, &__block_literal_global_35);
    }
    AXUIElementCopyAttributeValue((AXUIElementRef)AXUIElementSharedSystemWide_SystemWide, (CFStringRef)0x3E9, (CFTypeRef *)&SystemApp);
    AXUIElementRegisterForApplicationDeath((const __AXUIElement *)SystemApp, &__block_literal_global_37);
    return SystemApp;
  }
  return result;
}

AXError AXUIElementSetAttributeValue(AXUIElementRef element, CFStringRef attribute, CFTypeRef value)
{
  uint64_t v3 = MEMORY[0x1F4188790](element);
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  unsigned int v31 = 0;
  uint64_t v30 = 0;
  unsigned int v29 = 0;
  AXError v6 = kAXErrorIllegalArgument;
  if (!v4) {
    return v6;
  }
  if (!v3) {
    return v6;
  }
  uint64_t v7 = v5;
  if (!v5) {
    return v6;
  }
  uint64_t v8 = v4;
  BOOL v32 = 0;
  memset(v34, 0, 512);
  unsigned int v28 = 0;
  long long v27 = 0uLL;
  uint64_t v9 = _AXUIElementValidate(v3, &v32, &v27, (int *)&v28);
  AXError v6 = AXSerializeWrapper(v7, 0, v34, &v31, &v30, &v29);
  AXError v33 = v6;
  if (v6) {
    return v6;
  }
  long long v10 = v27;
  BOOL v11 = v32;
  pid_t v12 = getpid();
  if (v12 == v9 || !v9 && v11 && v12 == sSystemWideServerPID)
  {
    unsigned int v13 = v31;
    CFTypeID v14 = v30;
    unsigned int v15 = v29;
    if (_OverrideClientType) {
      uint64_t v16 = _OverrideClientType;
    }
    else {
      uint64_t v16 = 7;
    }
    if (getSelfAuditToken_onceToken != -1)
    {
      int v25 = v30;
      dispatch_once(&getSelfAuditToken_onceToken, &__block_literal_global_97);
      CFTypeID v14 = v25;
    }
    v26[0] = getSelfAuditToken_auditToken;
    v26[1] = unk_1EB39E668;
    int v17 = _AXXMIGSetAttributeValue(0, v9, v10, *((uint64_t *)&v10 + 1), v8, (uint64_t)v34, v13, v14, v15, v16, (int *)&v33, v26);
    if (!v15) {
      goto LABEL_16;
    }
  }
  else
  {
    if (v32)
    {
      if (_SystemWideServerPortName_onceToken != -1) {
        dispatch_once(&_SystemWideServerPortName_onceToken, &__block_literal_global_99);
      }
      unsigned int v18 = (const char *)_SystemWideServerPortName___portName;
    }
    else
    {
      unsigned int v18 = 0;
    }
    uint64_t v20 = _AXGetPortFromCache(v9, v18);
    if (v20)
    {
      uint64_t v21 = v28;
      unsigned int v15 = v29;
      uint64_t v22 = v31;
      uint64_t v23 = v30;
      uint64_t v24 = _AXDetermineRequestingClient();
      int v17 = _AXMIGSetAttributeValue(v20, v21, v9, v10, *((uint64_t *)&v10 + 1), v8, (uint64_t)v34, v22, (uint64_t)v23, v15, v24, (int *)&v33);
      _AXUIElementSetLastGlobalError(v33);
    }
    else
    {
      int v17 = 0;
      AXError v33 = -25215;
      unsigned int v15 = v29;
    }
    _AXReleasePortFromCache(v20);
    if (!v15) {
      goto LABEL_16;
    }
  }
  munmap(v30, v15);
LABEL_16:
  if (v17 == 268451843 || v17 == 268435460)
  {
    _AXIPCToPidTimedOut(v9);
    return -25216;
  }
  else if (v17)
  {
    return -25204;
  }
  else
  {
    return v33;
  }
}

AXError AXUIElementCopyMultipleAttributeValues(AXUIElementRef element, CFArrayRef attributes, AXCopyMultipleAttributeOptions options, CFArrayRef *values)
{
  uint64_t v7 = MEMORY[0x1F4188790](element);
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  unsigned int v59 = 0;
  uint64_t v57 = 0;
  __int16 v58 = 0;
  memset(v56, 0, sizeof(v56));
  AXError result = kAXErrorIllegalArgument;
  long long v45 = (const __AXUIElement *)v7;
  if (!v7) {
    return result;
  }
  CFTypeRef cf = v4;
  if (!v4) {
    return result;
  }
  uint64_t v9 = v6;
  if (!v6) {
    return result;
  }
  int v10 = v5;
  CFTypeID TypeID = CFArrayGetTypeID();
  if (TypeID != CFGetTypeID(cf) || !CFArrayGetCount((CFArrayRef)cf)) {
    return -25201;
  }
  AXError v61 = kAXErrorSuccess;
  BOOL v60 = 0;
  memset(v64, 0, 512);
  memset(v63, 0, 512);
  int v55 = 0;
  long long v54 = 0uLL;
  uint64_t v12 = _AXUIElementValidate((uint64_t)v45, &v60, &v54, &v55);
  AXError result = AXSerializeWrapper((uint64_t)cf, 1, v64, &v59, &v58, (_DWORD *)&v57 + 1);
  AXError v61 = result;
  if (result) {
    return result;
  }
  long long v13 = v54;
  if (v12 == getpid())
  {
    unsigned int v14 = v59;
    unsigned int v15 = v58;
    unsigned int v16 = HIDWORD(v57);
    if (_OverrideClientType) {
      uint64_t v17 = _OverrideClientType;
    }
    else {
      uint64_t v17 = 7;
    }
    if (getSelfAuditToken_onceToken != -1) {
      dispatch_once(&getSelfAuditToken_onceToken, &__block_literal_global_97);
    }
    v53[0] = getSelfAuditToken_auditToken;
    v53[1] = unk_1EB39E668;
    int v18 = _AXXMIGCopyMultipleAttributeValues(0, v12, v13, *((uint64_t *)&v13 + 1), (uint64_t)v64, v14, v15, v16, v10, v17, v63, &v57, (void **)&v56[1], v56, &v61, v53);
  }
  else
  {
    if (v60)
    {
      if (_SystemWideServerPortName_onceToken != -1) {
        dispatch_once(&_SystemWideServerPortName_onceToken, &__block_literal_global_99);
      }
      CFTypeRef v19 = (const char *)_SystemWideServerPortName___portName;
    }
    else
    {
      CFTypeRef v19 = 0;
    }
    uint64_t v20 = _AXGetPortFromCache(v12, v19);
    if (v20)
    {
      int v21 = v55;
      int v22 = v59;
      uint64_t v23 = v9;
      int v24 = (int)v58;
      unsigned int v16 = HIDWORD(v57);
      uint64_t v25 = _AXDetermineRequestingClient();
      int v26 = v24;
      uint64_t v9 = v23;
      int v18 = _AXMIGCopyMultipleAttributeValues(v20, v21, v12, v13, SDWORD2(v13), (int)v64, v22, v26, v16, v10, v25, v63, &v57, &v56[1], v56, &v61);
      _AXUIElementSetLastGlobalError(v61);
    }
    else
    {
      int v18 = 0;
      AXError v61 = -25215;
      unsigned int v16 = HIDWORD(v57);
    }
    _AXReleasePortFromCache(v20);
  }
  if (v16) {
    munmap(v58, v16);
  }
  if (!v18)
  {
    if (v61 == kAXErrorSuccess) {
      AXError v61 = AXUnserializeWrapper((uint64_t)v63, v57, *(uint64_t *)&v56[1], v56[0], (uint64_t)v9);
    }
    if (v56[0] && *(void *)&v56[1]) {
      munmap(*(void **)&v56[1], v56[0]);
    }
    if (!*v9) {
      return v61;
    }
    BOOL v27 = v60;
    pid_t v28 = getpid();
    if (v28 == v12)
    {
      BOOL v47 = 0;
    }
    else
    {
      BOOL v47 = 1;
      if (!v12 && v27) {
        BOOL v47 = v28 != sSystemWideServerPID;
      }
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v29 = *v9;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v49 objects:v62 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      id obj = v29;
      BOOL v32 = 0;
      uint64_t v33 = 0;
      uint64_t v46 = *(void *)v50;
      CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFArrayRef v34 = (const __CFArray *)cf;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v50 != v46) {
            objc_enumerationMutation(obj);
          }
          int v36 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          unint64_t v37 = (int)objc_msgSend((id)CFArrayGetValueAtIndex(v34, v33 + i), "intValue");
          if (shouldHandleRemoteElementCallthroughForAttribute(v37))
          {
            CFMutableSetRef Mutable = CFSetCreateMutable(allocator, 0, MEMORY[0x1E4F1D548]);
            int v39 = _AXHandleRemoteElementCallthrough(v36, v45, v37, 0, 0, &v48, Mutable);
            long long v40 = Mutable;
            CFArrayRef v34 = (const __CFArray *)cf;
            CFRelease(v40);
          }
          else
          {
            int v39 = 0;
          }
          if (v47
            && +[AXClientSideValueTransformer canTransformAttribute:v37])
          {
            if (v39) {
              uint64_t v41 = v39;
            }
            else {
              uint64_t v41 = v36;
            }
            int v39 = +[AXClientSideValueTransformer transformValue:v41 forAttribute:v37 withElement:v45];
          }
          if (v39)
          {
            if (!v32) {
              BOOL v32 = (void *)[*v9 mutableCopy];
            }
            [v32 replaceObjectAtIndex:v33 + i withObject:v39];
            CFRelease(v39);
          }
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v49 objects:v62 count:16];
        v33 += i;
      }
      while (v31);

      if (!v32) {
        return v61;
      }
      CFRelease(*v9);
      id v29 = v32;
      *uint64_t v9 = v29;
    }

    return v61;
  }
  if (v18 != 268451843 && v18 != 268435460) {
    return -25204;
  }
  _AXIPCToPidTimedOut(v12);
  return -25216;
}

uint64_t AXUIElementPerformFencedActionWithValue()
{
  uint64_t v0 = MEMORY[0x1F4188790]();
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  unsigned int v32 = 0;
  uint64_t v31 = 0;
  unsigned int v30 = 0;
  uint64_t v5 = 4294942095;
  if (v0)
  {
    uint64_t v6 = v1;
    if (v1)
    {
      int v7 = v4;
      uint64_t v8 = v3;
      unsigned __int8 v36 = 0;
      unsigned int v35 = 0;
      uint64_t v33 = 0;
      uint64_t v34 = 0;
      memset(v38, 0, 480);
      uint64_t v9 = v2 ? v2 : *MEMORY[0x1E4F1D260];
      memset(&v38[30], 0, 32);
      uint64_t v10 = _AXUIElementValidate();
      uint64_t v5 = AXSerializeWrapper(v9, 1, v38, &v32, &v31, &v30);
      unsigned int v37 = v5;
      if (!v5)
      {
        uint64_t v11 = v33;
        uint64_t v12 = v34;
        int v13 = v36;
        pid_t v14 = getpid();
        if (v14 == v10 || !v10 && v13 && v14 == sSystemWideServerPID)
        {
          if ((v8 - 1) > 0xFFFFFFFD)
          {
            LODWORD(v8) = 0;
          }
          else if (mach_port_insert_right(*MEMORY[0x1E4F14960], v8, v8, 0x13u))
          {
            LODWORD(v8) = 0;
          }
          unsigned int v15 = v32;
          unsigned int v16 = v31;
          unsigned int v17 = v30;
          uint64_t v18 = _OverrideClientType;
          if (!_OverrideClientType) {
            uint64_t v18 = 7;
          }
          if (getSelfAuditToken_onceToken != -1)
          {
            uint64_t v28 = v18;
            dispatch_once(&getSelfAuditToken_onceToken, &__block_literal_global_97);
            uint64_t v18 = v28;
          }
          v29[0] = getSelfAuditToken_auditToken;
          v29[1] = unk_1EB39E668;
          int v19 = _AXXMIGPerformActionWithValue(0, v8, v10, v11, v12, v6, (uint64_t)v38, v15, v16, v17, v18, (int *)&v37, v29);
        }
        else
        {
          uint64_t v20 = AXUIElementMachPortForNextMessage;
          if (AXUIElementMachPortForNextMessage)
          {
            AXUIElementMachPortForNextMessage = 0;
          }
          else
          {
            if (v36)
            {
              if (_SystemWideServerPortName_onceToken != -1) {
                dispatch_once(&_SystemWideServerPortName_onceToken, &__block_literal_global_99);
              }
              int v22 = (const char *)_SystemWideServerPortName___portName;
            }
            else
            {
              int v22 = 0;
            }
            uint64_t v20 = _AXGetPortFromCache(v10, v22);
            if (!v20) {
              return 4294942081;
            }
          }
          unsigned int v27 = v35;
          unsigned int v23 = v32;
          uint64_t v24 = (uint64_t)v31;
          int v25 = v30;
          uint64_t v26 = _AXDetermineRequestingClient();
          int v19 = _AXMIGPerformActionWithValue(v20, v8, v27, v10, v11, v12, v6, (uint64_t)v38, v23, v24, v25, v26, &v37);
          _AXUIElementSetLastGlobalError(v37);
          if (!v7) {
            _AXReleasePortFromCache(v20);
          }
        }
        if (v19 == 268451843 || v19 == 268435460)
        {
          _AXIPCToPidTimedOut(v10);
          return 4294942080;
        }
        else if (v19)
        {
          return 4294942092;
        }
        else
        {
          return v37;
        }
      }
    }
  }
  return v5;
}

AXError AXUIElementPerformAction(AXUIElementRef element, CFStringRef action)
{
  AXError result = kAXErrorIllegalArgument;
  if (element)
  {
    int v4 = (int)action;
    if (action)
    {
      AXError v20 = kAXErrorSuccess;
      BOOL v19 = 0;
      mach_msg_timeout_t v18 = 0;
      long long v17 = 0uLL;
      uint64_t v5 = _AXUIElementValidate((uint64_t)element, &v19, &v17, (int *)&v18);
      long long v6 = v17;
      BOOL v7 = v19;
      pid_t v8 = getpid();
      if (v8 == v5 || !v5 && v7 && v8 == sSystemWideServerPID)
      {
        if (_OverrideClientType) {
          uint64_t v9 = _OverrideClientType;
        }
        else {
          uint64_t v9 = 7;
        }
        if (getSelfAuditToken_onceToken != -1) {
          dispatch_once(&getSelfAuditToken_onceToken, &__block_literal_global_97);
        }
        v16[0] = getSelfAuditToken_auditToken;
        v16[1] = unk_1EB39E668;
        int v10 = _AXXMIGPerformAction(0, v5, v6, *((uint64_t *)&v6 + 1), v4, v9, (int *)&v20, v16);
      }
      else
      {
        if (v19)
        {
          if (_SystemWideServerPortName_onceToken != -1) {
            dispatch_once(&_SystemWideServerPortName_onceToken, &__block_literal_global_99);
          }
          uint64_t v11 = (const char *)_SystemWideServerPortName___portName;
        }
        else
        {
          uint64_t v11 = 0;
        }
        uint64_t v12 = _AXGetPortFromCache(v5, v11);
        if (!v12) {
          return -25215;
        }
        uint64_t v13 = v12;
        mach_msg_timeout_t v14 = v18;
        uint64_t v15 = _AXDetermineRequestingClient();
        int v10 = _AXMIGPerformAction(v13, v14, v5, v6, *((uint64_t *)&v6 + 1), v4, v15, &v20);
        _AXUIElementSetLastGlobalError(v20);
        _AXReleasePortFromCache(v13);
      }
      if (v10 == 268451843 || v10 == 268435460)
      {
        _AXIPCToPidTimedOut(v5);
        return -25216;
      }
      else if (v10)
      {
        return -25204;
      }
      else
      {
        return v20;
      }
    }
  }
  return result;
}

uint64_t AXUIElementCopyApplicationAtPosition(const __AXUIElement *a1, uint64_t *a2, float a3, float a4)
{
  return AXUIElementCopyApplicationAndContextAtPositionWithDisplayID(a1, a2, 0, 0, a3, a4);
}

uint64_t AXUIElementCopyApplicationAndContextAtPosition(const __AXUIElement *a1, uint64_t *a2, _DWORD *a3, float a4, float a5)
{
  return AXUIElementCopyApplicationAndContextAtPositionWithDisplayID(a1, a2, a3, 0, a4, a5);
}

uint64_t AXUIElementCopyApplicationAndContextAtPositionWithDisplayID(const __AXUIElement *a1, uint64_t *a2, _DWORD *a3, uint64_t a4, float a5, float a6)
{
  uint64_t result = 4294942095;
  if (a1 && a2)
  {
    int v18 = 0;
    BOOL v17 = 0;
    long long v16 = 0uLL;
    _AXUIElementValidate((uint64_t)a1, &v17, &v16, &v18);
    if (v17)
    {
      uint64_t v13 = copyApplicationAtPosition(a1, a3, a4, a5, a6);
      *a2 = v13;
      if (v13)
      {
        return 0;
      }
      else
      {
        mach_msg_timeout_t v14 = AXLogUIA();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v15 = 0;
          _os_log_impl(&dword_1BA657000, v14, OS_LOG_TYPE_INFO, "Returning invalid element for copy application:", v15, 2u);
        }

        return 4294942094;
      }
    }
    else
    {
      return 4294942096;
    }
  }
  return result;
}

uint64_t copyApplicationAtPosition(const __AXUIElement *a1, _DWORD *a2, uint64_t a3, float a4, float a5)
{
  v23[2] = *MEMORY[0x1E4F143B8];
  valuePtr[0] = a4;
  valuePtr[1] = a5;
  AXValueRef v8 = AXValueCreate(kAXValueTypeCGPoint, valuePtr);
  v22[0] = @"point";
  v22[1] = @"displayId";
  v23[0] = v8;
  uint64_t v9 = [NSNumber numberWithUnsignedInt:a3];
  v23[1] = v9;
  int v10 = (const void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

  CFTypeRef cf = 0;
  if (v8) {
    CFRelease(v8);
  }
  AXError v11 = AXUIElementCopyParameterizedAttributeValue(a1, (CFStringRef)0x1656C, v10, &cf);
  CFTypeRef v12 = cf;
  if (v11) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = cf == 0;
  }
  if (v13)
  {
    uint64_t Internal = 0;
    if (!cf) {
      return Internal;
    }
    goto LABEL_16;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    if (a2)
    {
      long long v16 = [(id)cf objectForKey:@"contextId"];
      *a2 = [v16 unsignedIntValue];
    }
    BOOL v17 = objc_msgSend((id)cf, "objectForKey:", @"pid", cf);
    int v18 = [v17 intValue];

    uint64_t Internal = _AXUIElementCreateInternal(v18, 0, kAXApplicationUID);
  }
  else
  {
    uint64_t Internal = 0;
  }
  CFTypeRef v12 = cf;
  if (cf) {
LABEL_16:
  }
    CFRelease(v12);
  return Internal;
}

double AXConvertRectToHostedCoordinates(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  *(double *)int valuePtr = a3;
  *(double *)&valuePtr[1] = a4;
  *(double *)&double valuePtr[2] = a5;
  *(double *)&valuePtr[3] = a6;
  CFTypeRef result = 0;
  AXValueRef v8 = AXValueCreate(kAXValueTypeCGRect, valuePtr);
  if (AXUIElementSharedSystemWide_onceToken != -1) {
    dispatch_once(&AXUIElementSharedSystemWide_onceToken, &__block_literal_global_35);
  }
  uint64_t v9 = (const __AXUIElement *)AXUIElementSharedSystemWide_SystemWide;
  v15[0] = v8;
  int v10 = [NSNumber numberWithUnsignedInt:a1];
  v15[1] = v10;
  AXError v11 = [NSNumber numberWithUnsignedInt:a2];
  v15[2] = v11;
  AXUIElementCopyParameterizedAttributeValue(v9, (CFStringRef)0x16577, (CFTypeRef)[MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3], &result);

  if (result)
  {
    AXValueGetValue((AXValueRef)result, kAXValueTypeCGRect, valuePtr);
    if (result)
    {
      CFRelease(result);
      CFTypeRef result = 0;
    }
  }
  if (v8) {
    CFRelease(v8);
  }
  return *(double *)valuePtr;
}

uint64_t AXUIElementSharedSystemWide()
{
  if (AXUIElementSharedSystemWide_onceToken != -1) {
    dispatch_once(&AXUIElementSharedSystemWide_onceToken, &__block_literal_global_35);
  }
  return AXUIElementSharedSystemWide_SystemWide;
}

double AXConvertRectFromHostedCoordinates(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  *(double *)int valuePtr = a3;
  *(double *)&valuePtr[1] = a4;
  *(double *)&double valuePtr[2] = a5;
  *(double *)&valuePtr[3] = a6;
  CFTypeRef result = 0;
  AXValueRef v8 = AXValueCreate(kAXValueTypeCGRect, valuePtr);
  if (AXUIElementSharedSystemWide_onceToken != -1) {
    dispatch_once(&AXUIElementSharedSystemWide_onceToken, &__block_literal_global_35);
  }
  uint64_t v9 = (const __AXUIElement *)AXUIElementSharedSystemWide_SystemWide;
  v15[0] = v8;
  int v10 = [NSNumber numberWithUnsignedInt:a1];
  v15[1] = v10;
  AXError v11 = [NSNumber numberWithUnsignedInt:a2];
  v15[2] = v11;
  AXUIElementCopyParameterizedAttributeValue(v9, (CFStringRef)0x16571, (CFTypeRef)[MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3], &result);

  if (result)
  {
    AXValueGetValue((AXValueRef)result, kAXValueTypeCGRect, valuePtr);
    if (result)
    {
      CFRelease(result);
      CFTypeRef result = 0;
    }
  }
  if (v8) {
    CFRelease(v8);
  }
  return *(double *)valuePtr;
}

double AXConvertPointFromHostedCoordinates(uint64_t a1, uint64_t a2, double a3, double a4)
{
  v13[3] = *MEMORY[0x1E4F143B8];
  *(double *)int valuePtr = a3;
  *(double *)&valuePtr[1] = a4;
  CFTypeRef result = 0;
  AXValueRef v6 = AXValueCreate(kAXValueTypeCGPoint, valuePtr);
  if (AXUIElementSharedSystemWide_onceToken != -1) {
    dispatch_once(&AXUIElementSharedSystemWide_onceToken, &__block_literal_global_35);
  }
  BOOL v7 = (const __AXUIElement *)AXUIElementSharedSystemWide_SystemWide;
  v13[0] = v6;
  AXValueRef v8 = [NSNumber numberWithUnsignedInt:a1];
  v13[1] = v8;
  uint64_t v9 = [NSNumber numberWithUnsignedInt:a2];
  v13[2] = v9;
  AXUIElementCopyParameterizedAttributeValue(v7, (CFStringRef)0x1656F, (CFTypeRef)[MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3], &result);

  if (result)
  {
    AXValueGetValue((AXValueRef)result, kAXValueTypeCGPoint, valuePtr);
    if (result)
    {
      CFRelease(result);
      CFTypeRef result = 0;
    }
  }
  if (v6) {
    CFRelease(v6);
  }
  return *(double *)valuePtr;
}

double AXConvertPointToHostedCoordinates(uint64_t a1, uint64_t a2, double a3, double a4)
{
  v13[3] = *MEMORY[0x1E4F143B8];
  *(double *)int valuePtr = a3;
  *(double *)&valuePtr[1] = a4;
  CFTypeRef result = 0;
  AXValueRef v6 = AXValueCreate(kAXValueTypeCGPoint, valuePtr);
  if (AXUIElementSharedSystemWide_onceToken != -1) {
    dispatch_once(&AXUIElementSharedSystemWide_onceToken, &__block_literal_global_35);
  }
  BOOL v7 = (const __AXUIElement *)AXUIElementSharedSystemWide_SystemWide;
  v13[0] = v6;
  AXValueRef v8 = [NSNumber numberWithUnsignedInt:a1];
  v13[1] = v8;
  uint64_t v9 = [NSNumber numberWithUnsignedInt:a2];
  v13[2] = v9;
  AXUIElementCopyParameterizedAttributeValue(v7, (CFStringRef)0x16570, (CFTypeRef)[MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3], &result);

  if (result)
  {
    AXValueGetValue((AXValueRef)result, kAXValueTypeCGPoint, valuePtr);
    if (result)
    {
      CFRelease(result);
      CFTypeRef result = 0;
    }
  }
  if (v6) {
    CFRelease(v6);
  }
  return *(double *)valuePtr;
}

id _AXUIElementSetElementBeingHitTested(id obj)
{
  return objc_storeWeak(&_AXElementBeingHitTested, obj);
}

id _AXUIElementElementBeingHitTested()
{
  id WeakRetained = objc_loadWeakRetained(&_AXElementBeingHitTested);

  return WeakRetained;
}

uint64_t _AXUISetConvertToCAScreenBlock(void *a1)
{
  AXUIConvertTOCAScreenConversionBlock = [a1 copy];
  return MEMORY[0x1F41817F8]();
}

uint64_t AXUIElementCopyElementWithParameters(uint64_t *a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 objectForKeyedSubscript:@"application"];

  uint64_t v5 = [v3 objectForKeyedSubscript:@"point"];
  [v5 pointValue];
  double v7 = v6;
  double v9 = v8;

  int v10 = [v3 objectForKeyedSubscript:@"displayId"];
  uint64_t v11 = [v10 unsignedIntValue];

  CFTypeRef v12 = [v3 objectForKeyedSubscript:@"contextId"];
  unsigned int v13 = [v12 unsignedIntValue];

  mach_msg_timeout_t v14 = [v3 objectForKeyedSubscript:@"hitTestType"];

  unsigned __int16 v15 = [v14 unsignedIntValue];
  float v16 = v7;
  float v17 = v9;
  return _AXUIElementCopyElementAtPositionWithParams((const __AXUIElement *)v4, a1, v15, 0, v13, v11, 0, v16, v17);
}

uint64_t _AXUIElementCopyElementAtPositionWithParams(const __AXUIElement *a1, uint64_t *a2, uint64_t a3, int a4, unsigned int a5, uint64_t a6, int a7, float a8, float a9)
{
  uint64_t v145 = *MEMORY[0x1E4F143B8];
  unsigned int v134 = a5;
  int v131 = 0;
  int v130 = 0;
  long long v129 = 0uLL;
  uint64_t v10 = 4294942095;
  if (!a1) {
    return v10;
  }
  uint64_t v11 = a2;
  if (!a2) {
    return v10;
  }
  unsigned int v133 = 0;
  BOOL v132 = 0;
  memset(v144, 0, 512);
  mach_msg_timeout_t v128 = 0;
  long long v127 = 0uLL;
  uint64_t v18 = AXRequestingClient();
  *uint64_t v11 = 0;
  uint64_t v19 = _AXUIElementValidate((uint64_t)a1, &v132, &v127, (int *)&v128);
  if (!a4 && v132)
  {
    uint64_t v20 = copyApplicationAtPosition(a1, &v134, a6, a8, a9);
    if (!v20)
    {
      _AXSetRequestingClient(v18);
      return 4294942096;
    }
    int v21 = (const void *)v20;
    uint64_t v19 = _AXUIElementValidate(v20, &v132, &v127, (int *)&v128);
    CFRelease(v21);
    goto LABEL_70;
  }
  uint64_t v22 = v134;
  if (v134) {
    goto LABEL_71;
  }
  if (!AXProcessCanContactSystemWideServer())
  {
LABEL_70:
    uint64_t v22 = v134;
    if (!v134)
    {
      double v62 = a8;
      double v64 = a9;
LABEL_73:
      long long v65 = v127;
      BOOL v66 = v132;
      pid_t v67 = getpid();
      if (v67 == v19)
      {
        BOOL v68 = 1;
      }
      else
      {
        BOOL v68 = 0;
        if (!v19 && v66) {
          BOOL v68 = v67 == sSystemWideServerPID;
        }
      }
      if (v68 | a7)
      {
        v69 = AXLogHitTest();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
        {
          v146.x = v62;
          v146.y = v64;
          v96 = NSStringFromPoint(v146);
          [NSNumber numberWithUnsignedInt:v134];
          v98 = uint64_t v97 = v19;
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v96;
          __int16 v137 = 2112;
          v138 = v98;
          _os_log_debug_impl(&dword_1BA657000, v69, OS_LOG_TYPE_DEBUG, "Calling from same app for point: %@ and contextId: %@", buf, 0x16u);

          uint64_t v19 = v97;
        }

        Current = CFRunLoopGetCurrent();
        if (Current == CFRunLoopGetMain())
        {
          float v71 = v62;
          float v72 = v64;
          int v73 = v134;
          if (_OverrideClientType) {
            uint64_t v74 = _OverrideClientType;
          }
          else {
            uint64_t v74 = 7;
          }
          if (getSelfAuditToken_onceToken != -1) {
            dispatch_once(&getSelfAuditToken_onceToken, &__block_literal_global_97);
          }
          v118[0] = getSelfAuditToken_auditToken;
          v118[1] = unk_1EB39E668;
          if (!_AXXMIGCopyElementAtPosition(v71, v72, 0, v19, v65, *((uint64_t *)&v65 + 1), a3, v73, v74, &v131, &v129, v144, &v130, (int *)&v133, v118))goto LABEL_88; {
        }
          }
      }
      else
      {
        uint64_t v83 = AXUIElementMachPortForNextMessage;
        if (AXUIElementMachPortForNextMessage)
        {
          int v84 = v19;
          AXUIElementMachPortForNextMessage = 0;
        }
        else
        {
          if (v132)
          {
            if (_SystemWideServerPortName_onceToken != -1) {
              dispatch_once(&_SystemWideServerPortName_onceToken, &__block_literal_global_99);
            }
            v85 = (const char *)_SystemWideServerPortName___portName;
          }
          else
          {
            v85 = 0;
          }
          int v84 = v19;
          uint64_t v83 = _AXGetPortFromCache(v19, v85);
          if (!v83)
          {
            v94 = AXRuntimeLogPID();
            if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
            {
              v95 = [NSNumber numberWithInt:v19];
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v95;
              _os_log_impl(&dword_1BA657000, v94, OS_LOG_TYPE_INFO, "Unable to CopyElement, no port for %@", buf, 0xCu);
            }
            unsigned int v93 = -25215;
            goto LABEL_109;
          }
        }
        mach_msg_timeout_t v86 = v128;
        int v89 = v134;
        uint64_t v90 = _AXDetermineRequestingClient();
        float v87 = v62;
        float v88 = v64;
        int v91 = v89;
        LODWORD(v19) = v84;
        int v92 = _AXMIGCopyElementAtPosition(v83, v86, v84, v65, *((uint64_t *)&v65 + 1), a3, v91, v90, v87, v88, &v131, &v129, v144, &v130, &v133);
        _AXUIElementSetLastGlobalError(v133);
        _AXReleasePortFromCache(v83);
        if (!v92)
        {
LABEL_88:
          if (v133) {
            goto LABEL_110;
          }
          uint64_t Internal = (const __AXUIElement *)_AXUIElementCreateInternal(v131, v129, *((uint64_t *)&v129 + 1));
          *uint64_t v11 = (uint64_t)Internal;
          if (Internal)
          {
            LODWORD(valuePtr.x) = 0;
            AXUIElementGetPid(Internal, (pid_t *)&valuePtr);
            int x_low = LODWORD(valuePtr.x);
            if ((LODWORD(valuePtr.x) & 0x80000000) != 0)
            {
              pid_t v77 = getpid();
              int x_low = LODWORD(valuePtr.x);
              if (v77 + LODWORD(valuePtr.x))
              {
                uint64_t v99 = -LODWORD(valuePtr.x);
                uint64_t v100 = _AXUIElementIDForElement(*v11);
                v79 = (const void *)_AXUIElementCreateWithPIDAndID(v99, v100, v101);
                v102 = +[AXUIMLElement cachedElementForParent:v79];
                v103 = v102;
                if (v102) {
                  v104 = v102;
                }
                else {
                  v104 = [[AXUIMLElement alloc] initWithParentElement:v79];
                }
                v80 = v104;
                if (*v11)
                {
                  CFRelease((CFTypeRef)*v11);
                  *uint64_t v11 = 0;
                }
                *uint64_t v11 = objc_msgSend(v80, "copyElementAtPosition:", a8, a9);
                goto LABEL_132;
              }
            }
            if (x_low != v19 && x_low)
            {
              BOOL CanContactSystemWideServer = AXProcessCanContactSystemWideServer();
              if (!a7 && CanContactSystemWideServer)
              {
                v79 = (const void *)AXUICreateApplicationElementForElement((const __AXUIElement *)*v11);
                v80 = _UIAXElementForAXUIElementRef(*v11);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  _AXUIElementSetMachPortForNextMessage([v80 machPort]);
                  uint64_t v81 = a3;
                  BOOL v82 = ([v80 deniesDirectAppConnection] & 1) == 0 && objc_msgSend(v80, "remotePid") != 0;
                }
                else
                {
                  uint64_t v81 = a3;
                  BOOL v82 = 1;
                }
                *(void *)buf = 0;
                v103 = +[AXUIElement uiElementWithAXElement:*v11];
                v105 = [v103 numberWithAXAttribute:2021];
                uint64_t v106 = [v105 unsignedIntValue];

                if (v82)
                {
                  unsigned int v133 = _AXUIElementCopyElementAtPositionWithParams(*v11, buf, v81, 0, v106, 0, 0, a8, a9);
                  if (!v133)
                  {
                    CFRelease((CFTypeRef)*v11);
                    *uint64_t v11 = *(void *)buf;
                  }
                }
LABEL_132:
                if (v79) {
                  CFRelease(v79);
                }

LABEL_135:
                if (*v11)
                {
                  if (!v133)
                  {
LABEL_112:
                    _AXSetRequestingClient(v18);
                    return v133;
                  }
LABEL_110:
                  if (*v11)
                  {
                    CFRelease((CFTypeRef)*v11);
                    *uint64_t v11 = 0;
                  }
                  goto LABEL_112;
                }
                goto LABEL_138;
              }
              int x_low = LODWORD(valuePtr.x);
            }
            if (x_low) {
              goto LABEL_135;
            }
            if (*v11)
            {
              CFRelease((CFTypeRef)*v11);
              *uint64_t v11 = 0;
            }
          }
LABEL_138:
          unsigned int v93 = -25200;
          goto LABEL_109;
        }
      }
      unsigned int v93 = -25204;
LABEL_109:
      unsigned int v133 = v93;
      goto LABEL_110;
    }
LABEL_71:
    double v62 = AXConvertPointToHostedCoordinates(v22, a6, a8, a9);
    double v64 = v63;
    goto LABEL_73;
  }
  unsigned int v115 = v19;
  valuePtr.x = a8;
  valuePtr.y = a9;
  AXValueRef v23 = AXValueCreate(kAXValueTypeCGPoint, &valuePtr);
  v143[0] = v23;
  uint64_t v24 = [NSNumber numberWithUnsignedInt:a6];
  v143[1] = v24;
  int v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v143 count:2];

  CFTypeRef result = 0;
  uint64_t v26 = (const __AXUIElement *)_AXUIElementCreateInternal(0, 0, kAXApplicationUID);
  AXError v27 = AXUIElementCopyParameterizedAttributeValue(v26, (CFStringRef)0x16573, v25, &result);
  if (v23) {
    CFRelease(v23);
  }
  CFTypeRef v28 = result;
  if (v27 == kAXErrorSuccess && result)
  {
    CFTypeID v29 = CFGetTypeID(result);
    if (v29 == CFNumberGetTypeID()) {
      unsigned int v134 = [(id)result unsignedIntValue];
    }
    CFTypeRef v28 = result;
  }
  if (v28)
  {
    CFRelease(v28);
    CFTypeRef result = 0;
  }
  if (!a7)
  {
LABEL_67:
    if (v26) {
      CFRelease(v26);
    }

    uint64_t v19 = v115;
    goto LABEL_70;
  }
  int v114 = a7;
  v141 = @"contextId";
  unsigned int v30 = [NSNumber numberWithUnsignedInt:v134];
  v142 = v30;
  uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v142 forKeys:&v141 count:1];

  AXError v32 = AXUIElementCopyParameterizedAttributeValue(v26, (CFStringRef)0x16574, v31, &result);
  id v33 = 0;
  CFTypeRef v34 = result;
  if (v32 == kAXErrorSuccess && result)
  {
    CFTypeID v35 = CFGetTypeID(result);
    if (v35 == CFNumberGetTypeID() && (int v36 = [(id)result unsignedIntValue], v36 != getpid()))
    {
      v112 = v11;
      v113 = v31;
      unsigned int v109 = a6;
      unsigned int v37 = AXRuntimeLogCommon();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        CFTypeRef v38 = result;
        uint64_t v39 = [NSNumber numberWithUnsignedInt:v134];
        long long v40 = [NSNumber numberWithInt:getpid()];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v38;
        __int16 v137 = 2112;
        v138 = v39;
        __int16 v139 = 2112;
        v140 = v40;
        _os_log_impl(&dword_1BA657000, v37, OS_LOG_TYPE_INFO, "the pid{%@} for this context id{%@} is not the same for the hit testing app{%@}, so we shouldn't use it here. this hit test needs to forward through to the remote view", buf, 0x20u);
      }
      v108 = v25;
      unsigned int v110 = a3;
      uint64_t v111 = v18;

      uint64_t v41 = +[AXRemoteElement registeredRemoteElements];
      [v41 enumerateObjectsUsingBlock:&__block_literal_global_0];

      v123[0] = MEMORY[0x1E4F143A8];
      v123[1] = 3221225472;
      v123[2] = ___AXUIElementCopyElementAtPositionWithParams_block_invoke_22;
      v123[3] = &__block_descriptor_44_e25_B16__0__AXRemoteElement_8l;
      unsigned int v124 = v134;
      v123[4] = result;
      +[AXRemoteElement remoteElementsForBlock:v123];
      long long v119 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v42 = [obj countByEnumeratingWithState:&v119 objects:v135 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        id v33 = 0;
        uint64_t v44 = *(void *)v120;
        do
        {
          for (uint64_t i = 0; i != v43; ++i)
          {
            if (*(void *)v120 != v44) {
              objc_enumerationMutation(obj);
            }
            uint64_t v46 = *(void **)(*((void *)&v119 + 1) + 8 * i);
            BOOL v47 = [v46 accessibilityContainer];
            char v48 = [v47 valueForKey:@"_accessibilityWindow"];

            long long v49 = AXRuntimeLogCommon();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v46;
              __int16 v137 = 2112;
              v138 = v48;
              _os_log_impl(&dword_1BA657000, v49, OS_LOG_TYPE_INFO, "matched on %@ with window: %@", buf, 0x16u);
            }

            if (!v33 && v48) {
              id v33 = v46;
            }
          }
          uint64_t v43 = [obj countByEnumeratingWithState:&v119 objects:v135 count:16];
        }
        while (v43);
      }
      else
      {
        id v33 = 0;
      }
      if ([obj count])
      {
        uint64_t v18 = v111;
        uint64_t v11 = v112;
        a6 = v109;
        a3 = v110;
        int v25 = v108;
        uint64_t v31 = v113;
      }
      else
      {

        objc_opt_class();
        uint64_t v18 = v111;
        uint64_t v11 = v112;
        a6 = v109;
        a3 = v110;
        int v25 = v108;
        uint64_t v31 = v113;
        if (objc_opt_isKindOfClass())
        {
          id WeakRetained = objc_loadWeakRetained(&_AXElementBeingHitTested);

          id v51 = WeakRetained;
          long long v52 = [v51 accessibilityContainer];
          long long v53 = [v52 valueForKey:@"_accessibilityWindow"];

          [v51 containerAccessibilityFrame];
          uint64_t v54 = 0;
          v116 = v53;
          if (CGRectContainsPoint(v147, valuePtr) && v53)
          {
            int v55 = [v53 valueForKey:@"isHidden"];
            uint64_t v54 = [v55 BOOLValue] ^ 1;
          }
          v107 = v51;
          uint64_t v56 = AXRuntimeLogCommon();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            uint64_t v57 = [NSNumber numberWithBool:v54];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v57;
            __int16 v137 = 2112;
            v138 = v107;
            _os_log_impl(&dword_1BA657000, v56, OS_LOG_TYPE_INFO, "Did not find matching remote element (multi-level remote hosting in play) - checking starting element: %@ %@", buf, 0x16u);
          }
          if (v54)
          {
            __int16 v58 = v107;
            id v59 = v107;

            id v33 = v59;
            uint64_t v31 = v113;
          }
          else
          {
            uint64_t v31 = v113;
            __int16 v58 = v107;
          }
        }
      }
      if (v33)
      {
        id v60 = v33;
        AXError v61 = AXRuntimeLogCommon();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v60;
          __int16 v137 = 1024;
          LODWORD(v138) = v134;
          _os_log_impl(&dword_1BA657000, v61, OS_LOG_TYPE_INFO, "The mismatched pid was found to be a remote element: %@, so leaving contextId unchanged so let's reset to use contextId of the hosting window: %u", buf, 0x12u);
        }

        uint64_t v31 = v113;
      }
      else
      {
        unsigned int v134 = 0;
      }
    }
    else
    {
      id v33 = 0;
    }
    CFTypeRef v34 = result;
  }
  if (v34)
  {
    CFRelease(v34);
    CFTypeRef result = 0;
  }
  if (!v33)
  {

    a7 = v114;
    goto LABEL_67;
  }
  *uint64_t v11 = _AXCreateAXUIElementWithElement(v33);
  if (v26) {
    CFRelease(v26);
  }
  _AXSetRequestingClient(v18);

  return 0;
}

AXUIElementRef AXUIElementCreateSystemWide(void)
{
  return (AXUIElementRef)_AXUIElementCreateInternal(0, 0, kAXApplicationUID);
}

AXError AXUIElementGetPid(AXUIElementRef element, pid_t *pid)
{
  AXError v2 = kAXErrorIllegalArgument;
  if (element && pid)
  {
    *pid_t pid = -1;
    pid_t v4 = _AXUIElementValidate();
    AXError v2 = kAXErrorSuccess;
    *pid_t pid = v4;
  }
  return v2;
}

uint64_t AXUICreateApplicationElementForElement(const __AXUIElement *a1)
{
  pid_t pid = -1;
  AXUIElementGetPid(a1, &pid);
  return _AXUIElementCreateAppElementWithPid(pid);
}

uint64_t AXUIElementCopyElementUsingContextIdAtPosition(const __AXUIElement *a1, unsigned int a2, uint64_t *a3, int a4, float a5, float a6)
{
  return _AXUIElementCopyElementAtPositionWithParams(a1, a3, 2 * (a4 != 0), 0, a2, 0, 0, a5, a6);
}

uint64_t AXUIElementCopyElementAtPositionWithParams(const __AXUIElement *a1, uint64_t *a2, int a3, float a4, float a5)
{
  return _AXUIElementCopyElementAtPositionWithParams(a1, a2, 2 * (a3 != 0), 0, 0, 0, 0, a4, a5);
}

uint64_t AXUIElementCopyElementUsingDisplayIdAtPosition(const __AXUIElement *a1, uint64_t a2, uint64_t *a3, int a4, float a5, float a6)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  CFTypeRef result = 0;
  v19[0] = a5;
  v19[1] = a6;
  AXValueRef v12 = AXValueCreate(kAXValueTypeCGPoint, v19);
  uint64_t Internal = (const __AXUIElement *)_AXUIElementCreateInternal(0, 0, kAXApplicationUID);
  v21[0] = v12;
  mach_msg_timeout_t v14 = [NSNumber numberWithUnsignedInt:a2];
  v21[1] = v14;
  uint64_t v15 = AXUIElementCopyParameterizedAttributeValue(Internal, (CFStringRef)0x16573, (CFTypeRef)[MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2], &result);

  if (Internal) {
    CFRelease(Internal);
  }
  if (v12) {
    CFRelease(v12);
  }
  CFTypeRef v16 = result;
  if (!v15 && result)
  {
    CFTypeID v17 = CFGetTypeID(result);
    if (v17 == CFNumberGetTypeID()) {
      uint64_t v15 = _AXUIElementCopyElementAtPositionWithParams(a1, a3, 2 * (a4 != 0), 0, [(id)result unsignedIntValue], a2, 0, a5, a6);
    }
    else {
      uint64_t v15 = 0;
    }
    CFTypeRef v16 = result;
  }
  if (v16) {
    CFRelease(v16);
  }
  return v15;
}

AXError AXUIElementCopyElementAtPosition(AXUIElementRef application, float x, float y, AXUIElementRef *element)
{
  return _AXUIElementCopyElementAtPositionWithParams(application, (uint64_t *)element, 0, 0, 0, 0, 0, x, y);
}

uint64_t __AXUIElementSharedSystemWide_block_invoke()
{
  uint64_t result = _AXUIElementCreateInternal(0, 0, kAXApplicationUID);
  AXUIElementSharedSystemWide_SystemWide = result;
  return result;
}

void AXUIElementRegisterForApplicationDeath(const __AXUIElement *a1, void *a2)
{
  id v3 = a2;
  if (AXUIElementRegisterForApplicationDeath_onceToken != -1) {
    dispatch_once(&AXUIElementRegisterForApplicationDeath_onceToken, &__block_literal_global_53);
  }
  pid_t v4 = (void *)[v3 copy];
  pid_t pid = 0;
  AXUIElementGetPid(a1, &pid);
  uint64_t v5 = [NSNumber numberWithInt:pid];
  id v6 = [(id)ApplicationDeathHandlers objectForKey:v5];
  if (!v6) {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  [v6 addObject:v4];
  [(id)ApplicationDeathHandlers setObject:v6 forKey:v5];
}

void __AXUIElementSharedSystemApp_block_invoke()
{
  SystemApp = 0;
}

uint64_t AXUIElementSharedKeyboardApp()
{
  uint64_t result = AXUIElementSharedKeyboardApp_KeyboardApp;
  if (!AXUIElementSharedKeyboardApp_KeyboardApp)
  {
    uint64_t v1 = (const __AXUIElement *)AXUIElementSharedSystemApp();
    AXUIElementCopyAttributeValue(v1, (CFStringRef)0x453, (CFTypeRef *)&AXUIElementSharedKeyboardApp_KeyboardApp);
    AXUIElementRegisterForApplicationDeath((const __AXUIElement *)AXUIElementSharedKeyboardApp_KeyboardApp, &__block_literal_global_39);
    return AXUIElementSharedKeyboardApp_KeyboardApp;
  }
  return result;
}

void __AXUIElementSharedKeyboardApp_block_invoke()
{
  if (AXUIElementSharedKeyboardApp_KeyboardApp)
  {
    CFRelease((CFTypeRef)AXUIElementSharedKeyboardApp_KeyboardApp);
    AXUIElementSharedKeyboardApp_KeyboardApp = 0;
  }
}

BOOL AXUIElementIsApplication(uint64_t a1)
{
  _AXUIElementIDForElement(a1);
  return v1 == kAXApplicationUID;
}

AXError AXUIElementSetMessagingTimeout(AXUIElementRef element, float timeoutInSeconds)
{
  BOOL v8 = 0;
  AXError result = kAXErrorIllegalArgument;
  if (element && timeoutInSeconds >= 0.0)
  {
    int v7 = 0;
    long long v6 = 0uLL;
    uint64_t v4 = (int)(float)(timeoutInSeconds * 1000.0);
    int v5 = _AXUIElementValidate((uint64_t)element, &v8, &v6, &v7);
    if (v8)
    {
      _AXUIElementSetGlobalTimeout(v4);
      return 0;
    }
    else if (v5 < 1)
    {
      return -25202;
    }
    else
    {
      AXError result = kAXErrorSuccess;
      *((_DWORD *)element + 9) = v4;
    }
  }
  return result;
}

void *AXUIElementRegisterSystemWideServerDeathCallback(void *result, uint64_t a2)
{
  gSystemWideServerCallback = result;
  gSystemWideServerCallbackInfo = a2;
  return result;
}

AXError AXObserverCreate(pid_t application, AXObserverCallback callback, AXObserverRef *outObserver)
{
  return AXObserverCreateWithPidObserver(application, (uint64_t)callback, (uint64_t *)outObserver, 0);
}

uint64_t AXObserverCreateWithPidObserver(int a1, uint64_t a2, uint64_t *a3, void *a4)
{
  int v14 = 1024;
  uint64_t result = 4294942095;
  if (a1 < 0 || !a2 || !a3) {
    return result;
  }
  uint64_t Internal = _AXObserverCreateInternal(a1, a2);
  if (!Internal) {
    return 4294942096;
  }
  uint64_t v9 = Internal;
  uint64_t v10 = MSHCreateMIGServerSource(0, 0, (uint64_t)_AXXMIGAccessibilityDefs_subsystem, 0, 0, 0);
  if (!v10)
  {
    CFRelease((CFTypeRef)v9);
    return 4294942096;
  }
  *(void *)(v9 + 24) = v10;
  uint64_t v11 = MSHGetMachPortFromSource(v10);
  *(_DWORD *)(v9 + 32) = v11;
  MEMORY[0x1BA9EDD10](*MEMORY[0x1E4F14960], v11, 1, &v14, 4);
  _AXSetObserverForPort((const void *)v9, *(_DWORD *)(v9 + 32));
  AXValueRef v12 = (const __AXUIElement *)_AXUIElementCreateInternal(0, 0, kAXApplicationUID);
  AXError v13 = AXObserverAddNotification((AXObserverRef)v9, v12, (CFStringRef)0x3FD, a4);
  if (v12) {
    CFRelease(v12);
  }
  if (v13) {
    NSLog((NSString *)@"AXError: Could not auto-register for pid status change");
  }
  uint64_t result = 0;
  *a3 = v9;
  return result;
}

AXError AXObserverAddNotification(AXObserverRef observer, AXUIElementRef element, CFStringRef notification, void *refcon)
{
  kern_return_t v17;
  BOOL v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  double Current;
  CFAbsoluteTime v24;
  mach_msg_timeout_t v25;
  CFStringRef v26;
  int v27;
  CFAbsoluteTime v28;
  _OWORD v29[2];
  long long v30;
  int v31;
  BOOL v32;
  AXError v33;

  id v33 = kAXErrorSuccess;
  AXError result = kAXErrorIllegalArgument;
  if (element && observer && notification)
  {
    CFTypeID TypeID = AXObserverGetTypeID();
    if (TypeID != CFGetTypeID(observer)) {
      return -25203;
    }
    AXError v32 = 0;
    uint64_t v31 = 0;
    unsigned int v30 = 0uLL;
    uint64_t v10 = _AXUIElementValidate((uint64_t)element, &v32, &v30, &v31);
    if (v10 == *((_DWORD *)observer + 4))
    {
      uint64_t v11 = v10;
      long long v12 = v30;
      BOOL v13 = v32;
      pid_t v14 = getpid();
      if (v14 == v11 || !v11 && v13 && v14 == sSystemWideServerPID)
      {
        mach_port_name_t v15 = *((_DWORD *)observer + 8);
        CFTypeRef v16 = (ipc_space_t *)MEMORY[0x1E4F14960];
        CFTypeID v17 = mach_port_mod_refs(*MEMORY[0x1E4F14960], v15, 0, 1);
        if (v17 == 17) {
          CFTypeID v17 = mach_port_mod_refs(*v16, v15, 4u, 1);
        }
        if (v17) {
          return -25204;
        }
        uint64_t v18 = *((unsigned char *)observer + 48) == 0;
        if (getSelfAuditToken_onceToken != -1) {
          dispatch_once(&getSelfAuditToken_onceToken, &__block_literal_global_97);
        }
        v29[0] = getSelfAuditToken_auditToken;
        v29[1] = unk_1EB39E668;
        if (_AXXMIGAddNotification(0, v11, v12, *((uint64_t *)&v12 + 1), (uint64_t)notification, v15, v18, (uint64_t)refcon, (int *)&v33, v29))return -25204; {
      }
        }
      else
      {
        uint64_t v19 = *((unsigned int *)observer + 4);
        if (v32)
        {
          if (_SystemWideServerPortName_onceToken != -1) {
            dispatch_once(&_SystemWideServerPortName_onceToken, &__block_literal_global_99);
          }
          uint64_t v20 = (const char *)_SystemWideServerPortName___portName;
        }
        else
        {
          uint64_t v20 = 0;
        }
        int v21 = _AXGetPortFromCache(v19, v20);
        if (!v21) {
          return -25215;
        }
        uint64_t v22 = v21;
        Current = CFAbsoluteTimeGetCurrent();
        if (v31 <= 999)
        {
          CFLog();
          uint64_t v31 = 2000;
        }
        uint64_t v24 = CFAbsoluteTimeGetCurrent();
        int v25 = v31;
        if (v24 - Current >= (double)(v31 / 1000))
        {
          AXError v27 = 1;
        }
        else
        {
          uint64_t v26 = (const __CFString *)*MEMORY[0x1E4F1D418];
          do
          {
            AXError v27 = _AXMIGAddNotification(v22, v25, v11, v12, *((uint64_t *)&v12 + 1), (int)notification, *((_DWORD *)observer + 8), *((unsigned char *)observer + 48) == 0, (uint64_t)refcon, (int *)&v33);
            _AXUIElementSetLastGlobalError(v33);
            if (!v27) {
              break;
            }
            CFRunLoopRunInMode(v26, 0.5, 1u);
            CFTypeRef v28 = CFAbsoluteTimeGetCurrent();
            int v25 = v31;
          }
          while (v28 - Current < (double)(v31 / 1000));
        }
        _AXReleasePortFromCache(v22);
        if (v27) {
          return -25204;
        }
      }
      AXError result = v33;
      if (v33 == kAXErrorSuccess) {
        *((unsigned char *)observer + 48) = 1;
      }
    }
    else
    {
      return -25201;
    }
  }
  return result;
}

void _AXObserverRelease(uint64_t a1)
{
  if (a1)
  {
    AXError v2 = *(__CFRunLoopSource **)(a1 + 24);
    if (v2)
    {
      CFRunLoopSourceInvalidate(v2);
      CFRelease(*(CFTypeRef *)(a1 + 24));
      unsigned int v3 = *(_DWORD *)(a1 + 32);
      _AXRemoveObserverForPort(v3);
    }
  }
}

CFRunLoopSourceRef AXObserverGetRunLoopSource(CFRunLoopSourceRef observer)
{
  if (observer) {
    return (CFRunLoopSourceRef)*((void *)observer + 3);
  }
  return observer;
}

AXError AXObserverRemoveNotification(AXObserverRef observer, AXUIElementRef element, CFStringRef notification)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  AXError result = kAXErrorIllegalArgument;
  if (observer && element && notification)
  {
    CFTypeID TypeID = AXObserverGetTypeID();
    if (TypeID != CFGetTypeID(observer)) {
      return -25203;
    }
    if (!*((unsigned char *)observer + 48)) {
      return -25210;
    }
    AXError v26 = kAXErrorSuccess;
    BOOL v25 = 0;
    mach_msg_timeout_t v24 = 0;
    long long v23 = 0uLL;
    uint64_t v8 = _AXUIElementValidate((uint64_t)element, &v25, &v23, (int *)&v24);
    if (v8 != *((_DWORD *)observer + 4)) {
      return -25201;
    }
    uint64_t v9 = v8;
    long long v10 = v23;
    BOOL v11 = v25;
    pid_t v12 = getpid();
    if (v12 == v9 || !v9 && v11 && v12 == sSystemWideServerPID)
    {
      mach_port_name_t v13 = *((_DWORD *)observer + 8);
      pid_t v14 = (ipc_space_t *)MEMORY[0x1E4F14960];
      int v15 = mach_port_mod_refs(*MEMORY[0x1E4F14960], v13, 0, 1);
      if (v15 == 17) {
        int v15 = mach_port_mod_refs(*v14, v13, 4u, 1);
      }
      if (!v15)
      {
        if (getSelfAuditToken_onceToken != -1) {
          dispatch_once(&getSelfAuditToken_onceToken, &__block_literal_global_97);
        }
        v22[0] = getSelfAuditToken_auditToken;
        v22[1] = unk_1EB39E668;
        int v15 = _AXXMIGRemoveNotification(0, v9, v10, *((uint64_t *)&v10 + 1), (uint64_t)notification, v13, (int *)&v26, v22);
      }
      goto LABEL_27;
    }
    uint64_t v16 = *((unsigned int *)observer + 4);
    if (v25)
    {
      if (_SystemWideServerPortName_onceToken != -1)
      {
        uint64_t v21 = *((unsigned int *)observer + 4);
        dispatch_once(&_SystemWideServerPortName_onceToken, &__block_literal_global_99);
        uint64_t v16 = v21;
      }
      CFTypeID v17 = (const char *)_SystemWideServerPortName___portName;
    }
    else
    {
      CFTypeID v17 = 0;
    }
    uint64_t v18 = _AXGetPortFromCache(v16, v17);
    if (v18)
    {
      uint64_t v19 = v18;
      int v15 = _AXMIGRemoveNotification(v18, v24, v9, v10, *((uint64_t *)&v10 + 1), (int)notification, *((_DWORD *)observer + 8), (int *)&v26);
      _AXUIElementSetLastGlobalError(v26);
      _AXReleasePortFromCache(v19);
LABEL_27:
      if (v15) {
        return -25204;
      }
      else {
        return v26;
      }
    }
    uint64_t v20 = AXRuntimeLogPID();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      AXObserverRef v28 = observer;
      _os_log_impl(&dword_1BA657000, v20, OS_LOG_TYPE_INFO, "Unable to AddObserver, no port for %@", buf, 0xCu);
    }

    return -25215;
  }
  return result;
}

uint64_t _AXKeyboardAppPid()
{
  pid_t pid = 0;
  uint64_t v0 = (const __AXUIElement *)AXUIElementSharedKeyboardApp();
  AXUIElementGetPid(v0, &pid);
  return pid;
}

void portInvalidationCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = AXRuntimeLogPID();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v25 = a2;
    _os_log_impl(&dword_1BA657000, v3, OS_LOG_TYPE_INFO, "Port invalidated: %d", buf, 8u);
  }

  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __portInvalidationCallback_block_invoke;
  uint64_t v21 = &__block_descriptor_36_e5_v8__0l;
  int v22 = a2;
  AX_PERFORM_WITH_LOCK();
  if (!a2 && gSystemWideServerCallback) {
    gSystemWideServerCallback(gSystemWideServerCallbackInfo);
  }
  uint64_t v4 = (void *)ApplicationDeathHandlers;
  int v5 = [NSNumber numberWithInt:a2];
  long long v6 = [v4 objectForKey:v5];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * i));
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v23 count:16];
    }
    while (v9);
  }

  pid_t v12 = (void *)ApplicationDeathHandlers;
  mach_port_name_t v13 = objc_msgSend(NSNumber, "numberWithInt:", a2, (void)v14);
  [v12 removeObjectForKey:v13];
}

uint64_t __AXUIElementRegisterForApplicationDeath_block_invoke()
{
  ApplicationDeathHandlers = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return MEMORY[0x1F41817F8]();
}

unint64_t AXGetCurrentSerializationStyle()
{
  if (AXInitSerializationStyle_onceToken != -1) {
    dispatch_once(&AXInitSerializationStyle_onceToken, &__block_literal_global_106);
  }
  return atomic_load(&AXCurrentSerializationStyle);
}

void AXSetCurrentSerializationStyle(unint64_t a1)
{
  if (AXInitSerializationStyle_onceToken != -1) {
    dispatch_once(&AXInitSerializationStyle_onceToken, &__block_literal_global_106);
  }
  atomic_store(a1, &AXCurrentSerializationStyle);
}

uint64_t _AXSetAllowsSuspendedAppServer(uint64_t result)
{
  gAllowsSuspendedAppServer = result;
  return result;
}

void _AXUIScreenConvertToCAScreen(int a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (_AXUIScreenConvertToCAScreen_onceToken == -1)
  {
    if (!a1) {
      return;
    }
  }
  else
  {
    dispatch_once(&_AXUIScreenConvertToCAScreen_onceToken, &__block_literal_global_56);
    if (!a1) {
      return;
    }
  }
  AXError v2 = [(id)_AXUIScreenConvertToCAScreen_mainScreen valueForKey:@"_integerDisplayID"];
  int v3 = [v2 unsignedIntValue];

  if (v3 != a1)
  {
    [NSClassFromString((NSString *)@"UIScreen") valueForKey:@"screens"];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v10 = objc_msgSend(v9, "valueForKey:", @"_integerDisplayID", (void)v15);
          int v11 = [v10 unsignedIntValue];

          if (v11 == a1)
          {
            pid_t v12 = [v9 valueForKey:@"scale"];
            [v12 doubleValue];

            mach_port_name_t v13 = [v9 valueForKey:@"_rotation"];
            [v13 doubleValue];

            long long v14 = [(id)_AXUIScreenConvertToCAScreen_mainScreen valueForKey:@"_unjailedReferenceBoundsInPixels"];
            [v14 rectValue];

            goto LABEL_15;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

LABEL_15:
  }
}

uint64_t __getSelfAuditToken_block_invoke()
{
  getSelfAuditToken_auditToken = 0u;
  unk_1EB39E668 = 0u;
  LODWORD(getSelfAuditToken_auditToken) = geteuid();
  uint64_t result = getegid();
  DWORD1(getSelfAuditToken_auditToken) = result;
  return result;
}

void *_AXHandleRemoteElementCallthroughForArray(void *a1, const __AXUIElement *a2, unint64_t a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = a1;
  uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v24 = 0;
    uint64_t v10 = 0;
    uint64_t v26 = *(void *)v28;
    BOOL v13 = a3 - 92501 < 2 || a3 >> 1 == 47626 || a3 == 95254;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v26) {
          objc_enumerationMutation(obj);
        }
        long long v15 = *(const __AXUIElement **)(*((void *)&v27 + 1) + 8 * i);
        if (v15) {
          BOOL v16 = v13;
        }
        else {
          BOOL v16 = 0;
        }
        if (v16)
        {
          CFTypeID v17 = CFGetTypeID(*(CFTypeRef *)(*((void *)&v27 + 1) + 8 * i));
          if (v17 == AXUIElementGetTypeID() && _AXIsRemoteElement(v15, a2) && v24 + i == [obj count] - 1)
          {
            uint64_t v18 = [obj count];
            uint64_t v19 = [a4 unsignedIntegerValue];
            [NSNumber numberWithUnsignedInteger:v19 - v18 + 1];
          }
        }
        uint64_t v20 = _AXHandleRemoteElementCallthrough(v15);
        if (v20)
        {
          uint64_t v21 = (void *)v20;
          if (!v10) {
            uint64_t v10 = (void *)[obj mutableCopy];
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend(v10, "replaceObjectsInRange:withObjectsFromArray:", v9, 1, v21);
            uint64_t v9 = v9 + [v21 count] - 1;
          }
          else
          {
            [v10 replaceObjectAtIndex:v9 withObject:v21];
          }
          CFRelease(v21);
LABEL_35:
          ++v9;
          continue;
        }
        if (!v15) {
          goto LABEL_35;
        }
        CFTypeID v22 = CFGetTypeID(v15);
        if (v22 != AXUIElementGetTypeID() || !_AXIsRemoteElement(v15, a2)) {
          goto LABEL_35;
        }
        if (!v10) {
          uint64_t v10 = (void *)[obj mutableCopy];
        }
        objc_msgSend(v10, "removeObject:", v15, v24);
      }
      v24 += v8;
      uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (!v8) {
        goto LABEL_40;
      }
    }
  }
  uint64_t v10 = 0;
LABEL_40:

  return v10;
}

BOOL _AXIsRemoteElement(const __AXUIElement *a1, const __AXUIElement *a2)
{
  _AXUIElementIDForElement((uint64_t)a1);
  if (v4 == kAXApplicationUID) {
    return 0;
  }
  pid_t pid = 0;
  AXUIElementGetPid(a2, &pid);
  pid_t v6 = 0;
  AXUIElementGetPid(a1, &v6);
  return v6 != pid;
}

void __portInvalidationCallback_block_invoke(uint64_t a1)
{
  if (gPortCache)
  {
    Value = (__CFMachPort *)CFDictionaryGetValue((CFDictionaryRef)gPortCache, (const void *)*(int *)(a1 + 32));
    if (Value)
    {
      int v3 = Value;
      CFRetain(Value);
      CFDictionaryRemoveValue((CFMutableDictionaryRef)gPortCache, (const void *)*(int *)(a1 + 32));
      mach_port_name_t Port = CFMachPortGetPort(v3);
      if (Port) {
        mach_port_deallocate(*MEMORY[0x1E4F14960], Port);
      }
      CFRelease(v3);
    }
    else
    {
      uint64_t v5 = (__CFDictionary *)gPortCache;
      pid_t v6 = (const void *)*(int *)(a1 + 32);
      CFDictionaryRemoveValue(v5, v6);
    }
  }
}

void __AXInitSerializationStyle_block_invoke()
{
  atomic_store(1uLL, &AXCurrentSerializationStyle);
  uint64_t v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.Accessibility"];
  id v2 = [v0 objectForKey:@"SerializationStyle"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v1 = [v2 integerValue];
    if (v1 <= 1) {
      atomic_store(v1, &AXCurrentSerializationStyle);
    }
  }
}

uint64_t AXRequestingClient()
{
  return _CurrentRequestClient;
}

void _AXResetRequestingClient()
{
  _CurrentRequestClient = 0;
}

uint64_t _AXSetRequestingClient(uint64_t result)
{
  _CurrentRequestClient = result;
  return result;
}

uint64_t _AXUIElementSetLastGlobalError(uint64_t result)
{
  _LastGlobalError = result;
  return result;
}

uint64_t AXUIElementLastGlobalError()
{
  return _LastGlobalError;
}

uint64_t AXDoesRequestingClientDeserveAutomation()
{
  if ((unint64_t)_CurrentRequestClient > 0x10 || ((1 << _CurrentRequestClient) & 0x19C38) != 0) {
    return 0;
  }
  if (((1 << _CurrentRequestClient) & 0x106) != 0) {
    return 1;
  }
  if (_CurrentRequestClient != 7) {
    return 0;
  }
  return _AXSAutomationEnabled();
}

BOOL AXRequestingClientSupportsMLElements()
{
  return (unint64_t)(_CurrentRequestClient - 3) < 3;
}

__n128 _AXRuntimeGetCallbacksForUnitTesting@<Q0>(uint64_t a1@<X8>)
{
  long long v1 = *(_OWORD *)&off_1EB39E848;
  *(_OWORD *)(a1 + 32) = xmmword_1EB39E838;
  *(_OWORD *)(a1 + 48) = v1;
  *(void *)(a1 + 64) = qword_1EB39E858;
  __n128 result = (__n128)xmmword_1EB39E828;
  *(_OWORD *)a1 = gCallbacks;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t AXDisableAccessibilityOnTermination()
{
  if (!AXDisableAccessibilityOnTermination_terminationObserver)
  {
    uint64_t v2 = AXObserverCreate(sSystemWideServerPID, (AXObserverCallback)_terminationEmptyHandler, (AXObserverRef *)&AXDisableAccessibilityOnTermination_terminationObserver);
    if (v2) {
      return v2;
    }
    CFRunLoopSourceRef RunLoopSource = AXObserverGetRunLoopSource((AXObserverRef)AXDisableAccessibilityOnTermination_terminationObserver);
    if (!RunLoopSource)
    {
      CFRelease((CFTypeRef)AXDisableAccessibilityOnTermination_terminationObserver);
      AXDisableAccessibilityOnTermination_terminationObserver = 0;
      return 4294942096;
    }
    uint64_t v5 = RunLoopSource;
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, v5, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
  }
  SystemWide = AXUIElementCreateSystemWide();
  long long v1 = AXRuntimeLogCommon();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_1BA657000, v1, OS_LOG_TYPE_INFO, "Requesting disable AX on termination", v7, 2u);
  }

  uint64_t v2 = AXObserverAddNotification((AXObserverRef)AXDisableAccessibilityOnTermination_terminationObserver, SystemWide, (CFStringRef)0x270F, 0);
  CFRelease(SystemWide);
  return v2;
}

BOOL _AXShouldDispatchNonMainThreadCallbacksOnMainThread()
{
  return __AXShouldDispatchNonMainThreadCallbacksOnMainThreadStack > 0;
}

void _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason()
{
}

void _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason()
{
}

uint64_t _AXUIElementRegisterSystemWideServerWithRunLoop(uint64_t a1, uint64_t a2, __CFRunLoop *a3, int a4)
{
  int v7 = 1;
  if (a4)
  {
    if (a4 != 1) {
      goto LABEL_6;
    }
    int v7 = 0;
    uint64_t v8 = &sSystemWideAppServerPID;
  }
  else
  {
    uint64_t v8 = &sSystemWideServerPID;
  }
  int *v8 = getpid();
LABEL_6:
  return _AXUIElementRegisterServerWithRunLoopInternal(a1, a2, a3, v7);
}

uint64_t _AXUIElementRegisterServerWithRunLoopInternal(uint64_t a1, uint64_t a2, __CFRunLoop *a3, int a4)
{
  kern_return_t MachPort;
  kern_return_t v12;
  NSObject *v13;
  kern_return_t v14;
  kern_return_t v15;
  NSObject *v16;
  NSObject *v17;
  CFStringRef v18;
  __CFRunLoopSource *v19;
  __CFNotificationCenter *DarwinNotifyCenter;
  long long v21;
  long long v22;
  long long v23;
  int v25;
  mach_port_t special_port;

  if ((gRegistered & 1) == 0)
  {
    if (!a1) {
      return 4294942095;
    }
    Current = a3;
    if (!a3)
    {
      Current = CFRunLoopGetCurrent();
      if (!Current) {
        return 4294942096;
      }
    }
    special_port = 0;
    uint64_t v9 = (ipc_space_t *)MEMORY[0x1E4F14960];
    if (task_get_special_port(*MEMORY[0x1E4F14960], 4, &special_port)) {
      return 4294942096;
    }
    int v25 = 0;
    if ((AXRuntimeCheck_SupportsMacAXV2() & 1) != 0 || !_CFMZEnabled())
    {
      if (a4) {
        uint64_t v10 = "com.apple.iphone.axserver-systemwide";
      }
      else {
        uint64_t v10 = "com.apple.iphone.axserver";
      }
      Machmach_port_name_t Port = _AXUIElementCreateMachPort((mach_port_name_t *)&v25, special_port, (uint64_t)v10);
      if (MachPort)
      {
        pid_t v12 = MachPort;
        BOOL v13 = AXRuntimeLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          _AXUIElementRegisterServerWithRunLoopInternal_cold_4(v12, v13);
        }
        uint64_t v4 = 4294942096;
        goto LABEL_35;
      }
    }
    else
    {
      int v25 = 0;
    }
    long long v14 = _AXUIElementCreateMachPort((mach_port_name_t *)&gAXServerPortForRemoteBridge, special_port, 0);
    if (v14)
    {
      long long v15 = v14;
      BOOL v16 = AXRuntimeLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        _AXUIElementRegisterServerWithRunLoopInternal_cold_3(v15, v16);
      }

      gAXServerPortForRemoteBridge = 0;
    }
    gCFRunLoopSourceRef RunLoopSource = (uint64_t)MSHCreateMIGServerSource(0, 0, (uint64_t)_AXXMIGAccessibilityDefs_subsystem, 0, v25, 0);
    if (!gRunLoopSource) {
      return 4294942096;
    }
    if (gAXServerPortForRemoteBridge)
    {
      gRunLoopSourceForRemoteBridge = (uint64_t)MSHCreateMIGServerSource(0, 0, (uint64_t)_AXXMIGAccessibilityDefs_subsystem, 0, gAXServerPortForRemoteBridge, 0);
      if (!gRunLoopSourceForRemoteBridge)
      {
        CFTypeID v17 = AXRuntimeLogCommon();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
          _AXUIElementRegisterServerWithRunLoopInternal_cold_2(v17);
        }
      }
    }
    mach_port_deallocate(*v9, special_port);
    uint64_t v18 = (const __CFString *)*MEMORY[0x1E4F1D410];
    CFRunLoopAddSource(Current, (CFRunLoopSourceRef)gRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    if (gRunLoopSourceForRemoteBridge) {
      CFRunLoopAddSource(Current, (CFRunLoopSourceRef)gRunLoopSourceForRemoteBridge, v18);
    }
    uint64_t v19 = MSHCreateMachServerSource(0, 0, (uint64_t)axObserverDeadNameHandler, 0, 0, 0);
    sDeadNameSource = (uint64_t)v19;
    if (!v19) {
      return 4294942096;
    }
    sDeadNamemach_port_name_t Port = MSHGetMachPortFromSource(v19);
    CFRunLoopAddSource(Current, (CFRunLoopSourceRef)sDeadNameSource, v18);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, (const void *)1, (CFNotificationCallback)apiNotifyCallback, @"com.apple.accessibility.api", 0, CFNotificationSuspensionBehaviorCoalesce);
    gUserData = a2;
    *(_OWORD *)&gCallbacks = *(_OWORD *)a1;
    CFTypeID v22 = *(_OWORD *)(a1 + 32);
    uint64_t v21 = *(_OWORD *)(a1 + 48);
    long long v23 = *(_OWORD *)(a1 + 16);
    qword_1EB39E858 = *(void *)(a1 + 64);
    *(_OWORD *)&xmmword_1EB39E838 = v22;
    off_1EB39E848 = v21;
    *(_OWORD *)&xmmword_1EB39E828 = v23;
    gRegistered = 1;
    gAXAccessibilityTurnedOnOnce = 1;
    gIsAPIOn = AXAPIEnabled();
    BOOL v13 = AXRuntimeLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      _AXUIElementRegisterServerWithRunLoopInternal_cold_1(v13);
    }
    uint64_t v4 = 0;
LABEL_35:

    return v4;
  }
  return 4294942092;
}

uint64_t _AXUIElementRegisterServerWithRunLoop(uint64_t a1, uint64_t a2, __CFRunLoop *a3)
{
  return _AXUIElementRegisterServerWithRunLoopInternal(a1, a2, a3, 0);
}

void AXUncaughtException(void *a1)
{
  id v1 = a1;
  NSLog((NSString *)@"AX Crash: %@", v1);
  id v2 = [v1 callStackSymbols];

  NSLog((NSString *)@"Backtrace: %@", v2);
}

uint64_t _AXUIElementServerRegistered()
{
  return gRegistered;
}

uint64_t _AXUIElementRegisterNotificationBypassCallback(void *a1)
{
  gNotificationBypassCallback = a1;
  return 0;
}

uint64_t _AXUIElementRegisterSystemWideServerBroadcastRelayerCallback(void *a1, uint64_t a2)
{
  if (gBroadcasterRegistered) {
    return 4294942092;
  }
  uint64_t result = 0;
  gSystemWideServerBroadcastRelayerCallback = a1;
  gSystemWideServerBroadcastRelayerCallbackInfo = a2;
  gBroadcasterRegistered = 1;
  return result;
}

uint64_t _AXUIElementRegisterAppAXReadyCallback(const void *a1)
{
  id v1 = _Block_copy(a1);
  id v2 = (void *)gAppAXReadyCallback;
  gAppAXReadyCallback = (uint64_t)v1;

  return 0;
}

id _AXUIElementGetAppAXReadyCallback()
{
  uint64_t v0 = _Block_copy((const void *)gAppAXReadyCallback);
  return v0;
}

uint64_t _AXUIElementRemoteBridgeMachPortForAXServer()
{
  return gAXServerPortForRemoteBridge;
}

uint64_t _AXUIElementUnregisterServer()
{
  if (gRegistered != 1) {
    return 4294942092;
  }
  if (gRunLoopSource)
  {
    CFRunLoopSourceInvalidate((CFRunLoopSourceRef)gRunLoopSource);
    CFRelease((CFTypeRef)gRunLoopSource);
    gCFRunLoopSourceRef RunLoopSource = 0;
  }
  if (gRunLoopSourceForRemoteBridge)
  {
    CFRunLoopSourceInvalidate((CFRunLoopSourceRef)gRunLoopSourceForRemoteBridge);
    CFRelease((CFTypeRef)gRunLoopSourceForRemoteBridge);
    gRunLoopSourceForRemoteBridge = 0;
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, (const void *)1, @"com.apple.accessibility.api", 0);
  gUserData = 0;
  *(_OWORD *)&gCallbacks = 0u;
  *(_OWORD *)&xmmword_1EB39E828 = 0u;
  *(_OWORD *)&xmmword_1EB39E838 = 0u;
  off_1EB39E848 = 0u;
  qword_1EB39E858 = 0;
  gRegistered = 0;
  gBroadcasterRegistered = 0;
  gAXServerPortForRemoteBridge = 0;
  if (sDeadNameSource)
  {
    CFRunLoopSourceInvalidate((CFRunLoopSourceRef)sDeadNameSource);
    CFRelease((CFTypeRef)sDeadNameSource);
    sDeadNameSource = 0;
    sDeadNamemach_port_name_t Port = 0;
  }
  uint64_t result = 0;
  gSystemWideServerBroadcastRelayerCallback = 0;
  gSystemWideServerBroadcastRelayerCallbackInfo = 0;
  return result;
}

uint64_t _AXUIElementIDForElement(uint64_t result)
{
  if (result) {
    return *(void *)(result + 20);
  }
  return result;
}

uint64_t _AXUIElementCreateWithID(uint64_t a1, uint64_t a2)
{
  pid_t v4 = getpid();
  return _AXUIElementCreateInternal(v4, a1, a2);
}

CFDataRef _AXUIElementCreateWithData(const __CFData *result)
{
  if (result)
  {
    CFDataRef v1 = result;
    *(_DWORD *)buffer = 0;
    *(void *)id v2 = 0;
    uint64_t v3 = 0;
    v5.location = 0;
    v5.unsigned int length = 4;
    CFDataGetBytes(result, v5, buffer);
    v6.location = 4;
    v6.unsigned int length = 8;
    CFDataGetBytes(v1, v6, v2);
    v7.location = 12;
    v7.unsigned int length = 8;
    CFDataGetBytes(v1, v7, (UInt8 *)&v3);
    return (const __CFData *)_AXUIElementCreateInternal(*(int *)buffer, *(uint64_t *)v2, v3);
  }
  return result;
}

__CFData *_AXUIElementCreateData(const UInt8 *a1)
{
  CFMutableSetRef Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  CFDataAppendBytes(Mutable, a1 + 16, 4);
  CFDataAppendBytes(Mutable, a1 + 20, 8);
  CFDataAppendBytes(Mutable, a1 + 28, 8);
  return Mutable;
}

void __AXPushNotificationToSystemForBroadcast_block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v0 = dispatch_queue_create("broadcast-ax-notify", v2);
  CFDataRef v1 = (void *)AXPushNotificationToSystemForBroadcast_broadcast_queue;
  AXPushNotificationToSystemForBroadcast_broadcast_queue = (uint64_t)v0;
}

uint64_t _AXXMIGCopyAttributeValue(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, void *a7, _DWORD *a8, void **a9, _DWORD *a10, int *a11, long long *a12)
{
  uint64_t v34 = 0;
  CFTypeID v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  int v33 = 0;
  *a8 = 0;
  *a9 = 0;
  *a10 = 0;
  _CurrentRequestClient = a6;
  long long v18 = a12[1];
  v29[0] = *a12;
  v29[1] = v18;
  if (!_isAXAllowed(v29))
  {
    uint64_t v19 = v31;
    int v20 = -25211;
    goto LABEL_20;
  }
  if (gAXServerPortForRemoteBridge == a1)
  {
    if (a5 <= 2999)
    {
      if (a5 != 2021 && a5 != 2076)
      {
LABEL_19:
        uint64_t v19 = v31;
        int v20 = -25217;
        goto LABEL_20;
      }
    }
    else if (((unint64_t)(a5 - 3000) > 0x10 || ((1 << (a5 + 72)) & 0x10005) == 0) {
           && a5 != 5002)
    }
    {
      goto LABEL_19;
    }
  }
  if (!gCallbacks)
  {
    uint64_t v19 = v31;
    int v20 = -25208;
    goto LABEL_20;
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = ___AXXMIGCopyAttributeValue_block_invoke;
  v25[3] = &unk_1E621FF78;
  uint64_t v27 = a3;
  uint64_t v28 = a4;
  int v26 = a5;
  v25[4] = &v30;
  v25[5] = &v34;
  _handleNonMainThreadCallback(v25);
  uint64_t v19 = v31;
  int v20 = *((_DWORD *)v31 + 6);
  if (!v20
    || (uint64_t v21 = (const void *)v35[3]) != 0
    && (CFRelease(v21), v35[3] = 0, uint64_t v19 = v31, (v20 = *((_DWORD *)v31 + 6)) == 0))
  {
    uint64_t v22 = v35[3];
    if (v22)
    {
      int v23 = AXSerializeWrapper(v22, 0, a7, a8, a9, a10);
      *((_DWORD *)v31 + 6) = v23;
      CFRelease((CFTypeRef)v35[3]);
      int v20 = *((_DWORD *)v31 + 6);
      goto LABEL_21;
    }
    int v20 = -25212;
LABEL_20:
    *((_DWORD *)v19 + 6) = v20;
  }
LABEL_21:
  *a11 = v20;
  _CurrentRequestClient = 0;
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  return 0;
}

void sub_1BA6646A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t _isAXAllowed(long long *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!gIsAPIOn) {
    return 0;
  }
  long long v1 = a1[1];
  long long v6 = *a1;
  long long v7 = v1;
  long long v2 = a1[1];
  long long v4 = *a1;
  long long v5 = v2;
  if (__hasEntitlementForAuditToken(@"com.apple.accessibility.api", (const UInt8 *)&v4)) {
    return 1;
  }
  long long v4 = v6;
  long long v5 = v7;
  return __hasEntitlementForAuditToken(@"com.apple.accessibility.SpringBoard", (const UInt8 *)&v4);
}

void _handleNonMainThreadCallback(void *a1)
{
  long long v1 = a1;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v1[2](v1);
  }
  else
  {
    if (__AXShouldDispatchNonMainThreadCallbacksOnMainThreadStack <= 0 && !_AXSInUnitTestMode())
    {
      long long v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"AXRuntime Thread Error" reason:@"We're calling into AX runtime off the main thread!" userInfo:0];
      [v2 raise];
    }
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = ___handleNonMainThreadCallback_block_invoke;
    v5[3] = &unk_1E6220040;
    dispatch_semaphore_t v6 = v3;
    long long v7 = v1;
    long long v4 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
    dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  }
}

uint64_t _AXXMIGCopyMultipleAttributeValues(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, void *a7, unsigned int a8, int a9, uint64_t a10, void *a11, _DWORD *a12, void **a13, _DWORD *a14, _DWORD *a15, long long *a16)
{
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000;
  int v44 = 0;
  _CurrentRequestClient = a10;
  *a12 = 0;
  *a13 = 0;
  *a14 = 0;
  long long v23 = a16[1];
  long long v39 = *a16;
  long long v40 = v23;
  if (!_isAXAllowed(&v39))
  {
    uint64_t v24 = v42;
    int v25 = -25211;
    goto LABEL_9;
  }
  if (gAXServerPortForRemoteBridge == a1)
  {
    uint64_t v24 = v42;
    int v25 = -25217;
    goto LABEL_9;
  }
  if (!(void)off_1EB39E848)
  {
    uint64_t v24 = v42;
    int v25 = -25208;
LABEL_9:
    *((_DWORD *)v24 + 6) = v25;
    if (!a7) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  CFTypeRef cf = 0;
  *(void *)&long long v39 = 0;
  *((void *)&v39 + 1) = &v39;
  long long v40 = 0x2020000000uLL;
  int v26 = AXUnserializeWrapper(a5, a6, (uint64_t)a7, a8, (uint64_t)&cf);
  *((_DWORD *)v42 + 6) = v26;
  if (v26)
  {
    uint64_t v27 = *((void *)&v39 + 1);
  }
  else
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = ___AXXMIGCopyMultipleAttributeValues_block_invoke;
    v34[3] = &unk_1E621FFA0;
    uint64_t v36 = a3;
    uint64_t v37 = a4;
    int v35 = a9;
    v34[4] = &v41;
    v34[5] = &v39;
    v34[6] = cf;
    _handleNonMainThreadCallback(v34);
    CFRelease(cf);
    long long v29 = v42;
    uint64_t v27 = *((void *)&v39 + 1);
    if (!*((_DWORD *)v42 + 6))
    {
LABEL_16:
      uint64_t v31 = *(void *)(v27 + 24);
      if (v31)
      {
        int v32 = AXSerializeWrapper(v31, 0, a11, a12, a13, a14);
        *((_DWORD *)v42 + 6) = v32;
        uint64_t v27 = *((void *)&v39 + 1);
      }
      else
      {
        *((_DWORD *)v29 + 6) = -25200;
      }
      goto LABEL_19;
    }
  }
  uint64_t v30 = *(const void **)(v27 + 24);
  if (v30)
  {
    CFRelease(v30);
    uint64_t v27 = *((void *)&v39 + 1);
    *(void *)(*((void *)&v39 + 1) + 24) = 0;
    long long v29 = v42;
    if (!*((_DWORD *)v42 + 6)) {
      goto LABEL_16;
    }
  }
LABEL_19:
  int v33 = *(const void **)(v27 + 24);
  if (v33) {
    CFRelease(v33);
  }
  _Block_object_dispose(&v39, 8);
  if (a7)
  {
LABEL_10:
    if (a8) {
      munmap(a7, a8);
    }
  }
LABEL_12:
  *a15 = *((_DWORD *)v42 + 6);
  _CurrentRequestClient = 0;
  _Block_object_dispose(&v41, 8);
  return 0;
}

void sub_1BA664B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

uint64_t _AXXMIGCopyParameterizedAttributeValue(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, unsigned int a7, void *a8, unsigned int a9, uint64_t a10, void *a11, _DWORD *a12, void **a13, _DWORD *a14, int *a15, long long *a16)
{
  uint64_t v38 = 0;
  long long v39 = &v38;
  uint64_t v40 = 0x2020000000;
  int v41 = 0;
  _CurrentRequestClient = a10;
  *a12 = 0;
  *a13 = 0;
  *a14 = 0;
  if ((a5 - 91503) > 5 || a5 == 91505 || !gIsAPIOn)
  {
    long long v22 = a16[1];
    long long v36 = *a16;
    long long v37 = v22;
    if (!_isAXAllowed(&v36))
    {
      long long v23 = v39;
      int v24 = -25211;
      goto LABEL_16;
    }
  }
  if (gAXServerPortForRemoteBridge == a1)
  {
    long long v23 = v39;
    int v24 = -25217;
LABEL_16:
    *((_DWORD *)v23 + 6) = v24;
    goto LABEL_17;
  }
  if (!*(&xmmword_1EB39E838 + 1))
  {
    long long v23 = v39;
    int v24 = -25208;
    goto LABEL_16;
  }
  CFTypeRef cf = 0;
  int v24 = AXUnserializeWrapper(a6, a7, (uint64_t)a8, a9, (uint64_t)&cf);
  *((_DWORD *)v39 + 6) = v24;
  if (!v24)
  {
    *(void *)&long long v36 = 0;
    *((void *)&v36 + 1) = &v36;
    long long v37 = 0x2020000000uLL;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = ___AXXMIGCopyParameterizedAttributeValue_block_invoke;
    v31[3] = &unk_1E621FFA0;
    uint64_t v33 = a3;
    uint64_t v34 = a4;
    int v32 = a5;
    v31[5] = &v36;
    v31[6] = cf;
    v31[4] = &v38;
    _handleNonMainThreadCallback(v31);
    int v25 = v39;
    if (!*((_DWORD *)v39 + 6)
      || (int v26 = *(const void **)(*((void *)&v36 + 1) + 24)) != 0
      && (CFRelease(v26), *(void *)(*((void *)&v36 + 1) + 24) = 0, int v25 = v39, !*((_DWORD *)v39 + 6)))
    {
      uint64_t v27 = *(void *)(*((void *)&v36 + 1) + 24);
      if (v27)
      {
        int v28 = AXSerializeWrapper(v27, 0, a11, a12, a13, a14);
        *((_DWORD *)v39 + 6) = v28;
        CFRelease(*(CFTypeRef *)(*((void *)&v36 + 1) + 24));
      }
      else
      {
        *((_DWORD *)v25 + 6) = -25212;
      }
    }
    CFRelease(cf);
    _Block_object_dispose(&v36, 8);
    int v24 = *((_DWORD *)v39 + 6);
  }
LABEL_17:
  *a15 = v24;
  if (a8 && a9) {
    munmap(a8, a9);
  }
  _CurrentRequestClient = 0;
  _Block_object_dispose(&v38, 8);
  return 0;
}

void sub_1BA664E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

uint64_t _AXXMIGSetAttributeValue(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, unsigned int a7, void *a8, unsigned int a9, uint64_t a10, int *a11, long long *a12)
{
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  int v33 = 0;
  _CurrentRequestClient = a10;
  long long v19 = a12[1];
  long long v28 = *a12;
  long long v29 = v19;
  if (!_isAXAllowed(&v28))
  {
    int v20 = v31;
    int v21 = -25211;
    goto LABEL_10;
  }
  if (gAXServerPortForRemoteBridge == a1)
  {
    int v20 = v31;
    int v21 = -25217;
LABEL_10:
    *((_DWORD *)v20 + 6) = v21;
    goto LABEL_11;
  }
  if (!*(&gCallbacks + 1))
  {
    int v20 = v31;
    int v21 = -25208;
    goto LABEL_10;
  }
  *(void *)&long long v28 = 0;
  *((void *)&v28 + 1) = &v28;
  long long v29 = 0x2020000000uLL;
  int v22 = AXUnserializeWrapper(a6, a7, (uint64_t)a8, a9, (uint64_t)&v29 + 8);
  *((_DWORD *)v31 + 6) = v22;
  if (!v22)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = ___AXXMIGSetAttributeValue_block_invoke;
    v24[3] = &unk_1E621FF78;
    uint64_t v26 = a3;
    uint64_t v27 = a4;
    int v25 = a5;
    v24[4] = &v30;
    v24[5] = &v28;
    _handleNonMainThreadCallback(v24);
    CFRelease(*(CFTypeRef *)(*((void *)&v28 + 1) + 24));
  }
  _Block_object_dispose(&v28, 8);
  int v21 = *((_DWORD *)v31 + 6);
LABEL_11:
  *a11 = v21;
  if (a8 && a9) {
    munmap(a8, a9);
  }
  _CurrentRequestClient = 0;
  _Block_object_dispose(&v30, 8);
  return 0;
}

void sub_1BA6650D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t _AXXMIGPerformAction(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int *a7, long long *a8)
{
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  int v25 = 0;
  _CurrentRequestClient = a6;
  long long v13 = a8[1];
  v21[0] = *a8;
  v21[1] = v13;
  if (!_isAXAllowed(v21))
  {
    uint64_t v14 = v23;
    int v15 = -25211;
    goto LABEL_9;
  }
  if (a5 != 2024 && gAXServerPortForRemoteBridge == a1)
  {
    uint64_t v14 = v23;
    int v15 = -25217;
LABEL_9:
    *((_DWORD *)v14 + 6) = v15;
    goto LABEL_10;
  }
  if (!xmmword_1EB39E828)
  {
    uint64_t v14 = v23;
    int v15 = -25208;
    goto LABEL_9;
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = ___AXXMIGPerformAction_block_invoke;
  v17[3] = &unk_1E621FFC8;
  v17[4] = &v22;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  int v18 = a5;
  _handleNonMainThreadCallback(v17);
  int v15 = *((_DWORD *)v23 + 6);
LABEL_10:
  *a7 = v15;
  _CurrentRequestClient = 0;
  _Block_object_dispose(&v22, 8);
  return 0;
}

void sub_1BA6652A8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t _AXXMIGPerformActionWithValue(int a1, mach_port_name_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, unsigned int a8, void *a9, unsigned int a10, uint64_t a11, int *a12, long long *a13)
{
  uint64_t v35 = 0;
  long long v36 = &v35;
  uint64_t v37 = 0x2020000000;
  int v38 = 0;
  _CurrentRequestClient = a11;
  long long v20 = a13[1];
  long long v33 = *a13;
  long long v34 = v20;
  if (!_isAXAllowed(&v33))
  {
    int v21 = v36;
    int v22 = -25211;
    goto LABEL_15;
  }
  if (a6 != 2024 && gAXServerPortForRemoteBridge == a1)
  {
    int v21 = v36;
    int v22 = -25217;
LABEL_15:
    *((_DWORD *)v21 + 6) = v22;
    goto LABEL_16;
  }
  if (!xmmword_1EB39E828)
  {
    int v21 = v36;
    int v22 = -25208;
    goto LABEL_15;
  }
  *(void *)&long long v33 = 0;
  *((void *)&v33 + 1) = &v33;
  long long v34 = 0x2020000000uLL;
  int v23 = AXUnserializeWrapper(a7, a8, (uint64_t)a9, a10, (uint64_t)&v34 + 8);
  *((_DWORD *)v36 + 6) = v23;
  uint64_t v24 = *(const void **)(*((void *)&v33 + 1) + 24);
  if (v24 && CFEqual((CFTypeRef)*MEMORY[0x1E4F1D260], v24))
  {
    CFRelease(*(CFTypeRef *)(*((void *)&v33 + 1) + 24));
    *(void *)(*((void *)&v33 + 1) + 24) = 0;
  }
  if (!*((_DWORD *)v36 + 6))
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = ___AXXMIGPerformActionWithValue_block_invoke;
    v28[3] = &unk_1E621FFF0;
    uint64_t v31 = a4;
    uint64_t v32 = a5;
    v28[4] = &v35;
    v28[5] = &v33;
    int v29 = a6;
    mach_port_name_t v30 = a2;
    _handleNonMainThreadCallback(v28);
    int v25 = *(const void **)(*((void *)&v33 + 1) + 24);
    if (v25) {
      CFRelease(v25);
    }
  }
  _Block_object_dispose(&v33, 8);
  int v22 = *((_DWORD *)v36 + 6);
LABEL_16:
  *a12 = v22;
  if (a9 && a10) {
    munmap(a9, a10);
  }
  if (a2) {
    mach_port_deallocate(*MEMORY[0x1E4F14960], a2);
  }
  _CurrentRequestClient = 0;
  uint64_t v26 = *((unsigned int *)v36 + 6);
  _Block_object_dispose(&v35, 8);
  return v26;
}

void sub_1BA66554C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t _AXXMIGCopyElementAtPosition(float a1, float a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, __int16 a7, int a8, uint64_t a9, _DWORD *a10, _OWORD *a11, unsigned char *a12, _DWORD *a13, int *a14, long long *a15)
{
  uint64_t v40 = 0;
  int v41 = &v40;
  uint64_t v42 = 0x2020000000;
  int v43 = 0;
  _CurrentRequestClient = a9;
  *a12 = 0;
  *a13 = 0;
  long long v22 = a15[1];
  long long v38 = *a15;
  long long v39 = v22;
  if (!_isAXAllowed(&v38))
  {
    uint64_t v24 = AXLogCommon();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      _AXXMIGCopyElementAtPosition_cold_1(v24);
    }

    int v25 = v41;
    int v26 = -25211;
    goto LABEL_10;
  }
  if (!xmmword_1EB39E838)
  {
    int v25 = v41;
    int v26 = -25208;
LABEL_10:
    *((_DWORD *)v25 + 6) = v26;
    goto LABEL_13;
  }
  *(void *)&long long v38 = 0;
  *((void *)&v38 + 1) = &v38;
  long long v39 = 0x2020000000uLL;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = ___AXXMIGCopyElementAtPosition_block_invoke;
  v31[3] = &unk_1E6220018;
  uint64_t v36 = a5;
  uint64_t v37 = a6;
  float v32 = a1;
  float v33 = a2;
  __int16 v35 = a7;
  int v34 = a8;
  v31[4] = &v40;
  v31[5] = &v38;
  _handleNonMainThreadCallback(v31);
  if (!*((_DWORD *)v41 + 6))
  {
    uint64_t v23 = *(void *)(*((void *)&v38 + 1) + 24);
    if (v23)
    {
      BOOL v30 = 0;
      int v29 = 0;
      long long v28 = 0uLL;
      *a10 = _AXUIElementValidate(v23, &v30, &v28, &v29);
      *a11 = v28;
      CFRelease(*(CFTypeRef *)(*((void *)&v38 + 1) + 24));
    }
    else
    {
      *((_DWORD *)v41 + 6) = -25212;
    }
  }
  _Block_object_dispose(&v38, 8);
  int v26 = *((_DWORD *)v41 + 6);
LABEL_13:
  *a14 = v26;
  _CurrentRequestClient = 0;
  _Block_object_dispose(&v40, 8);
  return 0;
}

void sub_1BA6657D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t _AXXMIGAddNotification(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, mach_port_name_t a6, int a7, uint64_t a8, int *a9, _OWORD *a10)
{
  kern_return_t v18;
  int v19;
  const void *v20;
  mach_port_name_t name[4];
  long long v23;

  long long v14 = a10[1];
  *(_OWORD *)name = *a10;
  uint64_t v23 = v14;
  if (!_isAXAllowed((long long *)name))
  {
    int v15 = -25211;
    goto LABEL_5;
  }
  if (gAXServerPortForRemoteBridge == a1)
  {
    int v15 = -25217;
LABEL_5:
    int v16 = 1;
    goto LABEL_15;
  }
  if (a7)
  {
    name[0] = 0;
    uint64_t v17 = (ipc_space_t *)MEMORY[0x1E4F14960];
    int v18 = mach_port_request_notification(*MEMORY[0x1E4F14960], a6, 72, 0, sDeadNamePort, 0x15u, name);
    if (name[0]) {
      mach_port_deallocate(*v17, name[0]);
    }
    int v16 = 0;
    if (v18)
    {
      int v15 = -25200;
      goto LABEL_15;
    }
  }
  else
  {
    int v16 = 1;
  }
  uint64_t v19 = _AXPidFromAuditToken((uint64_t)a10);
  long long v20 = (const void *)_AXObserverCookieCreate(a6, a8, v19, 0);
  _AXAddNotificationObserver();
  if (v20) {
    CFRelease(v20);
  }
  int v15 = 0;
LABEL_15:
  *a9 = v15;
  if (v15 | v16) {
    mach_port_mod_refs(*MEMORY[0x1E4F14960], a6, 0, -1);
  }
  return 0;
}

uint64_t _AXObserverCookieCreate(mach_port_name_t a1, uint64_t a2, int a3, int a4)
{
  kern_return_t v10;

  if (!__kAXObserverCookieTypeID) {
    __kAXObserverCookieCFTypeID TypeID = _CFRuntimeRegisterClass();
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    if (a1)
    {
      uint64_t v9 = (ipc_space_t *)MEMORY[0x1E4F14960];
      uint64_t v10 = mach_port_mod_refs(*MEMORY[0x1E4F14960], a1, 0, 1);
      if (!v10)
      {
        *(_DWORD *)(Instance + 16) = a1;
        if (!a4) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
      if (v10 == 17) {
        mach_port_mod_refs(*v9, a1, 4u, 1);
      }
    }
    if (!a4)
    {
LABEL_10:
      *(void *)(Instance + 24) = a2;
      *(_DWORD *)(Instance + 32) = a3;
      return Instance;
    }
LABEL_9:
    *(_DWORD *)(Instance + 20) = a1;
    goto LABEL_10;
  }
  return Instance;
}

uint64_t _AXXMIGRemoveNotification(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, mach_port_name_t a6, int *a7, long long *a8)
{
  long long v12 = a8[1];
  v17[0] = *a8;
  v17[1] = v12;
  if (_isAXAllowed(v17))
  {
    if (gAXServerPortForRemoteBridge == a1)
    {
      int v13 = -25217;
    }
    else
    {
      int v14 = _AXPidFromAuditToken((uint64_t)a8);
      int v15 = (const void *)_AXObserverCookieCreate(a6, 0, v14, 0);
      _AXRemoveNotificationObserver();
      if (v15) {
        CFRelease(v15);
      }
      int v13 = 0;
    }
  }
  else
  {
    int v13 = -25211;
  }
  *a7 = v13;
  mach_port_mod_refs(*MEMORY[0x1E4F14960], a6, 0, -1);
  return 0;
}

uint64_t _AXTraitsRemoveTrait(uint64_t a1, uint64_t a2)
{
  if ((a2 & ~a1) != 0) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = a2;
  }
  return v2 ^ a1;
}

uint64_t _AXTraitsAsString()
{
  return 0;
}

__CFString *_AXTraitsAsStringInternal(uint64_t a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableSetRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  long long v4 = Mutable;
  if (a1)
  {
    CFArrayAppendValue(Mutable, @"button");
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 0x100000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_66;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  CFArrayAppendValue(v4, @"link");
  if ((a1 & 0x100000000) == 0)
  {
LABEL_4:
    if ((a1 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_67;
  }
LABEL_66:
  CFArrayAppendValue(v4, @"visited");
  if ((a1 & 4) == 0)
  {
LABEL_5:
    if ((a1 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_68;
  }
LABEL_67:
  CFArrayAppendValue(v4, @"image");
  if ((a1 & 8) == 0)
  {
LABEL_6:
    if ((a1 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_69;
  }
LABEL_68:
  CFArrayAppendValue(v4, @"selected");
  if ((a1 & 0x10) == 0)
  {
LABEL_7:
    if ((a1 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_70;
  }
LABEL_69:
  CFArrayAppendValue(v4, @"plays-sound");
  if ((a1 & 0x20) == 0)
  {
LABEL_8:
    if ((a1 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_71;
  }
LABEL_70:
  CFArrayAppendValue(v4, @"kb-key");
  if ((a1 & 0x40) == 0)
  {
LABEL_9:
    if ((a1 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_72;
  }
LABEL_71:
  CFArrayAppendValue(v4, @"static-text");
  if ((a1 & 0x80) == 0)
  {
LABEL_10:
    if ((a1 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_73;
  }
LABEL_72:
  CFArrayAppendValue(v4, @"summary-elem");
  if ((a1 & 0x100) == 0)
  {
LABEL_11:
    if ((a1 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_74;
  }
LABEL_73:
  CFArrayAppendValue(v4, @"not-enabled");
  if ((a1 & 0x200) == 0)
  {
LABEL_12:
    if ((a1 & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_75;
  }
LABEL_74:
  CFArrayAppendValue(v4, @"updates-frequently");
  if ((a1 & 0x400) == 0)
  {
LABEL_13:
    if ((a1 & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_76;
  }
LABEL_75:
  CFArrayAppendValue(v4, @"search-field");
  if ((a1 & 0x2000) == 0)
  {
LABEL_14:
    if ((a1 & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_77;
  }
LABEL_76:
  CFArrayAppendValue(v4, @"direct-touch");
  if ((a1 & 0x4000) == 0)
  {
LABEL_15:
    if ((a1 & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_78;
  }
LABEL_77:
  CFArrayAppendValue(v4, @"cause-page-turn");
  if ((a1 & 0x10000) == 0)
  {
LABEL_16:
    if ((a1 & 0x4000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_79;
  }
LABEL_78:
  CFArrayAppendValue(v4, @"header");
  if ((a1 & 0x4000000) == 0)
  {
LABEL_17:
    if ((a1 & 0x20000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_80;
  }
LABEL_79:
  CFArrayAppendValue(v4, @"footer");
  if ((a1 & 0x20000) == 0)
  {
LABEL_18:
    if ((a1 & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_81;
  }
LABEL_80:
  CFArrayAppendValue(v4, @"web-content");
  if ((a1 & 0x40000) == 0)
  {
LABEL_19:
    if ((a1 & 0x80000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_82;
  }
LABEL_81:
  CFArrayAppendValue(v4, @"text-entry");
  if ((a1 & 0x80000) == 0)
  {
LABEL_20:
    if ((a1 & 0x200000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_83;
  }
LABEL_82:
  CFArrayAppendValue(v4, @"picker-elem");
  if ((a1 & 0x200000) == 0)
  {
LABEL_21:
    if ((a1 & 0x400000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_84;
  }
LABEL_83:
  CFArrayAppendValue(v4, @"is-editing");
  if ((a1 & 0x400000) == 0)
  {
LABEL_22:
    if ((a1 & 0x4000000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_85;
  }
LABEL_84:
  CFArrayAppendValue(v4, @"launch-icon");
  if ((a1 & 0x4000000000000) == 0)
  {
LABEL_23:
    if ((a1 & 0x800000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_86;
  }
LABEL_85:
  CFArrayAppendValue(v4, @"folder-icon");
  if ((a1 & 0x800000) == 0)
  {
LABEL_24:
    if ((a1 & 0x400000000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_87;
  }
LABEL_86:
  CFArrayAppendValue(v4, @"status-bar-elem");
  if ((a1 & 0x400000000000000) == 0)
  {
LABEL_25:
    if ((a1 & 0x1000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_88;
  }
LABEL_87:
  CFArrayAppendValue(v4, @"allow-layout-change-in-status-bar");
  if ((a1 & 0x1000000) == 0)
  {
LABEL_26:
    if ((a1 & 0x8000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_89;
  }
LABEL_88:
  CFArrayAppendValue(v4, @"text-field");
  if ((a1 & 0x8000000) == 0)
  {
LABEL_27:
    if ((a1 & 0x20000000000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_90;
  }
LABEL_89:
  CFArrayAppendValue(v4, @"back-button");
  if ((a1 & 0x20000000000000) == 0)
  {
LABEL_28:
    if ((a1 & 0x80000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_91;
  }
LABEL_90:
  CFArrayAppendValue(v4, @"toggle");
  if ((a1 & 0x80000000) == 0)
  {
LABEL_29:
    if ((a1 & 0x200000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_92;
  }
LABEL_91:
  CFArrayAppendValue(v4, @"select-dismisses-item");
  if ((a1 & 0x200000000) == 0)
  {
LABEL_30:
    if ((a1 & 0x400000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_93;
  }
LABEL_92:
  CFArrayAppendValue(v4, @"scrollable");
  if ((a1 & 0x400000000) == 0)
  {
LABEL_31:
    if ((a1 & 0x800000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_94;
  }
LABEL_93:
  CFArrayAppendValue(v4, @"spacer");
  if ((a1 & 0x800000000) == 0)
  {
LABEL_32:
    if ((a1 & 0x1000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_95;
  }
LABEL_94:
  CFArrayAppendValue(v4, @"table-index");
  if ((a1 & 0x1000000000) == 0)
  {
LABEL_33:
    if ((a1 & 0x2000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_96;
  }
LABEL_95:
  CFArrayAppendValue(v4, @"map");
  if ((a1 & 0x2000000000) == 0)
  {
LABEL_34:
    if ((a1 & 0x4000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_97;
  }
LABEL_96:
  CFArrayAppendValue(v4, @"text-ops-available");
  if ((a1 & 0x4000000000) == 0)
  {
LABEL_35:
    if ((a1 & 0x8000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_98;
  }
LABEL_97:
  CFArrayAppendValue(v4, @"draggable");
  if ((a1 & 0x8000000000) == 0)
  {
LABEL_36:
    if ((a1 & 0x2000000000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_99;
  }
LABEL_98:
  CFArrayAppendValue(v4, @"gesture-practice");
  if ((a1 & 0x2000000000000000) == 0)
  {
LABEL_37:
    if ((a1 & 0x10000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_100;
  }
LABEL_99:
  CFArrayAppendValue(v4, @"gesture-handler");
  if ((a1 & 0x10000000000) == 0)
  {
LABEL_38:
    if ((a1 & 0x20000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_101;
  }
LABEL_100:
  CFArrayAppendValue(v4, @"popup-button");
  if ((a1 & 0x20000000000) == 0)
  {
LABEL_39:
    if ((a1 & 0x200000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_102;
  }
LABEL_101:
  CFArrayAppendValue(v4, @"allows-native-sliding");
  if ((a1 & 0x200000000000) == 0)
  {
LABEL_40:
    if ((a1 & 0x400000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_103;
  }
LABEL_102:
  CFArrayAppendValue(v4, @"touch-container");
  if ((a1 & 0x400000000000) == 0)
  {
LABEL_41:
    if ((a1 & 0x800000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_104;
  }
LABEL_103:
  CFArrayAppendValue(v4, @"supports-zoom");
  if ((a1 & 0x800000000000) == 0)
  {
LABEL_42:
    if ((a1 & 0x1000000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_105;
  }
LABEL_104:
  CFArrayAppendValue(v4, @"text-area");
  if ((a1 & 0x1000000000000) == 0)
  {
LABEL_43:
    if ((a1 & 0x800) == 0) {
      goto LABEL_44;
    }
    goto LABEL_106;
  }
LABEL_105:
  CFArrayAppendValue(v4, @"book-content");
  if ((a1 & 0x800) == 0)
  {
LABEL_44:
    if ((a1 & 0x1000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_107;
  }
LABEL_106:
  CFArrayAppendValue(v4, @"starts-media");
  if ((a1 & 0x1000) == 0)
  {
LABEL_45:
    if ((a1 & 0x10000000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_108;
  }
LABEL_107:
  CFArrayAppendValue(v4, @"adjustable");
  if ((a1 & 0x10000000000000) == 0)
  {
LABEL_46:
    if ((a1 & 0x20000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_109;
  }
LABEL_108:
  CFArrayAppendValue(v4, @"menu-item");
  if ((a1 & 0x20000000) == 0)
  {
LABEL_47:
    if ((a1 & 0x40000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_110;
  }
LABEL_109:
  CFArrayAppendValue(v4, @"aut-correct-candidate");
  if ((a1 & 0x40000000) == 0)
  {
LABEL_48:
    if ((a1 & 0x10000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_111;
  }
LABEL_110:
  CFArrayAppendValue(v4, @"delete-key");
  if ((a1 & 0x10000000) == 0)
  {
LABEL_49:
    if ((a1 & 0x40000000000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_112;
  }
LABEL_111:
  CFArrayAppendValue(v4, @"tab-button");
  if ((a1 & 0x40000000000000) == 0)
  {
LABEL_50:
    if ((a1 & 0x100000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_113;
  }
LABEL_112:
  CFArrayAppendValue(v4, @"ignore-item-chooser");
  if ((a1 & 0x100000) == 0)
  {
LABEL_51:
    if ((a1 & 0x40000000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_114;
  }
LABEL_113:
  CFArrayAppendValue(v4, @"radio-button");
  if ((a1 & 0x40000000000) == 0)
  {
LABEL_52:
    if ((a1 & 0x2000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_115;
  }
LABEL_114:
  CFArrayAppendValue(v4, @"math-equation");
  if ((a1 & 0x2000000) == 0)
  {
LABEL_53:
    if ((a1 & 0x80000000000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_116;
  }
LABEL_115:
  CFArrayAppendValue(v4, @"inactive");
  if ((a1 & 0x80000000000000) == 0)
  {
LABEL_54:
    if ((a1 & 0x100000000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_117;
  }
LABEL_116:
  CFArrayAppendValue(v4, @"supports-tracking-detail");
  if ((a1 & 0x100000000000000) == 0)
  {
LABEL_55:
    if ((a1 & 0x8000000000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_118;
  }
LABEL_117:
  CFArrayAppendValue(v4, @"alert");
  if ((a1 & 0x8000000000000) == 0)
  {
LABEL_56:
    if ((a1 & 0x800000000000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_57;
  }
LABEL_118:
  CFArrayAppendValue(v4, @"read-only");
  if ((a1 & 0x800000000000000) != 0) {
LABEL_57:
  }
    CFArrayAppendValue(v4, @"web-interactive-video");
LABEL_58:
  long long v5 = CFStringCreateMutable(v2, 0);
  CFIndex Count = CFArrayGetCount(v4);
  CFIndex v7 = Count - 1;
  if (Count >= 1)
  {
    CFIndex v8 = Count;
    for (CFIndex i = 0; i != v8; ++i)
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v4, i);
      CFStringAppend(v5, ValueAtIndex);
      if (v7 != i) {
        CFStringAppend(v5, @", ");
      }
    }
  }
  CFRelease(v4);
  return v5;
}

void _AXRemoveObserverForPort(unsigned int a1)
{
  os_unfair_lock_lock(&gAXObserverLock);
  if (gObserverCache)
  {
    CFDictionaryRemoveValue((CFMutableDictionaryRef)gObserverCache, (const void *)a1);
    if (!CFDictionaryGetCount((CFDictionaryRef)gObserverCache))
    {
      CFRelease((CFTypeRef)gObserverCache);
      gObserverCache = 0;
    }
  }
  os_unfair_lock_unlock(&gAXObserverLock);
}

void _AXSetObserverForPort(const void *a1, unsigned int a2)
{
  os_unfair_lock_lock(&gAXObserverLock);
  CFMutableSetRef Mutable = (__CFDictionary *)gObserverCache;
  if (!gObserverCache)
  {
    CFMutableSetRef Mutable = CFDictionaryCreateMutable(0, 1, 0, 0);
    gObserverCache = (uint64_t)Mutable;
  }
  CFDictionarySetValue(Mutable, (const void *)a2, a1);
  os_unfair_lock_unlock(&gAXObserverLock);
}

BOOL AXProcessCanContactSystemWideServer()
{
  if (AXProcessCanContactSystemWideServer_onceToken != -1) {
    dispatch_once(&AXProcessCanContactSystemWideServer_onceToken, &__block_literal_global_542);
  }
  return (AXProcessCanContactSystemWideServer_CanContact & 1) == 0;
}

void __AXProcessCanContactSystemWideServer_block_invoke()
{
  dispatch_queue_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v1 = [v0 bundleIdentifier];
  int v2 = [v1 hasPrefix:@"com.apple.WebKit.WebContent"];

  if (v2) {
    AXProcessCanContactSystemWideServer_CanContact = 1;
  }
}

uint64_t _AXUIElementCreateMachPort(mach_port_name_t *a1, uint64_t a2, uint64_t a3)
{
  mach_port_name_t name = 0;
  if (!a3 || (uint64_t result = bootstrap_check_in2(), result))
  {
    dispatch_semaphore_t v6 = (ipc_space_t *)MEMORY[0x1E4F14960];
    uint64_t result = mach_port_allocate(*MEMORY[0x1E4F14960], 1u, &name);
    if (!result)
    {
      uint64_t result = mach_port_insert_right(*v6, name, name, 0x14u);
      if (a3)
      {
        if (!result) {
          uint64_t result = bootstrap_register2();
        }
      }
    }
  }
  *a1 = name;
  return result;
}

uint64_t axObserverDeadNameHandler(uint64_t result)
{
  if (result && *(_DWORD *)(result + 20) == 72)
  {
    mach_port_name_t v1 = *(_DWORD *)(result + 32);
    int v2 = (const void *)_AXObserverCookieCreate(v1, 0, 0, 1);
    _AXNotificationObserverClientDied(v2);
    if (v2) {
      CFRelease(v2);
    }
    ipc_space_t v3 = *MEMORY[0x1E4F14960];
    return mach_port_mod_refs(v3, v1, 4u, -2);
  }
  return result;
}

uint64_t apiNotifyCallback()
{
  uint64_t result = AXAPIEnabled();
  gIsAPIOn = result;
  return result;
}

uint64_t __hasEntitlementForAuditToken(const __CFString *a1, const UInt8 *a2)
{
  pid_t v4 = getpid();
  if (v4 != sSystemWideAppServerPID && v4 != sSystemWideServerPID) {
    return 1;
  }
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (!_ValidAuditTokens) {
    _ValidAuditTokens = (uint64_t)CFSetCreateMutable(v6, 0, MEMORY[0x1E4F1D548]);
  }
  CFDataRef v7 = CFDataCreate(v6, a2, 32);
  if (!CFSetContainsValue((CFSetRef)_ValidAuditTokens, v7))
  {
    int v10 = *(_DWORD *)a2;
    if (v10 != geteuid() || (int v11 = *((_DWORD *)a2 + 1), v11 != getegid()))
    {
      long long v12 = *((_OWORD *)a2 + 1);
      *(_OWORD *)cf.val = *(_OWORD *)a2;
      *(_OWORD *)&cf.val[4] = v12;
      int v13 = SecTaskCreateWithAuditToken(0, &cf);
      if (!v13)
      {
        uint64_t v8 = 0;
LABEL_29:
        CFRelease(v7);
        return v8;
      }
      int v14 = v13;
      *(void *)cf.val = 0;
      CFTypeRef v15 = SecTaskCopyValueForEntitlement(v13, a1, (CFErrorRef *)&cf);
      if (v15)
      {
        int v16 = v15;
        CFTypeID v17 = CFGetTypeID(v15);
        if (v17 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v16))
        {
          if (CFSetGetCount((CFSetRef)_ValidAuditTokens) >= 11) {
            CFSetRemoveAllValues((CFMutableSetRef)_ValidAuditTokens);
          }
          CFSetAddValue((CFMutableSetRef)_ValidAuditTokens, v7);
          CFRelease(v16);
          int v18 = *(const void **)cf.val;
          uint64_t v8 = 1;
          if (!*(void *)cf.val) {
            goto LABEL_28;
          }
          goto LABEL_26;
        }
        CFRelease(v16);
      }
      if (!*(void *)cf.val)
      {
        uint64_t v8 = 0;
        goto LABEL_28;
      }
      CFLog();
      uint64_t v8 = 0;
      int v18 = *(const void **)cf.val;
LABEL_26:
      CFRelease(v18);
LABEL_28:
      CFRelease(v14);
      goto LABEL_29;
    }
  }
  CFRelease(v7);
  return 1;
}

intptr_t ___handleNonMainThreadCallback_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  int v2 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v2);
}

uint64_t __AXObserverCookieDeallocate(uint64_t result)
{
  mach_port_name_t v1 = *(_DWORD *)(result + 16);
  if (v1) {
    return mach_port_deallocate(*MEMORY[0x1E4F14960], v1);
  }
  return result;
}

BOOL __AXObserverCookieEqual(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    int v3 = *(_DWORD *)(a1 + 16);
    if (!v3) {
      int v3 = *(_DWORD *)(a1 + 20);
    }
    int v4 = *(_DWORD *)(a2 + 16);
    if (!v4) {
      int v4 = *(_DWORD *)(a2 + 20);
    }
    return v3 == v4;
  }
  return v2;
}

uint64_t __AXObserverCookieHash(uint64_t a1)
{
  return *(unsigned int *)(a1 + 16);
}

CFStringRef __AXObserverCookieCopyDescription(uint64_t a1)
{
  CFAllocatorRef v2 = CFGetAllocator((CFTypeRef)a1);
  return CFStringCreateWithFormat(v2, 0, @"<AXObserverCookie %p> {port=0x%x refcon=%p, pid=%d}", a1, *(unsigned int *)(a1 + 16), *(void *)(a1 + 24), *(unsigned int *)(a1 + 32));
}

void sub_1BA666814(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA666BB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA666D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1BA666E94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA666F70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA667AC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA667B24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CFTypeID AXValueGetTypeID(void)
{
  if ((__AXValueInitialized & 1) == 0) {
    __AXValueInitialize();
  }
  return __kAXValueTypeID;
}

uint64_t __AXValueInitialize()
{
  pthread_mutex_lock(&sInitLock);
  if ((__AXValueInitialized & 1) == 0)
  {
    __kAXValueCFTypeID TypeID = _CFRuntimeRegisterClass();
    __AXValueInitialized = 1;
  }
  return pthread_mutex_unlock(&sInitLock);
}

_DWORD *_AXValueCreateFromInternalData(int a1, const void *a2)
{
  if (!a2) {
    return 0;
  }
  if ((__AXValueInitialized & 1) == 0) {
    __AXValueInitialize();
  }
  if ((a1 - 1) > 4) {
    return 0;
  }
  size_t v4 = dword_1BA6A62F0[a1 - 1];
  uint64_t Instance = (_DWORD *)_CFRuntimeCreateInstance();
  Instance[4] = a1;
  Instance[5] = v4;
  memcpy(Instance + 6, a2, v4);
  return Instance;
}

AXValueRef AXValueCreate(AXValueType theType, const void *valuePtr)
{
  if (!valuePtr) {
    return 0;
  }
  signed __int32 v3 = theType - 1;
  if (theType - 1 > 4) {
    return 0;
  }
  size_t v5 = qword_1BA6A6308[v3];
  if ((__AXValueInitialized & 1) == 0) {
    __AXValueInitialize();
  }
  uint64_t Instance = (_DWORD *)_CFRuntimeCreateInstance();
  Instance[4] = theType;
  Instance[5] = v5;
  CFDataRef v7 = Instance;
  switch(v3)
  {
    case 0:
    case 1:
    case 3:
      uint64_t v8 = malloc_type_calloc(1uLL, 0x10uLL, 0x1000040451B5BE8uLL);
      _OWORD *v8 = *(_OWORD *)valuePtr;
      goto LABEL_10;
    case 2:
      uint64_t v8 = malloc_type_calloc(1uLL, 0x20uLL, 0x1000040E0EAB150uLL);
      _OWORD *v8 = *(_OWORD *)valuePtr;
      v8[1] = *((_OWORD *)valuePtr + 1);
LABEL_10:
      memmove(v7 + 6, v8, v5);
      free(v8);
      break;
    case 4:
      memmove(Instance + 6, valuePtr, v5);
      break;
    default:
      return 0;
  }
  return (AXValueRef)v7;
}

AXValueType AXValueGetType(AXValueRef value)
{
  if (value)
  {
    AXValueRef v1 = value;
    if ((__AXValueInitialized & 1) == 0) {
      __AXValueInitialize();
    }
    uint64_t v2 = __kAXValueTypeID;
    if (v2 == CFGetTypeID(v1)) {
      LODWORD(value) = *((_DWORD *)v1 + 4);
    }
    else {
      LODWORD(value) = 0;
    }
  }
  return value;
}

Boolean AXValueGetValue(AXValueRef value, AXValueType theType, void *valuePtr)
{
  if (AXValueGetType(value) != theType) {
    return 0;
  }
  switch(theType)
  {
    case kAXValueTypeCGPoint:
    case kAXValueTypeCGSize:
    case kAXValueTypeCFRange:
      *(_OWORD *)CGPoint valuePtr = *(_OWORD *)((char *)value + 24);
      break;
    case kAXValueTypeCGRect:
      *(_OWORD *)CGPoint valuePtr = *(_OWORD *)((char *)value + 24);
      *((_OWORD *)valuePtr + 1) = *(_OWORD *)((char *)value + 40);
      break;
    case kAXValueTypeAXError:
      *(_DWORD *)CGPoint valuePtr = *((_DWORD *)value + 6);
      break;
    default:
      return 0;
  }
  return 1;
}

BOOL __AXValueEqual(_DWORD *a1, _DWORD *a2)
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    if (a1[4] == a2[4] && (size_t v3 = a1[5], v3 == a2[5])) {
      return memcmp(a1 + 6, a2 + 6, v3) == 0;
    }
    else {
      return 0;
    }
  }
  return v2;
}

uint64_t __AXValueHash(_DWORD *a1)
{
  return (a1[5] + a1[4] + a1[6]);
}

CFStringRef __AXValueCopyDescription(int *cf)
{
  switch(cf[4])
  {
    case 1:
      CFAllocatorRef v2 = CFGetAllocator(cf);
      CFStringRef result = CFStringCreateWithFormat(v2, 0, @"<AXValue %p> {value = x:%f y:%f type = kAXValueCGPointType}", cf, *((void *)cf + 3), *((void *)cf + 4));
      break;
    case 2:
      CFAllocatorRef v5 = CFGetAllocator(cf);
      CFStringRef result = CFStringCreateWithFormat(v5, 0, @"<AXValue %p> {value = w:%f h:%f type = kAXValueCGSizeType}", cf, *((void *)cf + 3), *((void *)cf + 4));
      break;
    case 3:
      CFAllocatorRef v6 = CFGetAllocator(cf);
      CFStringRef result = CFStringCreateWithFormat(v6, 0, @"<AXValue %p> {value = x:%f y:%f w:%f h:%f type = kAXValueCGRectType}", cf, *((void *)cf + 3), *((void *)cf + 4), *((void *)cf + 5), *((void *)cf + 6));
      break;
    case 4:
      CFAllocatorRef v7 = CFGetAllocator(cf);
      CFStringRef result = CFStringCreateWithFormat(v7, 0, @"<AXValue %p> {value = location:%d length:%d type = kAXValueCFRangeType}", cf, *((void *)cf + 3), *((void *)cf + 4));
      break;
    case 5:
      CFAllocatorRef v8 = CFGetAllocator(cf);
      CFStringRef result = CFStringCreateWithFormat(v8, 0, @"<AXValue %p> {value = error:%ld type = kAXValueAXErrorType}", cf, cf[6]);
      break;
    default:
      CFAllocatorRef v4 = CFGetAllocator(cf);
      CFStringRef result = CFStringCreateWithFormat(v4, 0, @"<AXValue %p> {type = kAXValueIllegalType}", cf);
      break;
  }
  return result;
}

id AXXCAttributeForAttribute(void *a1)
{
  id v1 = a1;
  if (_AXCAInitializeLookup_onceToken != -1) {
    dispatch_once(&_AXCAInitializeLookup_onceToken, &__block_literal_global_2);
  }
  CFAllocatorRef v2 = [(id)XCAttributesToAXAttributes allKeys];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __AXXCAttributeForAttribute_block_invoke;
  v7[3] = &unk_1E6220098;
  id v8 = v1;
  id v3 = v1;
  CFAllocatorRef v4 = objc_msgSend(v2, "ax_filteredArrayUsingBlock:", v7);
  CFAllocatorRef v5 = [v4 lastObject];

  return v5;
}

uint64_t __AXXCAttributeForAttribute_block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [(id)XCAttributesToAXAttributes objectForKeyedSubscript:a2];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

id AXAttributeForXCAttribute(void *a1)
{
  uint64_t v1 = _AXCAInitializeLookup_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&_AXCAInitializeLookup_onceToken, &__block_literal_global_2);
  }
  id v3 = [(id)XCAttributesToAXAttributes objectForKeyedSubscript:v2];

  return v3;
}

__CFString *AXExpandedStatusAttributeForValue(void *a1)
{
  int v1 = [a1 intValue];
  id v2 = @"kAXXCAttributeExpandedStatusUnsupported";
  if (v1 == 1) {
    id v2 = @"kAXXCAttributeExpandedStatusExpanded";
  }
  if (v1 == 2) {
    return @"kAXXCAttributeExpandedStatusCollapsed";
  }
  else {
    return v2;
  }
}

uint64_t __AXUIElementInitialize()
{
  pthread_mutex_lock(&sInitLock_0);
  if ((__AXUIElementInitialized & 1) == 0)
  {
    __kAXUIElementCFTypeID TypeID = _CFRuntimeRegisterClass();
    __AXUIElementInitialized = 1;
  }
  if (!gSerializeBufferKey)
  {
    gSerializeBufferKey = 0;
    int v0 = pthread_key_create((pthread_key_t *)&gSerializeBufferKey, (void (__cdecl *)(void *))serializeBufferDestructor);
    if (v0)
    {
      int v1 = v0;
      __AXUIElementInitialized = 0;
      gSerializeBufferKey = 0;
      id v2 = AXRuntimeLogCommon();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
        __AXUIElementInitialize_cold_1(v1, v2);
      }
    }
  }
  return pthread_mutex_unlock(&sInitLock_0);
}

uint64_t _AXUIElementSetGlobalTimeout(uint64_t result)
{
  if ((int)result <= 0) {
    int v1 = 3000;
  }
  else {
    int v1 = result;
  }
  sGlobalTimeout = v1;
  return result;
}

float AXUIElementMessagingTimeout()
{
  return (float)sGlobalTimeout;
}

CFTypeID AXObserverGetTypeID(void)
{
  if ((__AXObserverInitialized & 1) == 0) {
    __AXObserverInitialize();
  }
  return __kAXObserverTypeID;
}

uint64_t __AXObserverInitialize()
{
  pthread_mutex_lock(&sInitLock_0);
  if ((__AXObserverInitialized & 1) == 0)
  {
    __kAXObserverCFTypeID TypeID = _CFRuntimeRegisterClass();
    __AXObserverInitialized = 1;
  }
  return pthread_mutex_unlock(&sInitLock_0);
}

uint64_t _AXObserverCreateInternal(int a1, uint64_t a2)
{
  if ((__AXObserverInitialized & 1) == 0) {
    __AXObserverInitialize();
  }
  uint64_t result = _CFRuntimeCreateInstance();
  if (result)
  {
    *(_DWORD *)(result + 16) = a1;
    *(void *)(result + 24) = 0;
    *(_DWORD *)(result + 32) = 0;
    *(void *)(result + 40) = a2;
    *(unsigned char *)(result + 48) = 0;
  }
  return result;
}

BOOL __AXUIElementEqual(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a1 && a2) {
    return *(void *)(a1 + 20) == *(void *)(a2 + 20)
  }
        && *(void *)(a1 + 28) == *(void *)(a2 + 28)
        && *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16);
  return v2;
}

uint64_t __AXUIElementHash(uint64_t a1)
{
  return *(void *)(a1 + 20) + *(int *)(a1 + 16) + *(void *)(a1 + 28);
}

CFStringRef __AXUIElementCopyDescription(uint64_t a1)
{
  CFAllocatorRef v2 = CFGetAllocator((CFTypeRef)a1);
  return CFStringCreateWithFormat(v2, 0, @"<AXUIElementRef %p> {pid=%d} {uid=[ID:%llu hash:%p]}", a1, *(unsigned int *)(a1 + 16), *(void *)(a1 + 28), *(void *)(a1 + 20));
}

BOOL __AXObserverEqual(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 32) == *(_DWORD *)(a2 + 32);
}

uint64_t __AXObserverHash(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

CFStringRef __AXObserverCopyDescription(unsigned int *a1)
{
  CFAllocatorRef v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0, @"<AXObserver %p> {pid=%d}", a1, a1[4]);
}

uint64_t _AXClearElementCache()
{
  return AX_PERFORM_WITH_LOCK();
}

uint64_t _AXSetNextElementCacheUniqueUID()
{
  return AX_PERFORM_WITH_LOCK();
}

void _AXInitializeElementCache()
{
  if (_AXInitializeElementCache_onceToken != -1) {
    dispatch_once(&_AXInitializeElementCache_onceToken, &__block_literal_global_8);
  }
}

uint64_t _AXAddToElementCache(void *a1)
{
  id v1 = a1;
  if (_AXInitializeElementCache_onceToken != -1) {
    dispatch_once(&_AXInitializeElementCache_onceToken, &__block_literal_global_8);
  }
  uint64_t v5 = 0;
  CFAllocatorRef v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  if (v1)
  {
    id v4 = v1;
    AX_PERFORM_WITH_LOCK();

    uint64_t v2 = v6[3];
  }
  else
  {
    uint64_t v2 = 0;
  }
  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_1BA66C3E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _doesElementFrame(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  switch(a1)
  {
    case 2:
      v38.origin.x = a6;
      v38.origin.y = a7;
      v38.size.width = a8;
      v38.size.height = a9;
      double MaxY = CGRectGetMaxY(v38);
      v39.origin.x = a2;
      v39.origin.y = a3;
      v39.size.width = a4;
      v39.size.height = a5;
      if (MaxY - CGRectGetMaxY(v39) < 0.0) {
        return 0;
      }
      v40.origin.x = a6;
      v40.origin.y = a7;
      v40.size.width = a8;
      v40.size.height = a9;
      double MinY = CGRectGetMinY(v40);
      CGFloat v24 = a2;
      CGFloat v25 = a3;
      CGFloat v26 = a4;
      CGFloat v27 = a5;
      break;
    case 3:
      v41.origin.x = a6;
      v41.origin.y = a7;
      v41.size.width = a8;
      v41.size.height = a9;
      double MaxX = CGRectGetMaxX(v41);
      v42.origin.x = a2;
      v42.origin.y = a3;
      v42.size.width = a4;
      v42.size.height = a5;
      if (MaxX - CGRectGetMaxX(v42) < 0.0) {
        return 0;
      }
      v43.origin.x = a6;
      v43.origin.y = a7;
      v43.size.width = a8;
      v43.size.height = a9;
      double MinY = CGRectGetMinX(v43);
      CGFloat v20 = a2;
      CGFloat v21 = a3;
      CGFloat v22 = a4;
      CGFloat v18 = a5;
LABEL_10:
      double v29 = CGRectGetMaxX(*(CGRect *)&v20);
      return MinY - v29 < 6.0;
    case 4:
      double rectb = CGRectGetMinX(*(CGRect *)&a2);
      v36.origin.x = a6;
      v36.origin.y = a7;
      v36.size.width = a8;
      v36.size.height = a9;
      if (rectb - CGRectGetMinX(v36) < 0.0) {
        return 0;
      }
      v37.origin.x = a2;
      v37.origin.y = a3;
      v37.size.width = a4;
      v37.size.height = a5;
      CGFloat MinX = CGRectGetMinX(v37);
      CGFloat v18 = a9;
      double MinY = MinX;
      CGFloat v20 = a6;
      CGFloat v21 = a7;
      CGFloat v22 = a8;
      goto LABEL_10;
    default:
      double rectc = CGRectGetMinY(*(CGRect *)&a2);
      v44.origin.x = a6;
      v44.origin.y = a7;
      v44.size.width = a8;
      v44.size.height = a9;
      if (rectc - CGRectGetMinY(v44) < 0.0) {
        return 0;
      }
      v45.origin.x = a2;
      v45.origin.y = a3;
      v45.size.width = a4;
      v45.size.height = a5;
      CGFloat v30 = CGRectGetMinY(v45);
      CGFloat v27 = a9;
      double MinY = v30;
      CGFloat v24 = a6;
      CGFloat v25 = a7;
      CGFloat v26 = a8;
      break;
  }
  double v29 = CGRectGetMaxY(*(CGRect *)&v24);
  return MinY - v29 < 6.0;
}

id AXReadAllUtilitiesElementsToCombineForReadAll(void *a1, uint64_t a2)
{
  r1.size.CGFloat width = *(CGFloat *)MEMORY[0x1E4F143B8];
  id v2 = a1;
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v2;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  if (v4)
  {
    uint64_t v54 = v3;
    CGFloat x = *MEMORY[0x1E4F1DB28];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v10 = 0.0;
    int v11 = v4;
    id v12 = v4;
    CGFloat v59 = y;
    CGFloat v60 = *MEMORY[0x1E4F1DB28];
    CGFloat v57 = height;
    CGFloat v58 = width;
    double v56 = 0.0;
    while (1)
    {
      int v13 = v12;
      if (objc_msgSend(v5, "containsObject:", v11, v54)) {
        break;
      }
      [v5 addObject:v11];
      uint64_t v14 = [v11 stringWithAXAttribute:2008];
      if (v14)
      {
        CFTypeRef v15 = (void *)v14;
        uint64_t v16 = [v13 stringWithAXAttribute:2008];
        if (v16)
        {
          CFTypeID v17 = (void *)v16;
          CGFloat v18 = [v11 stringWithAXAttribute:2008];
          uint64_t v19 = [v13 stringWithAXAttribute:2008];
          int v20 = [v18 isEqualToString:v19];

          if (!v20) {
            break;
          }
        }
        else
        {
        }
      }
      CGFloat v21 = [v11 arrayWithAXAttribute:2145];
      if ([v21 containsObject:&unk_1F14233E0]) {
        goto LABEL_35;
      }
      CGFloat v22 = [v11 numberWithAXAttribute:2004];
      uint64_t v23 = [v22 unsignedLongLongValue];

      if ((v23 & 0x42) == 0) {
        goto LABEL_35;
      }
      CGFloat v24 = [v13 numberWithAXAttribute:2004];
      int v25 = [v24 unsignedLongLongValue];

      uint64_t v26 = *(void *)&v25 & 0x10000;
      if ((v23 & 0x10000) == 0x10000 && !v26) {
        goto LABEL_35;
      }
      if ((v23 & 0x10000) == 0 && v26 == 0x10000) {
        goto LABEL_35;
      }
      r1.origin.CGFloat x = x;
      uint64_t v27 = [v13 arrayWithAXAttribute:2145];
      long long v28 = (void *)v27;
      if (v21 && v27 && ![v21 isEqualToArray:v27]
        || (int v29 = [v11 BOOLWithAXAttribute:2213],
            v29 != [v13 BOOLWithAXAttribute:2213])
        || (int v30 = [v11 BOOLWithAXAttribute:2212],
            v30 != [v13 BOOLWithAXAttribute:2212]))
      {
LABEL_34:

LABEL_35:
        break;
      }
      [v11 rectWithAXAttribute:2003];
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      double v38 = v37;
      CGRect v39 = +[AXElement systemWideElement];
      CGRect v40 = [v11 numberWithAXAttribute:2021];
      objc_msgSend(v39, "convertRect:fromContextId:", objc_msgSend(v40, "unsignedIntValue"), v32, v34, v36, v38);
      CGFloat x = v41;
      CGFloat v43 = v42;
      CGFloat v45 = v44;
      CGFloat v47 = v46;

      v63.origin.CGFloat y = v59;
      v63.origin.CGFloat x = v60;
      v63.size.CGFloat height = v57;
      v63.size.CGFloat width = v58;
      v66.origin.CGFloat x = r1.origin.x;
      v66.origin.CGFloat y = y;
      v66.size.CGFloat width = width;
      v66.size.CGFloat height = height;
      if (CGRectEqualToRect(v63, v66))
      {
        CGFloat height = v47;
        CGFloat width = v45;
        CGFloat y = v43;
      }
      else
      {
        if (!_doesElementFrame(a2, x, v43, v45, v47, r1.origin.x, y, width, height)) {
          goto LABEL_34;
        }
        v64.origin.CGFloat x = r1.origin.x;
        v64.origin.CGFloat y = y;
        v64.size.CGFloat width = width;
        v64.size.CGFloat height = height;
        v67.origin.CGFloat x = x;
        v67.origin.CGFloat y = v43;
        v67.size.CGFloat width = v45;
        v67.size.CGFloat height = v47;
        CGRect v65 = CGRectUnion(v64, v67);
        CGFloat x = v65.origin.x;
        CGFloat y = v65.origin.y;
        CGFloat width = v65.size.width;
        CGFloat height = v65.size.height;
      }
      if ((~v23 & 2) == 0) {
        double v10 = v10 + 1.0;
      }
      char v48 = [v11 stringWithAXAttribute:2001];
      if (([v48 isEqualToString:@"•"] & 1) != 0
        || [v48 isEqualToString:@"-"])
      {
        [v48 length];
      }
      else
      {
        double v56 = v56 + 1.0;
        if ([v48 length]) {
          [v54 addObject:v11];
        }
      }
      id v12 = v11;

      long long v49 = [v12 nextElementsWithCount:1];
      int v11 = [v49 firstObject];

      if (!v11)
      {
        int v13 = v12;
        break;
      }
    }
    id v3 = v54;
    double v50 = v56;
  }
  else
  {
    int v13 = 0;
    int v11 = 0;
    double v50 = 0.0;
    double v10 = 0.0;
  }
  if (v10 / v50 < 0.75 && [v3 count])
  {
    id v51 = v3;
  }
  else
  {
    *(void *)&r1.origin.CGFloat y = v4;
    id v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&r1.origin.y count:1];
  }
  long long v52 = v51;

  return v52;
}

void AXSetProcessWantsMLElementForBundle(uint64_t a1, void *a2)
{
  uint64_t v3 = AXSetProcessWantsMLElementForBundle_onceToken;
  id v4 = a2;
  if (v3 != -1) {
    dispatch_once(&AXSetProcessWantsMLElementForBundle_onceToken, &__block_literal_global_4);
  }
  id v5 = [NSNumber numberWithBool:a1];
  [(id)MLElementRequests setObject:v5 forKeyedSubscript:v4];
}

uint64_t __AXSetProcessWantsMLElementForBundle_block_invoke()
{
  MLElementRequests = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

BOOL AXProcessEverWantsMLElements()
{
  return [(id)MLElementRequests count] != 0;
}

uint64_t AXProcessWantsMLElementsForBundle(uint64_t a1)
{
  id v1 = [(id)MLElementRequests objectForKeyedSubscript:a1];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

uint64_t AXProcessesWantMLElements()
{
  return [(id)MLElementRequests allKeys];
}

uint64_t _AXPidFromAuditToken(uint64_t a1)
{
  if (a1) {
    return (a1 + 20);
  }
  else {
    return 0;
  }
}

id AXConvertIncomingValue(void *a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (!v1) {
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_9;
  }
  uint64_t v2 = self;
  if (objc_opt_isKindOfClass()) {
    goto LABEL_8;
  }
  uint64_t v3 = self;
  if (objc_opt_isKindOfClass())
  {
LABEL_7:

LABEL_8:
LABEL_9:
    id v5 = v1;
LABEL_10:
    CFAllocatorRef v6 = v5;
    goto LABEL_11;
  }
  id v4 = self;
  if (objc_opt_isKindOfClass())
  {

    goto LABEL_7;
  }
  uint64_t v8 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    goto LABEL_9;
  }
  double v10 = self;
  char v11 = objc_opt_isKindOfClass();

  if (v11)
  {
    CFAllocatorRef v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v1, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v12 = v1;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          CGFloat v18 = [v12 objectForKey:v17];
          uint64_t v19 = AXConvertIncomingValue(v18);
          if (v19) {
            [v6 setObject:v19 forKey:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v14);
    }
LABEL_36:

    goto LABEL_11;
  }
  int v20 = self;
  char v21 = objc_opt_isKindOfClass();

  if (v21)
  {
    CFAllocatorRef v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v1, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v12 = v1;
    uint64_t v22 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(v12);
          }
          uint64_t v26 = AXConvertIncomingValue(*(void *)(*((void *)&v31 + 1) + 8 * j));
          if (v26) {
            [v6 addObject:v26];
          }
        }
        uint64_t v23 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v23);
    }
    goto LABEL_36;
  }
  CFTypeID v27 = CFGetTypeID(v1);
  if (v27 == AXValueGetTypeID())
  {
    switch(AXValueGetType((AXValueRef)v1))
    {
      case kAXValueTypeCGPoint:
        long long v29 = 0uLL;
        if (!AXValueGetValue((AXValueRef)v1, kAXValueTypeCGPoint, &v29)) {
          goto LABEL_47;
        }
        id v5 = [MEMORY[0x1E4F29238] valueWithPoint:v29];
        goto LABEL_10;
      case kAXValueTypeCGSize:
        long long v29 = 0uLL;
        if (!AXValueGetValue((AXValueRef)v1, kAXValueTypeCGSize, &v29)) {
          goto LABEL_47;
        }
        id v5 = [MEMORY[0x1E4F29238] valueWithSize:v29];
        goto LABEL_10;
      case kAXValueTypeCGRect:
        long long v29 = 0u;
        long long v30 = 0u;
        if (!AXValueGetValue((AXValueRef)v1, kAXValueTypeCGRect, &v29)) {
          goto LABEL_47;
        }
        objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", v29, v30);
        id v5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      case kAXValueTypeCFRange:
        long long v29 = 0uLL;
        CFAllocatorRef v6 = 0;
        if (!AXValueGetValue((AXValueRef)v1, kAXValueTypeCFRange, &v29)
          || (v29 & 0x8000000000000000) != 0
          || (*((void *)&v29 + 1) & 0x8000000000000000) != 0)
        {
          goto LABEL_11;
        }
        objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:");
        id v5 = (id)objc_claimAutoreleasedReturnValue();
        break;
      default:
        goto LABEL_47;
    }
    goto LABEL_10;
  }
  CFTypeID v28 = CFGetTypeID(v1);
  if (v28 == AXUIElementGetTypeID())
  {
    _UIAXElementForAXUIElementRef((uint64_t)v1);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
LABEL_47:
  CFAllocatorRef v6 = 0;
LABEL_11:

  return v6;
}

id AXConvertPidToAXElement(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v2 = [v1 intValue];
    if (v2) {
      uint64_t AppElementWithPid = _AXUIElementCreateAppElementWithPid(v2);
    }
    else {
      uint64_t AppElementWithPid = (uint64_t)AXUIElementCreateSystemWide();
    }
    id v4 = (void *)AppElementWithPid;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

id AXConvertOutgoingValue(uint64_t a1, void *a2)
{
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    id v12 = 0;
    goto LABEL_257;
  }
  id v4 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [[AXAttributedString alloc] initWithCFAttributedString:v4];

    id v4 = v5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 convertAttachmentsWithBlock:&__block_literal_global_13];
  }
  uint64_t v129 = 0;
  int v130 = &v129;
  uint64_t v131 = 0x2050000000;
  CFAllocatorRef v6 = (void *)getBKSHIDEventAuthenticationMessageClass_softClass;
  uint64_t v132 = getBKSHIDEventAuthenticationMessageClass_softClass;
  if (!getBKSHIDEventAuthenticationMessageClass_softClass)
  {
    *(void *)&long long valuePtr = MEMORY[0x1E4F143A8];
    *((void *)&valuePtr + 1) = 3221225472;
    *(void *)&long long v127 = __getBKSHIDEventAuthenticationMessageClass_block_invoke;
    *((void *)&v127 + 1) = &unk_1E6220520;
    mach_msg_timeout_t v128 = &v129;
    __getBKSHIDEventAuthenticationMessageClass_block_invoke((uint64_t)&valuePtr);
    CFAllocatorRef v6 = (void *)v130[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v129, 8);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];

    id v4 = (void *)v8;
  }
  NSClassFromString((NSString *)@"BEAccessibilityTextMarker");
  if (objc_opt_isKindOfClass())
  {
    id v125 = 0;
    uint64_t v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v125];
    id v10 = v125;

    if (v10)
    {
      char v11 = AXLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        AXConvertOutgoingValue_cold_1((uint64_t)v10, v11);
      }
    }
    id v4 = (void *)v9;
  }
  if (a1 > 3001)
  {
    if (a1 > 91500)
    {
      if (a1 > 94499)
      {
        switch(a1)
        {
          case 95217:
          case 95223:
          case 95246:
            goto LABEL_186;
          case 95218:
          case 95219:
          case 95220:
          case 95221:
          case 95228:
          case 95229:
          case 95232:
          case 95235:
          case 95237:
          case 95238:
          case 95239:
          case 95240:
          case 95241:
          case 95242:
          case 95243:
          case 95244:
          case 95245:
          case 95247:
          case 95248:
            goto LABEL_254;
          case 95222:
          case 95225:
          case 95226:
          case 95227:
          case 95230:
          case 95231:
          case 95233:
          case 95234:
          case 95249:
          case 95250:
          case 95251:
          case 95252:
          case 95253:
          case 95254:
          case 95255:
          case 95256:
          case 95258:
            goto LABEL_203;
          case 95224:
            objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
            id v12 = (id)objc_claimAutoreleasedReturnValue();
            long long v123 = 0u;
            long long v124 = 0u;
            long long v121 = 0u;
            long long v122 = 0u;
            id v14 = v4;
            uint64_t v15 = [v14 countByEnumeratingWithState:&v121 objects:v140 count:16];
            if (v15)
            {
              uint64_t v16 = *(void *)v122;
              do
              {
                for (uint64_t i = 0; i != v15; ++i)
                {
                  if (*(void *)v122 != v16) {
                    objc_enumerationMutation(v14);
                  }
                  CGFloat v18 = *(void **)(*((void *)&v121 + 1) + 8 * i);
                  long long valuePtr = 0u;
                  long long v127 = 0u;
                  [v18 rectValue];
                  *(void *)&long long valuePtr = v19;
                  *((void *)&valuePtr + 1) = v20;
                  *(void *)&long long v127 = v21;
                  *((void *)&v127 + 1) = v22;
                  AXValueRef v23 = AXValueCreate(kAXValueTypeCGRect, &valuePtr);
                  [v12 addObject:v23];
                  if (v23) {
                    CFRelease(v23);
                  }
                }
                uint64_t v15 = [v14 countByEnumeratingWithState:&v121 objects:v140 count:16];
              }
              while (v15);
            }

            goto LABEL_256;
          case 95236:
            goto LABEL_173;
          case 95257:
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              float v71 = [MEMORY[0x1E4F1CA48] array];
              v99[0] = MEMORY[0x1E4F143A8];
              v99[1] = 3221225472;
              v99[2] = __AXConvertOutgoingValue_block_invoke_2;
              v99[3] = &unk_1E62204F8;
              uint64_t v101 = 95257;
              id v72 = v71;
              id v100 = v72;
              [v4 enumerateObjectsUsingBlock:v99];
              if ([v72 count]) {
                id v12 = v72;
              }
              else {
                id v12 = 0;
              }

              goto LABEL_256;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v12 = [MEMORY[0x1E4F1CA60] dictionary];
              long long v97 = 0u;
              long long v98 = 0u;
              long long v95 = 0u;
              long long v96 = 0u;
              id v73 = v4;
              uint64_t v74 = [v73 countByEnumeratingWithState:&v95 objects:v135 count:16];
              if (v74)
              {
                uint64_t v75 = *(void *)v96;
                do
                {
                  for (uint64_t j = 0; j != v74; ++j)
                  {
                    if (*(void *)v96 != v75) {
                      objc_enumerationMutation(v73);
                    }
                    uint64_t v77 = *(void *)(*((void *)&v95 + 1) + 8 * j);
                    v78 = [v73 objectForKey:v77];
                    v79 = AXConvertOutgoingValue(95257);

                    if (v79) {
                      [v12 setObject:v79 forKey:v77];
                    }
                  }
                  uint64_t v74 = [v73 countByEnumeratingWithState:&v95 objects:v135 count:16];
                }
                while (v74);
              }

              goto LABEL_256;
            }
            if (v4)
            {
              CFTypeID v84 = CFGetTypeID(v4);
              if (v84 == AXUIElementGetTypeID()) {
                goto LABEL_254;
              }
              CFTypeID v85 = CFGetTypeID(v4);
              if (v85 == AXValueGetTypeID()) {
                goto LABEL_254;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                goto LABEL_254;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                goto LABEL_254;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                goto LABEL_254;
              }
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              goto LABEL_224;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass() & 1) == 0 || ([v4 onClientSide]) {
              goto LABEL_265;
            }
            goto LABEL_28;
          default:
            switch(a1)
            {
              case 95001:
              case 95005:
                goto LABEL_203;
              case 95002:
                goto LABEL_254;
              case 95003:
                goto LABEL_173;
              case 95004:
                goto LABEL_169;
              default:
                if (a1 == 94500) {
                  goto LABEL_203;
                }
                goto LABEL_254;
            }
        }
      }
      if (a1 <= 92600)
      {
        switch(a1)
        {
          case 91501:
          case 91503:
          case 91504:
            goto LABEL_169;
          case 91502:
          case 91506:
          case 91507:
          case 91508:
          case 91509:
            goto LABEL_254;
          case 91505:
          case 91511:
            goto LABEL_247;
          case 91510:
            goto LABEL_151;
          case 91512:
          case 91513:
            goto LABEL_203;
          default:
            JUMPOUT(0);
        }
      }
      if (a1 <= 92703)
      {
        if (a1 != 92601 && a1 != 92701 && a1 != 92703) {
          goto LABEL_254;
        }
        goto LABEL_247;
      }
      if ((unint64_t)(a1 - 94000) > 0x11) {
        goto LABEL_79;
      }
      if (((1 << (a1 - 48)) & 0x31200) == 0)
      {
        if (a1 != 94000)
        {
LABEL_79:
          if (a1 != 92704)
          {
            if (a1 == 94100)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v12 = [MEMORY[0x1E4F1CA60] dictionary];
                long long v89 = 0u;
                long long v90 = 0u;
                long long v87 = 0u;
                long long v88 = 0u;
                id v30 = v4;
                uint64_t v31 = [v30 countByEnumeratingWithState:&v87 objects:v133 count:16];
                if (v31)
                {
                  uint64_t v32 = *(void *)v88;
                  do
                  {
                    for (uint64_t k = 0; k != v31; ++k)
                    {
                      if (*(void *)v88 != v32) {
                        objc_enumerationMutation(v30);
                      }
                      uint64_t v34 = *(void *)(*((void *)&v87 + 1) + 8 * k);
                      long long v35 = objc_msgSend(v30, "objectForKey:", v34, (void)v87);
                      long long v36 = AXConvertOutgoingValue(94100);

                      if (v36) {
                        [v12 setObject:v36 forKey:v34];
                      }
                    }
                    uint64_t v31 = [v30 countByEnumeratingWithState:&v87 objects:v133 count:16];
                  }
                  while (v31);
                }

                goto LABEL_256;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_247;
              }
            }
LABEL_254:
            id v13 = v4;
            goto LABEL_255;
          }
          goto LABEL_201;
        }
LABEL_247:
        long long valuePtr = 0u;
        long long v127 = 0u;
        [v4 rectValue];
        *(void *)&long long valuePtr = v80;
        *((void *)&valuePtr + 1) = v81;
        *(void *)&long long v127 = v82;
        *((void *)&v127 + 1) = v83;
        id v13 = AXValueCreate(kAXValueTypeCGRect, &valuePtr);
        goto LABEL_255;
      }
LABEL_201:
      long long valuePtr = 0uLL;
      *(void *)&long long valuePtr = [v4 rangeValue];
      *((void *)&valuePtr + 1) = v59;
      id v13 = AXValueCreate(kAXValueTypeCFRange, &valuePtr);
      goto LABEL_255;
    }
    if (a1 <= 4004)
    {
      switch(a1)
      {
        case 3002:
        case 3004:
        case 3011:
        case 3012:
        case 3023:
        case 3024:
        case 3027:
        case 3037:
        case 3043:
        case 3049:
        case 3054:
        case 3055:
        case 3056:
        case 3057:
        case 3060:
        case 3061:
          goto LABEL_203;
        case 3003:
        case 3005:
        case 3006:
        case 3007:
        case 3008:
        case 3009:
        case 3010:
        case 3013:
        case 3014:
        case 3016:
        case 3017:
        case 3018:
        case 3019:
        case 3020:
        case 3021:
        case 3026:
        case 3028:
        case 3030:
        case 3033:
        case 3034:
        case 3035:
        case 3036:
        case 3038:
        case 3039:
        case 3040:
        case 3041:
        case 3042:
        case 3044:
        case 3045:
        case 3047:
        case 3048:
        case 3050:
        case 3052:
        case 3053:
        case 3059:
          goto LABEL_254;
        case 3015:
        case 3022:
        case 3025:
        case 3029:
        case 3031:
        case 3032:
          goto LABEL_186;
        case 3046:
        case 3051:
          goto LABEL_173;
        case 3058:
          goto LABEL_247;
        case 3062:
LABEL_28:
          id v13 = (id)_AXCreateAXUIElementWithElementUsingLocalRemoteElement(v4);
          goto LABEL_255;
        default:
          if (a1 == 3070) {
            goto LABEL_186;
          }
          if (a1 == 3073) {
            goto LABEL_173;
          }
          goto LABEL_254;
      }
    }
    if (a1 <= 5039)
    {
      switch(a1)
      {
        case 5001:
        case 5016:
        case 5017:
          goto LABEL_173;
        case 5002:
        case 5010:
        case 5024:
          goto LABEL_203;
        case 5003:
        case 5004:
        case 5005:
        case 5006:
        case 5009:
        case 5011:
        case 5012:
        case 5013:
        case 5014:
        case 5015:
        case 5018:
        case 5019:
        case 5020:
        case 5021:
        case 5022:
        case 5023:
          goto LABEL_254;
        case 5007:
        case 5008:
        case 5026:
        case 5027:
          goto LABEL_169;
        case 5025:
          goto LABEL_186;
        default:
          if (a1 == 4005) {
            goto LABEL_201;
          }
          goto LABEL_254;
      }
    }
    if (a1 <= 8999)
    {
      if ((unint64_t)(a1 - 5040) > 0x20) {
        goto LABEL_254;
      }
      if (((1 << (a1 + 80)) & 0x220C011) == 0)
      {
        if (a1 != 5064)
        {
          if (a1 != 5072) {
            goto LABEL_254;
          }
          goto LABEL_170;
        }
        goto LABEL_169;
      }
      goto LABEL_203;
    }
    if (a1 <= 12016)
    {
      if (a1 == 9000) {
        goto LABEL_247;
      }
      if (a1 != 12002) {
        goto LABEL_254;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 count])
      {
        objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        id v39 = v4;
        uint64_t v40 = [v39 countByEnumeratingWithState:&v91 objects:v134 count:16];
        if (v40)
        {
          uint64_t v41 = *(void *)v92;
          do
          {
            for (uint64_t m = 0; m != v40; ++m)
            {
              if (*(void *)v92 != v41) {
                objc_enumerationMutation(v39);
              }
              CGFloat v43 = (const void *)_AXCreateAXUIElementWithElement(*(void **)(*((void *)&v91 + 1) + 8 * m));
              [v12 addObject:v43];
              if (v43) {
                CFRelease(v43);
              }
            }
            uint64_t v40 = [v39 countByEnumeratingWithState:&v91 objects:v134 count:16];
          }
          while (v40);
        }

        goto LABEL_256;
      }
      goto LABEL_234;
    }
    if (a1 == 12017) {
      goto LABEL_203;
    }
    if (a1 != 14000) {
      goto LABEL_254;
    }
LABEL_186:
    id v12 = [MEMORY[0x1E4F1CA48] array];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      id v54 = v4;
      uint64_t v55 = [v54 countByEnumeratingWithState:&v109 objects:v137 count:16];
      if (v55)
      {
        uint64_t v56 = *(void *)v110;
        do
        {
          for (uint64_t n = 0; n != v55; ++n)
          {
            if (*(void *)v110 != v56) {
              objc_enumerationMutation(v54);
            }
            CGFloat v58 = (void *)_AXCreateAXUIElementWithElement(*(void **)(*((void *)&v109 + 1) + 8 * n));
            if (v58) {
              [v12 addObject:v58];
            }
          }
          uint64_t v55 = [v54 countByEnumeratingWithState:&v109 objects:v137 count:16];
        }
        while (v55);
      }
    }
    goto LABEL_256;
  }
  if (a1 <= 2091)
  {
    if (a1 > 2002)
    {
      if (a1 <= 2049)
      {
        switch(a1)
        {
          case 2003:
            goto LABEL_247;
          case 2004:
          case 2006:
          case 2008:
          case 2009:
          case 2010:
          case 2013:
          case 2016:
          case 2018:
          case 2019:
          case 2020:
          case 2021:
          case 2022:
          case 2023:
          case 2025:
          case 2029:
          case 2030:
          case 2031:
          case 2032:
          case 2034:
          case 2035:
            goto LABEL_254;
          case 2005:
          case 2027:
          case 2028:
            goto LABEL_201;
          case 2007:
            goto LABEL_169;
          case 2011:
          case 2012:
          case 2014:
          case 2015:
          case 2017:
          case 2024:
          case 2026:
          case 2033:
          case 2036:
            goto LABEL_203;
          default:
            if (a1 != 2042) {
              goto LABEL_254;
            }
            NSClassFromString((NSString *)@"UIBezierPath");
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_234;
            }
            id v13 = [v4 CGPath];
            break;
        }
        goto LABEL_255;
      }
      if (a1 > 2065)
      {
        switch(a1)
        {
          case 2076:
          case 2080:
            goto LABEL_203;
          case 2077:
          case 2079:
          case 2081:
          case 2082:
          case 2083:
            goto LABEL_254;
          case 2078:
            goto LABEL_201;
          case 2084:
            goto LABEL_173;
          default:
            if (a1 == 2066) {
              goto LABEL_203;
            }
            if (a1 == 2070) {
              goto LABEL_169;
            }
            goto LABEL_254;
        }
      }
      if (a1 == 2050 || a1 == 2057) {
        goto LABEL_247;
      }
      if (a1 != 2062) {
        goto LABEL_254;
      }
      goto LABEL_169;
    }
    if (a1 <= 1099)
    {
      if ((unint64_t)(a1 - 1000) > 0xB) {
        goto LABEL_254;
      }
      uint64_t v37 = 1 << (a1 + 24);
      uint64_t v38 = 3811;
      goto LABEL_150;
    }
    if (a1 <= 1511)
    {
      char v24 = a1 - 76;
      if ((unint64_t)(a1 - 1100) > 7) {
        goto LABEL_254;
      }
      if (((1 << v24) & 0x2D) != 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = [MEMORY[0x1E4F1CA48] array];
          long long v119 = 0u;
          long long v120 = 0u;
          long long v117 = 0u;
          long long v118 = 0u;
          id v25 = v4;
          uint64_t v26 = [v25 countByEnumeratingWithState:&v117 objects:v139 count:16];
          if (v26)
          {
            uint64_t v27 = *(void *)v118;
            do
            {
              for (iuint64_t i = 0; ii != v26; ++ii)
              {
                if (*(void *)v118 != v27) {
                  objc_enumerationMutation(v25);
                }
                long long v29 = AXConvertPidToAXElement(*(void **)(*((void *)&v117 + 1) + 8 * ii));
                [v12 addObject:v29];
              }
              uint64_t v26 = [v25 countByEnumeratingWithState:&v117 objects:v139 count:16];
            }
            while (v26);
          }

          goto LABEL_256;
        }
        goto LABEL_234;
      }
      uint64_t v37 = 1 << v24;
      uint64_t v38 = 146;
LABEL_150:
      if ((v37 & v38) == 0) {
        goto LABEL_254;
      }
LABEL_151:
      AXConvertPidToAXElement(v4);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_255:
      id v12 = v13;
      goto LABEL_256;
    }
    if (a1 != 1512)
    {
      if (a1 != 1513 && a1 != 1990) {
        goto LABEL_254;
      }
      goto LABEL_203;
    }
LABEL_169:
    long long valuePtr = 0uLL;
    [v4 pointValue];
    *(void *)&long long valuePtr = v44;
    *((void *)&valuePtr + 1) = v45;
    id v13 = AXValueCreate(kAXValueTypeCGPoint, &valuePtr);
    goto LABEL_255;
  }
  if (a1 <= 2166)
  {
    if (a1 > 2123)
    {
      if (a1 <= 2141)
      {
        switch(a1)
        {
          case 2124:
            goto LABEL_201;
          case 2125:
          case 2132:
            goto LABEL_203;
          case 2126:
            goto LABEL_173;
          case 2130:
            goto LABEL_247;
          default:
            goto LABEL_254;
        }
      }
      if ((unint64_t)(a1 - 2154) >= 3 && (unint64_t)(a1 - 2142) >= 2)
      {
        if (a1 != 2149) {
          goto LABEL_254;
        }
        goto LABEL_247;
      }
      goto LABEL_203;
    }
    if (a1 > 2103)
    {
      if ((unint64_t)(a1 - 2106) >= 4 && a1 != 2104 && a1 != 2113) {
        goto LABEL_254;
      }
      goto LABEL_203;
    }
    if (a1 > 2095)
    {
      if (a1 != 2096 && a1 != 2099) {
        goto LABEL_254;
      }
      goto LABEL_203;
    }
    if (a1 == 2092) {
      goto LABEL_203;
    }
    if (a1 != 2095) {
      goto LABEL_254;
    }
    goto LABEL_186;
  }
  if (a1 > 2215)
  {
    if (a1 > 2599)
    {
      if (a1 <= 2709)
      {
        if (a1 != 2600)
        {
          if (a1 != 2709) {
            goto LABEL_254;
          }
          goto LABEL_247;
        }
      }
      else if ((unint64_t)(a1 - 2710) >= 2 && a1 != 2714)
      {
        goto LABEL_254;
      }
      goto LABEL_203;
    }
    if (a1 <= 2309)
    {
      if (a1 != 2216)
      {
        if (a1 != 2236) {
          goto LABEL_254;
        }
        goto LABEL_247;
      }
      goto LABEL_201;
    }
    if ((unint64_t)(a1 - 2310) <= 3 && a1 != 2311)
    {
LABEL_203:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        CGFloat v60 = [MEMORY[0x1E4F1CA48] array];
        v106[0] = MEMORY[0x1E4F143A8];
        v106[1] = 3221225472;
        v106[2] = __AXConvertOutgoingValue_block_invoke_19;
        v106[3] = &unk_1E62204F8;
        uint64_t v108 = a1;
        id v61 = v60;
        id v107 = v61;
        [v4 enumerateObjectsUsingBlock:v106];
        if ([v61 count]) {
          id v12 = v61;
        }
        else {
          id v12 = 0;
        }

        goto LABEL_256;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        id v62 = v4;
        uint64_t v63 = [v62 countByEnumeratingWithState:&v102 objects:v136 count:16];
        if (v63)
        {
          uint64_t v64 = *(void *)v103;
          do
          {
            for (juint64_t j = 0; jj != v63; ++jj)
            {
              if (*(void *)v103 != v64) {
                objc_enumerationMutation(v62);
              }
              uint64_t v66 = *(void *)(*((void *)&v102 + 1) + 8 * jj);
              CGRect v67 = [v62 objectForKey:v66];
              BOOL v68 = AXConvertOutgoingValue(a1);

              if (v68) {
                [v12 setObject:v68 forKey:v66];
              }
            }
            uint64_t v63 = [v62 countByEnumeratingWithState:&v102 objects:v136 count:16];
          }
          while (v63);
        }

        goto LABEL_256;
      }
      if (!v4
        || (CFTypeID v69 = CFGetTypeID(v4), v69 != AXUIElementGetTypeID())
        && (CFTypeID v70 = CFGetTypeID(v4), v70 != AXValueGetTypeID())
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
LABEL_224:
          AXUIElementConvertOutgoingType(v4);
          id v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_265:
          id v13 = (id)_AXCreateAXUIElementWithElement(v4);
        }
        goto LABEL_255;
      }
      goto LABEL_254;
    }
    if (a1 != 2502) {
      goto LABEL_254;
    }
    goto LABEL_169;
  }
  if (a1 <= 2182)
  {
    if (a1 > 2180)
    {
      if (a1 == 2181)
      {
LABEL_170:
        long long valuePtr = 0uLL;
        [v4 sizeValue];
        *(void *)&long long valuePtr = v46;
        *((void *)&valuePtr + 1) = v47;
        id v13 = AXValueCreate(kAXValueTypeCGSize, &valuePtr);
        goto LABEL_255;
      }
      goto LABEL_169;
    }
    if (a1 != 2167)
    {
      if (a1 != 2171) {
        goto LABEL_254;
      }
      goto LABEL_247;
    }
    goto LABEL_203;
  }
  if (a1 > 2196)
  {
    if (a1 != 2197 && a1 != 2202 && a1 != 2208) {
      goto LABEL_254;
    }
    goto LABEL_203;
  }
  if ((unint64_t)(a1 - 2183) < 2) {
    goto LABEL_203;
  }
  if (a1 != 2196) {
    goto LABEL_254;
  }
LABEL_173:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = [MEMORY[0x1E4F1CA48] array];
    long long v115 = 0u;
    long long v116 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    id v48 = v4;
    uint64_t v49 = [v48 countByEnumeratingWithState:&v113 objects:v138 count:16];
    if (v49)
    {
      uint64_t v50 = *(void *)v114;
      do
      {
        for (kuint64_t k = 0; kk != v49; ++kk)
        {
          if (*(void *)v114 != v50) {
            objc_enumerationMutation(v48);
          }
          long long v52 = *(void **)(*((void *)&v113 + 1) + 8 * kk);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v12 addObject:v52];
          }
          else
          {
            long long v53 = (const void *)_AXCreateAXUIElementWithElement(v52);
            if (v53)
            {
              [v12 addObject:v53];
              CFRelease(v53);
            }
          }
        }
        uint64_t v49 = [v48 countByEnumeratingWithState:&v113 objects:v138 count:16];
      }
      while (v49);
    }

    goto LABEL_256;
  }
LABEL_234:
  id v12 = 0;
LABEL_256:

LABEL_257:
  return v12;
}

void sub_1BA66E830(_Unwind_Exception *a1)
{
}

CFTypeRef __AXConvertOutgoingValue_block_invoke(uint64_t a1, void *a2)
{
  int v2 = (const void *)_AXCreateAXUIElementWithElement(a2);
  return CFAutorelease(v2);
}

uint64_t __AXConvertOutgoingValue_block_invoke_19(uint64_t a1)
{
  uint64_t v2 = AXConvertOutgoingValue(*(void *)(a1 + 40));
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }
  return MEMORY[0x1F41817F8]();
}

uint64_t __AXConvertOutgoingValue_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = AXConvertOutgoingValue(*(void *)(a1 + 40));
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }
  return MEMORY[0x1F41817F8]();
}

uint64_t AXRuntimeIsAppleTV()
{
  return 0;
}

Class __getBKSHIDEventAuthenticationMessageClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!BackBoardServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    void v3[2] = (void *)3221225472;
    v3[3] = __BackBoardServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E6220540;
    uint64_t v5 = 0;
    BackBoardServicesLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  if (!BackBoardServicesLibraryCore_frameworkLibrary) {
    __getBKSHIDEventAuthenticationMessageClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("BKSHIDEventAuthenticationMessage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBKSHIDEventAuthenticationMessageClass_block_invoke_cold_2();
  }
  getBKSHIDEventAuthenticationMessageClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __BackBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BackBoardServicesLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

uint64_t _accessibilityNotificationCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  return objc_msgSend(a5, "_didObserveNotification:notificationData:");
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

uint64_t AXSerializeCFType(void *a1, uint64_t a2, int a3, void **a4, void *a5, size_t *a6)
{
  *a5 = 0;
  SerializeMethodForType = getSerializeMethodForType(a1);
  if (!SerializeMethodForType) {
    return 4294942095;
  }
  id v12 = SerializeMethodForType;
  int v13 = a3 << 12;
  if (!a3) {
    int v13 = 81920;
  }
  size_t v14 = v13;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  size_t v22 = 0;
  uint64_t v23 = v13;
  uint64_t v15 = (char *)*a4;
  if (*a4)
  {
    uint64_t v20 = *a4;
    size_t v14 = *a6;
  }
  else
  {
    uint64_t v15 = (char *)mmap(0, v13, 3, 4098, -1, 0);
    uint64_t v20 = v15;
    if (v15 == (char *)-1) {
      return 4294942096;
    }
  }
  size_t v22 = v14;
  CFTypeRef cf = 0;
  *(_DWORD *)uint64_t v15 = 1634036833;
  uint64_t v21 = v15 + 4;
  uint64_t v16 = v12(a1, (uint64_t)&v20);
  if (v16 && !*a4)
  {
    munmap(v20, v22);
    *a4 = 0;
    *a6 = 0;
  }
  else
  {
    uint64_t v17 = v20;
    CGFloat v18 = v21;
    *a4 = v20;
    *a6 = v22;
    *a5 = v18 - v17;
  }
  if (cf) {
    CFRelease(cf);
  }
  return v16;
}

uint64_t (*getSerializeMethodForType(const void *a1))(void *a1, uint64_t a2)
{
  CFTypeID v1 = CFGetTypeID(a1);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFTypeID TypeID = CFUUIDGetTypeID();
  }
  else
  {
    NSClassFromString((NSString *)@"UIFont");
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    CFTypeID TypeID = CTFontGetTypeID();
  }
  CFTypeID v1 = TypeID;
LABEL_6:
  if (getSerializeMethodForType_onceToken != -1) {
    dispatch_once(&getSerializeMethodForType_onceToken, &__block_literal_global_5);
  }
  if (AXIsAXAttributedString()) {
    return cfAttributedStringSerialize;
  }
  CFDictionaryRef v4 = (const __CFDictionary *)getSerializeMethodForType_SerializeLookup;
  uint64_t v5 = (const void *)[NSNumber numberWithUnsignedLong:v1];
  return (uint64_t (*)(void *, uint64_t))CFDictionaryGetValue(v4, v5);
}

uint64_t SerializeCFType(void *a1, void **a2, size_t *a3)
{
  *a3 = 0;
  *a2 = 0;
  return AXSerializeCFType(a1, (uint64_t)a2, 0, a2, &v4, a3);
}

uint64_t AXUnserializeCFType(uint64_t a1, uint64_t a2, unsigned int *a3, unint64_t a4, void *a5)
{
  if (a4 > 7)
  {
    *a5 = 0;
    unsigned int v14 = *a3;
    BOOL v15 = *a3 != 1634036833 && *a3 != 1870095726;
    unsigned int v17 = a3[1];
    unsigned int v16 = v17;
    uint64_t v20 = a3 + 1;
    unsigned int v19 = v17;
    if (v14 != 1634036833 && v14 != 1870095726)
    {
      unsigned int v16 = bswap32(v19);
      unsigned int v14 = bswap32(v14);
    }
    if (v16 <= 0xF) {
      return ((uint64_t (*)(uint64_t, unsigned int **, unint64_t, void *, BOOL, BOOL))sUnserializeFunctions[v16])(a1, &v20, a4 - 4, a5, v15, v14 == 1870095726);
    }
    else {
      return ((uint64_t (*)(uint64_t, unsigned int **, unint64_t, void *, BOOL, BOOL))bogusUnserialize)(a1, &v20, a4 - 4, a5, v15, v14 == 1870095726);
    }
  }
  else
  {
    uint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      AXUnserializeCFType_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    return 4294942095;
  }
}

void _logAndReturn(uint64_t a1)
{
  uint64_t v2 = AXRuntimeLogSerialization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    _logAndReturn_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }
}

uint64_t UnserializeCFType(unsigned int *a1, unint64_t a2, void *a3)
{
  return AXUnserializeCFType(0, a2, a1, a2, a3);
}

void __getSerializeMethodForType_block_invoke()
{
  CFMutableSetRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], 0);
  getSerializeMethodForType_SerializeLookup = (uint64_t)Mutable;
  CFTypeID v1 = (const void *)[NSNumber numberWithUnsignedLong:CFStringGetTypeID()];
  CFDictionarySetValue(Mutable, v1, cfStringSerialize);
  uint64_t v2 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  uint64_t v3 = (const void *)[NSNumber numberWithUnsignedLong:CFNumberGetTypeID()];
  CFDictionarySetValue(v2, v3, cfNumberSerialize);
  uint64_t v4 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  uint64_t v5 = (const void *)[NSNumber numberWithUnsignedLong:CFBooleanGetTypeID()];
  CFDictionarySetValue(v4, v5, cfBooleanSerialize);
  uint64_t v6 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  uint64_t v7 = (const void *)[NSNumber numberWithUnsignedLong:AXUIElementGetTypeID()];
  CFDictionarySetValue(v6, v7, axUIElementSerialize);
  uint64_t v8 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  uint64_t v9 = (const void *)[NSNumber numberWithUnsignedLong:AXValueGetTypeID()];
  CFDictionarySetValue(v8, v9, axValueSerialize);
  uint64_t v10 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  uint64_t v11 = (const void *)[NSNumber numberWithUnsignedLong:CFArrayGetTypeID()];
  CFDictionarySetValue(v10, v11, cfArraySerialize);
  uint64_t v12 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  int v13 = (const void *)[NSNumber numberWithUnsignedLong:CFDictionaryGetTypeID()];
  CFDictionarySetValue(v12, v13, cfDictionarySerialize);
  unsigned int v14 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  BOOL v15 = (const void *)[NSNumber numberWithUnsignedLong:CFDataGetTypeID()];
  CFDictionarySetValue(v14, v15, cfDataSerialize);
  unsigned int v16 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  unsigned int v17 = (const void *)[NSNumber numberWithUnsignedLong:CFDateGetTypeID()];
  CFDictionarySetValue(v16, v17, cfDateSerialize);
  CGFloat v18 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  unsigned int v19 = (const void *)[NSNumber numberWithUnsignedLong:CFURLGetTypeID()];
  CFDictionarySetValue(v18, v19, cfURLSerialize);
  uint64_t v20 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  uint64_t v21 = (const void *)[NSNumber numberWithUnsignedLong:CFUUIDGetTypeID()];
  CFDictionarySetValue(v20, v21, cfUUIDSerialize);
  size_t v22 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  uint64_t v23 = (const void *)[NSNumber numberWithUnsignedLong:CFNullGetTypeID()];
  CFDictionarySetValue(v22, v23, cfNullSerialize);
  char v24 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  id v25 = (const void *)[NSNumber numberWithUnsignedLong:CFAttributedStringGetTypeID()];
  CFDictionarySetValue(v24, v25, cfAttributedStringSerialize);
  uint64_t v26 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  uint64_t v27 = (const void *)[NSNumber numberWithUnsignedLong:CGColorGetTypeID()];
  CFDictionarySetValue(v26, v27, cgColorSerialize);
  CFTypeID v28 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  long long v29 = (const void *)[NSNumber numberWithUnsignedLong:CGPathGetTypeID()];
  CFDictionarySetValue(v28, v29, cgPathSerialize);
  id v30 = (__CFDictionary *)getSerializeMethodForType_SerializeLookup;
  uint64_t v31 = (const void *)[NSNumber numberWithUnsignedLong:CTFontGetTypeID()];
  CFDictionarySetValue(v30, v31, ctFontSerialize);
}

uint64_t cfStringSerialize(const __CFString *a1, vm_address_t *a2)
{
  CFIndex Length = CFStringGetLength(a1);
  if (!reserveSpace(a2, 2 * Length + 12))
  {
    vm_address_t v5 = a2[1];
    *(_DWORD *)vm_address_t v5 = 0;
    *(void *)(v5 + 4) = Length;
    uint64_t v6 = (UniChar *)(a2[1] + 12);
    a2[1] = (vm_address_t)v6;
    v8.locatiouint64_t n = 0;
    v8.unsigned int length = Length;
    CFStringGetCharacters(a1, v8, v6);
    a2[1] += 2 * Length;
  }
  return 0;
}

uint64_t cfNumberSerialize(const __CFNumber *a1, vm_address_t *a2)
{
  unsigned int Type = CFNumberGetType(a1);
  CFIndex ByteSize = CFNumberGetByteSize(a1);
  uint64_t result = reserveSpace(a2, ByteSize + 16);
  if (!result)
  {
    vm_address_t v7 = a2[1];
    *(_DWORD *)vm_address_t v7 = 1;
    *(_DWORD *)(v7 + 4) = Type;
    *(void *)(v7 + _Block_object_dispose(&STACK[0x2A0], 8) = ByteSize;
    CFRange v8 = (void *)(a2[1] + 16);
    a2[1] = (vm_address_t)v8;
    if (CFNumberGetValue(a1, (CFNumberType)Type, v8))
    {
      uint64_t result = 0;
      a2[1] += ByteSize;
    }
    else
    {
      return 4294942096;
    }
  }
  return result;
}

uint64_t cfBooleanSerialize(const __CFBoolean *a1, vm_address_t *a2)
{
  Boolean Value = CFBooleanGetValue(a1);
  uint64_t result = reserveSpace(a2, 5);
  if (!result)
  {
    vm_address_t v5 = a2[1];
    *(_DWORD *)vm_address_t v5 = 2;
    *(unsigned char *)(v5 + 4) = Value;
    a2[1] += 5;
  }
  return result;
}

__n128 axUIElementSerialize(uint64_t a1, vm_address_t *a2)
{
  int v3 = *(_DWORD *)(a1 + 16);
  __n128 v6 = *(__n128 *)(a1 + 20);
  if (!reserveSpace(a2, 24))
  {
    vm_address_t v5 = a2[1];
    *(_DWORD *)vm_address_t v5 = 10;
    *(_DWORD *)(v5 + 4) = v3;
    __n128 result = v6;
    *(__n128 *)(v5 + _Block_object_dispose(&STACK[0x2A0], 8) = v6;
    a2[1] += 24;
  }
  return result;
}

uint64_t axValueSerialize(_DWORD *a1, vm_address_t *a2)
{
  int v5 = a1[4];
  size_t v4 = a1[5];
  uint64_t v6 = reserveSpace(a2, v4 + 12);
  if (!v6)
  {
    vm_address_t v7 = (_DWORD *)a2[1];
    _DWORD *v7 = 11;
    v7[1] = v5;
    v7[2] = v4;
    CFRange v8 = (void *)(a2[1] + 12);
    a2[1] = (vm_address_t)v8;
    memmove(v8, a1 + 6, v4);
    a2[1] += v4;
  }
  return v6;
}

uint64_t cfArraySerialize(const __CFArray *a1, uint64_t a2)
{
  uint64_t Count = CFArrayGetCount(a1);
  CFDictionaryRef v5 = *(const __CFDictionary **)(a2 + 32);
  if (v5)
  {
    if (CFDictionaryGetValue(v5, a1)) {
      return 4294942095;
    }
    CFMutableSetRef Mutable = *(__CFDictionary **)(a2 + 32);
  }
  else
  {
    CFMutableSetRef Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    *(void *)(a2 + 32) = Mutable;
  }
  CFDictionarySetValue(Mutable, a1, (const void *)1);
  uint64_t v6 = reserveSpace((vm_address_t *)a2, 12);
  if (!v6)
  {
    uint64_t v8 = *(void *)(a2 + 8);
    *(_DWORD *)uint64_t v8 = 3;
    *(void *)(v8 + 4) = Count;
    *(void *)(a2 + 8) += 12;
    if (Count < 1)
    {
      uint64_t v6 = 0;
    }
    else
    {
      v10[0] = 0;
      v10[1] = a2;
      v11.locatiouint64_t n = 0;
      v11.unsigned int length = Count;
      CFArrayApplyFunction(a1, v11, (CFArrayApplierFunction)serializeArrayApplier, v10);
      uint64_t v6 = LODWORD(v10[0]);
    }
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a2 + 32), a1);
  }
  return v6;
}

uint64_t cfDictionarySerialize(const __CFDictionary *a1, uint64_t a2)
{
  CFIndex Count = CFDictionaryGetCount(a1);
  CFDictionaryRef v5 = *(const __CFDictionary **)(a2 + 32);
  if (v5)
  {
    if (CFDictionaryGetValue(v5, a1)) {
      return 4294942095;
    }
    CFMutableSetRef Mutable = *(__CFDictionary **)(a2 + 32);
  }
  else
  {
    CFMutableSetRef Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    *(void *)(a2 + 32) = Mutable;
  }
  CFDictionarySetValue(Mutable, a1, (const void *)1);
  uint64_t v6 = reserveSpace((vm_address_t *)a2, 12);
  if (!v6)
  {
    uint64_t v8 = *(void *)(a2 + 8);
    *(_DWORD *)uint64_t v8 = 4;
    *(void *)(v8 + 4) = Count;
    *(void *)(a2 + 8) += 12;
    if (Count < 1)
    {
      uint64_t v6 = 0;
    }
    else
    {
      v10[0] = 0;
      v10[1] = a2;
      CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)serializeDictApplier, v10);
      uint64_t v6 = LODWORD(v10[0]);
    }
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a2 + 32), a1);
  }
  return v6;
}

uint64_t cfDataSerialize(const __CFData *a1, vm_address_t *a2)
{
  CFIndex Length = CFDataGetLength(a1);
  uint64_t v5 = reserveSpace(a2, Length + 12);
  if (!v5)
  {
    vm_address_t v6 = a2[1];
    *(_DWORD *)vm_address_t v6 = 5;
    *(void *)(v6 + 4) = Length;
    vm_address_t v7 = (UInt8 *)(a2[1] + 12);
    a2[1] = (vm_address_t)v7;
    v9.locatiouint64_t n = 0;
    v9.unsigned int length = Length;
    CFDataGetBytes(a1, v9, v7);
    a2[1] += Length;
  }
  return v5;
}

uint64_t cfDateSerialize(uint64_t a1, vm_address_t *a2)
{
  double v3 = MEMORY[0x1BA9ED130]();
  uint64_t result = reserveSpace(a2, 12);
  if (!result)
  {
    vm_address_t v5 = a2[1];
    *(_DWORD *)vm_address_t v5 = 6;
    *(double *)(v5 + 4) = v3;
    a2[1] += 12;
  }
  return result;
}

uint64_t cfURLSerialize(const __CFURL *a1, vm_address_t *a2)
{
  CFURLRef v4 = CFURLGetBaseURL(a1);
  if (v4) {
    CFStringRef v5 = CFURLGetString(v4);
  }
  else {
    CFStringRef v5 = 0;
  }
  uint64_t v6 = reserveSpace(a2, 5);
  if (!v6)
  {
    if (v5) {
      char v7 = 2;
    }
    else {
      char v7 = 1;
    }
    vm_address_t v8 = a2[1];
    *(_DWORD *)vm_address_t v8 = 7;
    *(unsigned char *)(v8 + 4) = v7;
    a2[1] += 5;
    CFStringRef v9 = CFURLGetString(a1);
    cfStringSerialize(v9, a2);
    if (v5) {
      cfStringSerialize(v5, a2);
    }
  }
  return v6;
}

uint64_t cfUUIDSerialize(void *a1, uint64_t a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFStringRef v4 = (const __CFString *)[a1 UUIDString];
    CFUUIDRef v5 = CFUUIDCreateFromString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4);
    a1 = (void *)CFAutorelease(v5);
  }
  uint64_t v6 = reserveSpace((vm_address_t *)a2, 4);
  if (!v6)
  {
    **(_DWORD **)(a2 + _Block_object_dispose(&STACK[0x2A0], 8) = 14;
    *(void *)(a2 + 8) += 4;
    CFUUIDBytes v9 = CFUUIDGetUUIDBytes((CFUUIDRef)a1);
    CFDataRef v7 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &v9.byte0, 16);
    uint64_t v6 = cfDataSerialize(v7, (vm_address_t *)a2);
    CFRelease(v7);
  }
  return v6;
}

uint64_t cfNullSerialize(uint64_t a1, uint64_t a2)
{
  uint64_t result = reserveSpace((vm_address_t *)a2, 4);
  if (!result)
  {
    **(_DWORD **)(a2 + _Block_object_dispose(&STACK[0x2A0], 8) = 8;
    *(void *)(a2 + 8) += 4;
  }
  return result;
}

uint64_t cfAttributedStringSerialize(void *a1, uint64_t a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (AXIsAXAttributedString()) {
    a1 = (void *)AXGetCFAttributedStringFromAXAttributedString(a1);
  }
  uint64_t NumberOfRuns = _CFAttributedStringGetNumberOfRuns();
  if (NumberOfRuns < 0) {
    return 4294942096;
  }
  uint64_t v5 = NumberOfRuns;
  uint64_t v6 = reserveSpace((vm_address_t *)a2, (16 * NumberOfRuns) | 0xC);
  if (!v6)
  {
    uint64_t v7 = *(void *)(a2 + 8);
    *(_DWORD *)uint64_t v7 = 9;
    *(void *)(v7 + 4) = v5;
    *(void *)(a2 + 8) += 12;
    if (v5 < 1)
    {
      vm_address_t v8 = 0;
    }
    else
    {
      vm_address_t v8 = (const __CFDictionary **)malloc_type_malloc(8 * v5, 0x6004044C4A2DFuLL);
      MEMORY[0x1F4188790]();
      _CFAttributedStringGetRuns();
      memmove(*(void **)(a2 + 8), &v13[-2 * v5], 16 * v5);
      *(void *)(a2 + 8) += 16 * v5;
    }
    CFStringRef String = CFAttributedStringGetString((CFAttributedStringRef)a1);
    cfStringSerialize(String, (vm_address_t *)a2);
    if (v8)
    {
      if (v5 < 1)
      {
        uint64_t v6 = 0;
      }
      else
      {
        uint64_t v11 = 0;
        do
        {
          uint64_t v12 = cfDictionarySerialize(v8[v11], a2);
          uint64_t v6 = v12;
          ++v11;
        }
        while (v11 < v5 && !v12);
      }
      if (v5 >= 1) {
        free(v8);
      }
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

uint64_t cgColorSerialize(CGColor *a1, vm_address_t *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if (!CGColorGetColorSpace(a1)) {
    return 4294942096;
  }
  unsigned int ProcessColorModel = CGColorSpaceGetProcessColorModel();
  if (ProcessColorModel > 2) {
    return 4294942095;
  }
  unsigned int v5 = ProcessColorModel;
  unsigned int NumberOfComponents = CGColorGetNumberOfComponents(a1);
  size_t v7 = 8 * NumberOfComponents;
  uint64_t result = reserveSpace(a2, v7 + 12);
  if (!result)
  {
    Components = CGColorGetComponents(a1);
    uint64_t v10 = (uint64_t *)MEMORY[0x1F4188790](Components);
    int v13 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFF0);
    if (NumberOfComponents)
    {
      unsigned int v14 = (void *)((char *)v18 - ((v11 + 15) & 0xFFFFFFFF0));
      do
      {
        uint64_t v15 = *v10++;
        *v14++ = v15;
        --v12;
      }
      while (v12);
    }
    unsigned int v16 = (_DWORD *)a2[1];
    *unsigned int v16 = 12;
    v16[1] = v5;
    long long v16[2] = NumberOfComponents;
    unsigned int v17 = (void *)(a2[1] + 12);
    a2[1] = (vm_address_t)v17;
    memmove(v17, v13, v7);
    a2[1] += v7;
    return 0;
  }
  return result;
}

uint64_t cgPathSerialize(const CGPath *a1, vm_address_t *a2)
{
  CFMutableDataRef Mutable = CFDataCreateMutable(0, 0);
  CGPathApply(a1, Mutable, (CGPathApplierFunction)__encodePathElementIntoData);
  CFIndex Length = CFDataGetLength(Mutable);
  if (!reserveSpace(a2, Length + 12))
  {
    vm_address_t v6 = a2[1];
    *(_DWORD *)vm_address_t v6 = 13;
    *(void *)(v6 + 4) = Length;
    size_t v7 = (UInt8 *)(a2[1] + 12);
    a2[1] = (vm_address_t)v7;
    v9.locatiouint64_t n = 0;
    v9.unsigned int length = Length;
    CFDataGetBytes(Mutable, v9, v7);
    a2[1] += Length;
  }
  CFRelease(Mutable);
  return 0;
}

uint64_t ctFontSerialize(const __CTFont *a1, uint64_t a2)
{
  NSClassFromString((NSString *)@"UIFont");
  objc_opt_isKindOfClass();
  double Size = CTFontGetSize(a1);
  uint64_t result = reserveSpace((vm_address_t *)a2, 8);
  if (!result)
  {
    **(void **)(a2 + _Block_object_dispose(&STACK[0x2A0], 8) = ((unint64_t)(int)Size << 32) | 0xF;
    *(void *)(a2 + 8) += 8;
    vm_address_t v6 = CTFontCopyFontDescriptor(a1);
    CFDictionaryRef v7 = CTFontDescriptorCopyAttributes(v6);
    uint64_t v8 = cfDictionarySerialize(v7, a2);
    CFRelease(v6);

    return v8;
  }
  return result;
}

uint64_t reserveSpace(vm_address_t *a1, uint64_t a2)
{
  vm_size_t v2 = a1[1] - *a1;
  if (!__CFADD__(a2, v2))
  {
    vm_size_t v4 = v2 + a2;
    if (v2 + a2 <= a1[2]) {
      return 0;
    }
    vm_address_t v5 = a1[3];
    vm_size_t v6 = v4 % v5;
    vm_address_t v7 = v5 - v4 % v5;
    if (v6) {
      vm_address_t v8 = v7;
    }
    else {
      vm_address_t v8 = 0;
    }
    BOOL v9 = __CFADD__(v7, v4);
    size_t v10 = v8 + v4;
    if (v9) {
      size_t v11 = 0;
    }
    else {
      size_t v11 = v10;
    }
    uint64_t v12 = mmap(0, v11, 3, 4098, -1, 0);
    if (v12 != (void *)-1)
    {
      vm_address_t v13 = (vm_address_t)v12;
      vm_copy(*MEMORY[0x1E4F14960], *a1, v2, (vm_address_t)v12);
      munmap((void *)*a1, v2);
      uint64_t result = 0;
      *a1 = v13;
      a1[1] = v2 + v13;
      a1[2] = v11;
      return result;
    }
  }
  return 4294942096;
}

void serializeArrayApplier(__CFString *a1, uint64_t a2)
{
  vm_size_t v4 = (void *)MEMORY[0x1BA9EDE10]();
  if (!*(_DWORD *)a2)
  {
    SerializeMethodForunsigned int Type = getSerializeMethodForType(a1);
    if (!SerializeMethodForType)
    {
      a1 = &stru_1F141B5A8;
      vm_size_t v6 = getSerializeMethodForType(&stru_1F141B5A8);
      if (!v6)
      {
        int v7 = 9;
        goto LABEL_6;
      }
      SerializeMethodForunsigned int Type = v6;
    }
    int v7 = SerializeMethodForType(a1, *(void *)(a2 + 8));
LABEL_6:
    *(_DWORD *)a2 = v7;
  }
}

void serializeDictApplier(uint64_t a1, __CFString *a2, uint64_t a3)
{
  vm_size_t v6 = (void *)MEMORY[0x1BA9EDE10]();
  if (!*(_DWORD *)a3)
  {
    SerializeMethodForunsigned int Type = (uint64_t (*)(uint64_t, void))getSerializeMethodForType(a1);
    if (SerializeMethodForType)
    {
      int v8 = SerializeMethodForType(a1, *(void *)(a3 + 8));
      *(_DWORD *)a3 = v8;
      if (v8) {
        goto LABEL_10;
      }
      BOOL v9 = (uint64_t (*)(__CFString *, void))getSerializeMethodForType(a2);
      if (!v9)
      {
        a2 = &stru_1F141B5A8;
        uint64_t v10 = getSerializeMethodForType(&stru_1F141B5A8);
        if (!v10)
        {
          int v11 = 9;
          goto LABEL_9;
        }
        BOOL v9 = (uint64_t (*)(__CFString *, void))v10;
      }
      int v11 = v9(a2, *(void *)(a3 + 8));
    }
    else
    {
      int v11 = -25201;
    }
LABEL_9:
    *(_DWORD *)a3 = v11;
  }
LABEL_10:
}

void __encodePathElementIntoData(__CFData *a1, int *a2)
{
  *(_DWORD *)bytes = *a2;
  CFDataAppendBytes(a1, bytes, 4);
  uint64_t v4 = *a2;
  if (v4 > 3) {
    int v5 = 0;
  }
  else {
    int v5 = dword_1BA6A6340[v4];
  }
  *(_DWORD *)uint64_t v12 = v5;
  CFDataAppendBytes(a1, v12, 4);
  if (*(_DWORD *)v12)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      int v8 = (uint64_t *)(*((void *)a2 + 1) + v6);
      uint64_t v9 = *v8;
      *(void *)uint64_t v10 = v8[1];
      *(void *)int v11 = v9;
      CFDataAppendBytes(a1, v11, 8);
      CFDataAppendBytes(a1, v10, 8);
      ++v7;
      v6 += 16;
    }
    while (v7 < *(unsigned int *)v12);
  }
}

uint64_t bogusUnserialize()
{
  int v0 = AXRuntimeLogSerialization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    bogusUnserialize_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }

  return 4294942095;
}

uint64_t cfStringUnserialize(const __CFAllocator *a1, uint64_t *a2, unint64_t a3, CFStringRef *a4, int a5)
{
  if (a3 <= 0xB)
  {
    uint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      cfStringUnserialize_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
LABEL_20:

    return 4294942096;
  }
  uint64_t v16 = *a2;
  if (a5)
  {
    CFIndex v17 = bswap64(*(void *)(v16 + 4));
    *(void *)(v16 + 4) = v17;
  }
  else
  {
    CFIndex v17 = *(void *)(v16 + 4);
  }
  unsigned int v18 = 2 * v17;
  BOOL v19 = HIDWORD(v17) != 0;
  if ((unint64_t)(2 * v17) >> 32) {
    BOOL v19 = 1;
  }
  if (HIDWORD(a3)) {
    BOOL v19 = 1;
  }
  if ((v18 & 0xFFFFFFFC) > 0xFFFFFFF3uLL || v19)
  {
    uint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      cfStringUnserialize_cold_2(v5, v21, v22, v23, v24, v25, v26, v27);
    }
    goto LABEL_20;
  }
  if ((int)a3 - 12 < v18)
  {
    uint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      cfStringUnserialize_cold_3(v5, v28, v29, v30, v31, v32, v33, v34);
    }
    goto LABEL_20;
  }
  uint64_t v36 = (v18 + 12) & 0xFFFFFFFE;
  uint64_t v37 = (const UniChar *)(v16 + 12);
  if (a5 && v17 >= 1)
  {
    CFIndex v38 = v17;
    id v39 = (_WORD *)(v16 + 12);
    do
    {
      *id v39 = bswap32((unsigned __int16)*v39) >> 16;
      ++v39;
      --v38;
    }
    while (v38);
  }
  *a4 = CFStringCreateWithCharacters(a1, v37, v17);
  uint64_t v40 = *a2;
  *a2 += v36;
  CFStringRef v41 = *a4;
  if (__CFADD__(v36, v40))
  {
    if (v41)
    {
      CFRelease(v41);
      *a4 = 0;
    }
    uint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      cfStringUnserialize_cold_4(v5, v42, v43, v44, v45, v46, v47, v48);
    }
    goto LABEL_20;
  }
  if (!v41)
  {
    _logAndReturn((uint64_t)"string: unable to create");
    return 4294942096;
  }
  return 0;
}

uint64_t cfNumberUnserialize(const __CFAllocator *a1, unint64_t *a2, unint64_t a3, CFNumberRef *a4, int a5)
{
  v55[3] = *MEMORY[0x1E4F143B8];
  if (a3 <= 0xF)
  {
    uint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      cfNumberUnserialize_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    goto LABEL_14;
  }
  unint64_t v16 = *a2;
  if (!a5)
  {
    unint64_t v17 = *(void *)(v16 + 8);
    if ((v17 & 0x8000000000000000) == 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      cfNumberUnserialize_cold_2(v5, v25, v26, v27, v28, v29, v30, v31);
    }
    goto LABEL_14;
  }
  *(_DWORD *)(v16 + 4) = bswap32(*(_DWORD *)(v16 + 4));
  unint64_t v17 = bswap64(*(void *)(v16 + 8));
  *(void *)(v16 + _Block_object_dispose(&STACK[0x2A0], 8) = v17;
  if ((v17 & 0x8000000000000000) != 0) {
    goto LABEL_12;
  }
LABEL_6:
  if (HIDWORD(a3) || v17 >= 0xFFFFFFF0)
  {
    uint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      cfNumberUnserialize_cold_3(v5, v48, v49, v50, v51, v52, v53, v54);
    }
    goto LABEL_14;
  }
  if (v17 > a3 - 16)
  {
    uint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      cfNumberUnserialize_cold_4(v5, v18, v19, v20, v21, v22, v23, v24);
    }
LABEL_14:

    return 4294942096;
  }
  if (a5 && v17 >= 2)
  {
    if ((v17 & 3) != 0)
    {
      uint64_t v33 = (_WORD *)(v16 + 16);
      unint64_t v34 = v17 >> 1;
      do
      {
        *uint64_t v33 = bswap32((unsigned __int16)*v33) >> 16;
        ++v33;
        --v34;
      }
      while (v34);
    }
    else if (v17 >= 4)
    {
      unint64_t v35 = v17 >> 2;
      uint64_t v36 = (unsigned int *)(v16 + 16);
      do
      {
        *uint64_t v36 = bswap32(*v36);
        ++v36;
        --v35;
      }
      while (v35);
    }
  }
  unsigned int v37 = *(_DWORD *)(v16 + 4);
  switch(v37)
  {
    case 1u:
    case 7u:
      if (v17) {
        goto LABEL_39;
      }
      goto LABEL_38;
    case 2u:
    case 8u:
      if (v17 >= 2) {
        goto LABEL_39;
      }
      goto LABEL_38;
    case 3u:
    case 5u:
    case 9u:
    case 0xCu:
      if (v17 >= 4) {
        goto LABEL_39;
      }
      goto LABEL_38;
    case 4u:
    case 6u:
    case 0xAu:
    case 0xBu:
    case 0xDu:
    case 0xEu:
    case 0xFu:
      if (v17 >= 8) {
        goto LABEL_39;
      }
      goto LABEL_38;
    case 0x10u:
      if (v17 > 7) {
        goto LABEL_39;
      }
LABEL_38:
      _logAndReturn((uint64_t)"number: buffer not large enought");
      return 4294942096;
    default:
      if (v37 >= 0x11)
      {
        uint64_t v5 = AXRuntimeLogSerialization();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          cfNumberUnserialize_cold_5(v5, v38, v39, v40, v41, v42, v43, v44);
        }
        goto LABEL_14;
      }
LABEL_39:
      MEMORY[0x1F4188790](a1);
      memmove((void *)(((unint64_t)v55 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0)) & 0xFFFFFFFFFFFFFFE0), (const void *)(*a2 + 16), *(void *)(v16 + 8));
      *a4 = CFNumberCreate(a1, (CFNumberType)*(unsigned int *)(v16 + 4), (const void *)(((unint64_t)v55 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0)) & 0xFFFFFFFFFFFFFFE0));
      unint64_t v45 = *a2;
      *a2 += v17 + 16;
      CFNumberRef v46 = *a4;
      if (v45 > -17 - v17)
      {
        if (v46)
        {
          CFRelease(v46);
          *a4 = 0;
        }
        uint64_t v47 = "number: could not increment pointer";
      }
      else
      {
        if (v46) {
          return 0;
        }
        uint64_t v47 = "number: unable to create";
      }
      _logAndReturn((uint64_t)v47);
      uint64_t result = 4294942096;
      break;
  }
  return result;
}

uint64_t cfBooleanUnserialize(uint64_t a1, unint64_t *a2, unint64_t a3, CFTypeRef *a4)
{
  if (a3 <= 4)
  {
    uint64_t v4 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      cfBooleanUnserialize_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
LABEL_4:

    return 4294942096;
  }
  if (*(unsigned char *)(*a2 + 4)) {
    uint64_t v15 = (CFTypeRef *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v15 = (CFTypeRef *)MEMORY[0x1E4F1CFC8];
  }
  *a4 = CFRetain(*v15);
  unint64_t v16 = *a2;
  *a2 += 5;
  if (v16 >= 0xFFFFFFFFFFFFFFFBLL)
  {
    if (*a4)
    {
      CFRelease(*a4);
      *a4 = 0;
    }
    uint64_t v4 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      cfBooleanUnserialize_cold_2(v4, v17, v18, v19, v20, v21, v22, v23);
    }
    goto LABEL_4;
  }
  return 0;
}

uint64_t cfArrayUnserialize(CFAllocatorRef allocator, unint64_t *a2, unint64_t a3, CFTypeRef *a4, uint64_t a5, uint64_t a6)
{
  if (a3 <= 0xB)
  {
    uint64_t v6 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      cfArrayUnserialize_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    goto LABEL_42;
  }
  unint64_t v19 = *a2;
  if (a5)
  {
    uint64_t v20 = bswap64(*(void *)(v19 + 4));
    *(void *)(v19 + 4) = v20;
    if (v20) {
      goto LABEL_6;
    }
LABEL_11:
    *a4 = CFArrayCreate(allocator, 0, 0, MEMORY[0x1E4F1D510]);
    unint64_t v30 = *a2;
    *a2 += 12;
    if (v30 < 0xFFFFFFFFFFFFFFF4)
    {
      uint64_t v31 = 0;
      goto LABEL_39;
    }
    if (*a4)
    {
      CFRelease(*a4);
      *a4 = 0;
    }
    uint64_t v6 = AXRuntimeLogSerialization();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
LABEL_42:

      return 4294942096;
    }
LABEL_45:
    cfArrayUnserialize_cold_2(v6, v56, v57, v58, v59, v60, v61, v62);
    goto LABEL_42;
  }
  uint64_t v20 = *(void *)(v19 + 4);
  if (!v20) {
    goto LABEL_11;
  }
LABEL_6:
  value = 0;
  unint64_t v21 = *a2;
  *a2 += 12;
  if (v21 >= 0xFFFFFFFFFFFFFFF4)
  {
    uint64_t v6 = AXRuntimeLogSerialization();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_42;
    }
    goto LABEL_45;
  }
  unsigned int v22 = a3 - 12;
  if (((a3 - 12) | a3) >> 32)
  {
    uint64_t v6 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      cfArrayUnserialize_cold_6(v6, v23, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_42;
  }
  CFMutableArrayRef Mutable = CFArrayCreateMutable(allocator, 0, MEMORY[0x1E4F1D510]);
  CFMutableArrayRef v33 = Mutable;
  if (v20 < 1)
  {
LABEL_38:
    uint64_t v31 = 0;
    *a4 = v33;
    goto LABEL_39;
  }
  CFIndex v34 = 0;
  theArraCGFloat y = Mutable;
  while (1)
  {
    uint64_t v35 = v22;
    if (v22 <= 3uLL)
    {
      _logAndReturn((uint64_t)"array: element: unexpected buffer size");
LABEL_33:
      uint64_t v31 = 4294942096;
      goto LABEL_34;
    }
    uint64_t v36 = (unsigned int *)*a2;
    unsigned int v37 = a5 ? bswap32(*v36) : *v36;
    uint64_t v38 = v37 <= 0xF
        ? ((uint64_t (*)(CFAllocatorRef, unint64_t *, void, void **, uint64_t, uint64_t))sUnserializeFunctions[v37])(allocator, a2, v22, &value, a5, a6): ((uint64_t (*)(CFAllocatorRef, unint64_t *, void, void **, uint64_t, uint64_t))bogusUnserialize)(allocator, a2, v22, &value, a5, a6);
    uint64_t v31 = v38;
    if (v38 || !value) {
      break;
    }
    unint64_t v39 = *a2 - (void)v36;
    unsigned int v22 = v35 - v39;
    if ((v39 | (v35 - v39)) >> 32)
    {
      uint64_t v40 = AXRuntimeLogSerialization();
      CFMutableArrayRef v33 = theArray;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        cfArrayUnserialize_cold_5(v40, v41, v42, v43, v44, v45, v46, v47);
      }

      if (value)
      {
        CFRelease(value);
        value = 0;
      }
      goto LABEL_33;
    }
    CFMutableArrayRef v33 = theArray;
    CFArrayInsertValueAtIndex(theArray, v34, value);
    if (value) {
      CFRelease(value);
    }
    value = 0;
    if (v20 == ++v34) {
      goto LABEL_38;
    }
  }
  CFMutableArrayRef v33 = theArray;
  if (!v38) {
    goto LABEL_38;
  }
LABEL_34:
  if (v33) {
    CFRelease(v33);
  }
LABEL_39:
  if (!*a4)
  {
    uint64_t v6 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      cfArrayUnserialize_cold_3(v6, v48, v49, v50, v51, v52, v53, v54);
    }
    goto LABEL_42;
  }
  return v31;
}

uint64_t cfDictionaryUnserialize(CFAllocatorRef allocator, unint64_t *a2, unint64_t a3, CFTypeRef *a4, uint64_t a5, uint64_t a6)
{
  if (a3 <= 0xB)
  {
    uint64_t v6 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      cfDictionaryUnserialize_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    goto LABEL_52;
  }
  unint64_t v16 = a4;
  unint64_t v19 = *a2;
  if (a5)
  {
    CFIndex v20 = bswap64(*(void *)(v19 + 4));
    *(void *)(v19 + 4) = v20;
    if (v20)
    {
LABEL_6:
      value = 0;
      unint64_t v21 = *a2;
      *a2 += 12;
      if (v21 < 0xFFFFFFFFFFFFFFF4)
      {
        unint64_t v22 = a3 - 12;
        if (((a3 - 12) | a3) >> 32)
        {
          uint64_t v6 = AXRuntimeLogSerialization();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
            cfDictionaryUnserialize_cold_7(v6, v23, v24, v25, v26, v27, v28, v29);
          }
          goto LABEL_52;
        }
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(allocator, v20, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        CFMutableDictionaryRef v33 = Mutable;
        if (v20 < 1)
        {
LABEL_48:
          uint64_t v31 = 0;
          *unint64_t v16 = v33;
        }
        else
        {
          theDict = Mutable;
          uint64_t v77 = v16;
          while (1)
          {
            if (v22 <= 3)
            {
              _logAndReturn((uint64_t)"dictionary: element: unexpected buffer size");
              return 4294942096;
            }
            CFIndex v34 = (unsigned int *)*a2;
            unsigned int v35 = a5 ? bswap32(*v34) : *v34;
            uint64_t v36 = v35 <= 0xF
                ? ((uint64_t (*)(CFAllocatorRef, unint64_t *, unint64_t, void **, uint64_t, uint64_t))sUnserializeFunctions[v35])(allocator, a2, v22, &value, a5, a6): ((uint64_t (*)(CFAllocatorRef, unint64_t *, unint64_t, void **, uint64_t, uint64_t))bogusUnserialize)(allocator, a2, v22, &value, a5, a6);
            uint64_t v31 = v36;
            if (v36) {
              break;
            }
            unsigned int v37 = value;
            if (!value) {
              break;
            }
            uint64_t v38 = (unsigned int *)*a2;
            unint64_t v39 = *a2 - (void)v34;
            unint64_t v40 = v22 - v39;
            if (HIDWORD(v40) || HIDWORD(v39) || (v40 & 0xFFFFFFFC) == 0)
            {
              uint64_t v61 = AXRuntimeLogSerialization();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
                cfDictionaryUnserialize_cold_5(v61, v62, v63, v64, v65, v66, v67, v68);
              }

              unint64_t v16 = v77;
              uint64_t v52 = value;
              CFMutableDictionaryRef v33 = theDict;
              if (value)
              {
LABEL_43:
                CFRelease(v52);
                value = 0;
              }
LABEL_44:
              uint64_t v31 = 4294942096;
              goto LABEL_45;
            }
            if (a5) {
              unsigned int v41 = bswap32(*v38);
            }
            else {
              unsigned int v41 = *v38;
            }
            if (v41 <= 0xF) {
              uint64_t v42 = ((uint64_t (*)(CFAllocatorRef, unint64_t *, unint64_t, void **, uint64_t, uint64_t))sUnserializeFunctions[v41])(allocator, a2, v40, &value, a5, a6);
            }
            else {
              uint64_t v42 = ((uint64_t (*)(CFAllocatorRef, unint64_t *, unint64_t, void **, uint64_t, uint64_t))bogusUnserialize)(allocator, a2, v40, &value, a5, a6);
            }
            uint64_t v31 = v42;
            if (v42 || !value) {
              break;
            }
            unint64_t v43 = *a2 - (void)v38;
            unint64_t v22 = v40 - v43;
            if ((v43 | v22) >> 32)
            {
              uint64_t v44 = AXRuntimeLogSerialization();
              CFMutableDictionaryRef v33 = theDict;
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
                cfDictionaryUnserialize_cold_6(v44, v45, v46, v47, v48, v49, v50, v51);
              }

              unint64_t v16 = v77;
              uint64_t v52 = value;
              if (value) {
                goto LABEL_43;
              }
              goto LABEL_44;
            }
            CFMutableDictionaryRef v33 = theDict;
            CFDictionarySetValue(theDict, v37, value);
            CFRelease(v37);
            if (value)
            {
              CFRelease(value);
              value = 0;
            }
            --v20;
            unint64_t v16 = v77;
            if (!v20) {
              goto LABEL_48;
            }
          }
          CFMutableDictionaryRef v33 = theDict;
          unint64_t v16 = v77;
          if (!v31) {
            goto LABEL_48;
          }
LABEL_45:
          if (v33) {
            CFRelease(v33);
          }
        }
        goto LABEL_49;
      }
      uint64_t v6 = AXRuntimeLogSerialization();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        goto LABEL_52;
      }
LABEL_61:
      cfDictionaryUnserialize_cold_2(v6, v69, v70, v71, v72, v73, v74, v75);
      goto LABEL_52;
    }
  }
  else
  {
    CFIndex v20 = *(void *)(v19 + 4);
    if (v20) {
      goto LABEL_6;
    }
  }
  *a4 = CFDictionaryCreate(allocator, 0, 0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  unint64_t v30 = *a2;
  *a2 += 12;
  if (v30 >= 0xFFFFFFFFFFFFFFF4)
  {
    if (*v16)
    {
      CFRelease(*v16);
      *unint64_t v16 = 0;
    }
    uint64_t v6 = AXRuntimeLogSerialization();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_52;
    }
    goto LABEL_61;
  }
  uint64_t v31 = 0;
LABEL_49:
  if (*v16) {
    return v31;
  }
  uint64_t v6 = AXRuntimeLogSerialization();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    cfDictionaryUnserialize_cold_3(v6, v53, v54, v55, v56, v57, v58, v59);
  }
LABEL_52:

  return 4294942096;
}

uint64_t cfDataUnserialize(const __CFAllocator *a1, unint64_t *a2, unint64_t a3, CFDataRef *a4, int a5)
{
  if (a3 <= 0xB)
  {
    uint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      cfDataUnserialize_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
LABEL_16:

    return 4294942096;
  }
  unint64_t v15 = *a2;
  if (a5)
  {
    unint64_t v16 = bswap64(*(void *)(v15 + 4));
    *(void *)(v15 + 4) = v16;
  }
  else
  {
    unint64_t v16 = *(void *)(v15 + 4);
  }
  if (HIDWORD(v16)) {
    BOOL v17 = 0;
  }
  else {
    BOOL v17 = ((v16 + 12) | a3) >> 32 == 0;
  }
  if (!v17)
  {
    uint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      cfDataUnserialize_cold_4(v5, v18, v19, v20, v21, v22, v23, v24);
    }
    goto LABEL_16;
  }
  if (v16 > (a3 - 12))
  {
    uint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      cfDataUnserialize_cold_2(v5, v25, v26, v27, v28, v29, v30, v31);
    }
    goto LABEL_16;
  }
  *a4 = CFDataCreate(a1, (const UInt8 *)(v15 + 12), v16);
  unint64_t v33 = *a2;
  *a2 += v16 + 12;
  CFDataRef v34 = *a4;
  if (v33 > -13 - v16)
  {
    if (v34)
    {
      CFRelease(v34);
      *a4 = 0;
    }
    uint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      cfDataUnserialize_cold_3(v5, v35, v36, v37, v38, v39, v40, v41);
    }
    goto LABEL_16;
  }
  if (!v34)
  {
    _logAndReturn((uint64_t)"data: unable to create");
    return 4294942096;
  }
  return 0;
}

uint64_t cfDateUnserialize(const __CFAllocator *a1, unint64_t *a2, unint64_t a3, CFDateRef *a4, int a5)
{
  if (a3 > 0xB)
  {
    double v15 = *(double *)(*a2 + 4);
    if (a5) {
      double v15 = (double)bswap64(*(void *)(*a2 + 4));
    }
    *a4 = CFDateCreate(a1, v15);
    unint64_t v16 = *a2;
    *a2 += 12;
    CFDateRef v17 = *a4;
    if (v16 >= 0xFFFFFFFFFFFFFFF4)
    {
      if (v17)
      {
        CFRelease(v17);
        *a4 = 0;
      }
      uint64_t v5 = AXRuntimeLogSerialization();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        cfDateUnserialize_cold_2(v5, v26, v27, v28, v29, v30, v31, v32);
      }
    }
    else
    {
      if (v17) {
        return 0;
      }
      uint64_t v5 = AXRuntimeLogSerialization();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        cfDateUnserialize_cold_3(v5, v19, v20, v21, v22, v23, v24, v25);
      }
    }
  }
  else
  {
    uint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      cfDateUnserialize_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  return 4294942096;
}

uint64_t cfURLUnserialize(const __CFAllocator *a1, uint64_t *a2, unint64_t a3, CFURLRef *a4, int a5)
{
  unint64_t v5 = *a2;
  CFTypeRef cf = 0;
  if (a3 <= 4)
  {
    uint64_t v6 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      cfURLUnserialize_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
LABEL_8:

    return 4294942096;
  }
  unint64_t v15 = v5 + 5;
  *a2 = v5 + 5;
  if (v5 >= 0xFFFFFFFFFFFFFFFBLL)
  {
    uint64_t v6 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      cfURLUnserialize_cold_2(v6, v42, v43, v44, v45, v46, v47, v48);
    }
    goto LABEL_8;
  }
  unint64_t v16 = a3 - 5;
  if (((a3 - 5) | a3) >> 32)
  {
    uint64_t v6 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      cfURLUnserialize_cold_4(v6, v17, v18, v19, v20, v21, v22, v23);
    }
    goto LABEL_8;
  }
  uint64_t v24 = cfStringUnserialize(a1, a2, a3 - 5, (CFStringRef *)&cf, a5);
  if (!v24)
  {
    CFStringRef v29 = (const __CFString *)cf;
    if (cf)
    {
      unint64_t v30 = *a2 - v15;
      unint64_t v31 = v16 - v30;
      if ((v31 | v30) >> 32)
      {
        CFRelease(cf);
        uint64_t v6 = AXRuntimeLogSerialization();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          cfURLUnserialize_cold_3(v6, v32, v33, v34, v35, v36, v37, v38);
        }
        goto LABEL_8;
      }
      if (*(unsigned __int8 *)(v5 + 4) < 2u)
      {
        CFURLRef v41 = 0;
        goto LABEL_22;
      }
      CFTypeRef v49 = 0;
      uint64_t v24 = cfStringUnserialize(a1, a2, v31, (CFStringRef *)&v49, a5);
      CFTypeRef v39 = v49;
      if (!v24 && v49)
      {
        if (((v31 - (*a2 - v15)) | (*a2 - v15)) >> 32)
        {
          CFRelease(v49);
          CFRelease(v29);
          uint64_t v40 = "url: base buffer math error";
LABEL_30:
          _logAndReturn((uint64_t)v40);
          return 4294942096;
        }
        CFURLRef v41 = CFURLCreateWithString(a1, (CFStringRef)v49, 0);
        CFRelease(v39);
LABEL_22:
        *a4 = CFURLCreateWithString(a1, v29, v41);
        CFRelease(v29);
        if (v41) {
          CFRelease(v41);
        }
        if (*a4) {
          return 0;
        }
        uint64_t v40 = "url: unable to create";
        goto LABEL_30;
      }
      if (v49) {
        CFRelease(v49);
      }
      CFRelease(v29);
    }
  }
  return v24;
}

uint64_t cfNullUnserialize(uint64_t a1, unint64_t *a2, unint64_t a3, void *a4)
{
  if (a3 <= 3)
  {
    uint64_t v6 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      cfNullUnserialize_cold_2(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  unint64_t v14 = *a2;
  *a2 += 4;
  if (v14 >= 0xFFFFFFFFFFFFFFFCLL)
  {
    uint64_t v17 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      cfNullUnserialize_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
    }

    return 4294942096;
  }
  else
  {
    CFTypeRef v15 = CFRetain((CFTypeRef)*MEMORY[0x1E4F1D260]);
    uint64_t result = 0;
    *a4 = v15;
  }
  return result;
}

uint64_t cfAttributedStringUnserialize(const __CFAllocator *a1, uint64_t *a2, unint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  unint64_t v6 = *a2;
  CFStringRef str = 0;
  if (a3 <= 0xB)
  {
    uint64_t v7 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      cfAttributedStringUnserialize_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
LABEL_18:

    return 4294942096;
  }
  unint64_t v16 = v6 + 12;
  *a2 = v6 + 12;
  if (v6 >= 0xFFFFFFFFFFFFFFF4)
  {
    uint64_t v7 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      cfAttributedStringUnserialize_cold_2(v7, v72, v73, v74, v75, v76, v77, v78);
    }
    goto LABEL_18;
  }
  unint64_t v18 = a3 - 12;
  if (((a3 - 12) | a3) >> 32)
  {
    uint64_t v7 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      cfAttributedStringUnserialize_cold_7(v7, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_18;
  }
  if (a5) {
    uint64_t v30 = bswap64(*(void *)(v6 + 4));
  }
  else {
    uint64_t v30 = *(void *)(v6 + 4);
  }
  *(void *)(v6 + 4) = v30;
  if (v30 < 0) {
    goto LABEL_16;
  }
  if (!v30)
  {
    unint64_t v31 = (_OWORD *)(v6 + 12);
    goto LABEL_22;
  }
  if ((unint64_t)v30 >> 60)
  {
LABEL_16:
    uint64_t v7 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      cfAttributedStringUnserialize_cold_6(v7, v33, v34, v35, v36, v37, v38, v39);
    }
    goto LABEL_18;
  }
  unint64_t v31 = malloc_type_malloc(16 * v30, 0x1BB95363uLL);
  if (!v31)
  {
    uint64_t v32 = "attributedString: range: unable to allocate";
LABEL_57:
    _logAndReturn((uint64_t)v32);
    return 4294942096;
  }
LABEL_22:
  if (a5)
  {
    if (a6)
    {
      if (v30)
      {
        uint64_t v42 = 0;
        unint64_t v43 = a3 - 20;
        unint64_t v44 = v16 + 4;
        while (v43 < 0xFFFFFFFFFFFFFFF8)
        {
          int8x8_t v45 = vrev32_s8(*(int8x8_t *)(v44 - 4));
          *(void *)&long long v46 = v45.u32[0];
          *((void *)&v46 + 1) = v45.u32[1];
          v31[v42] = v46;
          if (HIDWORD(v43))
          {
            free(v31);
            uint64_t v7 = AXRuntimeLogSerialization();
            if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
              goto LABEL_18;
            }
            goto LABEL_93;
          }
          ++v42;
          v43 -= 8;
          v44 += 8;
          if (v30 == v42) {
            goto LABEL_36;
          }
        }
LABEL_56:
        free(v31);
        uint64_t v32 = "attributedString: range-entry: unexpected buffer size";
        goto LABEL_57;
      }
    }
    else if (v30)
    {
      uint64_t v50 = 0;
      unint64_t v51 = v16 + 8;
      while (v18 > 0xF)
      {
        v31[v50] = vrev64q_s8(*(int8x16_t *)(v51 - 8));
        v18 -= 16;
        if (HIDWORD(v18))
        {
          free(v31);
          uint64_t v7 = AXRuntimeLogSerialization();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            cfAttributedStringUnserialize_cold_4(v7, v86, v87, v88, v89, v90, v91, v92);
          }
          goto LABEL_18;
        }
        ++v50;
        v51 += 16;
        if (v30 == v50) {
          goto LABEL_48;
        }
      }
      goto LABEL_56;
    }
  }
  else if (a6)
  {
    if (v30)
    {
      uint64_t v47 = 0;
      unint64_t v43 = a3 - 20;
      while (v43 < 0xFFFFFFFFFFFFFFF8)
      {
        uint64_t v48 = *(void *)(v16 + 8 * v47);
        *(void *)&long long v49 = (int)v48;
        *((void *)&v49 + 1) = SHIDWORD(v48);
        v31[v47] = v49;
        if (HIDWORD(v43))
        {
          free(v31);
          uint64_t v7 = AXRuntimeLogSerialization();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
LABEL_93:
          }
            cfAttributedStringUnserialize_cold_3(v7, v79, v80, v81, v82, v83, v84, v85);
          goto LABEL_18;
        }
        ++v47;
        v43 -= 8;
        if (v30 == v47)
        {
LABEL_36:
          unint64_t v18 = v43 + 8;
          goto LABEL_48;
        }
      }
      goto LABEL_56;
    }
  }
  else if (v30)
  {
    uint64_t v52 = 0;
    while (v18 > 0xF)
    {
      v31[v52] = *(_OWORD *)(v16 + 16 * v52);
      v18 -= 16;
      if (HIDWORD(v18))
      {
        free(v31);
        uint64_t v32 = "attributedString: range-entry buffer math error";
        goto LABEL_57;
      }
      if (v30 == ++v52)
      {
LABEL_48:
        unint64_t v53 = 8;
        if (!a6) {
          unint64_t v53 = 16;
        }
        if (v18 < v53)
        {
          free(v31);
          uint64_t v32 = "attributedString: run: unexpected buffer size";
          goto LABEL_57;
        }
        BOOL v56 = ((unint64_t)v30 * (unsigned __int128)v53) >> 64 != 0;
        char v57 = 3;
        if (!a6) {
          char v57 = 4;
        }
        uint64_t v58 = v30 << v57;
        uint64_t v59 = *a2;
        uint64_t v60 = *a2 + v58;
        *a2 = v60;
        if (__CFADD__(v58, v59) || v56)
        {
          free(v31);
          uint64_t v32 = "attributedString: run buffer math error";
          goto LABEL_57;
        }
        uint64_t v61 = cfStringUnserialize(a1, a2, v18, &str, a5);
        uint64_t v62 = *a2 - v60;
        uint64_t v63 = v18 - v62;
        if ((v63 | (unint64_t)v62) >> 32)
        {
          if (str) {
            CFRelease(str);
          }
          free(v31);
          uint64_t v32 = "attributedString: final string buffer math error";
          goto LABEL_57;
        }
        uint64_t v40 = v61;
        CFStringRef v64 = str;
        if (!v61 && str)
        {
          CFStringRef v94 = str;
          if ((unint64_t)v30 >> 61)
          {
            CFRelease(str);
            free(v31);
            uint64_t v32 = "attributedString: dict buffer math error";
            goto LABEL_57;
          }
          uint64_t v65 = malloc_type_malloc(8 * v30, 0x468D5912uLL);
          bzero(v65, 8 * v30);
          uint64_t v96 = *a2;
          uint64_t v66 = 1;
          long long v93 = (CFTypeRef *)v65;
          do
          {
            uint64_t v95 = v66;
            *uint64_t v65 = 0;
            uint64_t v67 = cfDictionaryUnserialize(a1, (unint64_t *)a2, v63, (CFTypeRef *)v65, a5, a6);
            if (*v65)
            {
              uint64_t v40 = v67;
            }
            else
            {
              _logAndReturn((uint64_t)"attributedString: could not create dictionary");
              uint64_t v40 = 4294942096;
            }
            uint64_t v68 = *a2 - v96;
            uint64_t v63 = v63 - v68;
            if ((v68 | (unint64_t)v63) >> 32)
            {
              _logAndReturn((uint64_t)"attributedString: dict entry buffer math error");
              uint64_t v40 = 4294942096;
              goto LABEL_80;
            }
            if (v95 >= v30) {
              break;
            }
            uint64_t v66 = v95 + 1;
            ++v65;
            uint64_t v96 = *a2;
          }
          while (!v40);
          if (!v40)
          {
            uint64_t v69 = v93;
            CFStringRef v64 = v94;
            uint64_t v70 = _CFAttributedStringCreateWithRuns();
            goto LABEL_81;
          }
LABEL_80:
          CFStringRef v64 = v94;
          uint64_t v70 = (uint64_t)CFAttributedStringCreate(a1, v94, 0);
          uint64_t v69 = v93;
LABEL_81:
          *a4 = v70;
          if (v30 >= 1)
          {
            uint64_t v71 = v69;
            do
            {
              if (*v71)
              {
                CFRelease(*v71);
                *uint64_t v71 = 0;
              }
              ++v71;
              --v30;
            }
            while (v30);
          }
          free(v69);
        }
        if (v64) {
          CFRelease(v64);
        }
        free(v31);
        goto LABEL_54;
      }
    }
    goto LABEL_56;
  }
  uint64_t v40 = cfStringUnserialize(a1, a2, v18, &str, a5);
  if (!v40)
  {
    CFStringRef v54 = str;
    *a4 = (uint64_t)CFAttributedStringCreate(a1, str, 0);
    CFRelease(v54);
  }
LABEL_54:
  if (*a4)
  {
    uint64_t v55 = AXCreateAXAttributedStringFromCFAttributedString(*a4);
    CFRelease((CFTypeRef)*a4);
    *a4 = v55;
  }
  return v40;
}

uint64_t axElementUnserialize(uint64_t a1, uint64_t *a2, unint64_t a3, uint64_t *a4, int a5)
{
  if (a3 > 0x17)
  {
    uint64_t v16 = *a2;
    if (a5)
    {
      int v17 = bswap32(*(_DWORD *)(v16 + 4));
      *(_DWORD *)(v16 + 4) = v17;
      uint64_t v18 = bswap64(*(void *)(v16 + 8));
      uint64_t v19 = bswap64(*(void *)(v16 + 16));
      *(void *)(v16 + _Block_object_dispose(&STACK[0x2A0], 8) = v18;
      *(void *)(v16 + 16) = v19;
    }
    else
    {
      int v17 = *(_DWORD *)(v16 + 4);
      uint64_t v18 = *(void *)(v16 + 8);
      uint64_t v19 = *(void *)(v16 + 16);
    }
    uint64_t Internal = _AXUIElementCreateInternal(v17, v18, v19);
    uint64_t result = 0;
    *a4 = Internal;
    *a2 += 24;
  }
  else
  {
    unint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      axElementUnserialize_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    return 4294942096;
  }
  return result;
}

uint64_t axValueUnserialize(uint64_t a1, unsigned int **a2, unint64_t a3, void *a4, int a5)
{
  if (a3 <= 0xB)
  {
    unint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      axValueUnserialize_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
LABEL_12:

    return 4294942096;
  }
  uint64_t v14 = *a2;
  if (a5)
  {
    unsigned int v15 = bswap32(v14[2]);
    v14[1] = bswap32(v14[1]);
    v14[2] = v15;
  }
  if (((a3 - 12) | a3) >> 32)
  {
    unint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      axValueUnserialize_cold_4(v5, v16, v17, v18, v19, v20, v21, v22);
    }
    goto LABEL_12;
  }
  if (v14[2] > (int)a3 - 12)
  {
    unint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      axValueUnserialize_cold_2(v5, v23, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_12;
  }
  *a4 = _AXValueCreateFromInternalData(v14[1], v14 + 3);
  unint64_t v31 = (unint64_t)*a2;
  uint64_t v32 = v14[2];
  *a2 = (unsigned int *)((char *)*a2 + v32 + 12);
  if (-13 - v32 < v31)
  {
    unint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      axValueUnserialize_cold_3(v5, v33, v34, v35, v36, v37, v38, v39);
    }
    goto LABEL_12;
  }
  return 0;
}

uint64_t cgColorUnserialize(uint64_t a1, uint64_t *a2, unint64_t a3, CGColorRef *a4, int a5)
{
  v61[1] = *MEMORY[0x1E4F143B8];
  if (a3 <= 0xB)
  {
    unint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      cgColorUnserialize_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
LABEL_38:

    return 4294942096;
  }
  uint64_t v15 = *a2;
  if (a5)
  {
    LODWORD(v16) = bswap32(*(_DWORD *)(v15 + 8));
    *(_DWORD *)(v15 + 4) = bswap32(*(_DWORD *)(v15 + 4));
    *(_DWORD *)(v15 + _Block_object_dispose(&STACK[0x2A0], 8) = v16;
  }
  else
  {
    LODWORD(v16) = *(_DWORD *)(v15 + 8);
  }
  unsigned int v17 = 8 * v16;
  BOOL v18 = v16 >> 29 != 0;
  if (HIDWORD(a3)) {
    BOOL v18 = 1;
  }
  if (v17 > 0xFFFFFFF3 || v18)
  {
    unint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      cgColorUnserialize_cold_2(v5, v20, v21, v22, v23, v24, v25, v26);
    }
    goto LABEL_38;
  }
  if (v17 > (int)a3 - 12)
  {
    unint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      cgColorUnserialize_cold_3(v5, v27, v28, v29, v30, v31, v32, v33);
    }
    goto LABEL_38;
  }
  if (a5)
  {
    uint64_t v16 = v16;
    if (v16)
    {
      uint64_t v34 = (unint64_t *)(v15 + 12);
      do
      {
        *uint64_t v34 = bswap64(*v34);
        ++v34;
        --v16;
      }
      while (v16);
    }
  }
  int v35 = *(_DWORD *)(v15 + 4);
  if (v35 == 2)
  {
    DeviceCMYK = CGColorSpaceCreateDeviceCMYK();
  }
  else if (v35 == 1)
  {
    DeviceCMYK = CGColorSpaceCreateDeviceRGB();
  }
  else
  {
    if (v35) {
      return 4294942095;
    }
    DeviceCMYK = CGColorSpaceCreateDeviceGray();
  }
  uint64_t v37 = DeviceCMYK;
  if (!DeviceCMYK)
  {
    unint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      cgColorUnserialize_cold_4(v5, v46, v47, v48, v49, v50, v51, v52);
    }
    goto LABEL_38;
  }
  uint64_t v38 = *(unsigned int *)(v15 + 8);
  size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(DeviceCMYK);
  if (NumberOfComponents + 1 != v38)
  {
    CFRelease(v37);
    unint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      cgColorUnserialize_cold_5(v5, v53, v54, v55, v56, v57, v58, v59);
    }
    goto LABEL_38;
  }
  uint64_t v40 = v17 + 12;
  MEMORY[0x1F4188790](NumberOfComponents);
  uint64_t v42 = (char *)v61 - ((v41 + 15) & 0xFFFFFFFF0);
  memmove(v42, (const void *)(*a2 + 12), 8 * *(unsigned int *)(v15 + 8));
  *a4 = CGColorCreate(v37, (const CGFloat *)v42);
  CFRelease(v37);
  uint64_t v43 = *a2;
  *a2 += v40;
  CGColorRef v44 = *a4;
  if (__CFADD__(v40, v43))
  {
    if (v44)
    {
      CFRelease(v44);
      *a4 = 0;
    }
    uint64_t v60 = "color: could not increment pointer";
  }
  else
  {
    if (v44) {
      return 0;
    }
    uint64_t v60 = "color: unable to create";
  }
  _logAndReturn((uint64_t)v60);
  return 4294942096;
}

uint64_t cgPathUnserialize(const __CFAllocator *a1, unint64_t *a2, unint64_t a3, CGPath **a4, __int32 a5)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if (a3 <= 0xB)
  {
    unint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      cgPathUnserialize_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
LABEL_16:

    return 4294942096;
  }
  unint64_t v16 = *a2;
  if (a5)
  {
    unint64_t v17 = bswap64(*(void *)(v16 + 4));
    *(void *)(v16 + 4) = v17;
  }
  else
  {
    unint64_t v17 = *(void *)(v16 + 4);
  }
  if (HIDWORD(v17)) {
    BOOL v18 = 0;
  }
  else {
    BOOL v18 = ((v17 + 12) | a3) >> 32 == 0;
  }
  if (!v18)
  {
    unint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      cgPathUnserialize_cold_5(v5, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_16;
  }
  if (v17 > (a3 - 12))
  {
    unint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      cgPathUnserialize_cold_2(v5, v26, v27, v28, v29, v30, v31, v32);
    }
    goto LABEL_16;
  }
  CFDataRef v35 = CFDataCreate(a1, (const UInt8 *)(v16 + 12), v17);
  CFDataRef v36 = v35;
  unint64_t v37 = *a2;
  *a2 += v17 + 12;
  if (v37 > -13 - v17)
  {
    if (v35) {
      CFRelease(v35);
    }
    unint64_t v5 = AXRuntimeLogSerialization();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      cgPathUnserialize_cold_3(v5, v61, v62, v63, v64, v65, v66, v67);
    }
    goto LABEL_16;
  }
  CFMutableDictionaryRef Mutable = CGPathCreateMutable();
  int64_t v39 = *(void *)(v16 + 4);
  BytePtr = CFDataGetBytePtr(v36);
  if (v39 < 1)
  {
LABEL_46:
    uint64_t v33 = 0;
    goto LABEL_60;
  }
  uint64_t v42 = BytePtr;
  int64_t v43 = 0;
  CGColorRef v44 = "path: movePoint: unexpected buffer size";
  while (1)
  {
    if (v43 + 8 > (unint64_t)v39)
    {
      uint64_t v52 = "path: pointsType: unexpected buffer size";
      goto LABEL_56;
    }
    unsigned int v45 = *(_DWORD *)&v42[v43];
    unsigned int v46 = *(_DWORD *)&v42[v43 + 4];
    if (a5)
    {
      unsigned int v45 = bswap32(*(_DWORD *)&v42[v43]);
      unsigned int v46 = bswap32(*(_DWORD *)&v42[v43 + 4]);
    }
    if (v46 > 3 || v43 + 8 + 16 * (unint64_t)v46 > v39) {
      break;
    }
    v48.i32[1] = 0;
    v48.i64[1] = 0;
    long long v69 = 0u;
    *(_OWORD *)uint64_t v70 = 0u;
    long long v68 = 0u;
    if (v46)
    {
      uint64_t v49 = (int8x16_t *)&v68;
      uint64_t v50 = v46;
      v43 += 8;
      do
      {
        v48.i32[0] = 0;
        v41.i32[0] = a5;
        int8x16_t v51 = vdupq_lane_s8((int8x8_t)*(_OWORD *)&vceqq_s8(v41, v48), 0);
        int8x16_t v41 = *(int8x16_t *)&v42[v43];
        int8x16_t v48 = vbslq_s8(v51, v41, vrev64q_s8(v41));
        v43 += 16;
        *v49++ = v48;
        --v50;
      }
      while (v50);
    }
    else
    {
      v43 += 8;
    }
    switch(v45)
    {
      case 0u:
        if (v46 != 1) {
          goto LABEL_55;
        }
        CGPathMoveToPoint(Mutable, 0, *(CGFloat *)&v68, *((CGFloat *)&v68 + 1));
        goto LABEL_45;
      case 1u:
        if (v46 != 1)
        {
          CGColorRef v44 = "path: addLinePoint: unexpected buffer size";
LABEL_55:
          uint64_t v52 = v44;
LABEL_56:
          _logAndReturn((uint64_t)v52);
          goto LABEL_57;
        }
        CGPathAddLineToPoint(Mutable, 0, *(CGFloat *)&v68, *((CGFloat *)&v68 + 1));
LABEL_45:
        if (v43 >= v39) {
          goto LABEL_46;
        }
        break;
      case 2u:
        if (v46 == 2)
        {
          CGPathAddQuadCurveToPoint(Mutable, 0, *(CGFloat *)&v68, *((CGFloat *)&v68 + 1), *(CGFloat *)&v69, *((CGFloat *)&v69 + 1));
          goto LABEL_45;
        }
        CGColorRef v44 = "path: quadCurvePoint: unexpected buffer size";
        goto LABEL_55;
      case 3u:
        if (v46 == 3)
        {
          CGPathAddCurveToPoint(Mutable, 0, *(CGFloat *)&v68, *((CGFloat *)&v68 + 1), *(CGFloat *)&v69, *((CGFloat *)&v69 + 1), v70[0], v70[1]);
          goto LABEL_45;
        }
        CGColorRef v44 = "path: curvePoint: unexpected buffer size";
        goto LABEL_55;
      case 4u:
        if (!v46)
        {
          CGPathCloseSubpath(Mutable);
          goto LABEL_45;
        }
        CGColorRef v44 = "path: close: unexpected buffer size";
        goto LABEL_55;
      default:
        goto LABEL_45;
    }
  }
  uint64_t v53 = AXRuntimeLogSerialization();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
    cgPathUnserialize_cold_4(v53, v54, v55, v56, v57, v58, v59, v60);
  }

LABEL_57:
  if (Mutable)
  {
    CFRelease(Mutable);
    CFMutableDictionaryRef Mutable = 0;
  }
  uint64_t v33 = 4294942096;
LABEL_60:
  *a4 = Mutable;
  if (v36)
  {
    CFRelease(v36);
    CFMutableDictionaryRef Mutable = *a4;
  }
  if (!Mutable)
  {
    _logAndReturn((uint64_t)"path: unable to create");
    return 4294942096;
  }
  return v33;
}

uint64_t cfUUIDUnserialize(const __CFAllocator *a1, unint64_t *a2, unint64_t a3, void *a4, int a5)
{
  uint64_t v6 = 4294942096;
  BOOL v7 = a3 >= 4;
  unint64_t v8 = a3 - 4;
  if (v7)
  {
    unint64_t v9 = *a2;
    if (*(_DWORD *)*a2 == 14)
    {
      *a2 = v9 + 4;
      if (v9 >= 0xFFFFFFFFFFFFFFFCLL)
      {
        uint64_t v10 = AXRuntimeLogSerialization();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          cfUUIDUnserialize_cold_1(v10, v25, v26, v27, v28, v29, v30, v31);
        }
        goto LABEL_8;
      }
      if ((v8 | a3) >> 32)
      {
        uint64_t v10 = AXRuntimeLogSerialization();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          cfUUIDUnserialize_cold_2(v10, v11, v12, v13, v14, v15, v16, v17);
        }
LABEL_8:

        return 4294942096;
      }
      CFDataRef theData = 0;
      uint64_t v6 = cfDataUnserialize(a1, a2, v8, &theData, a5);
      if (!v6)
      {
        *(void *)&buffer.byte0 = 0;
        *(void *)&buffer.byte8 = 0;
        CFDataRef v19 = theData;
        if ((unint64_t)CFDataGetLength(theData) <= 0x10) {
          v20.unsigned int length = CFDataGetLength(v19);
        }
        else {
          v20.unsigned int length = 16;
        }
        v20.locatiouint64_t n = 0;
        CFDataGetBytes(v19, v20, &buffer.byte0);
        CFAllocatorRef v21 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        CFUUIDRef v22 = CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], buffer);
        CFStringRef v23 = CFUUIDCreateString(v21, v22);
        *a4 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v23];
        if (v23) {
          CFRelease(v23);
        }
        if (v22) {
          CFRelease(v22);
        }
        if (v19) {
          CFRelease(v19);
        }
      }
    }
  }
  return v6;
}

uint64_t ctFontUnserialize(const __CFAllocator *a1, unint64_t *a2, unint64_t a3, CTFontRef *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = 4294942096;
  BOOL v8 = a3 >= 8;
  unint64_t v9 = a3 - 8;
  if (v8)
  {
    unint64_t v10 = *a2;
    if (*(_DWORD *)*a2 == 15)
    {
      *a2 = v10 + 8;
      if (v10 >= 0xFFFFFFFFFFFFFFF8)
      {
        uint64_t v11 = AXRuntimeLogSerialization();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          ctFontUnserialize_cold_1(v11, v23, v24, v25, v26, v27, v28, v29);
        }
        goto LABEL_8;
      }
      if ((v9 | a3) >> 32)
      {
        uint64_t v11 = AXRuntimeLogSerialization();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          ctFontUnserialize_cold_2(v11, v12, v13, v14, v15, v16, v17, v18);
        }
LABEL_8:

        return v7;
      }
      CFDictionaryRef attributes = 0;
      uint64_t v7 = cfDictionaryUnserialize(a1, a2, v9, (CFTypeRef *)&attributes, a5, a6);
      if (!v7)
      {
        CFDictionaryRef v20 = attributes;
        if (attributes)
        {
          CFAllocatorRef v21 = CTFontDescriptorCreateWithAttributes(attributes);
          *a4 = CTFontCreateWithFontDescriptor(v21, (double)*(int *)(v10 + 4), 0);
          CFRelease(v20);
          if (v21) {
            CFRelease(v21);
          }
        }
      }
    }
  }
  return v7;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

CFRunLoopSourceRef MSHCreateMachServerSource(const __CFAllocator *a1, CFIndex a2, uint64_t a3, int a4, int a5, uint64_t a6)
{
  int v7 = a5;
  HIDWORD(v18.perform) = a5;
  uint64_t v12 = malloc_type_malloc(0x18uLL, 0x1080040D2F62047uLL);
  v18.versiouint64_t n = 1;
  v18.info = v12;
  v18.retaiuint64_t n = 0;
  v18.release = (void (__cdecl *)(const void *))mshRelease;
  v18.copyDescriptiouint64_t n = (CFStringRef (__cdecl *)(const void *))mshCopyDescription;
  v18.equal = (Boolean (__cdecl *)(const void *, const void *))mshEqual;
  v18.hash = (CFHashCode (__cdecl *)(const void *))mshHash;
  v18.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))mshGetPort;
  v18.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))mshPerform;
  ipc_space_t v13 = *MEMORY[0x1E4F14960];
  if (!v7)
  {
    if (mach_port_allocate(*MEMORY[0x1E4F14960], 1u, (mach_port_name_t *)&v18.perform + 1)) {
      goto LABEL_10;
    }
    if ((a4 & 4) == 0 && mach_port_insert_right(v13, HIDWORD(v18.perform), HIDWORD(v18.perform), 0x14u))
    {
      mach_port_name_t perform_high = HIDWORD(v18.perform);
      ipc_space_t v16 = v13;
      mach_port_right_t v17 = 1;
      goto LABEL_9;
    }
    a4 &= ~1u;
    int v7 = HIDWORD(v18.perform);
  }
  *((void *)v12 + 1) = a6;
  *((void *)v12 + 2) = a3;
  _DWORD *v12 = v7;
  v12[1] = a4;
  CFRunLoopSourceRef result = CFRunLoopSourceCreate(a1, a2, &v18);
  if (result) {
    return result;
  }
  if ((a4 & 1) == 0)
  {
    mach_port_mod_refs(v13, HIDWORD(v18.perform), 1u, -1);
    mach_port_name_t perform_high = HIDWORD(v18.perform);
    ipc_space_t v16 = v13;
    mach_port_right_t v17 = 0;
LABEL_9:
    mach_port_mod_refs(v16, perform_high, v17, -1);
  }
LABEL_10:
  free(v12);
  return 0;
}

void mshRelease(mach_port_name_t *a1)
{
  mach_port_name_t v2 = a1[1];
  if ((v2 & 1) == 0)
  {
    ipc_space_t v3 = *MEMORY[0x1E4F14960];
    mach_port_name_t v4 = *a1;
    mach_port_mod_refs(*MEMORY[0x1E4F14960], *a1, 1u, -1);
    if ((v2 & 4) == 0) {
      mach_port_mod_refs(v3, v4, 0, -1);
    }
  }
  free(a1);
}

CFStringRef mshCopyDescription(unsigned int *a1)
{
  return CFStringCreateWithFormat(0, 0, @"<MSHRunLoopSource %p> {port = %x, callbacuint64_t k = %p}", a1, *a1, *((void *)a1 + 2));
}

BOOL mshEqual(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t mshGetPort(unsigned int *a1)
{
  return *a1;
}

uint64_t mshPerform(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return 0;
}

CFRunLoopSourceRef MSHCreateMIGServerSource(const __CFAllocator *a1, CFIndex a2, uint64_t a3, int a4, int a5, uint64_t a6)
{
  int v7 = a5;
  HIDWORD(v18.perform) = a5;
  uint64_t v12 = malloc_type_malloc(0x28uLL, 0x10A0040C7231A41uLL);
  v18.versiouint64_t n = 1;
  v18.info = v12;
  v18.retaiuint64_t n = 0;
  v18.release = (void (__cdecl *)(const void *))mshRelease;
  v18.copyDescriptiouint64_t n = (CFStringRef (__cdecl *)(const void *))mshCopyDescription;
  v18.equal = (Boolean (__cdecl *)(const void *, const void *))mshEqual;
  v18.hash = (CFHashCode (__cdecl *)(const void *))mshHash;
  v18.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))mshGetPort;
  v18.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))mshMIGPerform;
  ipc_space_t v13 = *MEMORY[0x1E4F14960];
  if (!v7)
  {
    if (mach_port_allocate(*MEMORY[0x1E4F14960], 1u, (mach_port_name_t *)&v18.perform + 1)) {
      goto LABEL_10;
    }
    if ((a4 & 4) == 0 && mach_port_insert_right(v13, HIDWORD(v18.perform), HIDWORD(v18.perform), 0x14u))
    {
      mach_port_name_t perform_high = HIDWORD(v18.perform);
      ipc_space_t v16 = v13;
      mach_port_right_t v17 = 1;
      goto LABEL_9;
    }
    a4 &= ~1u;
    int v7 = HIDWORD(v18.perform);
  }
  _DWORD *v12 = v7;
  v12[1] = a4;
  *((void *)v12 + 3) = 0;
  *((void *)v12 + 4) = a3;
  *((void *)v12 + 1) = a6;
  *((void *)v12 + 2) = 0;
  CFRunLoopSourceRef result = CFRunLoopSourceCreate(a1, a2, &v18);
  if (result) {
    return result;
  }
  if ((a4 & 1) == 0)
  {
    mach_port_mod_refs(v13, HIDWORD(v18.perform), 1u, -1);
    mach_port_name_t perform_high = HIDWORD(v18.perform);
    ipc_space_t v16 = v13;
    mach_port_right_t v17 = 0;
LABEL_9:
    mach_port_mod_refs(v16, perform_high, v17, -1);
  }
LABEL_10:
  free(v12);
  return 0;
}

uint64_t MSHGetMachPortFromSource(__CFRunLoopSource *a1)
{
  memset(&v2, 0, sizeof(v2));
  CFRunLoopSourceGetContext(a1, &v2);
  if (v2.version == 1) {
    return ((uint64_t (*)(void *))v2.schedule)(v2.info);
  }
  else {
    return 0;
  }
}

BOOL MSHMIGSourceSetNoSendersCallback(__CFRunLoopSource *a1, uint64_t a2, mach_port_mscount_t a3)
{
  kern_return_t v12;
  mach_port_t v13;
  ipc_space_t v14;
  mach_port_name_t v15;
  mach_port_mscount_t v16;
  mach_msg_type_name_t v17;
  mach_port_t previous;
  CFRunLoopSourceContext context;

  memset(&context, 0, sizeof(context));
  CFRunLoopSourceGetContext(a1, &context);
  info = context.info;
  if (context.info) {
    BOOL v7 = context.version == 1;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7) {
    return 0;
  }
  mach_port_name_t v9 = MSHGetMachPortFromSource(a1);
  previous = 0;
  ipc_space_t v10 = *MEMORY[0x1E4F14960];
  uint64_t v11 = info[2];
  if (a2)
  {
    if (!v11) {
      goto LABEL_13;
    }
    uint64_t v12 = mach_port_request_notification(*MEMORY[0x1E4F14960], v9, 70, 0, 0, 0x12u, &previous);
    if (v12)
    {
LABEL_15:
      info[2] = a2;
      goto LABEL_16;
    }
    ipc_space_t v13 = previous;
    if (previous)
    {
      uint64_t v14 = v10;
      uint64_t v15 = v9;
      ipc_space_t v16 = a3;
      mach_port_right_t v17 = 18;
    }
    else
    {
LABEL_13:
      uint64_t v14 = v10;
      uint64_t v15 = v9;
      ipc_space_t v16 = a3;
      ipc_space_t v13 = v9;
      mach_port_right_t v17 = 21;
    }
    uint64_t v12 = mach_port_request_notification(v14, v15, 70, v16, v13, v17, &previous);
    goto LABEL_15;
  }
  if (!v11) {
    return 0;
  }
  info[2] = 0;
  uint64_t v12 = mach_port_request_notification(v10, v9, 70, 0, 0, 0x12u, &previous);
LABEL_16:
  if (previous) {
    mach_port_mod_refs(v10, previous, 2u, -1);
  }
  return v12 == 0;
}

void MSHMIGSourceSetSendOnceCallback(__CFRunLoopSource *a1, uint64_t a2)
{
  memset(&v4, 0, sizeof(v4));
  CFRunLoopSourceGetContext(a1, &v4);
  if (v4.info) {
    BOOL v3 = v4.version == 1;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3) {
    *((void *)v4.info + 3) = a2;
  }
}

BOOL AXValidateDictionaryAsDragWireFormat(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  CFRunLoopSourceContext v2 = [v1 objectForKeyedSubscript:@"AXInteractionLocationDescriptorViewPointerNumberKey"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_6;
  }
  CFRunLoopSourceContext v4 = [v1 objectForKeyedSubscript:@"AXInteractionLocationDescriptorAttributedNameKey"];
  objc_opt_class();
  char v5 = objc_opt_isKindOfClass();

  if ((v5 & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v6 = [v1 objectForKeyedSubscript:@"AXInteractionLocationDescriptorPointValueKey"];
  CFTypeID v7 = CFGetTypeID(v6);
  CFTypeID TypeID = AXValueGetTypeID();

  if (v7 == TypeID)
  {
    mach_port_name_t v9 = [v1 objectForKeyedSubscript:@"AXInteractionLocationDescriptorPointValueKey"];
    BOOL v10 = AXValueGetType(v9) == kAXValueTypeCGPoint;
  }
  else
  {
LABEL_6:
    BOOL v10 = 0;
  }

  return v10;
}

uint64_t AXValidateDictionaryAsDropWireFormat(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  CFRunLoopSourceContext v2 = [v1 objectForKeyedSubscript:@"AXInteractionLocationDescriptorViewPointerNumberKey"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_11;
  }
  CFRunLoopSourceContext v4 = [v1 objectForKeyedSubscript:@"AXInteractionLocationDescriptorAttributedNameKey"];
  objc_opt_class();
  char v5 = objc_opt_isKindOfClass();

  if ((v5 & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v6 = [v1 objectForKeyedSubscript:@"AXInteractionLocationDescriptorPointValueKey"];
  CFTypeID v7 = CFGetTypeID(v6);
  CFTypeID TypeID = AXValueGetTypeID();

  if (v7 != TypeID) {
    goto LABEL_11;
  }
  mach_port_name_t v9 = [v1 objectForKeyedSubscript:@"AXInteractionLocationDescriptorPointValueKey"];
  AXValueType Type = AXValueGetType(v9);

  if (Type != kAXValueTypeCGPoint) {
    goto LABEL_11;
  }
  uint64_t v11 = [v1 objectForKeyedSubscript:@"AXInteractionLocationDescriptorContextSpacePointKey"];
  CFTypeID v12 = CFGetTypeID(v11);
  CFTypeID v13 = AXValueGetTypeID();

  if (v12 != v13) {
    goto LABEL_11;
  }
  uint64_t v14 = [v1 objectForKeyedSubscript:@"AXInteractionLocationDescriptorContextSpacePointKey"];
  AXValueType v15 = AXValueGetType(v14);

  if (v15 != kAXValueTypeCGPoint) {
    goto LABEL_11;
  }
  ipc_space_t v16 = [v1 objectForKeyedSubscript:@"AXInteractionLocationDescriptorFixedScreenSpacePointKey"];
  CFTypeID v17 = CFGetTypeID(v16);
  CFTypeID v18 = AXValueGetTypeID();

  if (v17 != v18) {
    goto LABEL_11;
  }
  CFDataRef v19 = [v1 objectForKeyedSubscript:@"AXInteractionLocationDescriptorFixedScreenSpacePointKey"];
  AXValueType v20 = AXValueGetType(v19);

  if (v20 == kAXValueTypeCGPoint)
  {
    CFAllocatorRef v21 = [v1 objectForKeyedSubscript:@"AXInteractionLocationDescriptorContextIDKey"];
    objc_opt_class();
    char v22 = objc_opt_isKindOfClass();
  }
  else
  {
LABEL_11:
    char v22 = 0;
  }

  return v22 & 1;
}

uint64_t AXGetCFAttributedStringFromAXAttributedString(void *a1)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [a1 cfAttributedString];
}

uint64_t AXIsAXAttributedString()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t AXCreateAXAttributedStringFromCFAttributedString(uint64_t a1)
{
  CFRunLoopSourceContext v2 = [AXAttributedString alloc];
  return (uint64_t)[(AXAttributedString *)v2 initWithCFAttributedString:a1];
}

void sub_1BA674B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_1BA674D44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id AXStringFromAXAttributedString(void *a1)
{
  id v1 = a1;
  if ([v1 isAXAttributedString])
  {
    id v2 = [v1 string];
  }
  else
  {
    id v2 = v1;
  }
  BOOL v3 = v2;

  return v3;
}

void _AXInitializeObserverAccess()
{
  if (_AXInitializeObserverAccess_onceToken != -1) {
    dispatch_once(&_AXInitializeObserverAccess_onceToken, &__block_literal_global_6);
  }
}

uint64_t _AXIgnoreNextNotification(uint64_t result)
{
  AXIgnoredNotificatiouint64_t n = result;
  return result;
}

uint64_t _AXUIElementRegisterNotificationObserverDiedCallback(void *a1)
{
  if (_AXUIElementRegisterNotificationObserverDiedCallback_observerDiedRegistered) {
    return 4294942092;
  }
  uint64_t result = 0;
  ObserverDiedCallbacuint64_t k = a1;
  _AXUIElementRegisterNotificationObserverDiedCallback_observerDiedRegistered = 1;
  return result;
}

uint64_t _AXAddNotificationObserver()
{
  if (_AXInitializeObserverAccess_onceToken != -1) {
    dispatch_once(&_AXInitializeObserverAccess_onceToken, &__block_literal_global_6);
  }
  return AX_PERFORM_WITH_LOCK();
}

uint64_t _AXRemoveNotificationObserver()
{
  if (_AXInitializeObserverAccess_onceToken != -1) {
    dispatch_once(&_AXInitializeObserverAccess_onceToken, &__block_literal_global_6);
  }
  return AX_PERFORM_WITH_LOCK();
}

void _AXNotificationObserverClientDied(CFTypeRef cf)
{
  if (_AXInitializeObserverAccess_onceToken == -1)
  {
    if (!cf) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&_AXInitializeObserverAccess_onceToken, &__block_literal_global_6);
  if (cf) {
LABEL_3:
  }
    CFRetain(cf);
LABEL_4:
  uint64_t v11 = 0;
  CFTypeID v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  CFTypeID v7 = ___AXNotificationObserverClientDied_block_invoke;
  BOOL v8 = &unk_1E62204B0;
  mach_port_name_t v9 = &v11;
  CFTypeRef v10 = cf;
  AX_PERFORM_WITH_LOCK();
  if (*((unsigned char *)v12 + 24))
  {
    id v2 = AXRuntimeLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)CFRunLoopSourceContext v4 = 0;
      _os_log_impl(&dword_1BA657000, v2, OS_LOG_TYPE_INFO, "No more observers waiting to be disabled, turning off automation", v4, 2u);
    }

    _AXSAutomationLocalizedStringLookupInfoSetEnabled();
    _AXSSetAutomationEnabled();
    _AXSSetAuditInspectionModeEnabled();
  }
  else
  {
    BOOL v3 = AXRuntimeLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)CFRunLoopSourceContext v4 = 0;
      _os_log_impl(&dword_1BA657000, v3, OS_LOG_TYPE_INFO, "Automation disablement remaining: ", v4, 2u);
    }
  }
  if (ObserverDiedCallback) {
    ObserverDiedCallback(cf);
  }
  if (cf) {
    CFRelease(cf);
  }
  _Block_object_dispose(&v11, 8);
}

void sub_1BA675EF4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void AXTentativePidSuspend(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  CFRunLoopSourceContext v4 = AXRuntimeLogPID();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v11 = a1;
    __int16 v12 = 2112;
    uint64_t v13 = @"<redacted>";
    _os_log_impl(&dword_1BA657000, v4, OS_LOG_TYPE_INFO, "Tentative pid suspend: %d Name:%@", buf, 0x12u);
  }

  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", a1, @"pid");
  v9[0] = v5;
  v9[1] = @"tentative-suspended";
  v8[1] = @"suspended-status";
  v8[2] = @"display-type";
  uint64_t v6 = [NSNumber numberWithInt:a2];
  v9[2] = v6;
  CFTypeID v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  AXPushNotificationToSystemForBroadcast();
}

uint64_t _AXPidIsAssociatedInternal(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_unfair_lock_lock(&gAXSuspendedPidsLock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        mach_port_name_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
        CFTypeRef v10 = +[AXPidSuspensionInfo shared];
        int v11 = objc_msgSend(v10, "associatedRemotePidCacheForDisplay:", objc_msgSend(v9, "intValue"));

        __int16 v12 = [NSNumber numberWithInt:a1];
        char v13 = [v11 containsObject:v12];

        if (v13)
        {
          uint64_t v14 = 1;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 0;
LABEL_11:

  os_unfair_lock_unlock(&gAXSuspendedPidsLock);
  return v14;
}

uint64_t _AXIsPidAssociated(uint64_t a1)
{
  id v2 = _allDisplayTypes();
  IsAssociateduint64_t Internal = _AXPidIsAssociatedInternal(a1, v2);

  return IsAssociatedInternal;
}

uint64_t _AXIsPidAssociatedWithDisplayType(uint64_t a1, uint64_t a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = [NSNumber numberWithInt:a2];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  IsAssociateduint64_t Internal = _AXPidIsAssociatedInternal(a1, v4);

  return IsAssociatedInternal;
}

uint64_t _AXPidIsSuspendedWithDisplayType(uint64_t a1, uint64_t a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = [NSNumber numberWithInt:a2];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  uint64_t IsSuspendedInternal = _AXPidIsSuspendedInternal(a1, v4);

  return IsSuspendedInternal;
}

void _AXPutPidOnTimeoutProbation(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = AXRuntimeLogPID();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v13 = a1;
    _os_log_impl(&dword_1BA657000, v4, OS_LOG_TYPE_INFO, "Pid on timeout probation %d", buf, 8u);
  }

  os_unfair_lock_lock(&gAXTimeoutProbationPidsLock);
  uint64_t v5 = +[AXPidSuspensionInfo shared];
  uint64_t v6 = [v5 timeoutProbationPidsForDisplay:a2];

  uint64_t v7 = [NSNumber numberWithInt:a1];
  [v6 addObject:v7];

  dispatch_time_t v8 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___AXPutPidOnTimeoutProbation_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  int v10 = a1;
  int v11 = a2;
  dispatch_after(v8, MEMORY[0x1E4F14428], block);
  os_unfair_lock_unlock(&gAXTimeoutProbationPidsLock);
}

void _AXAddAssociatedPid(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = AXRuntimeLogPID();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    int v22 = a2;
    __int16 v23 = 1024;
    int v24 = a1;
    _os_log_impl(&dword_1BA657000, v6, OS_LOG_TYPE_INFO, "Associating pid (%d) with parent: (%d)", buf, 0xEu);
  }

  os_unfair_lock_lock(&gAXSuspendedPidsLock);
  dispatch_time_t v7 = dispatch_time(0, 300000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___AXAddAssociatedPid_block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  int v20 = a3;
  dispatch_after(v7, MEMORY[0x1E4F14428], block);
  dispatch_time_t v8 = +[AXPidSuspensionInfo shared];
  mach_port_name_t v9 = [v8 associatedRemotePidsForDisplay:a3];
  int v10 = [NSNumber numberWithInt:a1];
  int v11 = [v9 objectForKey:v10];

  if (!v11)
  {
    int v11 = [MEMORY[0x1E4F1CA80] set];
    __int16 v12 = +[AXPidSuspensionInfo shared];
    int v13 = [v12 associatedRemotePidsForDisplay:a3];
    uint64_t v14 = [NSNumber numberWithInt:a1];
    [v13 setObject:v11 forKey:v14];
  }
  AXValueType v15 = [NSNumber numberWithInt:a2];
  [v11 addObject:v15];

  long long v16 = +[AXPidSuspensionInfo shared];
  long long v17 = [v16 associatedRemotePidCacheForDisplay:a3];
  long long v18 = [NSNumber numberWithInt:a2];
  [v17 addObject:v18];

  os_unfair_lock_unlock(&gAXSuspendedPidsLock);
}

void _AXClearAssociatedPids(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v2 = AXRuntimeLogPID();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA657000, v2, OS_LOG_TYPE_INFO, "Clearing associated pids", buf, 2u);
  }

  os_unfair_lock_lock(&gAXSuspendedPidsLock);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v3 = +[AXPidSuspensionInfo shared];
  id v4 = [v3 associatedRemotePidsForDisplay:a1];
  uint64_t v5 = [v4 allKeys];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        int v11 = +[AXPidSuspensionInfo shared];
        __int16 v12 = [v11 associatedRemotePidsForDisplay:a1];
        int v13 = [v12 objectForKey:v10];

        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v37 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v29;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v29 != v17) {
                objc_enumerationMutation(v14);
              }
              long long v19 = *(void **)(*((void *)&v28 + 1) + 8 * j);
              if (([v19 isEqual:v10] & 1) == 0) {
                _AXRemoveSuspendedPid([v19 unsignedIntValue], a1);
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v37 count:16];
          }
          while (v16);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v7);
  }

  int v20 = +[AXPidSuspensionInfo shared];
  uint64_t v21 = [v20 associatedRemotePidsForDisplay:a1];
  [v21 removeAllObjects];

  int v22 = +[AXPidSuspensionInfo shared];
  __int16 v23 = [v22 associatedRemotePidCacheForDisplay:a1];
  [v23 removeAllObjects];

  os_unfair_lock_unlock(&gAXSuspendedPidsLock);
  dispatch_time_t v24 = dispatch_time(0, 300000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___AXClearAssociatedPids_block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  int v27 = a1;
  dispatch_after(v24, MEMORY[0x1E4F14428], block);
}

void ___displayMonitor_block_invoke()
{
  if (!_AXSMossdeepEnabled())
  {
    uint64_t v5 = 0;
    uint64_t v6 = &v5;
    uint64_t v7 = 0x2050000000;
    int v0 = (void *)getFBSDisplayMonitorClass_softClass;
    uint64_t v8 = getFBSDisplayMonitorClass_softClass;
    if (!getFBSDisplayMonitorClass_softClass)
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __getFBSDisplayMonitorClass_block_invoke;
      void v4[3] = &unk_1E6220520;
      v4[4] = &v5;
      __getFBSDisplayMonitorClass_block_invoke((uint64_t)v4);
      int v0 = (void *)v6[3];
    }
    id v1 = v0;
    _Block_object_dispose(&v5, 8);
    uint64_t v2 = objc_opt_new();
    id v3 = (void *)_displayMonitor_DisplayMonitor;
    _displayMonitor_DisplayMonitor = v2;
  }
}

void sub_1BA6773E8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  if (a2 == 1)
  {
    id v10 = objc_begin_catch(a1);
    int v11 = [v10 name];
    char v12 = [v11 isEqualToString:*MEMORY[0x1E4F1C3B8]];

    if (v12)
    {

      objc_end_catch();
      JUMPOUT(0x1BA6773D4);
    }
    objc_exception_rethrow();
  }
  _Unwind_Resume(a1);
}

Class __getFBSDisplayMonitorClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    void v3[2] = (void *)3221225472;
    v3[3] = __FrontBoardServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E62207A8;
    uint64_t v5 = 0;
    FrontBoardServicesLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  if (!FrontBoardServicesLibraryCore_frameworkLibrary) {
    __getFBSDisplayMonitorClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("FBSDisplayMonitor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getFBSDisplayMonitorClass_block_invoke_cold_2();
  }
  getFBSDisplayMonitorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __FrontBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  FrontBoardServicesLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

id AXLabelForElements(void *a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (![v1 count])
  {
    id v5 = [NSString string];
    goto LABEL_43;
  }
  long long v29 = [MEMORY[0x1E4F28E78] string];
  unint64_t v2 = [v1 count];
  id v3 = [v1 firstObject];
  _AXLabelForElement(v3);
  long long v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    long long v4 = &stru_1F141B5A8;
  }
  if (![(__CFString *)v4 length]) {
    goto LABEL_9;
  }
  if (![(__CFString *)v4 isAXAttributedString])
  {
    [v29 appendString:v4];
LABEL_9:
    long long v30 = 0;
    goto LABEL_10;
  }
  uint64_t v42 = 0;
  _appendAttributedString(v29, v4, &v42);
  long long v30 = v42;
LABEL_10:
  objc_opt_class();
  if (v2 < 2)
  {
    uint64_t v7 = v29;
  }
  else
  {
    uint64_t v6 = 1;
    uint64_t v7 = v29;
    do
    {
      uint64_t v8 = [v1 objectAtIndex:v6];
      mach_port_name_t v9 = _AXLabelForElement(v8);

      if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 length])
      {
        if ([v9 isAXAttributedString])
        {
          int8x16_t v41 = v30;
          _appendAttributedString(v29, v9, &v41);
          id v10 = v41;

          long long v30 = v10;
        }
        else
        {
          if ([v29 length]) {
            [v29 appendString:@", "];
          }
          [v29 appendString:v9];
        }
      }

      ++v6;
    }
    while (v2 != v6);
  }
  int v11 = v30;
  if (v30)
  {
    uint64_t v26 = v4;
    int v27 = v3;
    id v28 = v1;
    char v12 = +[AXAttributedString axAttributedStringWithString:v7];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v13 = v30;
    uint64_t v32 = [v13 countByEnumeratingWithState:&v37 objects:v44 count:16];
    if (v32)
    {
      uint64_t v31 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v38 != v31) {
            objc_enumerationMutation(v13);
          }
          uint64_t v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v16 = [v13 objectForKey:v15];
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v43 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v34;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v34 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = *(void *)(*((void *)&v33 + 1) + 8 * j);
                int v22 = [v16 objectForKey:v21];
                uint64_t v23 = [v15 rangeValue];
                objc_msgSend(v12, "setAttribute:forKey:withRange:", v22, v21, v23, v24);
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v43 count:16];
            }
            while (v18);
          }
        }
        uint64_t v32 = [v13 countByEnumeratingWithState:&v37 objects:v44 count:16];
      }
      while (v32);
    }

    id v3 = v27;
    id v1 = v28;
    long long v4 = v26;
    int v11 = v30;
  }
  else
  {
    char v12 = v7;
  }
  if ([v12 length]) {
    id v5 = v12;
  }
  else {
    id v5 = 0;
  }

LABEL_43:
  return v5;
}

AXAttributedString *_AXLabelForElement(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  unint64_t v2 = v1;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    unint64_t v2 = v1;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v3 = v1;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v4 = [(AXAttributedString *)v3 _accessibilityAXAttributedLabel];
      }
      else
      {
        if (objc_opt_respondsToSelector())
        {
          uint64_t v5 = [(AXAttributedString *)v3 accessibilityAttributedLabel];
          if (v5)
          {
            uint64_t v6 = (void *)v5;
            unint64_t v2 = [[AXAttributedString alloc] initWithCFAttributedString:v5];

LABEL_10:
            goto LABEL_11;
          }
        }
        uint64_t v4 = [(AXAttributedString *)v3 accessibilityLabel];
      }
      unint64_t v2 = (AXAttributedString *)v4;
      goto LABEL_10;
    }
  }
LABEL_11:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = AXCreateAXAttributedStringFromCFAttributedString((uint64_t)v2);

    unint64_t v2 = (AXAttributedString *)v7;
  }

  return v2;
}

void _appendAttributedString(void *a1, void *a2, void **a3)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  int v27 = a3;
  if (!*a3) {
    *a3 = (id)[objc_allocWithZone(MEMORY[0x1E4F1CA60]) init];
  }
  uint64_t v7 = [v5 length];
  BOOL v8 = v7 != 0;
  if (v7) {
    [v5 appendString:@", "];
  }
  unint64_t v29 = 0;
  uint64_t v30 = 0;
  unint64_t v28 = [v6 length];
  unint64_t v9 = 0;
  id v26 = v5;
  while (1)
  {
    id v10 = objc_msgSend(v6, "attributesAtIndex:effectiveRange:", v9, &v29, v26);
    int v11 = v10;
    if (v29 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    char v12 = [v6 string];
    id v13 = objc_msgSend(v12, "substringWithRange:", v29, v30);

    if (v11)
    {
      uint64_t v14 = [v5 length];
      uint64_t v15 = [v13 length];
      if (v8)
      {
        uint64_t v16 = [v11 objectForKeyedSubscript:UIAccessibilityTokenLiteralText];
        int v17 = [v16 BOOLValue];

        uint64_t v18 = v14 - objc_msgSend(@", ", "length");
        uint64_t v19 = objc_msgSend(@", ", "length");
        uint64_t v20 = v19;
        if (v17)
        {
          uint64_t v21 = *v27;
          uint64_t v31 = UIAccessibilityTokenIgnoreLeadingCommas;
          v32[0] = MEMORY[0x1E4F1CC38];
          BOOL v8 = 1;
          int v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
          uint64_t v23 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v18, v20);
          [v21 setObject:v22 forKey:v23];
        }
        else
        {
          BOOL v8 = 0;
          v15 += v19;
          uint64_t v14 = v18;
        }
        id v5 = v26;
      }
      else
      {
        BOOL v8 = 0;
      }
      uint64_t v24 = *v27;
      uint64_t v25 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v14, v15);
      [v24 setObject:v11 forKey:v25];
    }
    [v5 appendString:v13];
    v29 += v30;

    unint64_t v9 = v29;
    if (v29 == 0x7FFFFFFFFFFFFFFFLL || v29 >= v28) {
      goto LABEL_19;
    }
  }

LABEL_19:
}

id AXLabelAndValueForElements(void *a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (![v1 count])
  {
    id v5 = [NSString string];
    goto LABEL_43;
  }
  unint64_t v29 = [MEMORY[0x1E4F28E78] string];
  unint64_t v2 = [v1 count];
  id v3 = [v1 firstObject];
  _AXLabelAndValueForElement(v3);
  uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v4 = &stru_1F141B5A8;
  }
  if (![(__CFString *)v4 length]) {
    goto LABEL_9;
  }
  if (![(__CFString *)v4 isAXAttributedString])
  {
    [v29 appendString:v4];
LABEL_9:
    uint64_t v30 = 0;
    goto LABEL_10;
  }
  uint64_t v42 = 0;
  _appendAttributedString(v29, v4, &v42);
  uint64_t v30 = v42;
LABEL_10:
  objc_opt_class();
  if (v2 < 2)
  {
    uint64_t v7 = v29;
  }
  else
  {
    uint64_t v6 = 1;
    uint64_t v7 = v29;
    do
    {
      BOOL v8 = [v1 objectAtIndex:v6];
      unint64_t v9 = _AXLabelAndValueForElement(v8);

      if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 length])
      {
        if ([v9 isAXAttributedString])
        {
          int8x16_t v41 = v30;
          _appendAttributedString(v29, v9, &v41);
          id v10 = v41;

          uint64_t v30 = v10;
        }
        else
        {
          if ([v29 length]) {
            [v29 appendString:@", "];
          }
          [v29 appendString:v9];
        }
      }

      ++v6;
    }
    while (v2 != v6);
  }
  int v11 = v30;
  if (v30)
  {
    id v26 = v4;
    int v27 = v3;
    id v28 = v1;
    char v12 = +[AXAttributedString axAttributedStringWithString:v7];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v13 = v30;
    uint64_t v32 = [v13 countByEnumeratingWithState:&v37 objects:v44 count:16];
    if (v32)
    {
      uint64_t v31 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v38 != v31) {
            objc_enumerationMutation(v13);
          }
          uint64_t v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v16 = [v13 objectForKey:v15];
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v43 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v34;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v34 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = *(void *)(*((void *)&v33 + 1) + 8 * j);
                int v22 = [v16 objectForKey:v21];
                uint64_t v23 = [v15 rangeValue];
                objc_msgSend(v12, "setAttribute:forKey:withRange:", v22, v21, v23, v24);
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v43 count:16];
            }
            while (v18);
          }
        }
        uint64_t v32 = [v13 countByEnumeratingWithState:&v37 objects:v44 count:16];
      }
      while (v32);
    }

    id v3 = v27;
    id v1 = v28;
    uint64_t v4 = v26;
    int v11 = v30;
  }
  else
  {
    char v12 = v7;
  }
  if ([v12 length]) {
    id v5 = v12;
  }
  else {
    id v5 = 0;
  }

LABEL_43:
  return v5;
}

id _AXLabelAndValueForElement(void *a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  unint64_t v2 = [MEMORY[0x1E4F28E78] string];
  id v3 = _AXLabelForElement(v1);
  uint64_t v4 = (AXAttributedString *)v1;
  objc_opt_class();
  id v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    id v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v6 = v4;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v7 = [(AXAttributedString *)v6 _accessibilityAXAttributedValue];
      }
      else
      {
        if (objc_opt_respondsToSelector())
        {
          uint64_t v8 = [(AXAttributedString *)v6 accessibilityAttributedValue];
          if (v8)
          {
            unint64_t v9 = (void *)v8;
            id v5 = [[AXAttributedString alloc] initWithCFAttributedString:v8];

LABEL_10:
            goto LABEL_11;
          }
        }
        uint64_t v7 = [(AXAttributedString *)v6 accessibilityValue];
      }
      id v5 = (AXAttributedString *)v7;
      goto LABEL_10;
    }
  }
LABEL_11:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = AXCreateAXAttributedStringFromCFAttributedString((uint64_t)v5);

    id v5 = (AXAttributedString *)v10;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![v3 length]) {
    goto LABEL_18;
  }
  if (![v3 isAXAttributedString])
  {
    [v2 appendString:v3];
LABEL_18:
    int v11 = 0;
    goto LABEL_19;
  }
  uint64_t v42 = 0;
  _appendAttributedString(v2, v3, &v42);
  int v11 = v42;
LABEL_19:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![(AXAttributedString *)v5 length])
  {
LABEL_23:
    if (!v11) {
      goto LABEL_39;
    }
    goto LABEL_24;
  }
  if ([(AXAttributedString *)v5 isAXAttributedString])
  {
    int8x16_t v41 = v11;
    _appendAttributedString(v2, v5, &v41);
    char v12 = v41;

    int v11 = v12;
    goto LABEL_23;
  }
  if ([v2 length]) {
    [v2 appendString:@", "];
  }
  [v2 appendString:v5];
  if (v11)
  {
LABEL_24:
    int v27 = v5;
    id v28 = v2;
    unint64_t v29 = v4;
    uint64_t v30 = v3;
    unint64_t v2 = +[AXAttributedString axAttributedStringWithString:v2];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v26 = v11;
    id v13 = v11;
    uint64_t v32 = [v13 countByEnumeratingWithState:&v37 objects:v44 count:16];
    if (v32)
    {
      uint64_t v31 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v38 != v31) {
            objc_enumerationMutation(v13);
          }
          uint64_t v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v16 = [v13 objectForKey:v15];
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v43 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v34;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v34 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = *(void *)(*((void *)&v33 + 1) + 8 * j);
                int v22 = [v16 objectForKey:v21];
                uint64_t v23 = [v15 rangeValue];
                objc_msgSend(v2, "setAttribute:forKey:withRange:", v22, v21, v23, v24);
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v43 count:16];
            }
            while (v18);
          }
        }
        uint64_t v32 = [v13 countByEnumeratingWithState:&v37 objects:v44 count:16];
      }
      while (v32);
    }

    uint64_t v4 = v29;
    id v3 = v30;
    int v11 = v26;
    id v5 = v27;
  }
LABEL_39:

  return v2;
}

id __AXStringForVariables(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  unint64_t v9 = __AXStringForVariablesWithVariadics(a1, &a9);
  return v9;
}

id __AXStringForVariablesWithVariadics(void *a1, id *a2)
{
  id v3 = a1;
  uint64_t v10 = a2;
  objc_opt_class();
  uint64_t v4 = objc_opt_new();
  id v5 = v4;
  if (v3) {
    [v4 addObject:v3];
  }
  while (1)
  {
    uint64_t v6 = v10++;
    id v7 = *v6;
    if (!v7) {
      goto LABEL_7;
    }
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v7 isEqualToString:@"__AXStringForVariablesSentinel"] & 1) != 0)
    {
      break;
    }
    [v5 addObject:v7];
LABEL_7:
  }
  uint64_t v8 = AXLabelForElements(v5);

  return v8;
}

id AXArrayForString(void *a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ([v1 length])
  {
    v4[0] = v1;
    unint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    unint64_t v2 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v2;
}

void _gatherTransactionSummary()
{
  int v0 = [MEMORY[0x1E4F28F80] processInfo];
  id v1 = [v0 processName];
  int v2 = [&unk_1F1423FB0 containsObject:v1];

  if (v2)
  {
    id v3 = +[AXProfileDatabase sharedDatabase];
    id v12 = [v3 transactionSummary];

    id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v4 setDateFormat:@"yyyy-MM-dd_HH-mm-ss"];
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v6 = [v4 stringFromDate:v5];

    id v7 = NSString;
    uint64_t v8 = [MEMORY[0x1E4F28F80] processInfo];
    unint64_t v9 = [v8 processName];
    uint64_t v10 = [MEMORY[0x1E4F28F80] processInfo];
    int v11 = [v7 stringWithFormat:@"/var/mobile/Library/Accessibility/axperf_%@_%d_%@.csv", v9, objc_msgSend(v10, "processIdentifier"), v6];

    [v12 writeToFile:v11 atomically:1 encoding:4 error:0];
  }
}

void sub_1BA67AD9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA67B480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Block_object_dispose((const void *)(v29 - 192), 8);
  _Unwind_Resume(a1);
}

id AXRemoteElementConcatSceneUUIDAndContextId(void *a1, uint64_t a2)
{
  id v3 = NSNumber;
  id v4 = a1;
  id v5 = [v3 numberWithUnsignedInt:a2];
  uint64_t v6 = [v4 stringByAppendingFormat:@"_%@", v5];

  return v6;
}

id AXUIElementConvertOutgoingType(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    int v2 = self;
    if (objc_opt_isKindOfClass())
    {
LABEL_5:

      goto LABEL_6;
    }
    id v3 = self;
    if (objc_opt_isKindOfClass())
    {

      goto LABEL_5;
    }
    uint64_t v6 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v1 = v1;
        uint64_t v8 = (const char *)[v1 objCType];
        if (!strcmp(v8, "{CGRect={CGPoint=dd}{CGSize=dd}}"))
        {
          [v1 rectValue];
          uint64_t valuePtr = v17;
          uint64_t v32 = v18;
          uint64_t v33 = v19;
          uint64_t v34 = v20;
          AXValueType v10 = kAXValueTypeCGRect;
        }
        else if (!strcmp(v8, "{CGPoint=dd}"))
        {
          [v1 pointValue];
          uint64_t valuePtr = v21;
          uint64_t v32 = v22;
          AXValueType v10 = kAXValueTypeCGPoint;
        }
        else if (!strcmp(v8, "{CGSize=dd}"))
        {
          [v1 sizeValue];
          uint64_t valuePtr = v23;
          uint64_t v32 = v24;
          AXValueType v10 = kAXValueTypeCGSize;
        }
        else
        {
          if (strcmp(v8, "{_NSRange=QQ}")) {
            goto LABEL_6;
          }
          uint64_t valuePtr = [v1 rangeValue];
          uint64_t v32 = v9;
          AXValueType v10 = kAXValueTypeCFRange;
        }
        AXValueRef v25 = AXValueCreate(v10, &valuePtr);
        CFAutorelease(v25);
        id v13 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_24;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v11 = (void *)[v1 mutableCopy];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        long long v29[2] = __AXUIElementConvertOutgoingType_block_invoke;
        v29[3] = &unk_1E6220928;
        id v12 = v11;
        id v30 = v12;
        [v1 enumerateObjectsUsingBlock:v29];
        id v13 = v12;

LABEL_24:
        id v1 = v13;
        goto LABEL_6;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = (void *)[v1 mutableCopy];
        uint64_t v15 = [v14 allKeys];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        long long v26[2] = __AXUIElementConvertOutgoingType_block_invoke_2;
        v26[3] = &unk_1E62209E0;
        id v16 = v14;
        id v27 = v16;
        id v28 = v1;
        [v15 enumerateObjectsUsingBlock:v26];

        id v1 = v16;
      }
    }
  }
LABEL_6:
  id v4 = v1;

  return v4;
}

void __AXUIElementConvertOutgoingType_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  AXUIElementConvertOutgoingType(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v5 atIndexedSubscript:a3];
}

void __AXUIElementConvertOutgoingType_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v6 = [v3 objectForKeyedSubscript:v4];
  id v5 = AXUIElementConvertOutgoingType(v6);
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
}

void sub_1BA67E244(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA67E2A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA67E34C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA67E414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1BA67E7A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BA67E8D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  objc_sync_exit(v15);
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

void sub_1BA67EDA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AXBundleForElement(void *a1, const char *a2)
{
  return [a1 stringWithAXAttribute:3003];
}

void sub_1BA6819EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA6848A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1BA6852FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1BA6863C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,void *a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,void *a54,void *a55,uint64_t a56,void *a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,void *a63)
{
  _Unwind_Resume(a1);
}

void sub_1BA6866B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA686A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __copy_helper_block_e8_96n12_8_8_s0_t8w32144n15_8_8_s0_s8_t16w8(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 96) = *(id *)(a2 + 96);
  long long v4 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = v4;
  *(void *)(a1 + 144) = *(id *)(a2 + 144);
  id result = *(id *)(a2 + 152);
  *(void *)(a1 + 152) = result;
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  return result;
}

void __destroy_helper_block_e8_96n4_8_s0144n7_8_s0_s8(uint64_t a1)
{
  int v2 = *(void **)(a1 + 96);
}

void sub_1BA68744C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA687C1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA688210(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

Class __getAXPIFingerControllerClass_block_invoke(uint64_t a1)
{
  AccessibilityPhysicalInteractionLibrary();
  Class result = objc_getClass("AXPIFingerController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXPIFingerControllerClass_block_invoke_cold_1();
  }
  getAXPIFingerControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void AccessibilityPhysicalInteractionLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!AccessibilityPhysicalInteractionLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __AccessibilityPhysicalInteractionLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E6220BE8;
    uint64_t v2 = 0;
    AccessibilityPhysicalInteractionLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  if (!AccessibilityPhysicalInteractionLibraryCore_frameworkLibrary) {
    AccessibilityPhysicalInteractionLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __AccessibilityPhysicalInteractionLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityPhysicalInteractionLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

Class __getAXMTextDetectionOptionsClass_block_invoke(uint64_t a1)
{
  AXMediaUtilitiesLibrary();
  Class result = objc_getClass("AXMTextDetectionOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXMTextDetectionOptionsClass_block_invoke_cold_1();
  }
  getAXMTextDetectionOptionsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AXMediaUtilitiesLibrary()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 0;
  if (!AXMediaUtilitiesLibraryCore_frameworkLibrary)
  {
    v2[1] = (void *)MEMORY[0x1E4F143A8];
    v2[2] = (void *)3221225472;
    v2[3] = __AXMediaUtilitiesLibraryCore_block_invoke;
    v2[4] = &__block_descriptor_40_e5_v8__0l;
    v2[5] = v2;
    long long v3 = xmmword_1E6220C00;
    uint64_t v4 = 0;
    AXMediaUtilitiesLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  uint64_t v0 = AXMediaUtilitiesLibraryCore_frameworkLibrary;
  if (!AXMediaUtilitiesLibraryCore_frameworkLibrary) {
    AXMediaUtilitiesLibrary_cold_1(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t __AXMediaUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AXMediaUtilitiesLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

Class __getAXMDisplayManagerClass_block_invoke(uint64_t a1)
{
  AXMediaUtilitiesLibrary();
  Class result = objc_getClass("AXMDisplayManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXMDisplayManagerClass_block_invoke_cold_1();
  }
  getAXMDisplayManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXMVisionScreenRecognitionOptionsClass_block_invoke(uint64_t a1)
{
  AXMediaUtilitiesLibrary();
  Class result = objc_getClass("AXMVisionScreenRecognitionOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXMVisionScreenRecognitionOptionsClass_block_invoke_cold_1();
  }
  getAXMVisionScreenRecognitionOptionsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXMScreenRecognitionCenterClass_block_invoke(uint64_t a1)
{
  AXMediaUtilitiesLibrary();
  Class result = objc_getClass("AXMScreenRecognitionCenter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXMScreenRecognitionCenterClass_block_invoke_cold_1();
  }
  getAXMScreenRecognitionCenterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXMVisionFeatureClass_block_invoke(uint64_t a1)
{
  AXMediaUtilitiesLibrary();
  Class result = objc_getClass("AXMVisionFeature");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXMVisionFeatureClass_block_invoke_cold_1();
  }
  getAXMVisionFeatureClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXSettingsClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    void v3[2] = (void *)3221225472;
    v3[3] = __AccessibilityUtilitiesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E6220C18;
    uint64_t v5 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary) {
    __getAXSettingsClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("AXSettings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXSettingsClass_block_invoke_cold_2();
  }
  getAXSettingsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

void *__getAXMIntersectionOverUnionSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "AXMIntersectionOverUnion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXMIntersectionOverUnionSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXMRatioOfIntersectedAreaToSmallerRectAreaSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)AXMediaUtilitiesLibrary();
  uint64_t result = dlsym(v2, "AXMRatioOfIntersectedAreaToSmallerRectArea");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXMRatioOfIntersectedAreaToSmallerRectAreaSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

Class __getAXNamedReplayableGestureClass_block_invoke(uint64_t a1)
{
  AccessibilityPhysicalInteractionLibrary();
  Class result = objc_getClass("AXNamedReplayableGesture");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXNamedReplayableGestureClass_block_invoke_cold_1();
  }
  getAXNamedReplayableGestureClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void _accessibilityEventsHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = objc_msgSend((id)Handlers, "allKeys", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = [(id)Handlers objectForKey:*(void *)(*((void *)&v13 + 1) + 8 * v10)];
        id v12 = [v11 objectForKey:@"handler"];

        if (v12) {
          v12[2](v12, a3, a4);
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

void AX_CGPathEnumerateElementsUsingBlock(const CGPath *a1, void *a2)
{
  id v3 = a2;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  char v12 = 0;
  v10[0] = 0;
  v10[1] = v10;
  void v10[2] = 0x2020000000;
  void v10[3] = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __AX_CGPathEnumerateElementsUsingBlock_block_invoke;
  aBlock[3] = &unk_1E6220C60;
  uint64_t v8 = v11;
  id v4 = v3;
  id v7 = v4;
  uint64_t v9 = v10;
  uint64_t v5 = _Block_copy(aBlock);
  CGPathApply(a1, v5, (CGPathApplierFunction)_CGPathEnumerationIteration);

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v11, 8);
}

void sub_1BA68A7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void _CGPathEnumerationIteration(const void *a1, uint64_t a2)
{
  id v3 = (void (**)(id, void))_Block_copy(a1);
  v3[2](v3, a2);
}

void sub_1BA68EBD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXCustomContentClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!AccessibilityLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    void v3[2] = (void *)3221225472;
    v3[3] = __AccessibilityLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E6220CC8;
    uint64_t v5 = 0;
    AccessibilityLibraryCore_frameworkLibrarCGFloat y = _sl_dlopen();
  }
  if (!AccessibilityLibraryCore_frameworkLibrary) {
    __getAXCustomContentClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("AXCustomContent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getAXCustomContentClass_block_invoke_cold_2();
  }
  getAXCustomContentClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityLibraryCore_frameworkLibrarCGFloat y = result;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void _accessibilityEventsHandler_0(uint64_t a1, uint64_t a2, int a3, const void *a4, void *a5)
{
  id v8 = a5;
  if (a3 > 1043)
  {
    if (a3 <= 1054)
    {
      if (a3 == 1044)
      {
        [v8 _handleUpdateElementVisuals:a4];
      }
      else if (a3 == 1053)
      {
        [v8 _handleNativeFocusItemDidChange:a4];
      }
    }
    else
    {
      switch(a3)
      {
        case 1055:
          [v8 _handleScreenWillChange:a4];
          break;
        case 3029:
          [v8 _handleMediaDidBegin:a4];
          break;
        case 5000:
          [v8 _handleApplicationWasActivated:a4];
          break;
      }
    }
  }
  else
  {
    uint64_t v7 = 16;
    switch(a3)
    {
      case 1000:
        uint64_t v7 = 8;
        goto LABEL_14;
      case 1001:
        if (a4)
        {
          if (CFEqual(a4, kAXForceUpdateChangeToken[0])) {
            uint64_t v7 = 256;
          }
          else {
            uint64_t v7 = 4;
          }
        }
        else
        {
          uint64_t v7 = 4;
        }
        goto LABEL_14;
      case 1006:
        uint64_t v7 = 64;
        goto LABEL_14;
      case 1009:
        uint64_t v7 = 128;
        goto LABEL_14;
      case 1011:
LABEL_14:
        [v8 _fetchEventOccurred:v7];
        break;
      default:
        break;
    }
  }
}

void sub_1BA691D14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a2 == 1)
  {
    id v9 = objc_begin_catch(exception_object);
    NSLog((NSString *)@"Exception handling accessibility event: %@");

    objc_end_catch();
    JUMPOUT(0x1BA691C84);
  }
  _Unwind_Resume(exception_object);
}

void sub_1BA6924E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_1BA6935EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA6953B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA695DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1BA696F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

CFTypeID __smugglingDictionaryForCoreFoundationObject_block_invoke()
{
  smugglingDictionaryForCoreFoundationObject_CFBooleanCFTypeID TypeID = CFBooleanGetTypeID();
  smugglingDictionaryForCoreFoundationObject_CFUUIDCFTypeID TypeID = CFUUIDGetTypeID();
  smugglingDictionaryForCoreFoundationObject_AXUIElementCFTypeID TypeID = AXUIElementGetTypeID();
  smugglingDictionaryForCoreFoundationObject_AXValueCFTypeID TypeID = AXValueGetTypeID();
  smugglingDictionaryForCoreFoundationObject_CGColorCFTypeID TypeID = CGColorGetTypeID();
  smugglingDictionaryForCoreFoundationObject_CGPathCFTypeID TypeID = CGPathGetTypeID();
  smugglingDictionaryForCoreFoundationObject_CTFontCFTypeID TypeID = CTFontGetTypeID();
  smugglingDictionaryForCoreFoundationObject_CFNullCFTypeID TypeID = CFNullGetTypeID();
  CFTypeID result = CFURLGetTypeID();
  smugglingDictionaryForCoreFoundationObject_CFURLCFTypeID TypeID = result;
  return result;
}

id smugglingDictionaryForCFUUID(const __CFUUID *a1)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  CFUUIDBytes v4 = CFUUIDGetUUIDBytes(a1);
  long long v1 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v4 length:16];
  v5[0] = @"SmugType";
  v5[1] = @"Value";
  v6[0] = AXSerializeSmuggledTypeCFUUID;
  v6[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v2;
}

id smugglingDictionaryForCGPath(const CGPath *a1)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  int v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __smugglingDictionaryForCGPath_block_invoke;
  block[3] = &unk_1E6220F38;
  void block[4] = v9;
  CGPathApplyWithBlock(a1, block);
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __smugglingDictionaryForCGPath_block_invoke_2;
  void v6[3] = &unk_1E6220F60;
  id v3 = v2;
  id v7 = v3;
  CGPathApplyWithBlock(a1, v6);
  v11[0] = @"SmugType";
  v11[1] = @"Value";
  v12[0] = AXSerializeSmuggledTypeCGPath;
  v12[1] = v3;
  CFUUIDBytes v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  _Block_object_dispose(v9, 8);
  return v4;
}

void sub_1BA69759C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id smugglingDictionaryForCTFont(const __CTFont *a1, uint64_t a2)
{
  void v12[3] = *MEMORY[0x1E4F143B8];
  double Size = CTFontGetSize(a1);
  uint64_t v5 = CTFontCopyFontDescriptor(a1);
  CFDictionaryRef v6 = CTFontDescriptorCopyAttributes(v5);
  if (v5) {
    CFRelease(v5);
  }
  id v7 = [(__CFDictionary *)v6 _axRecursivelyPropertyListCoercedRepresentationWithError:a2];

  if (v7)
  {
    v12[0] = AXSerializeSmuggledTypeCTFont;
    v11[0] = @"SmugType";
    v11[1] = @"FSize";
    id v8 = [NSNumber numberWithDouble:Size];
    void v11[2] = @"Attrs";
    v12[1] = v8;
    v12[2] = v7;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

id smugglingDictionaryForCFNull()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = @"SmugType";
  v3[0] = AXSerializeSmuggledTypeCFNull;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  return v0;
}

id smugglingDictionaryForCFURL(const __CFURL *a1)
{
  void v5[2] = *MEMORY[0x1E4F143B8];
  long long v1 = CFURLGetString(a1);
  v4[0] = @"SmugType";
  v4[1] = @"Value";
  v5[0] = AXSerializeSmuggledTypeCFURL;
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

uint64_t __smugglingDictionaryForCGPath_block_invoke(uint64_t result)
{
  return result;
}

void __smugglingDictionaryForCGPath_block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(_DWORD *)a2;
  if (*(_DWORD *)a2 == 2) {
    int v5 = 2;
  }
  else {
    int v5 = 0;
  }
  BOOL v6 = v4 == 3 || *(_DWORD *)a2 == 2;
  if (v4 == 3) {
    int v7 = 3;
  }
  else {
    int v7 = v5;
  }
  int v8 = v4 < 2 || v6;
  if (v4 >= 2) {
    unsigned int v9 = v7;
  }
  else {
    unsigned int v9 = 1;
  }
  int v10 = [MEMORY[0x1E4F1CA58] data];
  __int16 v18 = bswap32(v4) >> 16;
  [v10 appendBytes:&v18 length:2];
  if (v8)
  {
    uint64_t v11 = 0;
    if (v9 <= 1) {
      unsigned int v12 = 1;
    }
    else {
      unsigned int v12 = v9;
    }
    uint64_t v13 = 16 * v12;
    do
    {
      long long v14 = (unint64_t *)(*(void *)(a2 + 8) + v11);
      unint64_t v15 = v14[1];
      unint64_t v17 = bswap64(*v14);
      [v10 appendBytes:&v17 length:8];
      unint64_t v16 = bswap64(v15);
      [v10 appendBytes:&v16 length:8];
      v11 += 16;
    }
    while (v13 != v11);
  }
  [*(id *)(a1 + 32) addObject:v10];
}

id reconstitutedSmuggledAttributedStringFromDictionary(void *a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  unsigned int v4 = [v3 objectForKey:@"String"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [v3 objectForKey:@"Attrl"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v29 = a2;
      BOOL v6 = +[AXAttributedString axAttributedStringWithString:v4];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id obj = v5;
      uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v31 = *(void *)v34;
        unint64_t v9 = 0x1E4F1C000uLL;
        id v27 = v4;
        id v28 = v5;
        id v26 = v3;
LABEL_5:
        uint64_t v10 = 0;
        while (1)
        {
          if (*(void *)v34 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v33 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            int v5 = v28;
            id v3 = v26;
            unsigned int v4 = v27;
            if (v29)
            {
              *uint64_t v29 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AXSerialize3ErrorDomain" code:1 userInfo:0];
            }
            goto LABEL_35;
          }
          unsigned int v12 = [v11 objectForKey:@"Range"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          id v13 = v12;
          if ([v13 length] != 16)
          {

            int v5 = v28;
            uint64_t v23 = v29;
            id v3 = v26;
            unsigned int v4 = v27;
            if (v29)
            {
              uint64_t v24 = 2;
LABEL_29:
              void *v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AXSerialize3ErrorDomain" code:v24 userInfo:0];
            }
            goto LABEL_30;
          }
          unint64_t v14 = v9;
          unint64_t v15 = v6;
          unint64_t v38 = 0;
          objc_msgSend(v13, "getBytes:range:", &v38, 0, 8);
          unint64_t v37 = 0;
          objc_msgSend(v13, "getBytes:range:", &v37, 8, 8);
          unint64_t v17 = v37;
          unint64_t v16 = v38;

          __int16 v18 = [v11 objectForKey:@"Attrs"];
          id v32 = 0;
          uint64_t v19 = [v18 _axRecursivelyReconstitutedRepresentationFromPropertyListWithError:&v32];
          id v20 = v32;

          if (!v19 || v20) {
            goto LABEL_32;
          }
          unint64_t v9 = v14;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v20 = 0;
LABEL_32:
            if (v29)
            {
              *uint64_t v29 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AXSerialize3ErrorDomain" code:1 userInfo:0];
            }

            BOOL v6 = v15;
            unsigned int v4 = v27;
            int v5 = v28;
            id v3 = v26;
LABEL_35:

            id v22 = 0;
            goto LABEL_36;
          }
          unint64_t v21 = bswap64(v17);
          BOOL v6 = v15;
          objc_msgSend(v15, "setAttributes:withRange:", v19, bswap64(v16), v21);

          if (v8 == ++v10)
          {
            uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
            unsigned int v4 = v27;
            int v5 = v28;
            id v3 = v26;
            if (v8) {
              goto LABEL_5;
            }
            goto LABEL_16;
          }
        }
        int v5 = v28;
        uint64_t v23 = v29;
        id v3 = v26;
        unsigned int v4 = v27;
        if (v29)
        {
          uint64_t v24 = 1;
          goto LABEL_29;
        }
LABEL_30:

        goto LABEL_35;
      }
LABEL_16:

      id v22 = v6;
LABEL_36:
    }
    else if (a2)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"AXSerialize3ErrorDomain" code:1 userInfo:0];
      id v22 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v22 = 0;
    }
  }
  else if (a2)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"AXSerialize3ErrorDomain" code:1 userInfo:0];
    id v22 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

id reconstitutedSmuggledCFBooleanFromDictionary(void *a1, void *a2)
{
  id v3 = [a1 objectForKey:@"Value"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v4 = [v3 BOOLValue];
    int v5 = (id *)MEMORY[0x1E4F1CFD0];
    if (!v4) {
      int v5 = (id *)MEMORY[0x1E4F1CFC8];
    }
    id v6 = *v5;
  }
  else if (a2)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"AXSerialize3ErrorDomain" code:1 userInfo:0];
    id v6 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

id reconstitutedSmuggledCFUUIDFromDictionary(void *a1, void *a2)
{
  id v3 = [a1 objectForKey:@"Value"];
  *(void *)&v10.byte0 = 0;
  *(void *)&v10.byte8 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a2)
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = 1;
LABEL_10:
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", @"AXSerialize3ErrorDomain", v8, 0, *(void *)&v10.byte0, *(void *)&v10.byte8);
      id v6 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_11:
    id v6 = 0;
    goto LABEL_12;
  }
  if ([v3 length] != 16)
  {
    if (a2)
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = 2;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  [v3 getBytes:&v10 length:16];
  CFUUIDRef v4 = CFUUIDCreateFromUUIDBytes(0, v10);
  int v5 = (__CFString *)CFUUIDCreateString(0, v4);
  if (v4) {
    CFRelease(v4);
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v5];

LABEL_12:
  return v6;
}

id reconstitutedSmuggledAXUIElementFromDictionary(void *a1, void *a2)
{
  id v3 = [a1 objectForKey:@"Value"];
  unsigned int v10 = 0;
  unint64_t v8 = 0;
  unint64_t v9 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v3 length] == 20)
    {
      objc_msgSend(v3, "getBytes:range:", &v10, 0, 4);
      objc_msgSend(v3, "getBytes:range:", &v9, 4, 8);
      objc_msgSend(v3, "getBytes:range:", &v8, 12, 8);
      CFUUIDRef v4 = (void *)_AXUIElementCreateWithPIDAndID(bswap32(v10), bswap64(v9), bswap64(v8));
      goto LABEL_10;
    }
    if (a2)
    {
      int v5 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v6 = 2;
      goto LABEL_8;
    }
  }
  else if (a2)
  {
    int v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = 1;
LABEL_8:
    [v5 errorWithDomain:@"AXSerialize3ErrorDomain" code:v6 userInfo:0];
    CFUUIDRef v4 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  CFUUIDRef v4 = 0;
LABEL_10:

  return v4;
}

AXValueRef reconstitutedSmuggledAXValueFromDictionary(void *a1, void *a2)
{
  id v3 = a1;
  CFUUIDRef v4 = [v3 objectForKeyedSubscript:@"ValueType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [v4 shortValue];
    uint64_t v6 = [v3 objectForKeyedSubscript:@"Value"];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (!a2)
      {
LABEL_27:
        AXValueRef v9 = 0;
        goto LABEL_28;
      }
      uint64_t v10 = 1;
    }
    else
    {
      switch(v5)
      {
        case 0:
          AXValueType v7 = kAXValueTypeIllegal;
          p_unint64_t valuePtr = 0;
          goto LABEL_21;
        case 1:
          if ([v6 length] != 16) {
            goto LABEL_24;
          }
          unint64_t v20 = 0;
          [v6 getBytes:&v20 length:8];
          unint64_t v19 = 0;
          objc_msgSend(v6, "getBytes:range:", &v19, 8, 8);
          unint64_t valuePtr = bswap64(v20);
          unint64_t v16 = bswap64(v19);
          p_unint64_t valuePtr = &valuePtr;
          AXValueType v7 = kAXValueTypeCGPoint;
          goto LABEL_21;
        case 2:
          if ([v6 length] != 16) {
            goto LABEL_24;
          }
          unint64_t v20 = 0;
          [v6 getBytes:&v20 length:8];
          unint64_t v19 = 0;
          objc_msgSend(v6, "getBytes:range:", &v19, 8, 8);
          unint64_t valuePtr = bswap64(v20);
          unint64_t v16 = bswap64(v19);
          p_unint64_t valuePtr = &valuePtr;
          AXValueType v7 = kAXValueTypeCGSize;
          goto LABEL_21;
        case 3:
          if ([v6 length] != 32) {
            goto LABEL_24;
          }
          unint64_t v20 = 0;
          [v6 getBytes:&v20 length:8];
          unint64_t v19 = 0;
          objc_msgSend(v6, "getBytes:range:", &v19, 8, 8);
          unint64_t v14 = 0;
          objc_msgSend(v6, "getBytes:range:", &v14, 16, 8);
          unint64_t v13 = 0;
          objc_msgSend(v6, "getBytes:range:", &v13, 24, 8);
          unint64_t valuePtr = bswap64(v20);
          unint64_t v16 = bswap64(v19);
          unint64_t v17 = bswap64(v14);
          unint64_t v18 = bswap64(v13);
          p_unint64_t valuePtr = &valuePtr;
          AXValueType v7 = kAXValueTypeCGRect;
          goto LABEL_21;
        case 4:
          if ([v6 length] != 16) {
            goto LABEL_24;
          }
          unint64_t v20 = 0;
          [v6 getBytes:&v20 length:8];
          unint64_t v19 = 0;
          objc_msgSend(v6, "getBytes:range:", &v19, 8, 8);
          unint64_t valuePtr = bswap64(v20);
          unint64_t v16 = bswap64(v19);
          p_unint64_t valuePtr = &valuePtr;
          AXValueType v7 = kAXValueTypeCFRange;
          goto LABEL_21;
        case 5:
          if ([v6 length] == 4)
          {
            LODWORD(v20) = 0;
            [v6 getBytes:&v20 length:4];
            LODWORD(valuePtr) = bswap32(v20);
            p_unint64_t valuePtr = &valuePtr;
            AXValueType v7 = kAXValueTypeAXError;
LABEL_21:
            AXValueRef v11 = AXValueCreate(v7, p_valuePtr);
            if (v11) {
              AXValueRef v9 = v11;
            }
            else {
              AXValueRef v9 = 0;
            }
            goto LABEL_28;
          }
LABEL_24:
          if (!a2) {
            goto LABEL_27;
          }
          uint64_t v10 = 2;
          break;
        default:
          goto LABEL_27;
      }
    }
    [MEMORY[0x1E4F28C58] errorWithDomain:@"AXSerialize3ErrorDomain" code:v10 userInfo:0];
    AXValueRef v9 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

    goto LABEL_29;
  }
  if (a2)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"AXSerialize3ErrorDomain" code:1 userInfo:0];
    AXValueRef v9 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AXValueRef v9 = 0;
  }
LABEL_29:

  return v9;
}

CGColorRef reconstitutedSmuggledCGColorFromDictionary(void *a1, void *a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  CFUUIDRef v4 = [v3 objectForKeyedSubscript:@"ValueType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [v4 intValue];
    uint64_t v6 = [v3 objectForKeyedSubscript:@"Value"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a2)
      {
        AXValueRef v9 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v10 = 1;
LABEL_24:
        [v9 errorWithDomain:@"AXSerialize3ErrorDomain" code:v10 userInfo:0];
        CGColorRef v8 = 0;
        *a2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:

        goto LABEL_31;
      }
LABEL_25:
      CGColorRef v8 = 0;
      goto LABEL_30;
    }
    if (v5)
    {
      if (v5 == 1)
      {
        CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
      }
      else
      {
        if (v5 != 2)
        {
          [v6 length];
          goto LABEL_22;
        }
        CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceCMYK();
      }
    }
    else
    {
      CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceGray();
    }
    AXValueRef v11 = DeviceRGB;
    unint64_t v12 = [v6 length];
    if (v11)
    {
      unint64_t v13 = v12;
      unint64_t v14 = v12 >> 3;
      size_t NumberOfComponents = CGColorSpaceGetNumberOfComponents(v11);
      if (v14 == NumberOfComponents + 1)
      {
        MEMORY[0x1F4188790](NumberOfComponents);
        unint64_t v17 = (const CGFloat *)((char *)v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
        if (v13 >= 8)
        {
          uint64_t v18 = 0;
          if (v14 <= 1) {
            unint64_t v14 = 1;
          }
          do
          {
            v20[0] = 0;
            objc_msgSend(v6, "getBytes:range:", v20, v18 * 8, 8);
            *(void *)&v17[v18++] = bswap64(v20[0]);
            --v14;
          }
          while (v14);
        }
        CGColorRef v8 = CGColorCreate(v11, v17);
      }
      else if (a2)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:@"AXSerialize3ErrorDomain" code:4 userInfo:0];
        CGColorRef v8 = 0;
        *a2 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        CGColorRef v8 = 0;
      }
      CFRelease(v11);
      goto LABEL_30;
    }
LABEL_22:
    if (a2)
    {
      AXValueRef v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = 3;
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  if (a2)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"AXSerialize3ErrorDomain" code:1 userInfo:0];
    CGColorRef v8 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CGColorRef v8 = 0;
  }
LABEL_31:

  return v8;
}

CGMutablePathRef reconstitutedSmuggledCGPathFromDictionary(void *a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 objectForKeyedSubscript:@"Value"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 count];
    CFMutableDictionaryRef Mutable = CGPathCreateMutable();
    CGMutablePathRef v6 = Mutable;
    unint64_t v30 = v4;
    if (!v4) {
      goto LABEL_40;
    }
    id v28 = a2;
    CGMutablePathRef v29 = Mutable;
    uint64_t v7 = 0;
    unsigned int v8 = 0;
    while (1)
    {
      AXValueRef v9 = [v3 objectAtIndexedSubscript:v7];
      unsigned __int16 v33 = 0;
      objc_msgSend(v9, "getBytes:range:", &v33, 0, 2);
      unsigned int v10 = bswap32(v33) >> 16;
      if (v10 < 2)
      {
        BOOL v12 = 1;
        unsigned int v13 = 1;
      }
      else
      {
        int v11 = v10 == 2 ? 2 : 0;
        BOOL v12 = v10 == 3 || v10 == 2;
        unsigned int v13 = v10 == 3 ? 3 : v11;
      }
      uint64_t v14 = v13;
      uint64_t v15 = [v9 length];
      if (v15 != ((16 * v14) | 2)) {
        break;
      }
      uint64_t v16 = v3;
      MEMORY[0x1F4188790](v15);
      uint64_t v18 = (CGFloat *)(&v27 - 2 * v17);
      if (v12)
      {
        unint64_t v19 = 0;
        if (v14 <= 1) {
          unsigned int v20 = 1;
        }
        else {
          unsigned int v20 = v14;
        }
        uint64_t v21 = 16 * v20;
        do
        {
          uint64_t v32 = 0;
          objc_msgSend(v9, "getBytes:range:", &v32, v19 + 2, 8);
          uint64_t v31 = 0;
          objc_msgSend(v9, "getBytes:range:", &v31, v19 + 10, 8);
          v22.i64[0] = v32;
          v22.i64[1] = v31;
          *(int8x16_t *)&v18[v19 / 8] = vrev64q_s8(v22);
          v19 += 16;
        }
        while (v21 != v19);
      }
      switch(v10)
      {
        case 0u:
          CGMutablePathRef v6 = v29;
          CGPathMoveToPoint(v29, 0, *v18, v18[1]);
          break;
        case 1u:
          CGMutablePathRef v6 = v29;
          CGPathAddLineToPoint(v29, 0, *v18, v18[1]);
          break;
        case 2u:
          CGMutablePathRef v6 = v29;
          CGPathAddQuadCurveToPoint(v29, 0, *v18, v18[1], v18[2], v18[3]);
          break;
        case 3u:
          CGMutablePathRef v6 = v29;
          CGPathAddCurveToPoint(v29, 0, *v18, v18[1], v18[2], v18[3], v18[4], v18[5]);
          break;
        case 4u:
          CGMutablePathRef v6 = v29;
          CGPathCloseSubpath(v29);
          break;
        default:
          uint64_t v24 = v28;
          if (v28)
          {
            *uint64_t v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AXSerialize3ErrorDomain" code:5 userInfo:0];
          }
          id v3 = v16;
          goto LABEL_37;
      }
      id v3 = v16;

      uint64_t v7 = ++v8;
      if (v30 <= v8) {
        goto LABEL_40;
      }
    }
    uint64_t v23 = v28;
    if (v28)
    {
      void *v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AXSerialize3ErrorDomain" code:2 userInfo:0];
    }
LABEL_37:
    CGMutablePathRef v25 = v29;

    if (v25) {
      CFRelease(v25);
    }
  }
  else if (a2)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"AXSerialize3ErrorDomain" code:1 userInfo:0];
    CGMutablePathRef v6 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
  CGMutablePathRef v6 = 0;
LABEL_40:

  return v6;
}

CTFontRef reconstitutedSmuggledCTFontFromDictionary(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"FSize"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 doubleValue];
    CGFloat v6 = v5;
    uint64_t v7 = [v3 objectForKeyedSubscript:@"Attrs"];
    CFDictionaryRef v8 = [v7 _axRecursivelyReconstitutedRepresentationFromPropertyListWithError:a2];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      AXValueRef v9 = CTFontDescriptorCreateWithAttributes(v8);
      CTFontRef v10 = CTFontCreateWithFontDescriptor(v9, v6, 0);
      if (v9) {
        CFRelease(v9);
      }
    }
    else if (a2)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"AXSerialize3ErrorDomain" code:1 userInfo:0];
      CTFontRef v10 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CTFontRef v10 = 0;
    }
  }
  else if (a2)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"AXSerialize3ErrorDomain" code:1 userInfo:0];
    CTFontRef v10 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CTFontRef v10 = 0;
  }

  return v10;
}

uint64_t reconstitutedSmuggledCFNullFromDictionary()
{
  return [MEMORY[0x1E4F1CA98] null];
}

CFURLRef reconstitutedSmuggledCFURLFromDictionary(void *a1, void *a2)
{
  id v3 = [a1 objectForKeyedSubscript:@"Value"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFURLRef v4 = CFURLCreateWithString(0, v3, 0);
  }
  else if (a2)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"AXSerialize3ErrorDomain" code:1 userInfo:0];
    CFURLRef v4 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CFURLRef v4 = 0;
  }

  return v4;
}

void __InitSmuggledTypes_block_invoke()
{
  uint64_t v0 = (void *)AXSerializeSmuggledTypeAttributedString;
  AXSerializeSmuggledTypeAttributedCFStringRef String = (uint64_t)&unk_1F1423DB8;

  long long v1 = (void *)AXSerializeSmuggledTypeCFBoolean;
  AXSerializeSmuggledTypeCFBooleauint64_t n = (uint64_t)&unk_1F1423DD0;

  uint64_t v2 = (void *)AXSerializeSmuggledTypeCFUUID;
  AXSerializeSmuggledTypeCFUUID = (uint64_t)&unk_1F1423DE8;

  id v3 = (void *)AXSerializeSmuggledTypeAXUIElement;
  AXSerializeSmuggledTypeAXUIElement = (uint64_t)&unk_1F1423E00;

  CFURLRef v4 = (void *)AXSerializeSmuggledTypeAXValue;
  AXSerializeSmuggledTypeAXBoolean Value = (uint64_t)&unk_1F1423E18;

  double v5 = (void *)AXSerializeSmuggledTypeCGColor;
  AXSerializeSmuggledTypeCGColor = (uint64_t)&unk_1F1423E30;

  CGFloat v6 = (void *)AXSerializeSmuggledTypeCGPath;
  AXSerializeSmuggledTypeCGPath = (uint64_t)&unk_1F1423E48;

  uint64_t v7 = (void *)AXSerializeSmuggledTypeCTFont;
  AXSerializeSmuggledTypeCTFont = (uint64_t)&unk_1F1423E60;

  CFDictionaryRef v8 = (void *)AXSerializeSmuggledTypeCFNull;
  AXSerializeSmuggledTypeCFNull = (uint64_t)&unk_1F1423E78;

  AXValueRef v9 = (void *)AXSerializeSmuggledTypeCFURL;
  AXSerializeSmuggledTypeCFURL = (uint64_t)&unk_1F1423E90;
}

void sub_1BA69AB5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_1BA69BA4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAXPerformPrivilegedAttributedStringTransformationsSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_0)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    void v4[2] = (void *)3221225472;
    void v4[3] = __AccessibilityUtilitiesLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_1E6220FE8;
    uint64_t v6 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v2 = (void *)AccessibilityUtilitiesLibraryCore_frameworkLibrary_0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_0) {
    __getAXPerformPrivilegedAttributedStringTransformationsSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  CFTypeID result = dlsym(v2, "AXPerformPrivilegedAttributedStringTransformations");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = result;
  getAXPerformPrivilegedAttributedStringTransformationsSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32)
                                                                                                + 8)
                                                                                    + 24);
  return result;
}

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

uint64_t _AXMIGCopyAttributeValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9, void *a10, _DWORD *a11, _DWORD *a12)
{
  int v12 = MEMORY[0x1F4188790]();
  uint64_t v14 = v13;
  mach_msg_timeout_t v16 = v15;
  int v17 = v12;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  long long v60 = 0u;
  memset(v61, 0, sizeof(v61));
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  long long v46 = 0u;
  long long v45 = 0u;
  long long v44 = 0u;
  long long v43 = 0u;
  long long v42 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  long long v39 = 0u;
  long long v38 = 0u;
  long long v37 = 0u;
  long long v36 = 0u;
  long long v35 = 0u;
  *(_OWORD *)size_t __n = 0u;
  long long v33 = 0u;
  *(_OWORD *)&rcv_name[16] = 0u;
  *(_OWORD *)rcv_mach_port_name_t name = 0u;
  *(void *)&rcv_name[20] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&rcv_name[28] = v18;
  *(void *)&long long v33 = v19;
  *((void *)&v33 + 1) = v20;
  LODWORD(__n[0]) = v21;
  *(size_t *)((char *)__n + 4) = v22;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = v17;
  *(_DWORD *)&rcv_name[8] = reply_port;
  int v31 = 5395;
  *(void *)&rcv_name[12] = 0xD1F6200000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v31);
    mach_port_name_t reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v24 = mach_msg((mach_msg_header_t *)&v31, 275, 0x40u, 0x1048u, reply_port, v16, 0);
  uint64_t v25 = v24;
  if ((v24 - 268435458) <= 0xE && ((1 << (v24 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  else
  {
    if (!v24)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v25 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 860102)
      {
        if ((v31 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            uint64_t v25 = 4294966996;
            if (*(_DWORD *)&rcv_name[28])
            {
              if (*(_DWORD *)&rcv_name[4]) {
                uint64_t v25 = 4294966996;
              }
              else {
                uint64_t v25 = *(unsigned int *)&rcv_name[28];
              }
            }
          }
          else
          {
            uint64_t v25 = 4294966996;
          }
          goto LABEL_32;
        }
        uint64_t v25 = 4294966996;
        if (*(_DWORD *)&rcv_name[20] == 1
          && *(_DWORD *)rcv_name >= 0x40u
          && *(_DWORD *)rcv_name <= 0x1040u
          && !*(_DWORD *)&rcv_name[4]
          && BYTE3(v33) == 1)
        {
          int v26 = __n[0];
          if (LODWORD(__n[0]) <= 0x1000 && (*(_DWORD *)rcv_name - 64) >= LODWORD(__n[0]))
          {
            unsigned int v27 = (LODWORD(__n[0]) + 3) & 0xFFFFFFFC;
            if (*(_DWORD *)rcv_name == v27 + 64)
            {
              id v28 = &rcv_name[v27 - 4];
              if (DWORD1(v33) == *((_DWORD *)v28 + 14))
              {
                CGMutablePathRef v29 = v28 - 4096;
                memcpy(v14, (char *)__n + 4, LODWORD(__n[0]));
                uint64_t v25 = 0;
                *a9 = v26;
                *a10 = *(void *)&rcv_name[24];
                *a11 = *((_DWORD *)v29 + 1038);
                *a12 = *((_DWORD *)v29 + 1039);
                return v25;
              }
            }
          }
        }
      }
      else
      {
        uint64_t v25 = 4294966995;
      }
LABEL_32:
      mach_msg_destroy((mach_msg_header_t *)&v31);
      return v25;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  if ((v25 - 268435459) <= 1)
  {
    if ((v31 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&rcv_name[8]);
    }
    goto LABEL_32;
  }
  return v25;
}

uint64_t _AXMIGSetAttributeValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned int a10, uint64_t a11, int *a12)
{
  mach_port_t v12 = MEMORY[0x1F4188790](a1);
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
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
  *(_OWORD *)&v34[8] = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v31 = 1;
  uint64_t v32 = a9;
  int v33 = 16777472;
  *(void *)uint64_t v34 = a10;
  *(void *)&v34[4] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&v34[12] = v15;
  *(void *)&v34[16] = v16;
  *(void *)&long long v35 = v17;
  DWORD2(v35) = v18;
  if (v14 <= 0x1000)
  {
    unsigned int v20 = v14;
    mach_msg_timeout_t v21 = v13;
    mach_port_t v22 = v12;
    __memcpy_chk();
    HIDWORD(v35) = v20;
    uint64_t v23 = (v20 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v24 = v23 + 92;
    uint64_t v25 = (char *)&rcv_name + v23;
    *((_DWORD *)v25 + 20) = a10;
    *(void *)(v25 + 84) = a11;
    mach_port_t reply_port = mig_get_reply_port();
    rcv_name.mach_port_t msgh_remote_port = v22;
    rcv_name.msgh_local_port = reply_port;
    rcv_name.msgh_bits = -2147478253;
    *(void *)&rcv_name.msgh_voucher_port = 0xD1F6300000000;
    if (MEMORY[0x1E4F14B18])
    {
      voucher_mach_msg_set(&rcv_name);
      mach_port_t reply_port = rcv_name.msgh_local_port;
    }
    uint64_t v27 = mach_msg(&rcv_name, 275, v24, 0x30u, reply_port, v21, 0);
    uint64_t v19 = v27;
    if ((v27 - 268435458) <= 0xE && ((1 << (v27 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name.msgh_local_port);
    }
    else
    {
      if (!v27)
      {
        if (rcv_name.msgh_id == 71)
        {
          uint64_t v19 = 4294966988;
        }
        else if (rcv_name.msgh_id == 860103)
        {
          if ((rcv_name.msgh_bits & 0x80000000) == 0)
          {
            if (rcv_name.msgh_size == 40)
            {
              if (!rcv_name.msgh_remote_port)
              {
                uint64_t v19 = HIDWORD(v32);
                if (!HIDWORD(v32))
                {
                  *a12 = v33;
                  return v19;
                }
                goto LABEL_28;
              }
            }
            else if (rcv_name.msgh_size == 36)
            {
              if (rcv_name.msgh_remote_port) {
                BOOL v28 = 1;
              }
              else {
                BOOL v28 = HIDWORD(v32) == 0;
              }
              if (v28) {
                uint64_t v19 = 4294966996;
              }
              else {
                uint64_t v19 = HIDWORD(v32);
              }
              goto LABEL_28;
            }
          }
          uint64_t v19 = 4294966996;
        }
        else
        {
          uint64_t v19 = 4294966995;
        }
LABEL_28:
        mach_msg_destroy(&rcv_name);
        return v19;
      }
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
    }
    if ((v19 - 268435459) > 1) {
      return v19;
    }
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name.msgh_local_port);
    }
    goto LABEL_28;
  }
  return 4294966989;
}

uint64_t _AXMIGPerformAction(mach_port_t a1, mach_msg_timeout_t a2, unsigned int a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, _DWORD *a8)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = *MEMORY[0x1E4F14068];
  unsigned int v18 = a3;
  uint64_t v19 = a4;
  uint64_t v20 = a5;
  int v21 = a6;
  uint64_t v22 = a7;
  mach_port_t reply_port = mig_get_reply_port();
  *(void *)&msg.msgh_bits = 5395;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  *(void *)&msg.msgh_voucher_port = 0xD1F6400000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v12 = mach_msg(&msg, 275, 0x40u, 0x30u, reply_port, a2, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!v12)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v13 = 4294966988;
      }
      else if (msg.msgh_id == 860104)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              uint64_t v13 = v18;
              if (!v18)
              {
                *a8 = v19;
                return v13;
              }
              goto LABEL_26;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port) {
              BOOL v14 = 1;
            }
            else {
              BOOL v14 = v18 == 0;
            }
            if (v14) {
              uint64_t v13 = 4294966996;
            }
            else {
              uint64_t v13 = v18;
            }
            goto LABEL_26;
          }
        }
        uint64_t v13 = 4294966996;
      }
      else
      {
        uint64_t v13 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy(&msg);
      return v13;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  if ((v13 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], msg.msgh_local_port);
    }
    goto LABEL_26;
  }
  return v13;
}

uint64_t _AXMIGPerformActionWithValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9, uint64_t a10, int a11, uint64_t a12, _DWORD *a13)
{
  mach_port_t v13 = MEMORY[0x1F4188790]();
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  memset(v38, 0, sizeof(v38));
  uint64_t v33 = 0x13000000000000;
  uint64_t v37 = 0;
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v31 = 2;
  int v32 = v15;
  uint64_t v34 = a10;
  int v35 = 16777472;
  int v36 = a11;
  uint64_t v37 = *MEMORY[0x1E4F14068];
  LODWORD(v38[0]) = v16;
  *(void *)((char *)v38 + 4) = v17;
  *(void *)((char *)v38 + 12) = v18;
  DWORD1(v38[1]) = v19;
  if (a9 <= 0x1000)
  {
    mach_msg_timeout_t v21 = v14;
    mach_port_t v22 = v13;
    __memcpy_chk();
    DWORD2(v38[1]) = a9;
    uint64_t v23 = (a9 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v24 = v23 + 104;
    uint64_t v25 = (char *)&rcv_name + v23;
    *((_DWORD *)v25 + 23) = a11;
    *((void *)v25 + 12) = a12;
    mach_port_t reply_port = mig_get_reply_port();
    rcv_name.mach_port_t msgh_remote_port = v22;
    rcv_name.msgh_local_port = reply_port;
    rcv_name.msgh_bits = -2147478253;
    *(void *)&rcv_name.msgh_voucher_port = 0xD1F6500000000;
    if (MEMORY[0x1E4F14B18])
    {
      voucher_mach_msg_set(&rcv_name);
      mach_port_t reply_port = rcv_name.msgh_local_port;
    }
    uint64_t v27 = mach_msg(&rcv_name, 275, v24, 0x30u, reply_port, v21, 0);
    uint64_t v20 = v27;
    if ((v27 - 268435458) <= 0xE && ((1 << (v27 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name.msgh_local_port);
    }
    else
    {
      if (!v27)
      {
        if (rcv_name.msgh_id == 71)
        {
          uint64_t v20 = 4294966988;
        }
        else if (rcv_name.msgh_id == 860105)
        {
          if ((rcv_name.msgh_bits & 0x80000000) == 0)
          {
            if (rcv_name.msgh_size == 40)
            {
              if (!rcv_name.msgh_remote_port)
              {
                uint64_t v20 = v33;
                if (!v33)
                {
                  *a13 = HIDWORD(v33);
                  return v20;
                }
                goto LABEL_28;
              }
            }
            else if (rcv_name.msgh_size == 36)
            {
              if (rcv_name.msgh_remote_port) {
                BOOL v28 = 1;
              }
              else {
                BOOL v28 = v33 == 0;
              }
              if (v28) {
                uint64_t v20 = 4294966996;
              }
              else {
                uint64_t v20 = v33;
              }
              goto LABEL_28;
            }
          }
          uint64_t v20 = 4294966996;
        }
        else
        {
          uint64_t v20 = 4294966995;
        }
LABEL_28:
        mach_msg_destroy(&rcv_name);
        return v20;
      }
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
    }
    if ((v20 - 268435459) > 1) {
      return v20;
    }
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name.msgh_local_port);
    }
    goto LABEL_28;
  }
  return 4294966989;
}

uint64_t _AXMIGCopyElementAtPosition(int a1, mach_msg_timeout_t a2, int a3, uint64_t a4, uint64_t a5, __int16 a6, int a7, uint64_t a8, float a9, float a10, _DWORD *a11, _OWORD *a12, void *a13, _DWORD *a14, _DWORD *a15)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  long long v54 = 0u;
  memset(v55, 0, sizeof(v55));
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  long long v39 = 0u;
  long long v38 = 0u;
  long long v37 = 0u;
  long long v36 = 0u;
  long long v35 = 0u;
  long long v34 = 0u;
  long long v33 = 0u;
  long long v32 = 0u;
  long long v31 = 0u;
  long long v30 = 0u;
  long long v29 = 0u;
  *(_OWORD *)&v28[16] = 0u;
  *(_OWORD *)BOOL v28 = 0u;
  *(_OWORD *)&rcv_name[16] = 0u;
  *(_OWORD *)rcv_mach_port_name_t name = 0u;
  *(void *)&rcv_name[20] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&rcv_name[28] = a3;
  *(void *)BOOL v28 = a4;
  *(void *)&v28[8] = a5;
  *(float *)&v28[16] = a9;
  *(float *)&v28[20] = a10;
  *(_WORD *)&v28[24] = a6;
  *(_DWORD *)&v28[28] = a7;
  *(void *)&long long v29 = a8;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = reply_port;
  int v26 = 5395;
  *(void *)&rcv_name[12] = 0xD1F6600000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v26);
    mach_port_name_t reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v18 = mach_msg((mach_msg_header_t *)&v26, 275, 0x4Cu, 0x448u, reply_port, a2, 0);
  uint64_t v19 = v18;
  if ((v18 - 268435458) <= 0xE && ((1 << (v18 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
    goto LABEL_21;
  }
  if (!v18)
  {
    if (*(_DWORD *)&rcv_name[16] == 71)
    {
      uint64_t v19 = 4294966988;
    }
    else if (*(_DWORD *)&rcv_name[16] == 860106)
    {
      if ((v26 & 0x80000000) == 0)
      {
        if ((*(_DWORD *)rcv_name - 1089) <= 0xFFFFFBFE)
        {
          if (*(_DWORD *)&rcv_name[4]) {
            BOOL v20 = 1;
          }
          else {
            BOOL v20 = *(_DWORD *)&rcv_name[28] == 0;
          }
          if (!v20 && *(_DWORD *)rcv_name == 36) {
            uint64_t v19 = *(unsigned int *)&rcv_name[28];
          }
          else {
            uint64_t v19 = 4294966996;
          }
          goto LABEL_28;
        }
        if (!*(_DWORD *)&rcv_name[4])
        {
          uint64_t v19 = *(unsigned int *)&rcv_name[28];
          if (*(_DWORD *)&rcv_name[28]) {
            goto LABEL_28;
          }
          size_t v23 = *(unsigned int *)&v28[20];
          if (*(_DWORD *)&v28[20] <= 0x400u)
          {
            uint64_t v19 = 4294966996;
            if ((*(_DWORD *)rcv_name - 64) >= *(_DWORD *)&v28[20])
            {
              unsigned int v24 = (*(_DWORD *)&v28[20] + 3) & 0xFFFFFFFC;
              if (*(_DWORD *)rcv_name == v24 + 64)
              {
                *a11 = *(_DWORD *)v28;
                *a12 = *(_OWORD *)&v28[4];
                uint64_t v25 = &rcv_name[v24 - 4];
                memcpy(a13, &v28[24], v23);
                uint64_t v19 = 0;
                *a14 = v23;
                *a15 = *((_DWORD *)v25 + 15);
                return v19;
              }
            }
            goto LABEL_28;
          }
        }
      }
      uint64_t v19 = 4294966996;
    }
    else
    {
      uint64_t v19 = 4294966995;
    }
LABEL_28:
    mach_msg_destroy((mach_msg_header_t *)&v26);
    return v19;
  }
  mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
LABEL_21:
  if ((v19 - 268435459) <= 1)
  {
    if ((v26 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&rcv_name[8]);
    }
    goto LABEL_28;
  }
  return v19;
}

uint64_t _AXMIGAddNotification(int a1, mach_msg_timeout_t a2, int a3, uint64_t a4, uint64_t a5, int a6, int a7, int a8, uint64_t a9, int *a10)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&msg[20] = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(_DWORD *)&msg[24] = 1;
  *(_DWORD *)&msg[28] = a7;
  int v18 = 1245184;
  uint64_t v19 = *MEMORY[0x1E4F14068];
  int v20 = a3;
  uint64_t v21 = a4;
  uint64_t v22 = a5;
  int v23 = a6;
  int v24 = a8;
  uint64_t v25 = a9;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)mach_msg_header_t msg = -2147478253;
  *(void *)&msg[16] = 0xD1F6700000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_name_t reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v13 = mach_msg((mach_msg_header_t *)msg, 275, 0x54u, 0x30u, reply_port, a2, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!v13)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v14 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 860107)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 40)
          {
            if (!*(_DWORD *)&msg[8])
            {
              uint64_t v14 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *a10 = v18;
                return v14;
              }
              goto LABEL_26;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8]) {
              BOOL v15 = 1;
            }
            else {
              BOOL v15 = *(_DWORD *)&msg[32] == 0;
            }
            if (v15) {
              uint64_t v14 = 4294966996;
            }
            else {
              uint64_t v14 = *(unsigned int *)&msg[32];
            }
            goto LABEL_26;
          }
        }
        uint64_t v14 = 4294966996;
      }
      else
      {
        uint64_t v14 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v14;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  if ((v14 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&msg[12]);
    }
    goto LABEL_26;
  }
  return v14;
}

uint64_t _AXMIGRemoveNotification(int a1, mach_msg_timeout_t a2, int a3, uint64_t a4, uint64_t a5, int a6, int a7, int *a8)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&rcv_name[16] = 0u;
  *(_OWORD *)rcv_mach_port_name_t name = 0u;
  *(_DWORD *)&rcv_name[20] = 1;
  *(_DWORD *)&rcv_name[24] = a7;
  int v18 = 1245184;
  uint64_t v19 = *MEMORY[0x1E4F14068];
  int v20 = a3;
  uint64_t v21 = a4;
  uint64_t v22 = a5;
  int v23 = a6;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = reply_port;
  int v16 = -2147478253;
  *(void *)&rcv_name[12] = 0xD1F6800000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v16);
    mach_port_name_t reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v12 = mach_msg((mach_msg_header_t *)&v16, 275, 0x48u, 0x30u, reply_port, a2, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  else
  {
    if (!v12)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v13 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 860108)
      {
        if ((v16 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              uint64_t v13 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a8 = v18;
                return v13;
              }
              goto LABEL_26;
            }
          }
          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4]) {
              BOOL v14 = 1;
            }
            else {
              BOOL v14 = *(_DWORD *)&rcv_name[28] == 0;
            }
            if (v14) {
              uint64_t v13 = 4294966996;
            }
            else {
              uint64_t v13 = *(unsigned int *)&rcv_name[28];
            }
            goto LABEL_26;
          }
        }
        uint64_t v13 = 4294966996;
      }
      else
      {
        uint64_t v13 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy((mach_msg_header_t *)&v16);
      return v13;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  if ((v13 - 268435459) <= 1)
  {
    if ((v16 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], *(mach_port_name_t *)&rcv_name[8]);
    }
    goto LABEL_26;
  }
  return v13;
}

uint64_t _AXMIGCopyParameterizedAttributeValue(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, unsigned int a10, uint64_t a11, void *__dst, _DWORD *a13, uint64_t *a14, _DWORD *a15, _DWORD *a16)
{
  mach_port_t v16 = MEMORY[0x1F4188790]();
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  *(_OWORD *)&v40[8] = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v37 = 1;
  uint64_t v38 = a9;
  int v39 = 16777472;
  *(void *)long long v40 = a10;
  *(void *)&v40[4] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&v40[12] = v19;
  *(void *)&v40[16] = v20;
  *(void *)&long long v41 = v21;
  DWORD2(v41) = v22;
  if (v18 <= 0x1000)
  {
    unsigned int v24 = v18;
    mach_msg_timeout_t v25 = v17;
    mach_port_t v26 = v16;
    __memcpy_chk();
    HIDWORD(v41) = v24;
    uint64_t v27 = (v24 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v28 = v27 + 92;
    long long v29 = (char *)&rcv_name + v27 - 4096;
    *((_DWORD *)v29 + 1044) = a10;
    *(void *)(v29 + 4180) = a11;
    mach_port_t reply_port = mig_get_reply_port();
    rcv_name.mach_port_t msgh_remote_port = v26;
    rcv_name.msgh_local_port = reply_port;
    rcv_name.msgh_bits = -2147478253;
    *(void *)&rcv_name.msgh_voucher_port = 0xD1F6900000000;
    if (MEMORY[0x1E4F14B18])
    {
      voucher_mach_msg_set(&rcv_name);
      mach_port_t reply_port = rcv_name.msgh_local_port;
    }
    uint64_t v31 = mach_msg(&rcv_name, 275, v28, 0x1048u, reply_port, v25, 0);
    uint64_t v23 = v31;
    if ((v31 - 268435458) <= 0xE && ((1 << (v31 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name.msgh_local_port);
    }
    else
    {
      if (!v31)
      {
        if (rcv_name.msgh_id == 71)
        {
          uint64_t v23 = 4294966988;
        }
        else if (rcv_name.msgh_id == 860109)
        {
          if ((rcv_name.msgh_bits & 0x80000000) != 0)
          {
            uint64_t v23 = 4294966996;
            if (v37 == 1
              && rcv_name.msgh_size >= 0x40
              && rcv_name.msgh_size <= 0x1040
              && !rcv_name.msgh_remote_port
              && HIBYTE(v39) == 1)
            {
              int v32 = *(_DWORD *)&v40[12];
              if (*(_DWORD *)&v40[12] <= 0x1000u && rcv_name.msgh_size - 64 >= *(_DWORD *)&v40[12])
              {
                unsigned int v33 = (*(_DWORD *)&v40[12] + 3) & 0xFFFFFFFC;
                if (rcv_name.msgh_size == v33 + 64)
                {
                  long long v34 = (char *)&rcv_name + v33 - 4096;
                  if (*(_DWORD *)v40 == *((_DWORD *)v34 + 1038))
                  {
                    memcpy(__dst, &v40[16], *(unsigned int *)&v40[12]);
                    uint64_t v23 = 0;
                    *a13 = v32;
                    *a14 = v38;
                    *a15 = *((_DWORD *)v34 + 1038);
                    *a16 = *((_DWORD *)v34 + 1039);
                    return v23;
                  }
                }
              }
            }
          }
          else if (rcv_name.msgh_size == 36)
          {
            uint64_t v23 = 4294966996;
            if (HIDWORD(v38))
            {
              if (rcv_name.msgh_remote_port) {
                uint64_t v23 = 4294966996;
              }
              else {
                uint64_t v23 = HIDWORD(v38);
              }
            }
          }
          else
          {
            uint64_t v23 = 4294966996;
          }
        }
        else
        {
          uint64_t v23 = 4294966995;
        }
        goto LABEL_34;
      }
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
    }
    if ((v23 - 268435459) > 1) {
      return v23;
    }
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name.msgh_local_port);
    }
LABEL_34:
    mach_msg_destroy(&rcv_name);
    return v23;
  }
  return 4294966989;
}

uint64_t _AXMIGCopyMultipleAttributeValues(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, unsigned int a9, int a10, uint64_t a11, void *__dst, _DWORD *a13, void *a14, _DWORD *a15, _DWORD *a16)
{
  mach_port_t v16 = MEMORY[0x1F4188790](a1);
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  *(_OWORD *)&v40[8] = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v37 = 1;
  uint64_t v38 = v19;
  int v39 = 16777472;
  *(void *)long long v40 = a9;
  *(void *)&v40[4] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&v40[12] = v20;
  *(void *)&v40[16] = v21;
  *(void *)&long long v41 = v22;
  if (v18 <= 0x1000)
  {
    unsigned int v24 = v18;
    mach_msg_timeout_t v25 = v17;
    mach_port_t v26 = v16;
    __memcpy_chk();
    DWORD2(v41) = v24;
    uint64_t v27 = (v24 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v28 = v27 + 92;
    long long v29 = (char *)&rcv_name + v27 - 4096;
    *((_DWORD *)v29 + 1043) = a9;
    *((_DWORD *)v29 + 1044) = a10;
    *(void *)(v29 + 4180) = a11;
    mach_port_t reply_port = mig_get_reply_port();
    rcv_name.mach_port_t msgh_remote_port = v26;
    rcv_name.msgh_local_port = reply_port;
    rcv_name.msgh_bits = -2147478253;
    *(void *)&rcv_name.msgh_voucher_port = 0xD1F6A00000000;
    if (MEMORY[0x1E4F14B18])
    {
      voucher_mach_msg_set(&rcv_name);
      mach_port_t reply_port = rcv_name.msgh_local_port;
    }
    uint64_t v31 = mach_msg(&rcv_name, 275, v28, 0x1048u, reply_port, v25, 0);
    uint64_t v23 = v31;
    if ((v31 - 268435458) <= 0xE && ((1 << (v31 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name.msgh_local_port);
    }
    else
    {
      if (!v31)
      {
        if (rcv_name.msgh_id == 71)
        {
          uint64_t v23 = 4294966988;
        }
        else if (rcv_name.msgh_id == 860110)
        {
          if ((rcv_name.msgh_bits & 0x80000000) != 0)
          {
            uint64_t v23 = 4294966996;
            if (v37 == 1
              && rcv_name.msgh_size >= 0x40
              && rcv_name.msgh_size <= 0x1040
              && !rcv_name.msgh_remote_port
              && HIBYTE(v39) == 1)
            {
              int v32 = *(_DWORD *)&v40[12];
              if (*(_DWORD *)&v40[12] <= 0x1000u && rcv_name.msgh_size - 64 >= *(_DWORD *)&v40[12])
              {
                unsigned int v33 = (*(_DWORD *)&v40[12] + 3) & 0xFFFFFFFC;
                if (rcv_name.msgh_size == v33 + 64)
                {
                  long long v34 = (char *)&rcv_name + v33 - 4096;
                  if (*(_DWORD *)v40 == *((_DWORD *)v34 + 1038))
                  {
                    memcpy(__dst, &v40[16], *(unsigned int *)&v40[12]);
                    uint64_t v23 = 0;
                    *a13 = v32;
                    *a14 = v38;
                    *a15 = *((_DWORD *)v34 + 1038);
                    *a16 = *((_DWORD *)v34 + 1039);
                    return v23;
                  }
                }
              }
            }
          }
          else if (rcv_name.msgh_size == 36)
          {
            uint64_t v23 = 4294966996;
            if (HIDWORD(v38))
            {
              if (rcv_name.msgh_remote_port) {
                uint64_t v23 = 4294966996;
              }
              else {
                uint64_t v23 = HIDWORD(v38);
              }
            }
          }
          else
          {
            uint64_t v23 = 4294966996;
          }
        }
        else
        {
          uint64_t v23 = 4294966995;
        }
        goto LABEL_34;
      }
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
    }
    if ((v23 - 268435459) > 1) {
      return v23;
    }
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x1E4F14960], rcv_name.msgh_local_port);
    }
LABEL_34:
    mach_msg_destroy(&rcv_name);
    return v23;
  }
  return 4294966989;
}

uint64_t (*AccessibilityDefs_server_routine(uint64_t a1))()
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 860013) >= 0xFFFFFFF5) {
    return _AXXMIGAccessibilityDefs_subsystem[5 * (v1 - 860002) + 5];
  }
  else {
    return 0;
  }
}

uint64_t _XCopyAttributeValue(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 64)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  uint64_t v17 = 0;
  if (*(_DWORD *)(result + 64) || *(_DWORD *)(result + 68) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 4096;
  CFURLRef v4 = (_DWORD *)(a2 + 52);
  *(_DWORD *)(a2 + 36) = 16777473;
  int v5 = *(_DWORD *)(result + 12);
  uint64_t v6 = *(unsigned int *)(result + 32);
  int v7 = *(_DWORD *)(result + 52);
  uint64_t v8 = *(void *)(result + 56);
  uint64_t v9 = *(void *)(result + 36);
  uint64_t v10 = *(void *)(result + 44);
  long long v11 = *(_OWORD *)(result + 100);
  v16[0] = *(_OWORD *)(result + 84);
  v16[1] = v11;
  uint64_t result = _AXXMIGCopyAttributeValue(v5, v6, v9, v10, v7, v8, (void *)(a2 + 56), v4, (void **)(a2 + 28), (_DWORD *)&v17 + 1, (int *)&v17, v16);
  if (!result)
  {
    int v12 = HIDWORD(v17);
    *(_DWORD *)(a2 + 40) = HIDWORD(v17);
    *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
    uint64_t v13 = (*(_DWORD *)(a2 + 52) + 3) & 0xFFFFFFFC;
    *(_DWORD *)(a2 + 4) = v13 + 64;
    uint64_t v14 = a2 + v13;
    int v15 = v17;
    *(_DWORD *)(v14 + 56) = v12;
    *(_DWORD *)(v14 + 60) = v15;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(void *)(a2 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XSetAttributeValue(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x5C || v5 > 0x105C) {
    goto LABEL_3;
  }
  if (*(unsigned char *)(result + 39) != 1) {
    goto LABEL_19;
  }
  unsigned int v7 = *(_DWORD *)(result + 76);
  if (v7 > 0x1000)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    uint64_t v4 = *MEMORY[0x1E4F14068];
    goto LABEL_4;
  }
  int v3 = -304;
  if ((int)v5 - 92 < v7) {
    goto LABEL_3;
  }
  unsigned int v8 = (v7 + 3) & 0xFFFFFFFC;
  if (v5 != v8 + 92) {
    goto LABEL_3;
  }
  uint64_t v9 = result + v8;
  unsigned int v10 = *(_DWORD *)(result + 40);
  if (v10 != *(_DWORD *)(v9 + 80))
  {
LABEL_19:
    int v3 = -300;
    goto LABEL_3;
  }
  uint64_t v11 = ((v5 + 3) & 0x1FFFFFFFCLL) + result;
  if (*(_DWORD *)v11 || *(_DWORD *)(v11 + 4) <= 0x1Fu)
  {
    int v3 = -309;
    goto LABEL_3;
  }
  uint64_t v12 = v9 - 4096;
  int v13 = *(_DWORD *)(result + 12);
  uint64_t v14 = *(unsigned int *)(result + 52);
  int v15 = *(_DWORD *)(result + 72);
  mach_port_t v16 = *(void **)(result + 28);
  uint64_t v17 = *(void *)(v12 + 4180);
  uint64_t v18 = *(void *)(result + 56);
  uint64_t v19 = *(void *)(result + 64);
  long long v20 = *(_OWORD *)(v11 + 36);
  v21[0] = *(_OWORD *)(v11 + 20);
  v21[1] = v20;
  uint64_t result = _AXXMIGSetAttributeValue(v13, v14, v18, v19, v15, result + 80, v7, v16, v10, v17, (int *)(a2 + 36), v21);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_4:
  *(void *)(a2 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v4;
  return result;
}

uint64_t _XPerformAction(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 64)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 64) || *(_DWORD *)(result + 68) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    uint64_t v4 = *MEMORY[0x1E4F14068];
    goto LABEL_8;
  }
  int v5 = *(_DWORD *)(result + 12);
  uint64_t v6 = *(unsigned int *)(result + 32);
  int v7 = *(_DWORD *)(result + 52);
  uint64_t v8 = *(void *)(result + 56);
  uint64_t v9 = *(void *)(result + 36);
  uint64_t v10 = *(void *)(result + 44);
  long long v11 = *(_OWORD *)(result + 100);
  v12[0] = *(_OWORD *)(result + 84);
  v12[1] = v11;
  uint64_t result = _AXXMIGPerformAction(v5, v6, v9, v10, v7, v8, (int *)(a2 + 36), v12);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_8:
  *(void *)(a2 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v4;
  return result;
}

uint64_t _XPerformActionWithValue(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 2) {
    goto LABEL_3;
  }
  uint64_t v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x68 || v5 > 0x1068) {
    goto LABEL_3;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112 || *(unsigned char *)(result + 51) != 1) {
    goto LABEL_20;
  }
  unsigned int v7 = *(_DWORD *)(result + 88);
  if (v7 > 0x1000)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    uint64_t v4 = *MEMORY[0x1E4F14068];
    goto LABEL_4;
  }
  int v3 = -304;
  if ((int)v5 - 104 < v7) {
    goto LABEL_3;
  }
  unsigned int v8 = (v7 + 3) & 0xFFFFFFFC;
  if (v5 != v8 + 104) {
    goto LABEL_3;
  }
  uint64_t v9 = result + v8;
  unsigned int v10 = *(_DWORD *)(result + 52);
  if (v10 != *(_DWORD *)(v9 + 92))
  {
LABEL_20:
    int v3 = -300;
    goto LABEL_3;
  }
  uint64_t v11 = ((v5 + 3) & 0x1FFFFFFFCLL) + result;
  if (*(_DWORD *)v11 || *(_DWORD *)(v11 + 4) <= 0x1Fu)
  {
    int v3 = -309;
    goto LABEL_3;
  }
  uint64_t v12 = v9 - 4096;
  int v13 = *(_DWORD *)(result + 12);
  mach_port_name_t v14 = *(_DWORD *)(result + 28);
  uint64_t v15 = *(unsigned int *)(result + 64);
  int v16 = *(_DWORD *)(result + 84);
  uint64_t v17 = *(void **)(result + 40);
  uint64_t v18 = *(void *)(v12 + 4192);
  uint64_t v19 = *(void *)(result + 68);
  uint64_t v20 = *(void *)(result + 76);
  long long v21 = *(_OWORD *)(v11 + 36);
  v22[0] = *(_OWORD *)(v11 + 20);
  v22[1] = v21;
  uint64_t result = _AXXMIGPerformActionWithValue(v13, v14, v15, v19, v20, v16, result + 92, v7, v17, v10, v18, (int *)(a2 + 36), v22);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_4:
  *(void *)(a2 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v4;
  return result;
}

uint64_t _XCopyElementAtPosition(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 76)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  int v17 = 0;
  if (*(_DWORD *)(result + 76) || *(_DWORD *)(result + 80) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    uint64_t v4 = *MEMORY[0x1E4F14068];
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 56) = 1024;
  uint64_t v5 = *(unsigned int *)(result + 12);
  uint64_t v6 = *(unsigned int *)(result + 32);
  float v7 = *(float *)(result + 52);
  float v8 = *(float *)(result + 56);
  __int16 v9 = *(_WORD *)(result + 60);
  int v10 = *(_DWORD *)(result + 64);
  uint64_t v11 = *(void *)(result + 68);
  uint64_t v12 = *(void *)(result + 36);
  uint64_t v13 = *(void *)(result + 44);
  long long v14 = *(_OWORD *)(result + 112);
  v16[0] = *(_OWORD *)(result + 96);
  v16[1] = v14;
  uint64_t result = _AXXMIGCopyElementAtPosition(v7, v8, v5, v6, v12, v13, v9, v10, v11, (_DWORD *)(a2 + 36), (_OWORD *)(a2 + 40), (unsigned char *)(a2 + 60), (_DWORD *)(a2 + 56), &v17, v16);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v4;
    uint64_t v15 = (*(_DWORD *)(a2 + 56) + 3) & 0xFFFFFFFC;
    *(_DWORD *)(a2 + 4) = v15 + 64;
    *(_DWORD *)(a2 + v15 + 60) = v17;
    return result;
  }
LABEL_8:
  *(void *)(a2 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v4;
  return result;
}

uint64_t _XAddNotification(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 84)
  {
    int v3 = -304;
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_9;
  }
  if (*(_DWORD *)(result + 84) || *(_DWORD *)(result + 88) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    uint64_t v4 = *MEMORY[0x1E4F14068];
    goto LABEL_10;
  }
  int v5 = *(_DWORD *)(result + 12);
  uint64_t v6 = *(unsigned int *)(result + 48);
  mach_port_name_t v7 = *(_DWORD *)(result + 28);
  uint64_t v8 = *(unsigned int *)(result + 68);
  int v9 = *(_DWORD *)(result + 72);
  uint64_t v10 = *(void *)(result + 76);
  uint64_t v11 = *(void *)(result + 52);
  uint64_t v12 = *(void *)(result + 60);
  long long v13 = *(_OWORD *)(result + 120);
  v14[0] = *(_OWORD *)(result + 104);
  v14[1] = v13;
  uint64_t result = _AXXMIGAddNotification(v5, v6, v11, v12, v8, v7, v9, v10, (int *)(a2 + 36), v14);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_10:
  *(void *)(a2 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v4;
  return result;
}

uint64_t _XRemoveNotification(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 72)
  {
    int v3 = -304;
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_9;
  }
  if (*(_DWORD *)(result + 72) || *(_DWORD *)(result + 76) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    uint64_t v4 = *MEMORY[0x1E4F14068];
    goto LABEL_10;
  }
  int v5 = *(_DWORD *)(result + 12);
  uint64_t v6 = *(unsigned int *)(result + 48);
  uint64_t v7 = *(unsigned int *)(result + 68);
  mach_port_name_t v8 = *(_DWORD *)(result + 28);
  uint64_t v9 = *(void *)(result + 52);
  uint64_t v10 = *(void *)(result + 60);
  long long v11 = *(_OWORD *)(result + 108);
  v12[0] = *(_OWORD *)(result + 92);
  v12[1] = v11;
  uint64_t result = _AXXMIGRemoveNotification(v5, v6, v9, v10, v7, v8, (int *)(a2 + 36), v12);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x1E4F14068];
  if (!result)
  {
    *(void *)(a2 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_10:
  *(void *)(a2 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v4;
  return result;
}

uint64_t _XCopyParameterizedAttributeValue(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v4 = *(unsigned int *)(result + 4);
  if (v4 < 0x5C || v4 > 0x105C) {
    goto LABEL_3;
  }
  if (*(unsigned char *)(result + 39) != 1) {
    goto LABEL_19;
  }
  unsigned int v6 = *(_DWORD *)(result + 76);
  if (v6 > 0x1000)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_4;
  }
  int v3 = -304;
  if ((int)v4 - 92 < v6) {
    goto LABEL_3;
  }
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  if (v4 != v7 + 92) {
    goto LABEL_3;
  }
  uint64_t v8 = result + v7;
  if (*(_DWORD *)(result + 40) != *(_DWORD *)(v8 + 80))
  {
LABEL_19:
    int v3 = -300;
    goto LABEL_3;
  }
  uint64_t v26 = 0;
  uint64_t v9 = ((v4 + 3) & 0x1FFFFFFFCLL) + result;
  if (*(_DWORD *)v9 || *(_DWORD *)(v9 + 4) <= 0x1Fu)
  {
    int v3 = -309;
    goto LABEL_3;
  }
  *(_DWORD *)(a2 + 52) = 4096;
  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t v10 = v8 - 4096;
  int v11 = *(_DWORD *)(result + 12);
  uint64_t v12 = *(unsigned int *)(result + 52);
  int v13 = *(_DWORD *)(result + 72);
  unsigned int v14 = *(_DWORD *)(result + 76);
  uint64_t v15 = *(void **)(result + 28);
  unsigned int v16 = *(_DWORD *)(result + 40);
  uint64_t v17 = *(void *)(v10 + 4180);
  uint64_t v18 = *(void *)(result + 56);
  uint64_t v19 = *(void *)(result + 64);
  long long v20 = *(_OWORD *)(v9 + 36);
  v25[0] = *(_OWORD *)(v9 + 20);
  v25[1] = v20;
  uint64_t result = _AXXMIGCopyParameterizedAttributeValue(v11, v12, v18, v19, v13, result + 80, v14, v15, v16, v17, (void *)(a2 + 56), (_DWORD *)(a2 + 52), (void **)(a2 + 28), (_DWORD *)&v26 + 1, (int *)&v26, v25);
  if (!result)
  {
    int v21 = HIDWORD(v26);
    *(_DWORD *)(a2 + 40) = HIDWORD(v26);
    *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
    uint64_t v22 = (*(_DWORD *)(a2 + 52) + 3) & 0xFFFFFFFC;
    *(_DWORD *)(a2 + 4) = v22 + 64;
    uint64_t v23 = a2 + v22;
    int v24 = v26;
    *(_DWORD *)(v23 + 56) = v21;
    *(_DWORD *)(v23 + 60) = v24;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_4:
  *(void *)(a2 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t _XCopyMultipleAttributeValues(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v4 = *(unsigned int *)(result + 4);
  if (v4 < 0x5C || v4 > 0x105C) {
    goto LABEL_3;
  }
  if (*(unsigned char *)(result + 39) != 1) {
    goto LABEL_19;
  }
  unsigned int v6 = *(_DWORD *)(result + 72);
  if (v6 > 0x1000)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_4;
  }
  int v3 = -304;
  if ((int)v4 - 92 < v6) {
    goto LABEL_3;
  }
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  if (v4 != v7 + 92) {
    goto LABEL_3;
  }
  uint64_t v8 = result + v7;
  if (*(_DWORD *)(result + 40) != *(_DWORD *)(v8 + 76))
  {
LABEL_19:
    int v3 = -300;
    goto LABEL_3;
  }
  uint64_t v26 = 0;
  uint64_t v9 = ((v4 + 3) & 0x1FFFFFFFCLL) + result;
  if (*(_DWORD *)v9 || *(_DWORD *)(v9 + 4) <= 0x1Fu)
  {
    int v3 = -309;
    goto LABEL_3;
  }
  *(_DWORD *)(a2 + 52) = 4096;
  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t v10 = v8 - 4096;
  int v11 = *(_DWORD *)(result + 12);
  uint64_t v12 = *(unsigned int *)(result + 52);
  unsigned int v13 = *(_DWORD *)(result + 72);
  unsigned int v14 = *(void **)(result + 28);
  unsigned int v15 = *(_DWORD *)(result + 40);
  int v16 = *(_DWORD *)(v10 + 4176);
  uint64_t v17 = *(void *)(v10 + 4180);
  uint64_t v18 = *(void *)(result + 56);
  uint64_t v19 = *(void *)(result + 64);
  long long v20 = *(_OWORD *)(v9 + 36);
  v25[0] = *(_OWORD *)(v9 + 20);
  v25[1] = v20;
  uint64_t result = _AXXMIGCopyMultipleAttributeValues(v11, v12, v18, v19, result + 76, v13, v14, v15, v16, v17, (void *)(a2 + 56), (_DWORD *)(a2 + 52), (void **)(a2 + 28), (_DWORD *)&v26 + 1, &v26, v25);
  if (!result)
  {
    int v21 = HIDWORD(v26);
    *(_DWORD *)(a2 + 40) = HIDWORD(v26);
    *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
    uint64_t v22 = (*(_DWORD *)(a2 + 52) + 3) & 0xFFFFFFFC;
    *(_DWORD *)(a2 + 4) = v22 + 64;
    uint64_t v23 = a2 + v22;
    int v24 = v26;
    *(_DWORD *)(v23 + 56) = v21;
    *(_DWORD *)(v23 + 60) = v24;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_4:
  *(void *)(a2 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *MEMORY[0x1E4F14068];
  return result;
}

uint64_t AccessibilityDefs_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + _Block_object_dispose(&a9, 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 860013) >= 0xFFFFFFF5
    && (int v5 = (void (*)(void))_AXXMIGAccessibilityDefs_subsystem[5 * (v4 - 860002) + 5]) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(void *)(a2 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *MEMORY[0x1E4F14068];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void _AXDetermineRequestingClient_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1BA657000, log, OS_LOG_TYPE_ERROR, "Requesting AX client was AXUIServer multiplexing but no futher match found. falling back to unknown", v1, 2u);
}

void _AXHandleRemoteElementCallthrough_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_1BA657000, log, OS_LOG_TYPE_DEBUG, "Not returning remote element because its from the same pid and we're not on main thread.", v1, 2u);
}

void AXSerializeWrapper_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1BA657000, log, OS_LOG_TYPE_ERROR, "Still could not get serialized buffer key!", v1, 2u);
}

void _AXUIElementRegisterServerWithRunLoopInternal_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_1BA657000, log, OS_LOG_TYPE_DEBUG, "Successfully created AX server", v1, 2u);
}

void _AXUIElementRegisterServerWithRunLoopInternal_cold_2(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_fault_impl(&dword_1BA657000, log, OS_LOG_TYPE_FAULT, "Unable to create run loop source for remote bridge communication.", v1, 2u);
}

void _AXUIElementRegisterServerWithRunLoopInternal_cold_3(kern_return_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  bootstrap_strerror(a1);
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1BA657000, a2, OS_LOG_TYPE_FAULT, "Unable to create mach port for remote bridge communication: %i (%s)", v3, 0x12u);
}

void _AXUIElementRegisterServerWithRunLoopInternal_cold_4(kern_return_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  bootstrap_strerror(a1);
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1BA657000, a2, OS_LOG_TYPE_ERROR, "Unable to create mach port for AX Server: %i (%s)", v3, 0x12u);
}

void __AXPushNotificationToSystemForBroadcast_block_invoke_2_cold_1(int *a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_1BA657000, log, OS_LOG_TYPE_ERROR, "Unable to broadcast %d: err %d", (uint8_t *)v4, 0xEu);
}

void _AXXMIGCopyElementAtPosition_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1BA657000, log, OS_LOG_TYPE_ERROR, "This copy element call was not allowed", v1, 2u);
}

void __AXUIElementInitialize_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1BA657000, a2, OS_LOG_TYPE_FAULT, "could not create pthread key: %d", (uint8_t *)v2, 8u);
}

void AXConvertOutgoingValue_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BA657000, a2, OS_LOG_TYPE_ERROR, "Can't serialize text marker: %@", (uint8_t *)&v2, 0xCu);
}

void __getBKSHIDEventAuthenticationMessageClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *BackBoardServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXRuntimeUtilities.m", 23, @"%s", *a1);

  __break(1u);
}

void __getBKSHIDEventAuthenticationMessageClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getBKSHIDEventAuthenticationMessageClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXRuntimeUtilities.m", 24, @"Unable to find class %s", "BKSHIDEventAuthenticationMessage");

  __break(1u);
}

void AXUnserializeCFType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _logAndReturn_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void bogusUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfStringUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfStringUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfStringUnserialize_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfStringUnserialize_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfNumberUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfNumberUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfNumberUnserialize_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfNumberUnserialize_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfNumberUnserialize_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfBooleanUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfBooleanUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfArrayUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfArrayUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfArrayUnserialize_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfArrayUnserialize_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfArrayUnserialize_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfDictionaryUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfDictionaryUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfDictionaryUnserialize_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfDictionaryUnserialize_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfDictionaryUnserialize_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfDictionaryUnserialize_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfDataUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfDataUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfDataUnserialize_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfDataUnserialize_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfDateUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfDateUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfDateUnserialize_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfURLUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfURLUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfURLUnserialize_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfURLUnserialize_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfNullUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfNullUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfAttributedStringUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfAttributedStringUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfAttributedStringUnserialize_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfAttributedStringUnserialize_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfAttributedStringUnserialize_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfAttributedStringUnserialize_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void axElementUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void axValueUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void axValueUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void axValueUnserialize_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void axValueUnserialize_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cgColorUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cgColorUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cgColorUnserialize_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cgColorUnserialize_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cgColorUnserialize_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cgPathUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cgPathUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cgPathUnserialize_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cgPathUnserialize_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cgPathUnserialize_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfUUIDUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void cfUUIDUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ctFontUnserialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ctFontUnserialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __getFBSDisplayMonitorClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *FrontBoardServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXPidManagement.m", 26, @"%s", *a1);

  __break(1u);
}

void __getFBSDisplayMonitorClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getFBSDisplayMonitorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXPidManagement.m", 27, @"Unable to find class %s", "FBSDisplayMonitor");

  __break(1u);
}

void __getAXPIFingerControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getAXPIFingerControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXUIMLElement.m", 35, @"Unable to find class %s", "AXPIFingerController");

  __break(1u);
}

void AccessibilityPhysicalInteractionLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AccessibilityPhysicalInteractionLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXUIMLElement.m", 34, @"%s", *a1);

  __break(1u);
}

void __getAXMTextDetectionOptionsClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getAXMTextDetectionOptionsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXUIMLElement.m", 26, @"Unable to find class %s", "AXMTextDetectionOptions");

  __break(1u);
}

void AXMediaUtilitiesLibrary_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AXMediaUtilitiesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXUIMLElement.m", 23, @"%s", *a1);

  __break(1u);
}

void __getAXMDisplayManagerClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getAXMDisplayManagerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXUIMLElement.m", 27, @"Unable to find class %s", "AXMDisplayManager");

  __break(1u);
}

void __getAXMVisionScreenRecognitionOptionsClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getAXMVisionScreenRecognitionOptionsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXUIMLElement.m", 25, @"Unable to find class %s", "AXMVisionScreenRecognitionOptions");

  __break(1u);
}

void __getAXMScreenRecognitionCenterClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getAXMScreenRecognitionCenterClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXUIMLElement.m", 29, @"Unable to find class %s", "AXMScreenRecognitionCenter");

  __break(1u);
}

void __getAXMVisionFeatureClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getAXMVisionFeatureClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXUIMLElement.m", 28, @"Unable to find class %s", "AXMVisionFeature");

  __break(1u);
}

void __getAXSettingsClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AccessibilityUtilitiesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXUIMLElement.m", 38, @"%s", *a1);

  __break(1u);
}

void __getAXSettingsClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getAXSettingsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXUIMLElement.m", 39, @"Unable to find class %s", "AXSettings");

  __break(1u);
}

void __getAXNamedReplayableGestureClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getAXNamedReplayableGestureClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXUIMLElement.m", 36, @"Unable to find class %s", "AXNamedReplayableGesture");

  __break(1u);
}

void __getAXCustomContentClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AccessibilityLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXElement.m", 24, @"%s", *a1);

  __break(1u);
}

void __getAXCustomContentClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  int v1 = [NSString stringWithUTF8String:"Class getAXCustomContentClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXElement.m", 25, @"Unable to find class %s", "AXCustomContent");

  __break(1u);
}

void AXSerializeCFType3_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1BA657000, log, OS_LOG_TYPE_ERROR, "unknown serialization error!", v1, 2u);
}

void __getAXPerformPrivilegedAttributedStringTransformationsSymbolLoc_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"void *AccessibilityUtilitiesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AXClientSideValueTransformer.m", 16, @"%s", *a1);

  __break(1u);
  AXDeviceIsAudioAccessory();
}

uint64_t AXDeviceIsAudioAccessory()
{
  return MEMORY[0x1F4105EA8]();
}

uint64_t AXLogAppAccessibility()
{
  return MEMORY[0x1F4105FA0]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x1F4105FE0]();
}

uint64_t AXLogHitTest()
{
  return MEMORY[0x1F4106018]();
}

uint64_t AXLogRemoteElement()
{
  return MEMORY[0x1F4106058]();
}

uint64_t AXLogUIA()
{
  return MEMORY[0x1F41060D0]();
}

uint64_t AXMediaLogElementVision()
{
  return MEMORY[0x1F4106108]();
}

uint64_t AXMediaLogMLElement()
{
  return MEMORY[0x1F4106130]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x1F41061A0]();
}

uint64_t AXRuntimeCheck_SupportsMacAXV2()
{
  return MEMORY[0x1F4106270]();
}

uint64_t AXRuntimeLogCommon()
{
  return MEMORY[0x1F4106290]();
}

uint64_t AXRuntimeLogNotifications()
{
  return MEMORY[0x1F4106298]();
}

uint64_t AXRuntimeLogPID()
{
  return MEMORY[0x1F41062A0]();
}

uint64_t AXRuntimeLogSerialization()
{
  return MEMORY[0x1F41062A8]();
}

uint64_t AX_PERFORM_WITH_LOCK()
{
  return MEMORY[0x1F4106310]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFAttributedStringBeginEditing(CFMutableAttributedStringRef aStr)
{
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x1F40D7240](alloc, str, attributes);
}

CFMutableAttributedStringRef CFAttributedStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFAttributedStringRef aStr)
{
  return (CFMutableAttributedStringRef)MEMORY[0x1F40D7258](alloc, maxLength, aStr);
}

void CFAttributedStringEndEditing(CFMutableAttributedStringRef aStr)
{
}

CFTypeRef CFAttributedStringGetAttribute(CFAttributedStringRef aStr, CFIndex loc, CFStringRef attrName, CFRange *effectiveRange)
{
  return (CFTypeRef)MEMORY[0x1F40D7270](aStr, loc, attrName, effectiveRange);
}

CFDictionaryRef CFAttributedStringGetAttributes(CFAttributedStringRef aStr, CFIndex loc, CFRange *effectiveRange)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7280](aStr, loc, effectiveRange);
}

CFIndex CFAttributedStringGetLength(CFAttributedStringRef aStr)
{
  return MEMORY[0x1F40D7298](aStr);
}

CFStringRef CFAttributedStringGetString(CFAttributedStringRef aStr)
{
  return (CFStringRef)MEMORY[0x1F40D72A0](aStr);
}

CFTypeID CFAttributedStringGetTypeID(void)
{
  return MEMORY[0x1F40D72A8]();
}

void CFAttributedStringRemoveAttribute(CFMutableAttributedStringRef aStr, CFRange range, CFStringRef attrName)
{
}

void CFAttributedStringReplaceAttributedString(CFMutableAttributedStringRef aStr, CFRange range, CFAttributedStringRef replacement)
{
}

void CFAttributedStringReplaceString(CFMutableAttributedStringRef aStr, CFRange range, CFStringRef replacement)
{
}

void CFAttributedStringSetAttributes(CFMutableAttributedStringRef aStr, CFRange range, CFDictionaryRef replacement, Boolean clearOtherAttributes)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1F40D7898](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x1F40D7928](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1F40D7938]();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7B60](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

uint64_t CFLog()
{
  return MEMORY[0x1F40D7C50]();
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x1F40D7C68](allocator, *(void *)&portNum, callout, context, shouldFreeInfo);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return MEMORY[0x1F40D7C78](port);
}

void CFMachPortSetInvalidationCallBack(CFMachPortRef port, CFMachPortInvalidationCallBack callout)
{
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x1F40D7D68]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFIndex CFNumberGetByteSize(CFNumberRef number)
{
  return MEMORY[0x1F40D7DF8](number);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E08](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1F40D8128](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
}

void CFRunLoopSourceGetContext(CFRunLoopSourceRef source, CFRunLoopSourceContext *context)
{
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1F40D81F8](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1F40D8220](theSet);
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1F40D8460](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1F40D8698](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x1F40D86A8](tokenizer);
  result.unsigned int length = v2;
  result.locatiouint64_t n = v1;
  return result;
}

CFStringTokenizerTokenType CFStringTokenizerGoToTokenAtIndex(CFStringTokenizerRef tokenizer, CFIndex index)
{
  return MEMORY[0x1F40D86B0](tokenizer, index);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1F40D88C0](allocator, URLString, baseURL);
}

CFURLRef CFURLGetBaseURL(CFURLRef anURL)
{
  return (CFURLRef)MEMORY[0x1F40D88F0](anURL);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8918](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1F40D8928]();
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x1F40D8998](alloc, uuidStr);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1F40D89A0](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

CFTypeID CFUUIDGetTypeID(void)
{
  return MEMORY[0x1F40D89D8]();
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x1F40D89E8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D99F8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1F40D9A00](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1F40D9A18](color);
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x1F40D9A30]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceCMYK(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AE8]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF0]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BF0](space);
}

uint64_t CGColorSpaceGetProcessColorModel()
{
  return MEMORY[0x1F40D9BF8]();
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

CFTypeID CGPathGetTypeID(void)
{
  return MEMORY[0x1F40DB0F8]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1F40DB228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x1F40DB300]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

CTFontDescriptorRef CTFontCopyFontDescriptor(CTFontRef font)
{
  return (CTFontDescriptorRef)MEMORY[0x1F40DF2B8](font);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1F40DF378](descriptor, matrix, size);
}

CFDictionaryRef CTFontDescriptorCopyAttributes(CTFontDescriptorRef descriptor)
{
  return (CFDictionaryRef)MEMORY[0x1F40DF3B0](descriptor);
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1F40DF408](attributes);
}

CGFloat CTFontGetSize(CTFontRef font)
{
  MEMORY[0x1F40DF558](font);
  return result;
}

CFTypeID CTFontGetTypeID(void)
{
  return MEMORY[0x1F40DF580]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E7140](range1.location, range1.length, range2.location, range2.length);
  result.unsigned int length = v3;
  result.locatiouint64_t n = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1F40E7180](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

void NSMapRemove(NSMapTable *table, const void *key)
{
}

uint64_t NSPopAutoreleasePool()
{
  return MEMORY[0x1F40E71E0]();
}

uint64_t NSPushAutoreleasePool()
{
  return MEMORY[0x1F40E71F0]();
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1 = MEMORY[0x1F40E71F8](aString);
  result.unsigned int length = v2;
  result.locatiouint64_t n = v1;
  return result;
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x1F40E7290]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1F40E72A8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1F40E72C0]((__n128)aSize, *(__n128 *)&aSize.height);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

uint64_t _AXSAccessibilityNeedsMiniServer()
{
  return MEMORY[0x1F4178850]();
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return MEMORY[0x1F41788D0]();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return MEMORY[0x1F4178908]();
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x1F4178968]();
}

uint64_t _AXSAutomationLocalizedStringLookupInfoSetEnabled()
{
  return MEMORY[0x1F4178990]();
}

uint64_t _AXSClarityBoardEnabled()
{
  return MEMORY[0x1F41789E8]();
}

uint64_t _AXSDwellControlEnabled()
{
  return MEMORY[0x1F4178A68]();
}

uint64_t _AXSHoverTextEnabled()
{
  return MEMORY[0x1F4178BC0]();
}

uint64_t _AXSInUnitTestMode()
{
  return MEMORY[0x1F4178CC0]();
}

uint64_t _AXSMossdeepEnabled()
{
  return MEMORY[0x1F4178DA8]();
}

uint64_t _AXSSetAuditInspectionModeEnabled()
{
  return MEMORY[0x1F4178F00]();
}

uint64_t _AXSSetAutomationEnabled()
{
  return MEMORY[0x1F4178F08]();
}

uint64_t _AXSWatchControlEnabled()
{
  return MEMORY[0x1F4179200]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFAttributedStringCreateWithRuns()
{
  return MEMORY[0x1F40D8B50]();
}

uint64_t _CFAttributedStringGetNumberOfRuns()
{
  return MEMORY[0x1F40D8B60]();
}

uint64_t _CFAttributedStringGetRuns()
{
  return MEMORY[0x1F40D8B68]();
}

uint64_t _CFMZEnabled()
{
  return MEMORY[0x1F40D8EA0]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void abort(void)
{
}

uint64_t bootstrap_check_in2()
{
  return MEMORY[0x1F40CA540]();
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1F40CA548](*(void *)&bp, service_name, sp);
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x1F40CA550]();
}

uint64_t bootstrap_register2()
{
  return MEMORY[0x1F40CA560]();
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return (const char *)MEMORY[0x1F40CA568](*(void *)&r);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

gid_t getegid(void)
{
  return MEMORY[0x1F40CC3A8]();
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1F40CC9A0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1F40CCA08](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1F40CCA10](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x1F40CCA28](*(void *)&task, *(void *)&name, *(void *)&msgid, *(void *)&sync, *(void *)&notify, *(void *)&notifyPoly, previous);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1F40CCA30](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info, *(void *)&port_infoCnt);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1F40CCD70]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD888](*(void *)&pid, buffer, *(void *)&buffersize);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40CDA20](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1F40CDA40](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40CDB70](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x1F40CE460](*(void *)&task, *(void *)&which_port, special_port);
}

kern_return_t vm_copy(vm_map_t target_task, vm_address_t source_address, vm_size_t size, vm_address_t dest_address)
{
  return MEMORY[0x1F40CE6B8](*(void *)&target_task, source_address, size, dest_address);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1F40CE758](msg);
}