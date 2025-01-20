BOOL sub_191893DC8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_indexOfObjectIdenticalTo_(a1, a2, a3, a4) != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t sub_191894540(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  v5 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], a2, a3, a4);
  v9 = objc_msgSend_threadDictionary(v5, v6, v7, v8);
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, @"com.apple.IMRemoteObjectDeliveringMessageKey", v11);
  objc_msgSend_setObject_forKeyedSubscript_(v9, v13, *(void *)(a1 + 32), @"com.apple.IMRemoteObjectDeliveringMessageKey");
  v14 = *(void **)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 64);
  if (objc_msgSend_isValid(v14, v18, v19, v20))
  {
    if (objc_msgSend_forwardXPCObject_messageContext_locked_(v14, v21, v15, v16, 0) == 1)
    {
      if (dword_1EB273738 < 0)
      {
        if (qword_1EB273BF0 != -1) {
          dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
        }
        if (dword_1EB273738 <= 0) {
          goto LABEL_25;
        }
      }
      else if (!dword_1EB273738)
      {
        goto LABEL_25;
      }
      v35 = @"* Message delivery failed, object is dead: %@";
    }
    else
    {
      if (dword_1EB273738 < 0)
      {
        if (qword_1EB273BF0 != -1) {
          dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
        }
        if (dword_1EB273738 <= 0) {
          goto LABEL_25;
        }
      }
      else if (!dword_1EB273738)
      {
LABEL_25:
        if (v17) {
          (*(void (**)(uint64_t))(v17 + 16))(v17);
        }
        goto LABEL_27;
      }
      v35 = @"* Message delivery success to: %@";
    }
    _IMLog(v35, v28, v29, v30, v31, v32, v33, v34, (char)v14);
    goto LABEL_25;
  }
  if ((dword_1EB273738 & 0x80000000) == 0)
  {
    if (!dword_1EB273738) {
      goto LABEL_27;
    }
LABEL_15:
    _IMLog(@"* Object is no longer valid, skipping this message: %@", (uint64_t)v21, v22, v23, v24, v25, v26, v27, (char)v14);
    goto LABEL_27;
  }
  if (qword_1EB273BF0 != -1) {
    dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
  }
  if (dword_1EB273738 > 0) {
    goto LABEL_15;
  }
LABEL_27:
  dispatch_release(*(dispatch_object_t *)(a1 + 56));
  xpc_release(*(xpc_object_t *)(a1 + 40));
  return objc_msgSend_setObject_forKeyedSubscript_(v9, v36, v12, @"com.apple.IMRemoteObjectDeliveringMessageKey");
}

uint64_t sub_191894730()
{
  pthread_mutex_lock(&stru_1EB2736B0);
  v0 = (void *)qword_1EB273780;
  qword_1EB273780 = 0;

  return pthread_mutex_unlock(&stru_1EB2736B0);
}

CFMutableDictionaryRef sub_191894A50(uint64_t a1)
{
  pthread_mutex_init((pthread_mutex_t *)(*(void *)(a1 + 32) + 8), 0);
  CFMutableDictionaryRef result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
  *(void *)(*(void *)(a1 + 32) + 72) = result;
  return result;
}

void sub_191894D50(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v2)
  {
    v6 = v2;
    uint64_t v7 = (const char *)objc_msgSend_selector(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3, v4, v5);
    uint64_t v11 = objc_msgSend_methodSignature(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8, v9, v10);
    uint64_t v15 = objc_msgSend_numberOfArguments(v11, v12, v13, v14);
    uint64_t v16 = NSStringFromSelector(v7);
    if (v15 == 2) {
      uint64_t v19 = (NSString *)objc_msgSend_stringByAppendingString_(v16, v17, @"WithMessageContext:", v18);
    }
    else {
      uint64_t v19 = (NSString *)objc_msgSend_stringByAppendingString_(v16, v17, @"messageContext:", v18);
    }
    SEL v20 = NSSelectorFromString(v19);
    if (v20)
    {
      uint64_t v23 = (uint64_t)v20;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v24 = objc_msgSend_methodSignatureForSelector_(v6, v21, v23, v22);
        if (v24)
        {
          uint64_t v25 = objc_msgSend_invocationWithMethodSignature_(MEMORY[0x1E4F1CA18], v21, v24, v22);
          objc_msgSend_setSelector_(v25, v26, v23, v27);
          JWCopyInvocationArguments(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v25);
          objc_msgSend_setArgument_atIndex_(v25, v28, *(void *)(*(void *)(a1 + 48) + 8) + 40, v15);
          *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v25;
        }
      }
    }
    objc_msgSend_invokeWithTarget_(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v21, (uint64_t)v6, v22);
    if (*(unsigned char *)(a1 + 56)) {
      kdebug_trace();
    }

    if (*(unsigned char *)(a1 + 56)) {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 8) = 0;
    }
  }
}

id sub_191894F68(void *a1, const char *a2, const char *a3, uint64_t a4)
{
  v6 = objc_msgSend_methodSignatureForSelector_(a1, a2, (uint64_t)a3, a4);
  if (!v6)
  {
    objc_msgSend_protocol(a1, v7, v8, v9);
    uint64_t v10 = (Protocol *)objc_claimAutoreleasedReturnValue();
    objc_method_description MethodDescription = protocol_getMethodDescription(v10, a3, 0, 1);

    if (MethodDescription.name)
    {
      v6 = objc_msgSend_signatureWithObjCTypes_(MEMORY[0x1E4F1CA38], v12, (uint64_t)MethodDescription.types, v13);
    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

uint64_t sub_191895324(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_sharedInstance(IMLockdownManager, a2, a3, a4);
  char isInternalInstall = objc_msgSend_isInternalInstall(v4, v5, v6, v7);

  v9.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v9.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v12.st_blksize = v9;
  *(timespec *)v12.st_qspare = v9;
  v12.st_birthtimespec = v9;
  *(timespec *)&v12.st_size = v9;
  v12.st_mtimespec = v9;
  v12.st_ctimespec = v9;
  *(timespec *)&v12.st_uid = v9;
  v12.st_atimespec = v9;
  *(timespec *)&v12.st_dev = v9;
  uint64_t result = lstat("/var/mobile/Library/PPTDevice", &v12);
  char v11 = isInternalInstall ^ 1;
  if (result) {
    char v11 = 1;
  }
  byte_1EB273A78 = v11;
  return result;
}

uint64_t sub_1918953A4()
{
  qword_1EB273C50 = objc_alloc_init(IMMobileNetworkManager);
  return MEMORY[0x1F41817F8]();
}

void sub_19189547C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_controlCharacterSet(MEMORY[0x1E4F28B88], a2, a3, a4);
  id v27 = (id)objc_msgSend_mutableCopy(v4, v5, v6, v7);

  char v11 = objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E4F28B88], v8, v9, v10);
  objc_msgSend_formUnionWithCharacterSet_(v27, v12, (uint64_t)v11, v13);

  uint64_t v17 = objc_msgSend_illegalCharacterSet(MEMORY[0x1E4F28B88], v14, v15, v16);
  objc_msgSend_formUnionWithCharacterSet_(v27, v18, (uint64_t)v17, v19);

  objc_msgSend_removeCharactersInString_(v27, v20, @"+", v21);
  uint64_t v25 = objc_msgSend_copy(v27, v22, v23, v24);
  uint64_t v26 = (void *)qword_1EB2737A8;
  qword_1EB2737A8 = v25;
}

void sub_19189553C(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x192FDE5A0]();
  v3 = (const void *)MGCopyAnswer();
  if (v3)
  {
    uint64_t v4 = v3;
    BOOL v5 = CFEqual(v3, @"Vendor") != 0;
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = a1 + 32;
    *(unsigned char *)(v7 + 12) = v5;
    *(unsigned char *)(*(void *)v6 + 10) = CFEqual(v4, @"Carrier") != 0;
    CFRelease(v4);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v6 = a1 + 32;
    *(unsigned char *)(v8 + 12) = 0;
    *(unsigned char *)(*(void *)v6 + 10) = 0;
  }
  *(unsigned char *)(*(void *)v6 + 9) = os_variant_has_internal_ui();
  *(unsigned char *)(*(void *)v6 + 11) = os_variant_has_factory_content();
}

CFNumberRef sub_191895DC0()
{
  char valuePtr = 0;
  qword_1EB273B78 = (uint64_t)CFNumberCreate(0, kCFNumberCharType, &valuePtr);
  char valuePtr = 1;
  qword_1EB273B80 = (uint64_t)CFNumberCreate(0, kCFNumberCharType, &valuePtr);
  char valuePtr = 2;
  qword_1EB273B88 = (uint64_t)CFNumberCreate(0, kCFNumberCharType, &valuePtr);
  char valuePtr = 3;
  qword_1EB273B90 = (uint64_t)CFNumberCreate(0, kCFNumberCharType, &valuePtr);
  char valuePtr = 4;
  qword_1EB273B98 = (uint64_t)CFNumberCreate(0, kCFNumberCharType, &valuePtr);
  char valuePtr = 5;
  qword_1EB273BA0 = (uint64_t)CFNumberCreate(0, kCFNumberCharType, &valuePtr);
  char valuePtr = 6;
  qword_1EB273BA8 = (uint64_t)CFNumberCreate(0, kCFNumberCharType, &valuePtr);
  char valuePtr = 7;
  qword_1EB273BB0 = (uint64_t)CFNumberCreate(0, kCFNumberCharType, &valuePtr);
  char valuePtr = 8;
  CFNumberRef result = CFNumberCreate(0, kCFNumberCharType, &valuePtr);
  qword_1EB273BB8 = (uint64_t)result;
  return result;
}

__CFBundle *IMGetMainBundleIdentifier()
{
  MainBundle = CFBundleGetMainBundle();
  if (MainBundle)
  {
    CFBundleGetIdentifier(MainBundle);
    MainBundle = (__CFBundle *)objc_claimAutoreleasedReturnValue();
  }
  return MainBundle;
}

void sub_191896034()
{
  v0 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  uint64_t v4 = objc_msgSend_lastObject(v0, v1, v2, v3);
  objc_msgSend_stringByAppendingPathComponent_(v4, v5, @"Caches/com.apple.setmme", v6);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v10 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v7, v8, v9);
  byte_1EB2737C8 = objc_msgSend_fileExistsAtPath_(v10, v11, (uint64_t)v13, v12);
}

id sub_1918960D4(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_objectForKey_(a1, a2, a3, a4);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

void sub_191896140(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 8))
  {
    uint64_t v6 = objc_msgSend_timer(IMIDSLog, a2, a3, a4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v16 = 134217984;
      uint64_t v17 = v7;
      _os_log_impl(&dword_191892000, v6, OS_LOG_TYPE_DEFAULT, "-[IMDispatchTimer fired] {self: %p}", (uint8_t *)&v16, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v5 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v5 + 9))
  {
    uint64_t v8 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E4F1C9C8], a2, a3, a4, (double)*(unint64_t *)(a1 + 48));
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 24);
    *(void *)(v9 + 24) = v8;
  }
  else
  {
    char v11 = objc_msgSend_timer(IMIDSLog, a2, a3, a4);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v16 = 134217984;
      uint64_t v17 = v12;
      _os_log_impl(&dword_191892000, v11, OS_LOG_TYPE_DEFAULT, "-[IMDispatchTimer invalidating] {self: %p}", (uint8_t *)&v16, 0xCu);
    }

    objc_msgSend_invalidate(*(void **)(a1 + 32), v13, v14, v15);
  }
}

void sub_191896300()
{
  v0 = (void *)qword_1EB273D20;
  qword_1EB273D20 = @"UIApplicationDidBecomeActiveNotification";

  v1 = (void *)qword_1EB273D28;
  qword_1EB273D28 = @"UIApplicationWillResignActiveNotification";

  uint64_t v2 = (void *)qword_1EB273D30;
  qword_1EB273D30 = @"UIApplicationDidEnterBackgroundNotification";

  uint64_t v3 = (void *)qword_1EB273D38;
  qword_1EB273D38 = @"UIApplicationWillEnterForegroundNotification";

  uint64_t v4 = (void *)qword_1EB273D40;
  qword_1EB273D40 = @"UIApplicationSuspendedNotification";

  uint64_t v5 = (void *)qword_1EB273D48;
  qword_1EB273D48 = @"UIApplicationResumedNotification";

  uint64_t v6 = (void *)qword_1EB273D50;
  qword_1EB273D50 = @"UIApplicationSuspendedEventsOnlyNotification";

  uint64_t v7 = (void *)qword_1EB273D58;
  qword_1EB273D58 = @"UIApplicationResumedEventsOnlyNotification";

  uint64_t v8 = (void *)qword_1EB273D60;
  qword_1EB273D60 = @"_UIApplicationWillAddDeactivationReasonNotification";

  uint64_t v9 = (void *)qword_1EB273D68;
  qword_1EB273D68 = @"_UIApplicationDidRemoveDeactivationReasonNotification";

  uint64_t v10 = (void *)qword_1EB273D70;
  qword_1EB273D70 = @"_UIApplicationDeactivationReasonUserInfoKey";
}

void sub_191896964(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  notify_get_state(*(_DWORD *)(a1 + 56), &state64);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v6 = objc_msgSend_registration(IMRGLog, v3, v4, v5);
  uint64_t v7 = v6;
  if (v2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = v8;
      __int16 v18 = 1024;
      int v19 = state64;
      _os_log_impl(&dword_191892000, v7, OS_LOG_TYPE_DEFAULT, "Dispatch registration invoked - fetched state {name: %s, state: %u}", buf, 0x12u);
    }

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_19189CC0C;
    v11[3] = &unk_1E5722D98;
    uint64_t v9 = *(NSObject **)(a1 + 32);
    uint64_t v10 = *(id *)(a1 + 40);
    int v14 = *(_DWORD *)(a1 + 56);
    uint64_t v12 = v10;
    uint64_t v13 = state64;
    dispatch_async(v9, v11);
    uint64_t v7 = v12;
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_1918E0B28(a1, (uint64_t *)&state64, v7);
  }
}

id sub_191896AD8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_count(a1, a2, a3, a4);
  if (v5)
  {
    uint64_t v5 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v6, (uint64_t)a1, v7);
  }
  return v5;
}

_xpc_connection_s *sub_191896B24(const char *a1, void *a2, void *a3, void *a4, void *a5, void *a6, int a7)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (v13)
  {
    if (!a1) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v13 = dispatch_get_global_queue(2, 0);
    if (!a1) {
      goto LABEL_7;
    }
  }
  if (*a1)
  {
    xpc_connection_t mach_service = xpc_connection_create_mach_service(a1, v13, 1uLL);
    goto LABEL_8;
  }
LABEL_7:
  xpc_connection_t mach_service = xpc_connection_create(0, v13);
LABEL_8:
  xpc_connection_t v19 = mach_service;
  if (a7) {
    xpc_connection_enable_sim2host_4sim();
  }
  uint64_t v20 = OSLogHandleForIDSCategory("XPC");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v36 = a1;
    __int16 v37 = 2048;
    xpc_connection_t v38 = v19;
    _os_log_impl(&dword_191892000, v20, OS_LOG_TYPE_DEFAULT, "Created XPC service with name: %s  (Connection: %p)", buf, 0x16u);
  }

  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = sub_191897114;
  handler[3] = &unk_1E5724250;
  uint64_t v21 = v19;
  id v32 = v14;
  id v33 = v15;
  uint64_t v30 = v21;
  id v31 = v17;
  id v34 = v16;
  id v22 = v16;
  id v23 = v17;
  id v24 = v15;
  id v25 = v14;
  xpc_connection_set_event_handler(v21, handler);
  uint64_t v26 = v34;
  id v27 = v21;

  return v27;
}

void sub_191896D94(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  int v4 = (int)a2;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v6 = objc_msgSend_registration(IMRGLog, a2, a3, a4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 136315138;
      uint64_t v21 = v7;
      _os_log_impl(&dword_191892000, v6, OS_LOG_TYPE_DEFAULT, "Dispatch registration invoked - checking state {name: %s}", buf, 0xCu);
    }

    uint64_t v8 = dispatch_get_global_queue(2, 0);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_191896964;
    v15[3] = &unk_1E5722DC0;
    int v19 = v4;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    id v17 = v9;
    uint64_t v18 = v10;
    id v16 = *(id *)(a1 + 32);
    dispatch_async(v8, v15);
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = objc_msgSend_registration(IMRGLog, a2, a3, a4);
    uint64_t v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 136315138;
        uint64_t v21 = v14;
        _os_log_impl(&dword_191892000, v13, OS_LOG_TYPE_DEFAULT, "Dispatch registration invoked - calling handler {name: %s}", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1918E0AAC(a1, v13);
      }
    }
  }
}

uint64_t sub_191896F94(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  int v4 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x1E4F28B88], a2, a3, a4);
  uint64_t v8 = objc_msgSend_mutableCopy(v4, v5, v6, v7);
  id v9 = (void *)qword_1EB273B20;
  qword_1EB273B20 = v8;

  uint64_t v13 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x1E4F28B88], v10, v11, v12);
  uint64_t v17 = objc_msgSend_mutableCopy(v13, v14, v15, v16);
  uint64_t v18 = (void *)qword_1EB273B28;
  qword_1EB273B28 = v17;

  objc_msgSend_addCharactersInString_((void *)qword_1EB273B28, v19, @"+#*,;px", v20);
  objc_msgSend_invert((void *)qword_1EB273B20, v21, v22, v23);
  id v27 = (void *)qword_1EB273B28;
  return objc_msgSend_invert(v27, v24, v25, v26);
}

uint64_t sub_191897038(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  int v4 = objc_msgSend_trimmedString(a1, a2, a3, a4);
  uint64_t v8 = objc_msgSend_longLongValue(v4, v5, v6, v7);

  return v8;
}

__CFString *sub_191897070(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  int v4 = (__CFString *)objc_msgSend_mutableCopy(a1, a2, a3, a4);
  CFStringTrimWhitespace(v4);
  return v4;
}

void sub_191897114(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x192FDEE90]();
  if (v4 == MEMORY[0x1E4F145A8])
  {
    uint64_t v7 = *(void **)(a1 + 48);
    uint64_t v8 = *(void **)(a1 + 56);
    id v9 = *(void **)(a1 + 40);
    id v10 = *(id *)(a1 + 32);
    id v11 = v3;
    uint64_t v12 = v7;
    uint64_t v13 = v8;
    id v14 = v9;
    if (v11 == (id)MEMORY[0x1E4F14528])
    {
      uint64_t v39 = OSLogHandleForIDSCategory("XPC");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v10;
        _os_log_impl(&dword_191892000, v39, OS_LOG_TYPE_DEFAULT, "Connection went invalid: %p", (uint8_t *)&buf, 0xCu);
      }

      uint64_t v16 = v12;
      if (!v12) {
        goto LABEL_20;
      }
    }
    else
    {
      if (v11 != (id)MEMORY[0x1E4F14550])
      {
        uint64_t v45 = MEMORY[0x192FDEE90](v11);
        v46 = OSLogHandleForIDSCategory("Warning");
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v45;
          _os_log_impl(&dword_191892000, v46, OS_LOG_TYPE_DEFAULT, "Unknown error type: %@, exiting", (uint8_t *)&buf, 0xCu);
        }

        exit(0);
      }
      uint64_t v15 = OSLogHandleForIDSCategory("XPC");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v10;
        _os_log_impl(&dword_191892000, v15, OS_LOG_TYPE_DEFAULT, "Termination coming for connection: %p", (uint8_t *)&buf, 0xCu);
      }

      uint64_t v16 = v13;
      if (!v13) {
        goto LABEL_20;
      }
    }
    v16[2]();
LABEL_20:

    goto LABEL_27;
  }
  uint64_t v5 = v4;
  if (v4 == MEMORY[0x1E4F14578])
  {
    uint64_t v17 = *(void **)(a1 + 64);
    uint64_t v18 = *(void **)(a1 + 40);
    int v19 = (_xpc_connection_s *)*(id *)(a1 + 32);
    id v20 = v3;
    id v21 = v17;
    uint64_t v22 = v18;
    uint64_t v23 = (_xpc_connection_s *)v20;
    if (!v22)
    {
      if (_os_feature_enabled_impl())
      {
        id v27 = im_primary_base_queue();
        if (v27)
        {
          uint64_t v28 = NSString;
          uint64_t v29 = objc_msgSend_stringGUID(NSString, v24, v25, v26);
          objc_msgSend_stringWithFormat_(v28, v30, @"PeerQueue with WL Target: %@", v31, v29);
          id v32 = objc_claimAutoreleasedReturnValue();
          v36 = (const char *)objc_msgSend_UTF8String(v32, v33, v34, v35);
          __int16 v37 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          xpc_connection_t v38 = im_primary_base_queue();
          uint64_t v22 = dispatch_queue_create_with_target_V2(v36, v37, v38);
        }
        else
        {
          uint64_t v22 = MEMORY[0x1E4F14428];
          id v41 = MEMORY[0x1E4F14428];
        }
      }
      else
      {
        uint64_t v22 = MEMORY[0x1E4F14428];
        id v40 = MEMORY[0x1E4F14428];
      }
    }
    xpc_connection_set_target_queue(v23, v22);
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v48 = sub_191897724;
    v49 = &unk_1E5724278;
    v42 = v23;
    v50 = v42;
    id v51 = v21;
    id v43 = v21;
    xpc_connection_set_event_handler(v42, &buf);
    if (xpc_connection_get_context(v19))
    {
      context = xpc_connection_get_context(v19);
      xpc_connection_set_context(v42, context);
    }
    xpc_connection_resume(v42);
  }
  else
  {
    uint64_t v6 = OSLogHandleForIDSCategory("Warning");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_191892000, v6, OS_LOG_TYPE_DEFAULT, "Unhandled listener event:  %p", (uint8_t *)&buf, 0xCu);
    }
  }
LABEL_27:
}

BOOL sub_1918975D4(void *a1, const char *a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  unint64_t v10 = a4;
  uint64_t v11 = a5;
  unint64_t v5 = a5 + a4;
  if (a4 >= a5 + a4) {
    return 0;
  }
  do
  {
    uint64_t v8 = objc_msgSend_attribute_atIndex_effectiveRange_(a1, a2, a3, a4, &v10);

    BOOL result = v8 != 0;
    if (v8) {
      break;
    }
    a4 = v11 + v10;
  }
  while (v11 + v10 < v5);
  return result;
}

BOOL IMGetDomainBoolForKey(CFStringRef applicationID, CFStringRef key)
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(key, applicationID, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

uint64_t IMOSLoggingEnabled()
{
  if (qword_1EB273A80 != -1) {
    dispatch_once(&qword_1EB273A80, &unk_1EE22FF38);
  }
  return byte_1EB273A78;
}

void sub_191897724(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = OSLogHandleForIDSCategory("XPC");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134217984;
    uint64_t v7 = v5;
    _os_log_impl(&dword_191892000, v4, OS_LOG_TYPE_DEBUG, "Message from client: %p", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_191897C14(const void *a1, dispatch_once_t *predicate, const char *a3)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_191894A50;
  block[3] = &unk_1E5723248;
  block[4] = predicate;
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  pthread_mutex_lock((pthread_mutex_t *)(predicate + 1));
  int v6 = CFDictionaryGetValue((CFDictionaryRef)predicate[9], a1);
  if (!v6)
  {
    int v6 = os_log_create(a3, (const char *)a1);
    CFDictionarySetValue((CFMutableDictionaryRef)predicate[9], a1, v6);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(predicate + 1));
  return v6;
}

void sub_191897D18(void *a1, uint64_t a2, void *a3)
{
  id v14 = a1;
  uint64_t v4 = (void *)MEMORY[0x1E4F29060];
  uint64_t v5 = a3;
  id v9 = objc_msgSend_currentThread(v4, v6, v7, v8);
  char isEqual = objc_msgSend_isEqual_(v9, v10, (uint64_t)v14, v11);

  if (isEqual) {
    v5[2](v5);
  }
  else {
    objc_msgSend___im_performBlock_waitUntilDone_(v14, v13, (uint64_t)v5, 0);
  }
}

BOOL sub_191897E04(const __CFString *a1, int a2, CFStringRef theString2)
{
  return theString2 && CFStringCompare(a1, theString2, 1uLL) == kCFCompareEqualTo;
}

__CFString *IMCopyStringWithLocalizedNumbers(const __CFString *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t Length = CFStringGetLength(a1);
  if (Length < 1) {
    return 0;
  }
  uint64_t v3 = Length;
  Mutable = CFStringCreateMutable(0, Length);
  for (CFIndex i = 0; i != v3; ++i)
  {
    UniChar chars = -21846;
    UChar32 CharacterAtIndex = CFStringGetCharacterAtIndex(a1, i);
    UniChar chars = CharacterAtIndex;
    uint64_t v7 = u_charDigitValue(CharacterAtIndex);
    if (v7 == -1)
    {
      CFStringAppendCharacters(Mutable, &chars, 1);
    }
    else
    {
      unint64_t v10 = (void *)MEMORY[0x1E4F28EE0];
      uint64_t v11 = objc_msgSend_numberWithInt_(NSNumber, v8, v7, v9);
      objc_msgSend_localizedStringFromNumber_numberStyle_(v10, v12, (uint64_t)v11, 1);
      uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFStringAppend(Mutable, v13);
    }
  }
  return Mutable;
}

id JWDecodeCodableObjectWithStandardAllowlist(void *a1)
{
  id v1 = a1;
  id v5 = JWCopyCodableObjectStandardAllowlist();
  if (v1 && objc_msgSend_length(v1, v2, v3, v4))
  {
    id v6 = objc_alloc(MEMORY[0x1E4F29138]);
    uint64_t v9 = objc_msgSend_initForReadingWithData_(v6, v7, (uint64_t)v1, v8);
    objc_msgSend__setAllowedClasses_(v9, v10, (uint64_t)v5, v11);
    uint64_t v15 = objc_msgSend_decodeObject(v9, v12, v13, v14);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

id JWCopyCodableObjectStandardAllowlist()
{
  if (qword_1E92DB388 != -1) {
    dispatch_once(&qword_1E92DB388, &unk_1EE22FC38);
  }
  v0 = (void *)qword_1E92DB380;
  return v0;
}

id sub_191898B60(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_copyStringGUID(a1, a2, a3, a4);
  return v4;
}

CFStringRef sub_191898B88()
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = 0xAAAAAAAAAAAAAAAALL;
  v2[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x192FDEC40](v2);
  CFStringRef v1 = 0;
  jw_uuid_to_cfstring((const unsigned __int8 *)v2, &v1);
  return v1;
}

uint64_t sub_191898BF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4181798](a1, sel_initWithTarget_protocol_, 0, a3);
}

uint64_t IMCopyGUIDForChat(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return _NSNewStringByAppendingStrings();
  }
  else {
    return 0;
  }
}

void sub_191898CBC(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = sub_1918990AC;
  uint64_t v23 = &unk_1E57244D8;
  uint64_t v24 = a1;
  id v11 = v8;
  id v25 = v11;
  id v12 = v9;
  id v26 = v12;
  id v13 = v10;
  id v27 = v13;
  uint64_t v14 = &v20;
  if (_os_feature_enabled_impl()
    && (im_primary_base_queue(), uint64_t v18 = objc_claimAutoreleasedReturnValue(), v18, v18))
  {
    int v19 = im_primary_queue();
    dispatch_async(v19, v14);
  }
  else if (objc_msgSend_isMainThread(MEMORY[0x1E4F29060], v15, v16, v17, v20, v21))
  {
    v22(v14);
  }
  else
  {
    dispatch_async(MEMORY[0x1E4F14428], v14);
  }
}

void sub_191898E30(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = sub_1918990A0;
  uint64_t v15 = &unk_1E5724488;
  uint64_t v16 = a1;
  id v5 = v4;
  id v17 = v5;
  id v6 = &v12;
  if (_os_feature_enabled_impl()
    && (im_primary_base_queue(), id v10 = objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    id v11 = im_primary_queue();
    dispatch_async(v11, v6);
  }
  else if (objc_msgSend_isMainThread(MEMORY[0x1E4F29060], v7, v8, v9, v12, v13))
  {
    ((void (*)(uint64_t *))v14)(v6);
  }
  else
  {
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void sub_191898F48(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  id v17 = sub_191899090;
  uint64_t v18 = &unk_1E57244B0;
  uint64_t v19 = a1;
  id v8 = v6;
  id v20 = v8;
  id v9 = v7;
  id v21 = v9;
  id v10 = v16;
  if (_os_feature_enabled_impl()
    && (im_primary_base_queue(), uint64_t v14 = objc_claimAutoreleasedReturnValue(), v14, v14))
  {
    uint64_t v15 = im_primary_queue();
    dispatch_async(v15, v10);
  }
  else if (objc_msgSend_isMainThread(MEMORY[0x1E4F29060], v11, v12, v13))
  {
    ((void (*)(void *))v17)(v10);
  }
  else
  {
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
}

uint64_t sub_191899090(uint64_t a1, const char *a2)
{
  return objc_msgSend_postNotificationName_object_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t sub_1918990A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F4181798](*(void *)(a1 + 32), sel_postNotification_, *(void *)(a1 + 40), a4);
}

uint64_t sub_1918990AC(void *a1)
{
  return MEMORY[0x1F4181798](a1[4], sel_postNotificationName_object_userInfo_, a1[5], a1[6]);
}

uint64_t IMAreObjectsLogicallySame(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (v3 == v4)
  {
    uint64_t v9 = 1;
  }
  else if (v3 || !v4) && (!v3 || v4) && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t isEqualToString = objc_msgSend_isEqualToString_(v3, v6, (uint64_t)v5, v7);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        uint64_t isEqualToString = objc_msgSend_isEqualToData_(v3, v11, (uint64_t)v5, v12);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          uint64_t isEqualToString = objc_msgSend_isEqualToArray_(v3, v13, (uint64_t)v5, v14);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            uint64_t isEqualToString = objc_msgSend_isEqualToSet_(v3, v15, (uint64_t)v5, v16);
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
            {
              uint64_t isEqualToString = objc_msgSend_isEqualToAttributedString_(v3, v17, (uint64_t)v5, v18);
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
              {
                uint64_t isEqualToString = objc_msgSend_isEqualToDate_(v3, v19, (uint64_t)v5, v20);
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
                {
                  uint64_t isEqualToString = objc_msgSend_isEqualToOrderedSet_(v3, v21, (uint64_t)v5, v22);
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
                  {
                    uint64_t isEqualToString = objc_msgSend_isEqualToValue_(v3, v23, (uint64_t)v5, v24);
                  }
                  else
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass())) {
                      uint64_t isEqualToString = objc_msgSend_isEqualToDictionary_(v3, v25, (uint64_t)v5, v26);
                    }
                    else {
                      uint64_t isEqualToString = objc_msgSend_isEqual_(v3, v25, (uint64_t)v5, v26);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    uint64_t v9 = isEqualToString;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void IMComponentsFromChatGUID(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a1;
  id v29 = v7;
  if (a2 && !a3 && !a4)
  {
    uint64_t v10 = objc_msgSend_rangeOfString_options_(v7, v8, @";", 4);
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend_substringFromIndex_(v29, v11, (uint64_t)&v11[v10], v12);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    uint64_t v13 = objc_msgSend_componentsSeparatedByString_(v29, v11, @"", v12);;
    objc_msgSend_lastObject(v13, v14, v15, v16);
    goto LABEL_14;
  }
  if (!a4 && !a2 && a3)
  {
    uint64_t v18 = objc_msgSend_rangeOfString_options_(v7, v8, @";", 0);
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend_substringToIndex_(v29, v17, v18, v19);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    uint64_t v13 = objc_msgSend_componentsSeparatedByString_(v29, v17, @"", v19);;
    objc_msgSend___imFirstObject(v13, v20, v21, v22);
    goto LABEL_17;
  }
  uint64_t v13 = objc_msgSend_componentsSeparatedByString_(v7, v8, @"", v9);;
  if (a2)
  {
    objc_msgSend_lastObject(v13, v23, v24, v25);
LABEL_14:
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a3)
  {
    objc_msgSend___imFirstObject(v13, v23, v24, v25);
LABEL_17:
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a4)
  {
    uint64_t v26 = objc_msgSend_objectAtIndex_(v13, v23, 1, v25);
    *a4 = objc_msgSend_characterAtIndex_(v26, v27, 0, v28);
  }
LABEL_21:
}

void sub_191899730(void *a1, const char *a2, void *a3)
{
  xpc_object_t xdict = a3;
  id v5 = a1;
  uint64_t v9 = (const void *)objc_msgSend_bytes(v5, v6, v7, v8);
  size_t v13 = objc_msgSend_length(v5, v10, v11, v12);

  if (v9 && v13) {
    xpc_dictionary_set_data(xdict, a2, v9, v13);
  }
}

id sub_1918997C8(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  memset(md, 170, 20);
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v15.data[9] = v2;
  *(_OWORD *)&v15.data[13] = v2;
  *(_OWORD *)&v15.data[1] = v2;
  *(_OWORD *)&v15.data[5] = v2;
  *(_OWORD *)&v15.h0 = v2;
  *(_OWORD *)&v15.h4 = v2;
  CC_SHA1_Init(&v15);
  id v3 = a1;
  uint64_t v7 = (const void *)objc_msgSend_bytes(v3, v4, v5, v6);
  CC_LONG v11 = objc_msgSend_length(v3, v8, v9, v10);
  CC_SHA1_Update(&v15, v7, v11);
  CC_SHA1_Final(md, &v15);
  size_t v13 = objc_msgSend___imHexStringOfBytes_withLength_(v3, v12, (uint64_t)md, 20);
  return v13;
}

uint64_t sub_19189989C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend___imHexStringOfBytes_withLength_(MEMORY[0x1E4F1C9B8], a2, a3, a4);
}

char *sub_1918998A8(uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  if (a4 < 0)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v5 = a4;
    uint64_t v7 = 2 * a4;
    uint64_t v8 = (char *)malloc_type_malloc(2 * a4, 0x79E1DCAuLL);
    if (v8)
    {
      uint64_t v9 = (uint64_t)v8;
      if (v5)
      {
        uint64_t v10 = v8 + 1;
        do
        {
          unsigned int v11 = *a3++;
          *(v10 - 1) = byte_1918E7750[(unint64_t)v11 >> 4];
          unsigned char *v10 = byte_1918E7750[v11 & 0xF];
          v10 += 2;
          --v5;
        }
        while (v5);
      }
      id v12 = [NSString alloc];
      uint64_t v8 = (char *)objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v12, v13, v9, v7, 4, 1);
    }
  }
  return v8;
}

id IMCountryCodeForIncomingTextMessage(uint64_t a1)
{
  pthread_mutex_lock(&stru_1EB2736B0);
  long long v2 = (void *)qword_1EB273780;
  if (qword_1EB273780) {
    goto LABEL_7;
  }
  if (qword_1EB2737C0 != -1) {
    dispatch_once(&qword_1EB2737C0, &unk_1EE230EB8);
  }
  if (off_1EB2737B8)
  {
    uint64_t v3 = off_1EB2737B8(a1);
    uint64_t v4 = (void *)qword_1EB273780;
    qword_1EB273780 = v3;

    im_dispatch_after(&unk_1EE230FB8, 0.0);
  }
  long long v2 = (void *)qword_1EB273780;
  if (qword_1EB273780) {
LABEL_7:
  }
    id v5 = v2;
  else {
    id v5 = 0;
  }
  pthread_mutex_unlock(&stru_1EB2736B0);
  if (objc_msgSend_length(v5, v6, v7, v8))
  {
    id v12 = v5;
  }
  else
  {
    size_t v13 = objc_msgSend_autoupdatingCurrentLocale(MEMORY[0x1E4F1CA20], v9, v10, v11);
    objc_msgSend_objectForKey_(v13, v14, *MEMORY[0x1E4F1C400], v15);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

void im_dispatch_after(void *a1, double a2)
{
  if (a1)
  {
    int64_t v2 = (uint64_t)(a2 * 1000000000.0);
    dispatch_block_t block = a1;
    dispatch_time_t v3 = dispatch_time(0, v2);
    dispatch_after(v3, MEMORY[0x1E4F14428], block);
  }
}

BOOL sub_191899AFC(void *a1, void *a2, void *a3, unsigned char *a4, unsigned char *a5, void *a6, void *a7, void *a8)
{
  uint64_t v158 = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v13 = a7;
  id v14 = a8;
  IMGetEnvironmentName((uint64_t)v14, v15, v16, v17);
  uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB273788);
  uint64_t v22 = (void *)qword_1EB273A90;
  if (!qword_1EB273A90)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    uint64_t v24 = (void *)qword_1EB273A90;
    qword_1EB273A90 = (uint64_t)Mutable;

    uint64_t v22 = (void *)qword_1EB273A90;
  }
  value = v13;
  uint64_t v25 = objc_msgSend___imFirstObject(v13, v19, v20, v21);
  objc_msgSend_objectForKey_(v22, v26, (uint64_t)v25, v27);
  id v28 = (id)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v34 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v14)
    {
      uint64_t v35 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v32, (uint64_t)v14, v33);
      if (v35) {
        CFDictionarySetValue(v34, @"url", v35);
      }
    }
    CFDictionarySetValue(v34, @"apsenv", &unk_1EE244B48);
    if (value) {
      CFDictionarySetValue(v34, @"topics", value);
    }
    xpc_connection_t v38 = objc_msgSend_numberWithBool_(NSNumber, v36, 0, v37);
    if (v38) {
      CFDictionarySetValue(v34, @"selfsigned", v38);
    }

    id v41 = objc_msgSend_numberWithBool_(NSNumber, v39, 0, v40);
    if (v41) {
      CFDictionarySetValue(v34, @"unsigned", v41);
    }

    objc_msgSend_setObject_forKey_(v28, v42, (uint64_t)v34, @"prod");
    id v43 = (void *)qword_1EB273A90;
    v47 = objc_msgSend___imFirstObject(value, v44, v45, v46);
    objc_msgSend_setObject_forKey_(v43, v48, (uint64_t)v28, (uint64_t)v47);
  }
  if (!objc_msgSend_length(v18, v29, v30, v31))
  {

    uint64_t v18 = @"prod";
  }
  v49 = value;
  if (_IMWillLog(@"Settings")) {
    _IMAlwaysLog(0, @"Settings", @"Using environment: %@", v51, v52, v53, v54, v55, (char)v18);
  }
  if ((objc_msgSend_isEqualToString_(v18, v50, @"prod", v51) & 1) == 0
    && (unint64_t)objc_msgSend_count(v28, v56, v57, v58) <= 1)
  {
    v142 = a3;
    v143 = a5;
    v152 = v28;
    id v59 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v144 = v12;
    long long v153 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    v151 = objc_msgSend_initWithContentsOfFile_(v59, v60, (uint64_t)v12, v61);
    objc_msgSend_allKeys(v151, v62, v63, v64);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v65, (uint64_t)&v153, (uint64_t)v157, 16);
    if (v66)
    {
      uint64_t v69 = v66;
      uint64_t v150 = *(void *)v154;
      do
      {
        for (uint64_t i = 0; i != v69; ++i)
        {
          if (*(void *)v154 != v150) {
            objc_enumerationMutation(obj);
          }
          uint64_t v71 = *(void *)(*((void *)&v153 + 1) + 8 * i);
          v72 = objc_msgSend_objectForKey_(v151, v67, v71, v68);
          v73 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v76 = objc_msgSend_objectForKey_(v72, v74, @"url", v75);

          if (v76)
          {
            v79 = (void *)MEMORY[0x1E4F1CB10];
            v80 = objc_msgSend_objectForKey_(v72, v77, @"url", v78);
            v83 = objc_msgSend_URLWithString_(v79, v81, (uint64_t)v80, v82);

            if (v83) {
              CFDictionarySetValue(v73, @"url", v83);
            }

            v49 = value;
          }
          v84 = objc_msgSend_objectForKey_(v72, v77, @"apsenv", v78);
          if (v84) {
            CFDictionarySetValue(v73, @"apsenv", v84);
          }

          if (v49) {
            CFDictionarySetValue(v73, @"topics", v49);
          }
          v87 = objc_msgSend_objectForKey_(v72, v85, @"selfsigned", v86);
          if (v87) {
            CFDictionarySetValue(v73, @"selfsigned", v87);
          }

          v90 = objc_msgSend_objectForKey_(v72, v88, @"unsigned", v89);
          if (v90) {
            CFDictionarySetValue(v73, @"unsigned", v90);
          }

          objc_msgSend_setObject_forKey_(v152, v91, (uint64_t)v73, v71);
        }
        uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v67, (uint64_t)&v153, (uint64_t)v157, 16);
      }
      while (v69);
    }

    id v12 = v144;
    a5 = v143;
    id v28 = v152;
    a3 = v142;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB273788);
  v94 = objc_msgSend_objectForKey_(v28, v92, (uint64_t)v18, v93);
  if (!objc_msgSend_count(v94, v95, v96, v97))
  {

    uint64_t v18 = @"prod";
    uint64_t v103 = objc_msgSend_objectForKey_(v28, v101, @"prod", v102);

    v94 = (void *)v103;
  }
  uint64_t v106 = objc_msgSend_count(v94, v98, v99, v100);
  if (v106)
  {
    if (a1)
    {
      objc_msgSend_objectForKey_(v94, v104, @"url", v105);
      *a1 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_containsObject_(v49, v107, @"com.apple.private.ids", v108) & 1) != 0
        || (objc_msgSend_containsObject_(v49, v109, @"com.apple.private.ac", v110) & 1) != 0
        || objc_msgSend_containsObject_(v49, v111, @"com.apple.ess", v112))
      {
        v115 = IMGetCachedDomainValueForKey(@"com.apple.ids", @"custom-ids-bag-url");
        if (v115)
        {
          objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v113, (uint64_t)v115, v114);
          *a1 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    if (a3) {
      *a3 = v49;
    }
    if (a4)
    {
      v116 = objc_msgSend_objectForKey_(v94, v104, @"selfsigned", v105);
      *a4 = objc_msgSend_BOOLValue(v116, v117, v118, v119);
    }
    if (a5)
    {
      v120 = objc_msgSend_objectForKey_(v94, v104, @"unsigned", v105);
      *a5 = objc_msgSend_BOOLValue(v120, v121, v122, v123);
    }
    if (a2)
    {
      if (!qword_1EB273A98)
      {
        v124 = (void **)IMWeakLinkSymbol();
        if (v124) {
          v125 = *v124;
        }
        else {
          v125 = 0;
        }
        objc_storeStrong((id *)&qword_1EB273A98, v125);
      }
      if (!qword_1EB273AA0)
      {
        v126 = (void **)IMWeakLinkSymbol();
        if (v126) {
          v127 = *v126;
        }
        else {
          v127 = 0;
        }
        objc_storeStrong((id *)&qword_1EB273AA0, v127);
      }
      if (!qword_1EB273AA8)
      {
        v128 = (void **)IMWeakLinkSymbol();
        if (v128) {
          v129 = *v128;
        }
        else {
          v129 = 0;
        }
        objc_storeStrong((id *)&qword_1EB273AA8, v129);
      }
      id v130 = (id)qword_1EB273A98;
      v133 = objc_msgSend_objectForKey_(v94, v131, @"apsenv", v132);
      int v137 = objc_msgSend_intValue(v133, v134, v135, v136);

      if (v137 == 1)
      {
        v138 = &qword_1EB273AA0;
      }
      else
      {
        if (v137 != 2)
        {
LABEL_78:
          id v140 = v130;
          *a2 = v140;

          v49 = value;
          goto LABEL_79;
        }
        v138 = &qword_1EB273AA8;
      }
      id v139 = (id)*v138;

      id v130 = v139;
      goto LABEL_78;
    }
  }
LABEL_79:

  return v106 != 0;
}

CFArrayRef sub_19189A4D0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  CFArrayRef result = (CFArrayRef)objc_msgSend_count(a1, a2, a3, a4);
  if (result)
  {
    return CFArrayCreateCopy(0, (CFArrayRef)a1);
  }
  return result;
}

id sub_19189A51C(void *a1, uint64_t a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  uint64_t v8 = objc_msgSend_count(a1, v5, v6, v7);
  if (!v4 || !v8)
  {
    if (objc_msgSend___imIsMutable(a1, v9, v10, v11)) {
      id v30 = (id)objc_msgSend_copy(a1, v27, v28, v29);
    }
    else {
      id v30 = a1;
    }
    uint64_t v31 = v30;
    goto LABEL_24;
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v13 = a1;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v36, (uint64_t)v40, 16);
  if (!v15)
  {

LABEL_20:
    if (objc_msgSend___imIsMutable(v13, v23, v24, v25, (void)v36)) {
      id v26 = (id)objc_msgSend_copy(v13, v32, v33, v34);
    }
    else {
      id v26 = v13;
    }
    goto LABEL_23;
  }
  uint64_t v16 = v15;
  char v17 = 0;
  uint64_t v18 = *(void *)v37;
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v37 != v18) {
        objc_enumerationMutation(v13);
      }
      uint64_t v20 = *(void *)(*((void *)&v36 + 1) + 8 * i);
      if (v4[2](v4, v20)) {
        objc_msgSend_addObject_(v12, v21, v20, v22, (void)v36);
      }
      else {
        char v17 = 1;
      }
    }
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v21, (uint64_t)&v36, (uint64_t)v40, 16);
  }
  while (v16);

  if ((v17 & 1) == 0) {
    goto LABEL_20;
  }
  id v26 = v12;
LABEL_23:
  uint64_t v31 = v26;

LABEL_24:
  return v31;
}

id sub_19189A6DC(void *a1, uint64_t a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  uint64_t v8 = objc_msgSend_count(a1, v5, v6, v7);
  if (!v4 || !v8)
  {
    if (objc_msgSend___imIsMutable(a1, v9, v10, v11)) {
      id v32 = (id)objc_msgSend_copy(a1, v29, v30, v31);
    }
    else {
      id v32 = a1;
    }
    uint64_t v33 = v32;
    goto LABEL_24;
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v13 = a1;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v38, (uint64_t)v42, 16);
  if (!v15)
  {

LABEL_20:
    if (objc_msgSend___imIsMutable(v13, v25, v26, v27, (void)v38)) {
      id v28 = (id)objc_msgSend_copy(v13, v34, v35, v36);
    }
    else {
      id v28 = v13;
    }
    goto LABEL_23;
  }
  uint64_t v16 = v15;
  char v17 = 0;
  uint64_t v18 = *(void *)v39;
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v39 != v18) {
        objc_enumerationMutation(v13);
      }
      uint64_t v20 = *(void **)(*((void *)&v38 + 1) + 8 * i);
      uint64_t v23 = ((void (**)(id, void *))v4)[2](v4, v20);
      if (v23)
      {
        objc_msgSend_addObject_(v12, v21, (uint64_t)v23, v22, (void)v38);
        v17 |= v23 != v20;
      }
      else
      {
        char v17 = 1;
      }
    }
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v24, (uint64_t)&v38, (uint64_t)v42, 16);
  }
  while (v16);

  if ((v17 & 1) == 0) {
    goto LABEL_20;
  }
  id v28 = v12;
LABEL_23:
  uint64_t v33 = v28;

LABEL_24:
  return v33;
}

id sub_19189A8B4(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  id v5 = objc_msgSend_count(a1, a2, a3, a4);
  if (v5)
  {
    id v5 = objc_msgSend_objectAtIndex_(a1, v6, 0, v7);
  }
  return v5;
}

id IMCleanupPhoneNumber(void *a1)
{
  id v1 = a1;
  if (IMStringIsPhoneNumber(v1))
  {
    int hasPrefix = objc_msgSend_hasPrefix_(v1, v2, @"+", v3);
    id v5 = IMNormalizeFormattedString(v1, 3);
    id v8 = v5;
    if (hasPrefix && (objc_msgSend_hasPrefix_(v5, v6, @"+", v7) & 1) == 0)
    {
      uint64_t v11 = objc_msgSend_stringByAppendingString_(@"+", v9, (uint64_t)v8, v10);

      id v8 = (id)v11;
    }
  }
  else
  {
    id v8 = v1;
  }

  return v8;
}

id IMStripFormattingFromAddress(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_length(v1, v2, v3, v4))
  {
    if (qword_1EB2737B0 != -1) {
      dispatch_once(&qword_1EB2737B0, &unk_1EE230018);
    }
    uint64_t v7 = objc_msgSend_stringByRemovingCharactersFromSet_(v1, v5, qword_1EB2737A8, v6);
    uint64_t v11 = objc_msgSend__im_normalizedURIString(v7, v8, v9, v10);

    if (IMStringIsPhoneNumber(v11))
    {
      id v12 = IMFormatPhoneNumber(v11, 1);
      goto LABEL_9;
    }
    id v13 = v11;
  }
  else
  {
    id v13 = v1;
  }
  id v12 = v13;
  uint64_t v11 = v13;
LABEL_9:

  return v12;
}

id IMFormatPhoneNumber(void *a1, int a2)
{
  id v3 = a1;
  if (objc_msgSend_length(v3, v4, v5, v6) && !IMStringIsEmail(v3))
  {
    if (qword_1EB273B30 != -1) {
      dispatch_once(&qword_1EB273B30, &unk_1EE22FD78);
    }
    uint64_t v9 = &qword_1EB273B28;
    if (!a2) {
      uint64_t v9 = &qword_1EB273B20;
    }
    uint64_t v10 = objc_msgSend_stringByTrimmingCharactersInSet_(v3, v7, *v9, v8);

    uint64_t v14 = objc_msgSend_length(v10, v11, v12, v13);
    id v15 = objc_alloc(MEMORY[0x1E4F28E78]);
    uint64_t v21 = objc_msgSend_initWithCapacity_(v15, v16, v14, v17);
    if (v14)
    {
      uint64_t v22 = 0;
      while (2)
      {
        UChar32 v23 = objc_msgSend_characterAtIndex_(v10, v18, v22, v20);
        uint64_t v19 = @"+";
        switch(v23)
        {
          case '#':
            objc_msgSend_appendString_(v21, v18, @"#", v20);
            goto LABEL_17;
          case '$':
          case '%':
          case '&':
          case '\'':
          case '(':
          case ')':
            goto LABEL_14;
          case '*':
            objc_msgSend_appendString_(v21, v18, @"*", v20);
            goto LABEL_17;
          case '+':
            goto LABEL_16;
          case ',':
            break;
          default:
            if ((v23 - 59) <= 0x3D && ((1 << (v23 - 59)) & 0x2020000000000001) != 0) {
              break;
            }
LABEL_14:
            int32_t v24 = u_charDigitValue(v23);
            if (v24 <= 9)
            {
              uint64_t v19 = *(&off_1E5724318 + v24);
LABEL_16:
              objc_msgSend_appendString_(v21, v18, (uint64_t)v19, v20);
            }
LABEL_17:
            if (v14 == ++v22) {
              break;
            }
            continue;
        }
        break;
      }
    }
    if (objc_msgSend_length(v21, v18, (uint64_t)v19, v20))
    {
      if (_IMWillLog(@"Normalization")) {
        _IMAlwaysLog(0, @"Normalization", @"Converted phone number from %@ to %@", v25, v26, v27, v28, v29, (char)v10);
      }
      id v30 = v21;

      uint64_t v10 = v30;
    }

    id v3 = v10;
  }
  return v3;
}

BOOL IMStringIsEmail(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_length(v1, v2, v3, v4)) {
    BOOL v5 = CFStringFind(v1, @"@", 0).location != -1;
  }
  else {
    BOOL v5 = 1;
  }

  return v5;
}

BOOL _IMWillLog(void *a1)
{
  id v4 = a1;
  if (!byte_1E92DB788)
  {
    if (dword_1EB273744 < 0)
    {
      dword_1EB273744 = CFPreferencesGetAppBooleanValue(@"Log", (CFStringRef)*MEMORY[0x1E4F1D3D8], 0);
      BOOL v6 = byte_1E92DB788 == 0;
      if (dword_1EB273744) {
        goto LABEL_9;
      }
    }
    else
    {
      BOOL v6 = 1;
      if (dword_1EB273744) {
        goto LABEL_9;
      }
    }
    if (v6) {
      goto LABEL_18;
    }
    goto LABEL_9;
  }
  if (!byte_1E92DB789)
  {
LABEL_9:
    uint64_t v7 = (CFStringRef *)MEMORY[0x1E4F1D3D8];
    if (dword_1E92DA7E8 < 0)
    {
      dword_1E92DA7E8 = CFPreferencesGetAppBooleanValue(@"Log.All", (CFStringRef)*MEMORY[0x1E4F1D3D8], 0);
      if (dword_1E92DA7E8) {
        goto LABEL_11;
      }
    }
    else if (dword_1E92DA7E8)
    {
LABEL_11:
      id v8 = [NSString alloc];
      uint64_t v11 = (__CFString *)objc_msgSend_initWithFormat_(v8, v9, @"DontLog.%@", v10, v4);
      BOOL v5 = CFPreferencesGetAppBooleanValue(v11, *v7, 0) == 0;
LABEL_12:

      goto LABEL_19;
    }
    if (objc_msgSend_length(v4, v1, v2, v3))
    {
      id v12 = [NSString alloc];
      uint64_t v11 = (__CFString *)objc_msgSend_initWithFormat_(v12, v13, @"Log.%@", v14, v4);
      BOOL v5 = byte_1E92DB788
        && (objc_msgSend_objectForKey_((void *)qword_1E92DB770, v15, (uint64_t)v11, v16),
            uint64_t v17 = objc_claimAutoreleasedReturnValue(),
            int v21 = objc_msgSend_intValue(v17, v18, v19, v20),
            v17,
            v21)
        || CFPreferencesGetAppBooleanValue(v11, *v7, 0) != 0;
      goto LABEL_12;
    }
LABEL_18:
    BOOL v5 = 0;
    goto LABEL_19;
  }
  BOOL v5 = 1;
LABEL_19:

  return v5;
}

double IMTimeOfDay()
{
  v1.tv_sec = 0;
  *(void *)&v1.tv_usec = 0;
  gettimeofday(&v1, 0);
  return (double)v1.tv_usec / 1000000.0 + (double)v1.tv_sec;
}

uint64_t IMStringIsPhoneNumber_0(const __CFString *a1)
{
  if (a1)
  {
    CFIndex Length = CFStringGetLength(a1);
    if (Length >= 2)
    {
      CFIndex v5 = Length;
      char v3 = 0;
      CFIndex v6 = 0;
      while (1)
      {
        UChar32 CharacterAtIndex = CFStringGetCharacterAtIndex(a1, v6);
        if (CharacterAtIndex <= 111)
        {
          switch(CharacterAtIndex)
          {
            case ' ':
            case '""':
            case '#':
            case '\'':
            case '(':
            case ')':
            case '*':
            case '+':
            case ',':
            case '-':
            case '.':
            case '/':
            case ':':
            case ';':
            case '?':
              goto LABEL_8;
            default:
              goto LABEL_23;
          }
        }
        if (CharacterAtIndex > 8209)
        {
          if (CharacterAtIndex > 8235)
          {
            if (CharacterAtIndex == 8236) {
              goto LABEL_8;
            }
            int v8 = 8237;
          }
          else
          {
            if (CharacterAtIndex == 8210) {
              goto LABEL_8;
            }
            int v8 = 8234;
          }
          if (CharacterAtIndex != v8) {
            goto LABEL_23;
          }
        }
        else if (CharacterAtIndex <= 8207)
        {
          if (CharacterAtIndex == 112) {
            goto LABEL_9;
          }
          if (CharacterAtIndex != 160)
          {
LABEL_23:
            if (u_charDigitValue(CharacterAtIndex) == -1) {
              break;
            }
          }
        }
LABEL_8:
        char v3 = 1;
LABEL_9:
        if (v5 == ++v6) {
          return v3 & 1;
        }
      }
    }
  }
  char v3 = 0;
  return v3 & 1;
}

uint64_t jw_uuid_to_cfstring(const unsigned __int8 *a1, CFStringRef *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!a2) {
    return 22;
  }
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[2] = v3;
  v6[3] = v3;
  v6[0] = v3;
  v6[1] = v3;
  uuid_unparse_upper(a1, (char *)v6);
  CFStringRef v4 = CFStringCreateWithCString(0, (const char *)v6, 0x8000100u);
  uint64_t result = 0;
  *a2 = v4;
  return result;
}

__CFString *sub_19189B2DC(__CFString *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_length(a1, v5, v6, v7);
  if (v8 << 32
    && (v24.length = (int)v8, v24.location = 0, CFStringFindCharacterFromSet(a1, (CFCharacterSetRef)v4, v24, 0, 0)))
  {
    uint64_t v9 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    if (objc_msgSend_length(a1, v10, v11, v12))
    {
      unint64_t v15 = 0;
      do
      {
        uint64_t v16 = objc_msgSend_characterAtIndex_(a1, v13, v15, v14);
        if ((objc_msgSend_characterIsMember_(v4, v17, v16, v18) & 1) == 0) {
          objc_msgSend_appendFormat_(v9, v19, @"%C", v21, v16);
        }
        ++v15;
      }
      while (v15 < objc_msgSend_length(a1, v19, v20, v21));
    }
  }
  else
  {
    uint64_t v9 = a1;
  }

  return v9;
}

uint64_t sub_19189B3E0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  id v4 = objc_msgSend_lowercaseString(a1, a2, a3, a4);
  if (objc_msgSend_hasPrefix_(v4, v5, @"urn:biz:", v6)) {
    uint64_t hasPrefix = 1;
  }
  else {
    uint64_t hasPrefix = objc_msgSend_hasPrefix_(v4, v7, @"biz:", v8);
  }

  return hasPrefix;
}

id sub_19189B43C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if ((objc_msgSend__appearsToBePseudonymID(a1, a2, a3, a4) & 1) != 0
    || objc_msgSend__appearsToBeHardwareID(a1, v5, v6, v7))
  {
    id v11 = a1;
  }
  else
  {
    objc_msgSend_lowercaseString(a1, v8, v9, v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

id sub_19189B494(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if ((objc_msgSend_hasPrefix_(a1, a2, @"urn:biz:", a4) & 1) != 0
    || (objc_msgSend_hasPrefix_(a1, v5, @"biz:", v6) & 1) != 0
    || (objc_msgSend_hasPrefix_(a1, v7, @"temp:", v8) & 1) != 0
    || (objc_msgSend_hasPrefix_(a1, v9, @"pseud:", v10) & 1) != 0
    || (objc_msgSend_hasPrefix_(a1, v11, @"dev:", v12) & 1) != 0
    || (objc_msgSend_hasPrefix_(a1, v13, @"urn:ds:", v14) & 1) != 0
    || (objc_msgSend_hasPrefix_(a1, v15, @"ds:", v16) & 1) != 0
    || objc_msgSend_hasPrefix_(a1, v17, @"sip:", v18)
    || objc_msgSend__appearsToBeStewie(a1, v19, v20, v21)
    || (uint64_t v24 = objc_msgSend_rangeOfString_(a1, v22, @":", v23), v24 == 0x7FFFFFFFFFFFFFFFLL))
  {
    id v27 = a1;
  }
  else
  {
    objc_msgSend_substringFromIndex_(a1, v25, v24 + 1, v26);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v27;
}

uint64_t sub_19189B5A0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_hasPrefix_(a1, a2, @"stewie:", a4);
}

uint64_t sub_19189B5AC(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_hasPrefix_(a1, a2, @"pseud:", a4);
}

uint64_t sub_19189B5B8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_hasPrefix_(a1, a2, @"dev:", a4);
}

id OSLogHandleForIDSCategory(const void *a1)
{
  return sub_191897C14(a1, qword_1EB273C78, "com.apple.IDS");
}

uint64_t IMWeakLinkSymbol()
{
  return MEMORY[0x1F4112A78]();
}

id im_primary_queue()
{
  unsigned __int8 v0 = atomic_load(byte_1EB273B60);
  if ((v0 & 1) == 0) {
    atomic_store(1u, byte_1EB273B60);
  }
  if (qword_1E92DB0B8)
  {
    id v1 = (id)qword_1E92DB0B8;
  }
  else
  {
    id v1 = (id)MEMORY[0x1E4F14428];
    id v2 = MEMORY[0x1E4F14428];
  }
  return v1;
}

uint64_t IMWeakLinkClass()
{
  return MEMORY[0x1F4112A70]();
}

void im_configure_connection_with_local_object(xpc_connection_t connection, const char *a2, uint64_t a3, uint64_t a4)
{
  if (connection)
  {
    if (a2)
    {
      id v5 = (id)objc_msgSend_weakRefWithObject_(MEMORY[0x1E4F59E30], a2, (uint64_t)a2, a4);
      xpc_connection_set_context(connection, v5);
      xpc_connection_set_finalizer_f(connection, (xpc_finalizer_t)sub_1918BFFB8);
    }
    else
    {
      id context = xpc_connection_get_context(connection);
      xpc_connection_set_context(connection, 0);
      if (context)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
        }
      }
    }
  }
}

uint64_t IMDispatchForNotify(const char *a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  unsigned int v18 = -1;
  if (!v7)
  {
    id v7 = (id)MEMORY[0x1E4F14428];
    id v8 = MEMORY[0x1E4F14428];
  }
  if (im_notify_register_dispatch(a1, (int *)&v18, 0, a2, v7, a4)) {
    _IMWarn(@"Dispatch registration failed for %s (%u)\n", v9, v10, v11, v12, v13, v14, v15, (char)a1);
  }
  uint64_t v16 = v18;

  return v16;
}

uint64_t im_notify_register_dispatch(const char *a1, int *a2, uint64_t *a3, char a4, void *a5, void *a6)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = v12;
  uint64_t v14 = 0;
  if (a1 && a2 && v11)
  {
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    uint64_t v29 = sub_191896D94;
    id v30 = &unk_1E5722DE8;
    char v34 = a4;
    uint64_t v33 = a1;
    id v32 = v12;
    dispatch_queue_t v31 = (dispatch_queue_t)v11;
    uint64_t v14 = notify_register_dispatch(a1, a2, v31, &v27);
    if (v14)
    {
      unsigned int v18 = objc_msgSend_registration(IMRGLog, v15, v16, v17, v27, v28, v29, v30);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = @"YES";
        *(_DWORD *)long long buf = 136315650;
        uint64_t v36 = a1;
        if (!a3) {
          uint64_t v19 = @"NO";
        }
        __int16 v37 = 1024;
        int v38 = v14;
        __int16 v39 = 2112;
        long long v40 = v19;
        uint64_t v20 = "Dispatch registration failed {name: %s, status: %u, hasInitialState: %@}";
        uint64_t v21 = v18;
        uint32_t v22 = 28;
        goto LABEL_14;
      }
LABEL_15:

      goto LABEL_16;
    }
    if (a3)
    {
      notify_get_state(*a2, a3);
      unsigned int v18 = objc_msgSend_registration(IMRGLog, v23, v24, v25, v27, v28, v29, v30);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)long long buf = 136315394;
      uint64_t v36 = a1;
      __int16 v37 = 1024;
      int v38 = (int)a3;
      uint64_t v20 = "Dispatch registration success - initial state {name: %s, initialState: %u}";
      uint64_t v21 = v18;
      uint32_t v22 = 18;
    }
    else
    {
      unsigned int v18 = objc_msgSend_registration(IMRGLog, v15, v16, v17, v27, v28, v29, v30);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)long long buf = 136315138;
      uint64_t v36 = a1;
      uint64_t v20 = "Dispatch registration success {name: %s}";
      uint64_t v21 = v18;
      uint32_t v22 = 12;
    }
LABEL_14:
    _os_log_impl(&dword_191892000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
    goto LABEL_15;
  }
LABEL_16:

  return v14;
}

#error "19189BA94: stack frame is too big (funcsize=0)"

uint64_t JWCopyInvocationArguments(void *a1, void *a2)
{
  sizep[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v8 = objc_msgSend_methodSignature(v3, v5, v6, v7);
  unint64_t v12 = objc_msgSend_numberOfArguments(v8, v9, v10, v11);
  if (v12 >= 3)
  {
    unint64_t v13 = v12;
    for (uint64_t i = 2; i != v13; ++i)
    {
      id v15 = v8;
      ArgumentTypeAtIndex = (const char *)objc_msgSend_getArgumentTypeAtIndex_(v15, v16, i, v17);
      if (*ArgumentTypeAtIndex == 64)
      {
        sizep[0] = 0;
        objc_msgSend_getArgument_atIndex_(v3, v19, (uint64_t)sizep, i);
        objc_msgSend_setArgument_atIndex_(v4, v20, (uint64_t)sizep, i);
      }
      else
      {
        sizep[0] = 0xAAAAAAAAAAAAAAAALL;
        uint64_t v21 = NSGetSizeAndAlignment(ArgumentTypeAtIndex, sizep, 0);
        MEMORY[0x1F4188790](v21);
        uint64_t v24 = (char *)sizep - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
        if (v23) {
          memset((char *)sizep - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0), 170, v23);
        }
        objc_msgSend_getArgument_atIndex_(v3, v22, (uint64_t)v24, i);
        objc_msgSend_setArgument_atIndex_(v4, v25, (uint64_t)v24, i);
      }
    }
  }

  return 1;
}

uint64_t IMCreateXPCObjectFromInvocation(uint64_t result)
{
  if (result) {
    return JWCreateXPCObjectFromInvocation();
  }
  return result;
}

__CFString *IMGetEnvironmentName(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (!qword_1EB273830)
  {
    uint64_t v4 = IMGetCachedDomainValueForKey(@"com.apple.ids", @"env");
    id v5 = (void *)qword_1EB273830;
    qword_1EB273830 = v4;
  }
  if (qword_1EB273AB0 != -1) {
    dispatch_once(&qword_1EB273AB0, &unk_1EE22FAB8);
  }
  if (byte_1EB2737C8 && !objc_msgSend_length((void *)qword_1EB273830, a2, a3, a4))
  {
    id v8 = @"ven1-external";
  }
  else
  {
    uint64_t v6 = objc_msgSend_length((void *)qword_1EB273830, a2, a3, a4);
    uint64_t v7 = (__CFString *)qword_1EB273830;
    if (!v6) {
      uint64_t v7 = @"prod";
    }
    id v8 = v7;
  }
  return v8;
}

id IMGetCachedDomainValueForKey(CFStringRef applicationID, CFStringRef key)
{
  id v2 = (void *)CFPreferencesCopyAppValue(key, applicationID);
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

uint64_t IMGetAppIntForKey(void *a1)
{
  id v1 = IMCopyAppValueForKey(a1);
  uint64_t v5 = objc_msgSend_integerValue(v1, v2, v3, v4);

  return v5;
}

id IMCopyAppValueForKey(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_length(v1, v2, v3, v4)) {
    uint64_t v5 = (void *)CFPreferencesCopyAppValue(v1, (CFStringRef)*MEMORY[0x1E4F1D3D8]);
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t sub_19189C9D0()
{
  return objc_opt_isKindOfClass() & 1;
}

void IMLogBacktrace(void *a1)
{
}

uint64_t IMCopyThreadNameForChat(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return _NSNewStringByAppendingStrings();
  }
  else {
    return 0;
  }
}

uint64_t sub_19189CC0C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 48), *(void *)(a1 + 40));
}

uint64_t IMGetCachedDomainBoolForKeyWithDefaultValue(CFStringRef applicationID, CFStringRef key, unsigned int a3)
{
  Boolean keyExistsAndHasValidFormat = 0;
  BOOL v4 = CFPreferencesGetAppBooleanValue(key, applicationID, &keyExistsAndHasValidFormat) != 0;
  if (keyExistsAndHasValidFormat) {
    return v4;
  }
  else {
    return a3;
  }
}

__CFString *IMSystemRootDirectory()
{
  return @"/";
}

void IMSetDomainBoolForKey(void *a1, const __CFString *a2, int a3)
{
  if (a3) {
    uint64_t v3 = (const void *)MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v3 = 0;
  }
  IMSetDomainValueForKey(a1, a2, v3);
}

id ValidMobileMeDomains()
{
  if (qword_1EB273978 != -1) {
    dispatch_once(&qword_1EB273978, &unk_1EE22FB18);
  }
  unsigned __int8 v0 = (void *)qword_1EB273980;
  return v0;
}

BOOL IMGetCachedDomainBoolForKey(CFStringRef applicationID, CFStringRef key)
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(key, applicationID, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

void IMSetDomainValueForKey(void *a1, const __CFString *a2, const void *a3)
{
  applicationID = a1;
  CFPreferencesSetAppValue(a2, a3, applicationID);
  CFPreferencesAppSynchronize(applicationID);
}

id OSLogHandleForTransportCategory(const void *a1)
{
  return sub_191897C14(a1, qword_1EB2737D0, "com.apple.Transport");
}

uint64_t IMGetDomainBoolForKeyWithDefaultValue(CFStringRef applicationID, CFStringRef key, unsigned int a3)
{
  Boolean keyExistsAndHasValidFormat = 0;
  BOOL v4 = CFPreferencesGetAppBooleanValue(key, applicationID, &keyExistsAndHasValidFormat) != 0;
  if (keyExistsAndHasValidFormat) {
    return v4;
  }
  else {
    return a3;
  }
}

__CFString *IMFormattedDisplayStringForNumber(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v7 = v3;
  switch(a2)
  {
    case 3:
      IMFormattedNumberForUnformattedNumber(v3);
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      objc_msgSend_lowercaseString(v3, v4, v5, v6);
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      id v8 = (__CFString *)v3;
LABEL_7:
      unint64_t v12 = v8;
      uint64_t v13 = objc_msgSend_length(v8, v9, v10, v11);
      goto LABEL_9;
  }
  unint64_t v12 = 0;
  uint64_t v13 = objc_msgSend_length(0, v4, v5, v6);
LABEL_9:
  if (v13)
  {
    uint64_t v14 = v12;
    unint64_t v12 = v14;
  }
  else if (IMStringIsEmail(v7))
  {
    objc_msgSend_lowercaseString(v7, v15, v16, v17);
    uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    IMFormattedNumberForUnformattedNumber(v7);
    unsigned int v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_length(v18, v19, v20, v21))
    {
      uint32_t v22 = IMCopyStringWithLocalizedNumbers(v18);
      if (objc_msgSend_length(v22, v23, v24, v25)) {
        uint64_t v26 = v22;
      }
      else {
        uint64_t v26 = v18;
      }
      uint64_t v14 = v26;
    }
    else
    {
      uint64_t v14 = v7;
    }
    unint64_t v12 = v18;
  }

  return v14;
}

id IMFormattedNumberForUnformattedNumber(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    if (qword_1E92DB0E8 != -1) {
      dispatch_once(&qword_1E92DB0E8, &unk_1EE22FFD8);
    }
    id v2 = (void *)off_1E92DB0E0(v1, 0, 2, 0);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void im_assert_primary_base_queue()
{
  unsigned __int8 v0 = im_primary_base_queue();
  dispatch_assert_queue_V2(v0);
}

id im_primary_base_queue()
{
  unsigned __int8 v0 = atomic_load(byte_1E92DAFD8);
  if ((v0 & 1) == 0) {
    atomic_store(1u, byte_1E92DAFD8);
  }
  return (id)qword_1E92DB098;
}

id IMCreateXPCObjectFromDictionary(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_count(v1, v2, v3, v4))
  {
    uint64_t v5 = (void *)_CFXPCCreateXPCMessageWithCFObject();
    if (!v5)
    {
      xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
      uint64_t v5 = v6;
      if (v6) {
        IMInsertOptionallyCodableDictionariesToXPCDictionary(v6, "__encoded__", v7, v8, v9, v10, v11, v12, (uint64_t)v1);
      }
    }
    id v13 = v5;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

BOOL IMGetiMessageSettings(void *a1, char *a2, void *a3, unsigned char *a4, unsigned char *a5)
{
  uint64_t v10 = IMSingleObjectArray(@"com.apple.madrid", a2, (uint64_t)a3, (uint64_t)a4);
  BOOL v11 = sub_191899AFC(a1, a2, a3, a4, a5, @"/AppleInternal/Library/Madrid/Environments.plist", v10, @"https://init-p01md.apple.com/bag?ix=2");

  return v11;
}

BOOL IMGetConferenceSettings(void *a1, char *a2, void *a3, unsigned char *a4, unsigned char *a5)
{
  uint64_t v10 = IMSingleObjectArray(@"com.apple.ess", a2, (uint64_t)a3, (uint64_t)a4);
  BOOL v11 = sub_191899AFC(a1, a2, a3, a4, a5, @"/AppleInternal/Library/Conference/Environments.plist", v10, @"https://init.ess.apple.com/WebObjects/VCInit.woa/wa/getBag?ix=3");

  return v11;
}

id IMSingleObjectArray(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    a1 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1C978], a2, (uint64_t)a1, a4);
    uint64_t v4 = vars8;
  }
  return a1;
}

id IMGetXPCStringFromDictionary(void *a1, const char *a2)
{
  id v2 = 0;
  if (a1 && a2)
  {
    uint64_t v3 = xpc_dictionary_get_value(a1, a2);
    uint64_t v4 = (void *)v3;
    if (v3 && MEMORY[0x192FDEE90](v3) == MEMORY[0x1E4F145F0] && (string_ptr = xpc_string_get_string_ptr(v4)) != 0)
    {
      id v2 = objc_msgSend_stringWithUTF8String_(NSString, v7, (uint64_t)string_ptr, v8);
    }
    else
    {
      id v2 = 0;
    }
  }
  return v2;
}

void IMSyncronizeAppPreferencesLater()
{
}

void *IMDAuditTokenTaskCopyValuesForEntitlements(_OWORD *a1, void *a2)
{
  id v3 = a2;
  if (qword_1E92DB230 != -1) {
    dispatch_once(&qword_1E92DB230, &unk_1EE22F978);
  }
  if (qword_1E92DB228 != -1) {
    dispatch_once(&qword_1E92DB228, &unk_1EE22F998);
  }
  uint64_t v4 = *MEMORY[0x1E4F1CF80];
  long long v5 = a1[1];
  *(_OWORD *)cf = *a1;
  long long v27 = v5;
  uint64_t v6 = off_1E92DB220(v4, cf);
  if (v6)
  {
    uint64_t v14 = (const void *)v6;
    cf[0] = 0;
    id v15 = (void *)off_1E92DB218(v6, v3, cf);
    uint64_t v16 = v15;
    if (cf[0])
    {

      _IMWarn(@"Unable to get entitlements for client task. Error: %@", v17, v18, v19, v20, v21, v22, v23, (char)cf[0]);
      if (cf[0]) {
        CFRelease(cf[0]);
      }
      uint64_t v16 = 0;
    }
    CFRelease(v14);
  }
  else
  {
    _IMWarn(@"Unable to create security task from audit token.", v7, v8, v9, v10, v11, v12, v13, v25);
    uint64_t v16 = 0;
  }

  return v16;
}

uint64_t IMCreateDictionaryFromXPCObjectWithStandardAllowlist(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    id v3 = IMGetXPCDataFromDictionary(v1, "__encoded__");
    uint64_t v4 = v3;
    if (v3)
    {
      uint64_t v5 = JWDecodeKeyedCodableObjectWithSecureCoding(v3, 0);
      if (v5)
      {
LABEL_8:

        goto LABEL_9;
      }
      uint64_t v6 = JWDecodeDictionary(v4);
    }
    else
    {
      uint64_t v6 = _CFXPCCreateCFObjectFromXPCMessage();
    }
    uint64_t v5 = v6;
    goto LABEL_8;
  }
  uint64_t v5 = 0;
LABEL_9:

  return v5;
}

id IMGetXPCDataFromDictionary(void *a1, const char *a2)
{
  uint64_t v4 = 0;
  if (a1 && a2)
  {
    uint64_t v4 = sub_19189D580(a2, a1, 1);
    uint64_t v2 = vars8;
  }
  return v4;
}

id IMGetXPCCodableFromDictionaryWithStandardAllowlist(void *a1, const char *a2)
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    id v3 = sub_19189D580(a2, a1, 0);
    uint64_t v2 = JWDecodeKeyedCodableObjectWithSecureCoding(v3, 0);
  }
  return v2;
}

id IMGetXPCKeyedCodableFromDictionaryWithSecureCoding(void *a1, const char *a2, uint64_t a3)
{
  id v3 = 0;
  if (a1 && a2)
  {
    uint64_t v5 = sub_19189D580(a2, a1, 0);
    id v3 = JWDecodeKeyedCodableObjectWithSecureCoding(v5, a3);
  }
  return v3;
}

id JWDecodeKeyedCodableObjectWithSecureCoding(void *a1, uint64_t a2)
{
  return sub_19189D638(a1, a2, 0);
}

id sub_19189D580(const char *a1, void *a2, int a3)
{
  id v5 = a2;
  if (MEMORY[0x192FDEE90]() == MEMORY[0x1E4F14590]
    && (size_t length = 0, (data = xpc_dictionary_get_data(v5, a1, &length)) != 0))
  {
    uint64_t v8 = (uint64_t)data;
    id v9 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    if (a3) {
      uint64_t v11 = objc_msgSend_initWithBytes_length_(v9, v10, v8, length);
    }
    else {
      uint64_t v11 = objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v9, v10, v8, length, 0);
    }
    uint64_t v6 = (void *)v11;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

id sub_19189D638(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v9 = a3;
  if (v5 && objc_msgSend_length(v5, v6, v7, v8))
  {
    if (qword_1EB273B58 != -1) {
      dispatch_once(&qword_1EB273B58, &unk_1EE2305F8);
    }
    id v10 = objc_alloc(MEMORY[0x1E4F28DC0]);
    uint64_t v12 = objc_msgSend_initForReadingFromData_error_(v10, v11, (uint64_t)v5, 0);
    objc_msgSend_setDecodingFailurePolicy_(v12, v13, 0, v14);
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v18 = v15;
    if (v9) {
      objc_msgSend_addObjectsFromArray_(v15, v16, (uint64_t)v9, v17);
    }
    if (a2)
    {
      if (objc_msgSend_containsObject_((void *)qword_1EB273B38, v16, a2, v17)) {
        objc_msgSend_unionSet_(v18, v19, qword_1EB273B40, v20);
      }
      objc_msgSend_addObject_(v18, v19, a2, v20);
    }
    else
    {
      objc_msgSend_unionSet_(v18, v16, qword_1EB273B40, v17);
    }
    uint64_t v22 = objc_msgSend_decodeObjectOfClasses_forKey_(v12, v21, (uint64_t)v18, *MEMORY[0x1E4F284E8]);
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

void sub_19189D798(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    uint64_t v6 = objc_msgSend_XPC(IMIDSLog, v3, v4, v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1918E1984((uint64_t)v2, v6);
    }

    IMLogSimulateCrashForException(v2);
    objc_end_catch();
    JUMPOUT(0x19189D74CLL);
  }
  _Unwind_Resume(exception_object);
}

void IMLogBacktraceToDepth(void *a1, uint64_t a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = v3;
  if (!v3 || _IMWillLog(v3))
  {
    uint64_t v5 = sub_1918C5A04(a2);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v33, (uint64_t)v37, 16);
    if (v7)
    {
      uint64_t v15 = v7;
      uint64_t v16 = *(void *)v34;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v5);
          }
          uint64_t v18 = *(void *)(*((void *)&v33 + 1) + 8 * v17);
          if (v4)
          {
            if (objc_msgSend_isEqualToString_(v4, v8, @"IDSDaemon", v10))
            {
              if (qword_1E92DB780)
              {
                sub_1918C5B58(@"IDSDaemon", (uint64_t)v19, v20, v21, v22, v23, v24, v25, v18);
              }
              else if (_IMWillLog(@"IDSDaemon"))
              {
                _IMAlwaysLog(0, @"IDSDaemon", @"%@", v10, v11, v12, v13, v14, v18);
              }
            }
            else if (objc_msgSend_isEqualToString_(v4, v19, @"IDSDAccount", v21))
            {
              if (qword_1E92DB780)
              {
                sub_1918C5B58(@"IDSDAccount", (uint64_t)v26, v27, v28, v29, v30, v31, v32, v18);
              }
              else if (_IMWillLog(@"IDSDAccount"))
              {
                _IMAlwaysLog(0, @"IDSDAccount", @"%@", v10, v11, v12, v13, v14, v18);
              }
            }
            else if (objc_msgSend_isEqualToString_(v4, v26, @"Power", v28))
            {
              if (qword_1E92DB780)
              {
                sub_1918C5B58(@"Power", (uint64_t)v8, v9, v10, v11, v12, v13, v14, v18);
              }
              else if (_IMWillLog(@"Power"))
              {
                _IMAlwaysLog(0, @"Power", @"%@", v10, v11, v12, v13, v14, v18);
              }
            }
          }
          else if (qword_1E92DB778)
          {
            sub_1918C5BD4(@"%@", (uint64_t)v8, v9, v10, v11, v12, v13, v14, *(void *)(*((void *)&v33 + 1) + 8 * v17));
          }
          else
          {
            _IMWarn(@"%@", (uint64_t)v8, v9, v10, v11, v12, v13, v14, v18);
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v33, (uint64_t)v37, 16);
      }
      while (v15);
    }
  }
}

id IMGetXPCDictionaryFromDictionary(void *a1, const char *a2)
{
  id v2 = 0;
  if (a1 && a2)
  {
    id v3 = sub_19189D580(a2, a1, 0);
    id v2 = JWDecodeDictionary(v3);
  }
  return v2;
}

id JWDecodeDictionary(void *a1)
{
  id v1 = a1;
  uint64_t v5 = v1;
  if (v1 && objc_msgSend_length(v1, v2, v3, v4))
  {
    uint64_t v10 = 0;
    unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v7 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E4F28F98], v6, (uint64_t)v5, 0, &v11, &v10);
    id v8 = 0;
    if (!v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v8 = v7;
      }
      else {
        id v8 = 0;
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

id IMInternationalForPhoneNumberWithOptions(void *a1, void *a2, int a3)
{
  uint64_t v3 = (void *)IMPhoneNumberRefCopyForPhoneNumber(a1, a2, a3);
  uint64_t v4 = IMNormalizedPhoneNumberForCFPhoneNumberRef(v3);
  if (v3) {
    CFRelease(v3);
  }
  return v4;
}

uint64_t IMPhoneNumberRefCopyForPhoneNumber(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v6 = a2;
  if (!v6)
  {
    if (qword_1EB273988 != -1) {
      dispatch_once(&qword_1EB273988, &unk_1EE231038);
    }
    if (qword_1EB273968 != -1) {
      dispatch_once(&qword_1EB273968, &unk_1EE2310F8);
    }
    id v6 = (id)off_1EB273960();
    if (!v6) {
      id v6 = (id)off_1EB273958();
    }
  }
  if (qword_1EB2739D0 == -1)
  {
    if (!a3) {
      goto LABEL_12;
    }
  }
  else
  {
    dispatch_once(&qword_1EB2739D0, &unk_1EE231178);
    if (!a3) {
      goto LABEL_12;
    }
  }
  if (!v6) {
    id v6 = (id)off_1EB2739C0();
  }
LABEL_12:
  if (qword_1EB2739C8 != -1) {
    dispatch_once(&qword_1EB2739C8, &unk_1EE2311B8);
  }
  uint64_t v7 = off_1EB2739E0(*MEMORY[0x1E4F1CF80], v5, v6);

  return v7;
}

id IMNormalizedPhoneNumberForCFPhoneNumberRef(id a1)
{
  id v1 = a1;
  if (a1)
  {
    if (qword_1EB2739A8 != -1) {
      dispatch_once(&qword_1EB2739A8, &unk_1EE2312F8);
    }
    if (qword_1EB2739B0 != -1) {
      dispatch_once(&qword_1EB2739B0, &unk_1EE231378);
    }
    id v2 = (void *)off_1EB2739A0(v1);
    if ((unint64_t)objc_msgSend_length(v2, v3, v4, v5) < 7) {
      goto LABEL_13;
    }
    uint64_t v9 = (void *)off_1EB273998(v1);
    if ((unint64_t)objc_msgSend_length(v2, v10, v11, v12) <= 7
      && objc_msgSend_hasPrefix_(v9, v6, @"+90444", v8))
    {
      if (_IMWillLog(@"IMFormattingUtilities")) {
        _IMAlwaysLog(0, @"IMFormattingUtilities", @"Turkish short code detected, using unformatted phone number", v15, v16, v17, v18, v19, v22);
      }
      uint64_t v20 = objc_msgSend_copy(v2, v13, v14, v15);

      uint64_t v9 = (void *)v20;
    }
    if (!v9) {
LABEL_13:
    }
      uint64_t v9 = objc_msgSend_copy(v2, v6, v7, v8);
    id v1 = v9;
  }
  return v1;
}

uint64_t IMXPCCreateServerConnection(const char *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v10 = dispatch_get_global_queue(2, 0);
  uint64_t v11 = sub_191896B24(a1, v10, a2, a3, a4, a5, 0);

  return v11;
}

CFIndex IMGetCachedDomainIntForKeyWithDefaultValue(CFStringRef applicationID, CFStringRef key, uint64_t a3)
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex result = CFPreferencesGetAppIntegerValue(key, applicationID, &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    return a3;
  }
  return result;
}

uint64_t IMInsertNSStringsToXPCDictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a1;
  if (v10) {
    BOOL v11 = a2 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  uint64_t v12 = !v11;
  if (!v11)
  {
    uint64_t v23 = (id *)&a9;
    do
    {
      uint64_t v13 = v23;
      uint64_t v24 = v23 + 1;
      uint64_t v14 = (__CFString *)*v13;
      if (objc_msgSend_length(v14, v15, v16, v17)) {
        BOOL v18 = v14 == 0;
      }
      else {
        BOOL v18 = 1;
      }
      if (!v18)
      {
        CStringPtr = CFStringGetCStringPtr(v14, 0x600u);
        if (CStringPtr
          || (CStringPtr = CFStringGetCStringPtr(v14, 0)) != 0
          || (CStringPtr = CFStringGetCStringPtr(v14, 0x8000100u)) != 0)
        {
          xpc_dictionary_set_string(v10, a2, CStringPtr);
        }
        else
        {
          CFIndex maxBufLen = 0;
          v26.size_t length = CFStringGetLength(v14);
          v26.location = 0;
          CFStringGetBytes(v14, v26, 0x8000100u, 0, 0, 0, 0, &maxBufLen);
          uint64_t v21 = (UInt8 *)malloc_type_malloc(maxBufLen + 1, 0x6D1BBAA9uLL);
          v27.size_t length = CFStringGetLength(v14);
          v27.location = 0;
          CFStringGetBytes(v14, v27, 0x8000100u, 0, 0, v21, maxBufLen, 0);
          v21[maxBufLen] = 0;
          xpc_dictionary_set_string(v10, a2, (const char *)v21);
          free(v21);
        }
      }

      uint64_t v20 = (const char **)v24;
      uint64_t v23 = (id *)(v24 + 1);
      a2 = *v20;
    }
    while (*v20);
  }

  return v12;
}

void im_dispatch_after_primary_queue(void *a1, double a2)
{
  if (a1)
  {
    int64_t v2 = (uint64_t)(a2 * 1000000000.0);
    id v3 = a1;
    dispatch_time_t v4 = dispatch_time(0, v2);
    uint64_t v5 = im_primary_queue();
    dispatch_after(v4, v5, v3);
  }
}

uint64_t IMInsertDictionariesToXPCDictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a1;
  if (v10) {
    BOOL v12 = a2 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  uint64_t v13 = !v12;
  if (!v12)
  {
    CFRange v27 = (id *)&a9;
    *(void *)&long long v11 = 138412290;
    long long v26 = v11;
    do
    {
      uint64_t v14 = v27;
      uint64_t v28 = v27 + 1;
      id v15 = *v14;
      uint64_t v19 = JWEncodeDictionary(v15);
      if (!v19)
      {
        if (objc_msgSend_count(v15, v16, v17, v18))
        {
          uint64_t v23 = OSLogHandleForIDSCategory("Warning");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = v26;
            id v30 = v15;
            _os_log_impl(&dword_191892000, v23, OS_LOG_TYPE_DEFAULT, "Failed to encode dictionary: %@", buf, 0xCu);
          }
        }
        uint64_t v19 = objc_msgSend_data(MEMORY[0x1E4F1C9B8], v20, v21, v22, v26);
      }
      sub_191899730(v19, a2, v10);

      uint64_t v24 = (const char **)v28;
      CFRange v27 = (id *)(v28 + 1);
      a2 = *v24;
    }
    while (*v24);
  }

  return v13;
}

id JWEncodeDictionary(void *a1)
{
  id v1 = a1;
  uint64_t v5 = v1;
  if (v1 && objc_msgSend_count(v1, v2, v3, v4))
  {
    uint64_t v19 = 0;
    uint64_t v7 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E4F28F98], v6, (uint64_t)v5, 200, 0, &v19);
    id v15 = v7;
    if (v7) {
      BOOL v16 = 1;
    }
    else {
      BOOL v16 = v19 == 0;
    }
    if (v16)
    {
      id v17 = v7;
    }
    else
    {
      _IMWarn(@"Error while encoding dictionary %@", v8, v9, v10, v11, v12, v13, v14, v19);
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

_xpc_connection_s *IMXPCCreateConnectionForServiceWithQueue(char a1, int a2, const char *a3, void *a4, void *a5, void *a6)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (a3)
  {
    if (!v11)
    {
      uint64_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      id v15 = [NSString alloc];
      id v18 = objc_msgSend_initWithFormat_(v15, v16, @"%s_connection_queue", v17, a3);
      uint64_t v22 = (const char *)objc_msgSend_UTF8String(v18, v19, v20, v21);
      uint64_t v11 = dispatch_queue_create(v22, v14);
    }
    if (a1) {
      xpc_connection_t mach_service = xpc_connection_create_mach_service(a3, v11, 0);
    }
    else {
      xpc_connection_t mach_service = xpc_connection_create(a3, v11);
    }
    uint64_t v24 = mach_service;
    if (mach_service)
    {
      uint64_t v25 = OSLogHandleForIDSCategory("XPC");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315394;
        name = xpc_connection_get_name(v24);
        __int16 v30 = 2048;
        uint64_t v31 = v24;
        _os_log_impl(&dword_191892000, v25, OS_LOG_TYPE_DEFAULT, "Created connection to %s service: %p", buf, 0x16u);
      }

      if (a2) {
        IMXPCConfigureConnection(v24, v12, v13);
      }
    }
    else
    {
      long long v26 = OSLogHandleForIDSCategory("Warning");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        name = a3;
        _os_log_impl(&dword_191892000, v26, OS_LOG_TYPE_DEFAULT, "Unable to build service for name: %s", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

uint64_t IMInsertCodableObjectsToXPCDictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a1;
  if (v10) {
    BOOL v11 = a2 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  uint64_t v12 = !v11;
  if (!v11)
  {
    uint64_t v21 = (id *)&a9;
    do
    {
      id v13 = v21;
      uint64_t v22 = v21 + 1;
      id v14 = *v13;
      id v18 = JWEncodeKeyedCodableObject(v14);
      if (!v18)
      {
        id v18 = objc_msgSend_data(MEMORY[0x1E4F1C9B8], v15, v16, v17);
      }
      sub_191899730(v18, a2, v10);

      uint64_t v19 = (const char **)v22;
      uint64_t v21 = (id *)(v22 + 1);
      a2 = *v19;
    }
    while (*v19);
  }

  return v12;
}

id JWEncodeKeyedCodableObject(void *a1)
{
  if (a1)
  {
    id v1 = (objc_class *)MEMORY[0x1E4F28DB0];
    id v2 = a1;
    id v3 = [v1 alloc];
    inited = objc_msgSend_initRequiringSecureCoding_(v3, v4, 0, v5);
    objc_msgSend_setRequiresSecureCoding_(inited, v7, 1, v8);
    objc_msgSend_encodeObject_forKey_(inited, v9, (uint64_t)v2, *MEMORY[0x1E4F284E8]);

    id v13 = objc_msgSend_encodedData(inited, v10, v11, v12);
  }
  else
  {
    id v13 = 0;
  }
  return v13;
}

_xpc_connection_s *im_local_object_from_connection(_xpc_connection_s *result)
{
  if (result)
  {
    id context = xpc_connection_get_context(result);
    uint64_t v5 = objc_msgSend_object(context, v2, v3, v4);
    return (_xpc_connection_s *)v5;
  }
  return result;
}

void IMXPCConfigureConnection(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = sub_1918CD008;
  handler[3] = &unk_1E5724228;
  id v12 = v5;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  id v10 = (_xpc_connection_s *)v5;
  xpc_connection_set_event_handler(v10, handler);
  xpc_connection_resume(v10);
}

uint64_t IMCreateInvocationFromXPCObjectWithProtocol(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (v7)
  {
    xpc_dictionary_get_value(v7, "invocation");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11) {
      id v11 = v7;
    }
    uint64_t v12 = JWCreateInvocationFromXPCObject(v11, v8, v9, v10);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

void sub_19189E97C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9)
{
  if (a2 == 1)
  {
    id v9 = objc_begin_catch(exception_object);
    id v10 = OSLogHandleForIDSCategory("Warning");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(a9) = 138412290;
      *(void *)((char *)&a9 + 4) = v9;
      _os_log_impl(&dword_191892000, v10, OS_LOG_TYPE_DEFAULT, "Exception building invocation: %@", (uint8_t *)&a9, 0xCu);
    }

    IMLogBacktrace(0);
    IMLogSimulateCrashForException(v9);

    objc_end_catch();
    JUMPOUT(0x19189E924);
  }
  _Unwind_Resume(exception_object);
}

#error "19189EA48: stack frame is too big (funcsize=0)"

BOOL IMDAuditTokenTaskHasEntitlement(_OWORD *a1, void *a2)
{
  id v3 = a2;
  if (qword_1EB273AC8 != -1) {
    dispatch_once(&qword_1EB273AC8, &unk_1EE22F918);
  }
  if (qword_1EB273A88 != -1) {
    dispatch_once(&qword_1EB273A88, &unk_1EE22F938);
  }
  uint64_t v4 = *MEMORY[0x1E4F1CF80];
  long long v5 = a1[1];
  *(_OWORD *)cf = *a1;
  long long v29 = v5;
  uint64_t v6 = off_1EB273AC0(v4, cf);
  if (v6)
  {
    id v14 = (const void *)v6;
    cf[0] = 0;
    CFBooleanRef v15 = (const __CFBoolean *)off_1EB273AB8(v6, v3, cf);
    if (v15)
    {
      CFBooleanRef v23 = v15;
      CFTypeID v24 = CFGetTypeID(v15);
      BOOL v25 = v24 == CFBooleanGetTypeID() && CFBooleanGetValue(v23) != 0;
      CFRelease(v23);
    }
    else
    {
      BOOL v25 = 0;
    }
    if (cf[0])
    {
      _IMWarn(@"Unable to get entitlements for client task. Error: %@", v16, v17, v18, v19, v20, v21, v22, (char)cf[0]);
      if (cf[0]) {
        CFRelease(cf[0]);
      }
    }
    CFRelease(v14);
  }
  else
  {
    _IMWarn(@"Unable to create security task from audit token.", v7, v8, v9, v10, v11, v12, v13, v27);
    BOOL v25 = 0;
  }

  return v25;
}

void im_local_object_peer_event_handler_is_syncReply(_xpc_connection_s *a1, void *a2, uint64_t a3)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v6 = MEMORY[0x192FDEE90](a2);
    if (v6 != MEMORY[0x1E4F145A8])
    {
      if (v6 != MEMORY[0x1E4F14590]) {
        return;
      }
      if (dword_1EB273738 < 0)
      {
        if (qword_1EB273BF0 != -1) {
          dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
        }
        if (dword_1EB273738 <= 0) {
          goto LABEL_23;
        }
      }
      else if (!dword_1EB273738)
      {
LABEL_23:
        id context = xpc_connection_get_context(a1);
        id v23 = (id)objc_msgSend_object(context, v20, v21, v22);
        if (!v23) {
          return;
        }
        if (xpc_dictionary_get_BOOL(a2, "xpc-object"))
        {
          char v27 = OSLogHandleForIDSCategory("IMLocalObject");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v64) = 0;
            _os_log_impl(&dword_191892000, v27, OS_LOG_TYPE_DEFAULT, "Incoming file descriptor request", (uint8_t *)&v64, 2u);
          }
          xpc_object_t value = xpc_dictionary_get_value(a2, "object");
          uint64_t v29 = objc_opt_class();
          id v30 = IMGetXPCKeyedCodableFromDictionaryWithSecureCoding(a2, "object-context", v29);
          if (!objc_msgSend_count(v30, v31, v32, v33))
          {
            __int16 v37 = OSLogHandleForIDSCategory("IMLocalObject");
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v64) = 0;
              _os_log_impl(&dword_191892000, v37, OS_LOG_TYPE_DEFAULT, " => Empty response, trying serialized response", (uint8_t *)&v64, 2u);
            }
            id v30 = IMGetXPCDictionaryFromDictionary(a2, "object-context");
            uint64_t v38 = OSLogHandleForIDSCategory("IMLocalObject");
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              pid_t v39 = objc_msgSend_count(v30, v34, v35, v36);
              int v64 = 67109120;
              pid_t pid = v39;
              _os_log_impl(&dword_191892000, v38, OS_LOG_TYPE_DEFAULT, " => Found response with %d keys", (uint8_t *)&v64, 8u);
            }
          }
          if (value && MEMORY[0x192FDEE90](value) == MEMORY[0x1E4F145B0])
          {
            int v40 = xpc_fd_dup(value);
            close(v40);
          }
          uint64_t v41 = objc_msgSend_target(v23, v34, v35, v36);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend_xpcObject_objectContext_(v41, v42, (uint64_t)value, (uint64_t)v30);
          }
        }
        else
        {
          uint64_t v52 = objc_msgSend_protocolChecker(v23, v24, v25, v26);
          v56 = objc_msgSend_protocol(v52, v53, v54, v55);
          v60 = objc_msgSend_allowlistedClasses(v23, v57, v58, v59);
          uint64_t v61 = (void *)IMCreateInvocationFromXPCObjectWithProtocol(a2, v23, v56, v60);
          if (v61)
          {
            if (pthread_main_np())
            {
              objc_msgSend__enqueueInvocationWithSync_xpcMessage_submitToComponentQueue_isReply_(v23, v62, (uint64_t)v61, 0, 1, a3);
            }
            else if (a3)
            {
              objc_msgSend__enqueueInvocationWithSync_xpcMessage_submitToComponentQueue_isReply_(v23, v62, (uint64_t)v61, 0, 1, 1);
            }
            else
            {
              objc_msgSend__enqueueInvocation_(v23, v62, (uint64_t)v61, v63);
            }
          }
        }
        goto LABEL_49;
      }
      uint64_t v17 = (void *)MEMORY[0x192FDED90](a2);
      uint64_t v18 = OSLogHandleForIDSCategory("IMLocalObject");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v64 = 67109378;
        pid_t pid = xpc_connection_get_pid(a1);
        __int16 v66 = 2080;
        v67 = v17;
        _os_log_impl(&dword_191892000, v18, OS_LOG_TYPE_DEFAULT, "received message from peer(%d): %s", (uint8_t *)&v64, 0x12u);
      }
      free(v17);
      goto LABEL_23;
    }
    if (a2 == (void *)MEMORY[0x1E4F14528])
    {
      uint64_t v8 = OSLogHandleForIDSCategory("IMLocalObject");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v64 = 67109120;
        pid_t pid = xpc_connection_get_pid(a1);
        _os_log_impl(&dword_191892000, v8, OS_LOG_TYPE_DEFAULT, "peer(%d) received XPC_ERROR_CONNECTION_INVALID", (uint8_t *)&v64, 8u);
      }
      uint64_t v9 = xpc_connection_get_context(a1);
      id v13 = (id)objc_msgSend_object(v9, v10, v11, v12);
      xpc_connection_cancel(a1);
      if (v13) {
        objc_msgSend__portDidBecomeInvalid(v13, v14, v15, v16);
      }
    }
    else
    {
      if (a2 == (void *)MEMORY[0x1E4F14520])
      {
        uint64_t v43 = OSLogHandleForIDSCategory("IMLocalObject");
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          int v64 = 67109120;
          pid_t pid = xpc_connection_get_pid(a1);
          _os_log_impl(&dword_191892000, v43, OS_LOG_TYPE_DEFAULT, "peer(%d) received XPC_ERROR_CONNECTION_INTERRUPTED", (uint8_t *)&v64, 8u);
        }
        v44 = xpc_connection_get_context(a1);
        id v48 = (id)objc_msgSend_object(v44, v45, v46, v47);
        id v23 = v48;
        if (v48) {
          objc_msgSend__portInterrupted(v48, v49, v50, v51);
        }
LABEL_49:

        return;
      }
      if (a2 == (void *)MEMORY[0x1E4F14550])
      {
        uint64_t v7 = OSLogHandleForIDSCategory("IMLocalObject");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v64 = 67109120;
          pid_t pid = xpc_connection_get_pid(a1);
          _os_log_impl(&dword_191892000, v7, OS_LOG_TYPE_DEFAULT, "peer(%d) received XPC_ERROR_TERMINATION_IMMINENT", (uint8_t *)&v64, 8u);
        }
      }
    }
  }
}

void im_local_object_peer_event_handler(_xpc_connection_s *a1, void *a2)
{
}

uint64_t sub_1918A0178(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  qword_1EB273980 = objc_msgSend_arrayWithObjects_(MEMORY[0x1E4F1C978], a2, @"mac.com", a4, @"me.com", @"icloud.com", 0);
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918A01E0()
{
  uint64_t result = IMGetAppIntForKey(@"Log.RemoteObjects");
  dword_1EB273738 = result;
  return result;
}

uint64_t sub_1918A0208()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C978]);
  qword_1E92DB380 = objc_msgSend_initWithObjects_(v0, v1, @"NSString", v2, @"NSNumber", @"NSCalendarDate", @"NSDate", @"NSArray", @"NSDictionary", @"NSMutableDictionary", @"NSObject", @"NSAttributedString", @"NSMutableAttributedString", @"NSValue", @"NSMutableArray", @"NSMutableString", @"NSData", @"NSMutableData", @"NSError",
                      @"NSURLError",
                      @"NSURL",
                      @"NSURLRequest",
                      @"NSMutableURLRequest",
                      @"NSURLResponse",
                      0);
  return MEMORY[0x1F41817F8]();
}

uint64_t (*sub_1918A0324())(void, void, void)
{
  uint64_t result = (uint64_t (*)(void, void, void))IMWeakLinkSymbol();
  off_1EB2739E0 = result;
  return result;
}

uint64_t (*sub_1918A0354())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1EB2739C0 = result;
  return result;
}

uint64_t (*sub_1918A0384())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1EB273958 = result;
  return result;
}

uint64_t (*sub_1918A03B4())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1EB273960 = result;
  return result;
}

uint64_t (*sub_1918A03E4())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1EB2739A0 = result;
  return result;
}

uint64_t (*sub_1918A0414())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1EB273998 = result;
  return result;
}

uint64_t (*sub_1918A0444())(void, void, void, void)
{
  uint64_t result = (uint64_t (*)(void, void, void, void))IMWeakLinkSymbol();
  off_1E92DB0E0 = result;
  return result;
}

uint64_t (*sub_1918A0474())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1EB2737B8 = result;
  return result;
}

IMRemoteObjectBroadcaster *sub_1918A04A4()
{
  uint64_t result = objc_alloc_init(IMRemoteObjectBroadcaster);
  qword_1EB273BE8 = (uint64_t)result;
  return result;
}

uint64_t sub_1918A04CC()
{
  qword_1EB273C58 = objc_alloc_init(IMLockdownManager);
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918A0508()
{
  qword_1EB273C40 = objc_alloc_init(IMSystemMonitor);
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918A0544(uint64_t a1)
{
  qword_1EB273A08 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918A057C()
{
  qword_1EB273C20 = (uint64_t)os_log_create("com.apple.IDS", "Registration");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918A05C4()
{
  qword_1EB273BF8 = (uint64_t)os_log_create("com.apple.Registration", "timing");
  return MEMORY[0x1F41817F8]();
}

void IMLogRegisterStateToSysdiagnoseBlock(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (!v7)
  {
    dispatch_get_global_queue(-32768, 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v5 && v7)
  {
    id v9 = v5;
    id v8 = v6;
    os_state_add_handler();
  }
}

CFIndex IMGetCachedDomainIntForKey(CFStringRef applicationID, CFStringRef key)
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex result = CFPreferencesGetAppIntegerValue(key, applicationID, &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    return 0;
  }
  return result;
}

id sub_1918A11C8()
{
  if (qword_1E92DB3C8 != -1) {
    dispatch_once(&qword_1E92DB3C8, &unk_1EE22FA38);
  }
  id v0 = (void *)qword_1E92DB3C0;
  return v0;
}

void sub_1918A121C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  id v9 = (objc_class *)IMWeakLinkClass();
  if (v9)
  {
    qword_1E92DB3C0 = (uint64_t)objc_alloc_init(v9);
    MEMORY[0x1F41817F8]();
  }
  else
  {
    _IMWarn(@"Unable to link against <SymptomDiagnosticReporter.framework/SDRDiagnosticReporter> - ABCs will not be reported.", v10, v11, v12, v13, v14, v15, v16, a9);
  }
}

void IMReportAutoBugCapture(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v21 = sub_1918A11C8();
  if (v21)
  {
    uint64_t v22 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v14, v15, v16);
    uint64_t v26 = objc_msgSend_bundleIdentifier(v22, v23, v24, v25);
    uint64_t v28 = objc_msgSend_signatureWithDomain_type_subType_subtypeContext_detectedProcess_triggerThresholdValues_(v21, v27, (uint64_t)v9, (uint64_t)v10, v11, v12, v26, 0);

    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = sub_1918A1454;
    v38[3] = &unk_1E5722CC0;
    id v29 = v28;
    id v39 = v29;
    int v31 = objc_msgSend_snapshotWithSignature_delay_events_payload_actions_reply_(v21, v30, (uint64_t)v29, 0, v13, 0, v38, 15.0);
    if (_IMWillLog(@"ABC"))
    {
      if (v31) {
        __int16 v37 = @"Auto Bug Capture took a snapshot for signature %@";
      }
      else {
        __int16 v37 = @"Auto Bug Capture failed to take snapshot for signature %@";
      }
      _IMAlwaysLog(0, @"ABC", v37, v32, v33, v34, v35, v36, (char)v29);
    }
  }
  else
  {
    _IMWarn(@"Dropping ABC domain:%@ type:%@ subType:%@ subtypeContext:%@ payload:%@", (uint64_t)v14, v15, v16, v17, v18, v19, v20, (char)v9);
  }
}

void sub_1918A1454(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (_IMWillLog(@"ABC")) {
    _IMAlwaysLog(0, @"ABC", @"Received response from Auto Bug Capture for signature %@ - response: %@", v3, v4, v5, v6, v7, *(void *)(a1 + 32));
  }
}

id IMCanonicalFormForEmail(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_lowercaseString(a1, a2, a3, a4);
  if (objc_msgSend_hasMobileMeSuffix(v4, v5, v6, v7))
  {
    id v11 = objc_msgSend_stripMobileMSuffixIfPresent(v4, v8, v9, v10);

    uint64_t v4 = objc_msgSend_stringByAppendingString_(v11, v12, @"@icloud.com", v13);
  }
  return v4;
}

uint64_t IMAreEmailsLogicallyTheSame(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v7 = IMCanonicalFormForEmail(a1, v4, v5, v6);
  id v11 = IMCanonicalFormForEmail(v3, v8, v9, v10);

  uint64_t isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v7, v12, (uint64_t)v11, v13);
  return isEqualToIgnoringCase;
}

uint64_t IMStringIsStewieEmergency(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F4181798](a1, sel__appearsToBeStewieEmergency, a3, a4);
}

uint64_t IMStringIsStewieRoadside(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F4181798](a1, sel__appearsToBeStewieRoadside, a3, a4);
}

uint64_t IMStringIsInHardcodedEmergencyNumberSet(void *a1)
{
  uint64_t v1 = qword_1E92DB060;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_1E92DB060, &unk_1EE22FA58);
  }
  id v3 = (void *)qword_1E92DB058;
  uint64_t v4 = IMNormalizedPhoneNumberForPhoneNumber(v2);

  uint64_t v7 = objc_msgSend_containsObject_(v3, v5, (uint64_t)v4, v6);
  return v7;
}

void sub_1918A16CC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_set(MEMORY[0x1E4F1CA80], a2, a3, a4);
  id v54 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = IMNormalizedPhoneNumberForPhoneNumber(@"911");
  objc_msgSend_addObject_(v54, v5, (uint64_t)v4, v6);

  uint64_t v7 = IMNormalizedPhoneNumberForPhoneNumber(@"112");
  objc_msgSend_addObject_(v54, v8, (uint64_t)v7, v9);

  uint64_t v10 = IMNormalizedPhoneNumberForPhoneNumber(@"000");
  objc_msgSend_addObject_(v54, v11, (uint64_t)v10, v12);

  uint64_t v13 = IMNormalizedPhoneNumberForPhoneNumber(@"08");
  objc_msgSend_addObject_(v54, v14, (uint64_t)v13, v15);

  uint64_t v16 = IMNormalizedPhoneNumberForPhoneNumber(@"110");
  objc_msgSend_addObject_(v54, v17, (uint64_t)v16, v18);

  uint64_t v19 = IMNormalizedPhoneNumberForPhoneNumber(@"118");
  objc_msgSend_addObject_(v54, v20, (uint64_t)v19, v21);

  uint64_t v22 = IMNormalizedPhoneNumberForPhoneNumber(@"119");
  objc_msgSend_addObject_(v54, v23, (uint64_t)v22, v24);

  uint64_t v25 = IMNormalizedPhoneNumberForPhoneNumber(@"103");
  objc_msgSend_addObject_(v54, v26, (uint64_t)v25, v27);

  uint64_t v28 = IMNormalizedPhoneNumberForPhoneNumber(@"105");
  objc_msgSend_addObject_(v54, v29, (uint64_t)v28, v30);

  int v31 = IMNormalizedPhoneNumberForPhoneNumber(@"115");
  objc_msgSend_addObject_(v54, v32, (uint64_t)v31, v33);

  uint64_t v34 = IMNormalizedPhoneNumberForPhoneNumber(@"100");
  objc_msgSend_addObject_(v54, v35, (uint64_t)v34, v36);

  __int16 v37 = IMNormalizedPhoneNumberForPhoneNumber(@"122");
  objc_msgSend_addObject_(v54, v38, (uint64_t)v37, v39);

  int v40 = IMNormalizedPhoneNumberForPhoneNumber(@"105");
  objc_msgSend_addObject_(v54, v41, (uint64_t)v40, v42);

  uint64_t v43 = IMNormalizedPhoneNumberForPhoneNumber(@"190");
  objc_msgSend_addObject_(v54, v44, (uint64_t)v43, v45);

  uint64_t v46 = IMNormalizedPhoneNumberForPhoneNumber(@"133");
  objc_msgSend_addObject_(v54, v47, (uint64_t)v46, v48);

  uint64_t v52 = objc_msgSend_copy(v54, v49, v50, v51);
  uint64_t v53 = (void *)qword_1E92DB058;
  qword_1E92DB058 = v52;
}

uint64_t IMStringIsEmergencyPhoneNumber(void *a1)
{
  id v8 = a1;
  if (qword_1E92DAE50 != -1) {
    dispatch_once(&qword_1E92DAE50, &unk_1EE2313F8);
  }
  uint64_t v9 = (void *)qword_1E92DAE48;
  if (!qword_1E92DAE48)
  {
    _IMWarn(@"Failed to weak link FTSelectedPNRSubscription from IMFoundation for IMStringIsEmergencyPhoneNumber", (uint64_t)v1, v2, v3, v4, v5, v6, v7, v15);
    uint64_t v9 = (void *)qword_1E92DAE48;
  }
  uint64_t v10 = objc_msgSend_sharedInstance(v9, v1, v2, v3);
  uint64_t isPhoneNumberEmergencyNumber = objc_msgSend_isPhoneNumberEmergencyNumber_(v10, v11, (uint64_t)v8, v12);

  return isPhoneNumberEmergencyNumber;
}

uint64_t sub_1918A1A58()
{
  uint64_t result = IMWeakLinkClass();
  qword_1E92DAE48 = result;
  return result;
}

BOOL IMStringIsEmpty(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_trimmedString(a1, a2, a3, a4);
  BOOL v8 = objc_msgSend_length(v4, v5, v6, v7) == 0;

  return v8;
}

id sub_1918A1AC4(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], a2, a3, a4);

  if (v5 == a1)
  {
    uint64_t v10 = (void *)qword_1E92DB3D0;
    if (!qword_1E92DB3D0)
    {
      uint64_t v11 = objc_msgSend_resourcePath(a1, v6, v7, v8);
      uint64_t v12 = (void *)qword_1E92DB3D0;
      qword_1E92DB3D0 = v11;

      uint64_t v10 = (void *)qword_1E92DB3D0;
    }
    id v9 = v10;
  }
  else
  {
    objc_msgSend_resourcePath(a1, v6, v7, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

BOOL sub_1918A1B50(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_null(MEMORY[0x1E4F1CA98], a2, a3, a4);
  BOOL v6 = v5 == a1;

  return v6;
}

uint64_t sub_1918A1B90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = qword_1E92DB3D8;
  if (!qword_1E92DB3D8)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    uint64_t v7 = (void *)qword_1E92DB3D8;
    qword_1E92DB3D8 = (uint64_t)v6;

    objc_msgSend_setFormatterBehavior_((void *)qword_1E92DB3D8, v8, 1040, v9);
    objc_msgSend_setNumberStyle_((void *)qword_1E92DB3D8, v10, 0, v11);
    uint64_t v5 = qword_1E92DB3D8;
  }
  return MEMORY[0x1F4181798](v5, sel_stringFromNumber_, a1, a4);
}

id sub_1918A1C04(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = (void *)qword_1E92DB3E0;
  if (!qword_1E92DB3E0)
  {
    uint64_t v5 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], a2, @"\\:", a4);
    id v6 = (void *)qword_1E92DB3E0;
    qword_1E92DB3E0 = v5;

    uint64_t v4 = (void *)qword_1E92DB3E0;
  }
  return v4;
}

id sub_1918A1C64(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_copyStringGUIDForObject_(a1, a2, a3, a4);
  return v4;
}

uint64_t sub_1918A1C8C()
{
  unsigned int v0 = FastRandomUInt();
  return objc_msgSend_stringWithFormat_(NSString, v1, @"%u", v2, v0 % 0x3B9ACA00);
}

uint64_t FastRandomUInt()
{
  if (qword_1E92DB348 != -1) {
    dispatch_once(&qword_1E92DB348, &unk_1EE22F878);
  }
  return random();
}

id sub_1918A1D24()
{
  uint64_t v0 = FastRandomUInt() % 0x3B9ACA00;
  unsigned int v1 = FastRandomUInt();
  uint64_t v4 = objc_msgSend_stringWithFormat_(NSString, v2, @"Chat%u%u", v3, v0, v1 % 0x3B9ACA00);
  uint64_t v8 = objc_msgSend_lowercaseString(v4, v5, v6, v7);

  return v8;
}

uint64_t sub_1918A1DCC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  unsigned __int8 v8 = 0;
  uint64_t v5 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], a2, a3, a4);
  objc_msgSend_fileExistsAtPath_isDirectory_(v5, v6, a1, (uint64_t)&v8);

  return v8;
}

uint64_t sub_1918A1E20(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  memset(v10, 170, sizeof(v10));
  unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v5 = objc_msgSend_length(a1, a2, a3, a4);
  uint64_t result = objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_(a1, v6, (uint64_t)v10, 15, &v9, 4, 1, 0, v5, 0);
  if (result)
  {
    v10[v9] = 0;
    unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
    if (sscanf(v10, "%lx", &v8) == 1) {
      return v8;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1918A1EE8(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_length(a1, v5, v6, v7);
  uint64_t v12 = objc_msgSend_autoupdatingCurrentLocale(MEMORY[0x1E4F1CA20], v9, v10, v11);
  uint64_t v14 = objc_msgSend_compare_options_range_locale_(a1, v13, (uint64_t)v4, 961, 0, v8, v12);

  return v14;
}

__CFString *sub_1918A1F64(CFStringRef originalString)
{
  unsigned int v1 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes(0, originalString, &stru_1EE231AD8);
  return v1;
}

id sub_1918A1F9C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x1E4F28B88], a2, a3, a4);
  uint64_t v8 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(a1, v6, (uint64_t)v5, v7);

  return v8;
}

id sub_1918A1FFC(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (objc_msgSend_length(a1, a2, a3, a4))
  {
    uint64_t v10 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v5, (uint64_t)a1, v6);
    if (!v10)
    {
      uint64_t v11 = objc_msgSend_stringByRemovingURLEscapes(a1, v7, v8, v9);
      char v15 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x1E4F28B88], v12, v13, v14);
      uint64_t v19 = objc_msgSend_mutableCopy(v15, v16, v17, v18);

      objc_msgSend_addCharactersInString_(v19, v20, @"#", v21);
      uint64_t v24 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v11, v22, (uint64_t)v19, v23);
      if (objc_msgSend_length(v24, v25, v26, v27))
      {
        uint64_t v10 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v28, (uint64_t)v24, v29);
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

uint64_t sub_1918A20F0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_stringWithFormat_(NSString, a2, @"E:%@", a4, a1);
}

id sub_1918A2128(void *a1)
{
  unsigned int v1 = NSString;
  uint64_t v2 = IMFormatPhoneNumber(a1, 1);
  uint64_t v5 = objc_msgSend_stringWithFormat_(v1, v3, @"P:%@", v4, v2);

  return v5;
}

uint64_t sub_1918A2198(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if ((objc_msgSend_hasPrefix_(a1, a2, @"H:", a4) & 1) != 0
    || (objc_msgSend_hasPrefix_(a1, v5, @"D:", v6) & 1) != 0
    || (objc_msgSend_hasPrefix_(a1, v7, @"E:", v8) & 1) != 0)
  {
    return 1;
  }
  if (objc_msgSend_hasPrefix_(a1, v9, @"P:", v10)) {
    return 0;
  }
  if (objc_msgSend_hasPrefix_(a1, v12, @"A:", v13)) {
    return 6;
  }
  if (objc_msgSend_hasPrefix_(a1, v14, @"tel:", v15)) {
    return 0;
  }
  if (objc_msgSend_hasPrefix_(a1, v16, @"mailto:", v17)) {
    return 1;
  }
  if ((objc_msgSend_hasPrefix_(a1, v18, @"urn:biz:", v19) & 1) != 0
    || (objc_msgSend_hasPrefix_(a1, v20, @"biz:", v21) & 1) != 0)
  {
    return 3;
  }
  if (objc_msgSend_hasPrefix_(a1, v22, @"temp:", v23)) {
    return 4;
  }
  if (objc_msgSend_hasPrefix_(a1, v24, @"pseud:", v25)) {
    return 5;
  }
  if (objc_msgSend_hasPrefix_(a1, v26, @"dev:", v27)) {
    return 6;
  }
  if ((objc_msgSend_hasPrefix_(a1, v28, @"urn:", v29) & 1) != 0
    || (objc_msgSend_hasPrefix_(a1, v30, @"ds:", v31) & 1) != 0)
  {
    return 2;
  }
  if (objc_msgSend_hasPrefix_(a1, v32, @"sip:", v33)) {
    return 7;
  }
  return -1;
}

id sub_1918A2320(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = NSString;
  uint64_t v5 = objc_msgSend_lowercaseString(a1, a2, a3, a4);
  uint64_t v8 = objc_msgSend_stringWithFormat_(v4, v6, @"mailto:%@", v7, v5);

  return v8;
}

id sub_1918A238C(void *a1)
{
  unsigned int v1 = NSString;
  uint64_t v2 = IMFormatPhoneNumber(a1, 1);
  uint64_t v5 = objc_msgSend_stringWithFormat_(v1, v3, @"tel:%@", v4, v2);

  return v5;
}

id sub_1918A23FC(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (objc_msgSend_hasPrefix_(a1, a2, @"urn:", a4))
  {
    id v8 = a1;
  }
  else
  {
    uint64_t v9 = NSString;
    uint64_t v10 = objc_msgSend_lowercaseString(a1, v5, v6, v7);
    objc_msgSend_stringWithFormat_(v9, v11, @"urn:%@", v12, v10);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

id sub_1918A2494(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_lowercaseString(a1, a2, a3, a4);
  if (objc_msgSend_hasPrefix_(v4, v5, @"urn:biz:", v6))
  {
    id v9 = v4;
  }
  else
  {
    if (objc_msgSend_hasPrefix_(v4, v7, @"biz:", v8)) {
      objc_msgSend_stringWithFormat_(NSString, v10, @"urn:%@", v11, v4);
    }
    else {
      objc_msgSend_stringByAppendingString_(@"urn:biz:", v10, (uint64_t)v4, v11);
    }
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v12 = v9;

  return v12;
}

id sub_1918A2540(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (objc_msgSend_hasPrefix_(a1, a2, @"temp:", a4))
  {
    id v7 = a1;
  }
  else
  {
    objc_msgSend_stringByAppendingString_(@"temp:", v5, (uint64_t)a1, v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

id sub_1918A259C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (objc_msgSend_hasPrefix_(a1, a2, @"pseud:", a4))
  {
    id v7 = a1;
  }
  else
  {
    objc_msgSend_stringByAppendingString_(@"pseud:", v5, (uint64_t)a1, v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

id sub_1918A25F8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (objc_msgSend_hasPrefix_(a1, a2, @"dev:", a4))
  {
    id v7 = a1;
  }
  else
  {
    objc_msgSend_stringByAppendingString_(@"dev:", v5, (uint64_t)a1, v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

id sub_1918A2654(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (objc_msgSend_hasPrefix_(a1, a2, @"sip:", a4))
  {
    id v7 = a1;
  }
  else
  {
    objc_msgSend_stringByAppendingString_(@"sip:", v5, (uint64_t)a1, v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

uint64_t sub_1918A26B0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend__FZBestGuessFZIDType(a1, a2, a3, a4);
  return MEMORY[0x1F4181798](a1, sel__URIFromFZIDType_, v5, v6);
}

uint64_t sub_1918A26EC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_stringByAppendingString_(@"mailto:", a2, a1, a4);
}

uint64_t sub_1918A26FC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_stringByAppendingString_(@"tel:", a2, a1, a4);
}

uint64_t sub_1918A270C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_stringByAppendingString_(@"urn:", a2, a1, a4);
}

uint64_t sub_1918A2730(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend__FZBestGuessFZIDType(a1, a2, a3, a4);
  return MEMORY[0x1F4181798](a1, sel__URIFromCanonicalizedFZIDType_, v5, v6);
}

uint64_t sub_1918A276C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (objc_msgSend__appearsToBeSIPID(a1, a2, a3, a4)) {
    return 7;
  }
  if (objc_msgSend__appearsToBePhoneNumber(a1, v5, v6, v7)) {
    return 0;
  }
  if (objc_msgSend__appearsToBeEmail(a1, v9, v10, v11)) {
    return 1;
  }
  if (objc_msgSend__appearsToBeDSID(a1, v12, v13, v14)) {
    return 2;
  }
  if (objc_msgSend__appearsToBeBusinessID(a1, v15, v16, v17)) {
    return 3;
  }
  if (objc_msgSend__appearsToBeTemporaryID(a1, v18, v19, v20)) {
    return 4;
  }
  if (objc_msgSend__appearsToBePseudonymID(a1, v21, v22, v23)) {
    return 5;
  }
  if (objc_msgSend__appearsToBeHardwareID(a1, v24, v25, v26)) {
    return 6;
  }
  return -1;
}

id sub_1918A2828(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  switch(a3)
  {
    case -1:
    case 1:
      uint64_t v6 = objc_msgSend__URIFromCanonicalizedEmail(a1, a2, a3, a4, v4);
      goto LABEL_13;
    case 0:
      uint64_t v6 = objc_msgSend__URIFromCanonicalizedPhoneNumber(a1, a2, a3, a4, v4);
      goto LABEL_13;
    case 2:
      uint64_t v6 = objc_msgSend__URIFromCanonicalizedDSID(a1, a2, a3, a4, v4);
      goto LABEL_13;
    case 3:
      uint64_t v6 = objc_msgSend__URIFromCanonicalizedBusinessID(a1, a2, a3, a4, v4);
      goto LABEL_13;
    case 4:
      uint64_t v6 = objc_msgSend__URIFromCanonicalizedTemporaryID(a1, a2, a3, a4, v4);
      goto LABEL_13;
    case 5:
      uint64_t v6 = objc_msgSend__URIFromCanonicalizedPseudonymID(a1, a2, a3, a4, v4);
      goto LABEL_13;
    case 6:
      uint64_t v6 = objc_msgSend__URIFromCanonicalizedHardwareID(a1, a2, a3, a4, v4);
      goto LABEL_13;
    case 7:
      uint64_t v6 = objc_msgSend__URIFromCanonicalizedSIPID(a1, a2, a3, a4, v4);
LABEL_13:
      break;
    default:
      uint64_t v6 = 0;
      break;
  }
  return v6;
}

id sub_1918A290C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  switch(a3)
  {
    case -1:
    case 1:
      uint64_t v6 = objc_msgSend__URIFromEmail(a1, a2, a3, a4, v4);
      goto LABEL_13;
    case 0:
      uint64_t v6 = objc_msgSend__URIFromPhoneNumber(a1, a2, a3, a4, v4);
      goto LABEL_13;
    case 2:
      uint64_t v6 = objc_msgSend__URIFromDSID(a1, a2, a3, a4, v4);
      goto LABEL_13;
    case 3:
      uint64_t v6 = objc_msgSend__URIFromBusinessID(a1, a2, a3, a4, v4);
      goto LABEL_13;
    case 4:
      uint64_t v6 = objc_msgSend__URIFromTemporaryID(a1, a2, a3, a4, v4);
      goto LABEL_13;
    case 5:
      uint64_t v6 = objc_msgSend__URIFromPseudonymID(a1, a2, a3, a4, v4);
      goto LABEL_13;
    case 6:
      uint64_t v6 = objc_msgSend__URIFromHardwareID(a1, a2, a3, a4, v4);
      goto LABEL_13;
    case 7:
      uint64_t v6 = objc_msgSend__URIFromSIPID(a1, a2, a3, a4, v4);
LABEL_13:
      break;
    default:
      uint64_t v6 = 0;
      break;
  }
  return v6;
}

id sub_1918A29F0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  switch(a3)
  {
    case -1:
    case 1:
      objc_msgSend__FZIDFromEmail(a1, a2, a3, a4);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 0:
      objc_msgSend__FZIDFromPhoneNumber(a1, a2, a3, a4);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
      id v5 = a1;
      goto LABEL_9;
    case 6:
      objc_msgSend_stringWithFormat_(NSString, a2, @"A:%@", a4, a1);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
      break;
    default:
      id v5 = 0;
      break;
  }
  return v5;
}

id sub_1918A2AC0(void *a1, const char *a2, void *a3, uint64_t a4)
{
  if ((objc_msgSend_hasPrefix_(a1, a2, @"token:", a4) & 1) != 0
    || objc_msgSend_hasPrefix_(a1, v6, @"self-token:", v8))
  {
    id v9 = objc_msgSend__stripFZIDPrefix(a1, v6, v7, v8);
    uint64_t v12 = objc_msgSend_rangeOfString_(v9, v10, @"/", v11);
    uint64_t v16 = v12;
    if (a3)
    {
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v17 = v9;
      }
      else
      {
        objc_msgSend_substringToIndex_(v9, v13, v12, v15);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      uint64_t v21 = v17;
      objc_msgSend___imDataWithHexString_(MEMORY[0x1E4F1C9B8], v18, (uint64_t)v17, v19);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend_length(v9, v13, v14, v15) <= (unint64_t)(v16 + 1))
    {
      id v20 = 0;
    }
    else
    {
      objc_msgSend_substringFromIndex_(v9, v22, v16 + 1, v23);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v20 = a1;
  }
  return v20;
}

id sub_1918A2BCC(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v5 = (const char *)objc_msgSend_UTF8String(v1, v2, v3, v4);
  memset(md, 170, sizeof(md));
  CC_LONG v6 = strlen(v5);
  CC_MD5(v5, v6, md);
  id v7 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v12 = objc_msgSend_initWithCapacity_(v7, v8, 32, v9);
  for (uint64_t i = 0; i != 16; ++i)
    objc_msgSend_appendFormat_(v12, v10, @"%02x", v11, md[i], *(void *)md, *(void *)&md[8], v16);
  return v12;
}

__CFString *IMCopyStringWithLatinNumbers(const __CFString *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t Length = CFStringGetLength(a1);
  if (Length < 1) {
    return 0;
  }
  uint64_t v3 = Length;
  CFMutableDictionaryRef Mutable = CFStringCreateMutable(0, Length);
  for (CFIndex i = 0; i != v3; ++i)
  {
    UniChar chars = -21846;
    UChar32 CharacterAtIndex = CFStringGetCharacterAtIndex(a1, i);
    UniChar chars = CharacterAtIndex;
    uint64_t v7 = u_charDigitValue(CharacterAtIndex);
    if (v7 == -1) {
      CFStringAppendCharacters(Mutable, &chars, 1);
    }
    else {
      CFStringAppendFormat(Mutable, 0, @"%d", v7);
    }
  }
  return Mutable;
}

uint64_t sub_1918A2D74(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if ((objc_msgSend_hasPrefix_(a1, a2, @"urn:ds:", a4) & 1) != 0
    || (objc_msgSend_hasPrefix_(a1, v5, @"ds:", v6) & 1) != 0)
  {
    return 1;
  }
  return objc_msgSend_hasPrefix_(a1, v7, @"DS:", v8);
}

uint64_t sub_1918A2DE4(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_hasPrefix_(a1, a2, @"temp:", a4);
}

uint64_t sub_1918A2DF0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_hasPrefix_(a1, a2, @"sip:", a4);
}

uint64_t sub_1918A2DFC(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_hasPrefix_(a1, a2, @"stewie:emergency:", a4);
}

uint64_t sub_1918A2E08(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_hasPrefix_(a1, a2, @"stewie:roadside:", a4);
}

id sub_1918A2E14(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_stringByExpandingTildeInPath(a1, a2, a3, a4);
  uint64_t v8 = objc_msgSend_stringByStandardizingPath(v4, v5, v6, v7);

  uint64_t v12 = objc_msgSend_stringByResolvingSymlinksInPath(v8, v9, v10, v11);

  id v13 = v12;
  uint64_t v16 = objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x1E4F1CB10], v14, (uint64_t)v13, 0);
  id v17 = v13;
  if (v16)
  {
    uint64_t v18 = objc_msgSend_URLByResolvingAliasFileAtURL_options_error_(MEMORY[0x1E4F1CB10], v15, (uint64_t)v16, 0, 0);
    uint64_t v22 = v18;
    id v17 = v13;
    if (v18)
    {
      id v17 = objc_msgSend_path(v18, v19, v20, v21);
    }
  }

  return v17;
}

uint64_t sub_1918A2EEC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = qword_1E92DB3E8;
  if (!qword_1E92DB3E8)
  {
    uint64_t v6 = objc_msgSend_newlineCharacterSet(MEMORY[0x1E4F28B88], a2, 0, a4);
    uint64_t v7 = (void *)qword_1E92DB3E8;
    qword_1E92DB3E8 = v6;

    uint64_t v5 = qword_1E92DB3E8;
  }
  return MEMORY[0x1F4181798](a1, sel_rangeOfCharacterFromSet_options_range_, v5, 7);
}

id sub_1918A2F68(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E4F28B88], a2, a3, a4);
  uint64_t v8 = objc_msgSend_stringByTrimmingCharactersInSet_(a1, v6, (uint64_t)v5, v7);

  return v8;
}

id sub_1918A2FC8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], a2, a3, a4);
  uint64_t v9 = objc_msgSend_lastPathComponent(a1, v6, v7, v8);
  id v13 = objc_msgSend_stringByDeletingPathExtension(v9, v10, v11, v12);
  id v17 = objc_msgSend_stringByDeletingLastPathComponent(a1, v14, v15, v16);
  uint64_t v21 = objc_msgSend_pathExtension(a1, v18, v19, v20);
  uint64_t v23 = objc_msgSend_uniqueFilename_atPath_ofType_(v5, v22, (uint64_t)v13, (uint64_t)v17, v21);

  return v23;
}

__CFString *sub_1918A308C(void *a1)
{
  uint64_t v2 = sub_1918A30F8();
  objc_msgSend_stringByRemovingCharactersFromSet_(a1, v3, (uint64_t)v2, v4);
  uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_1EE231AD8;
  }
  uint64_t v7 = v5;

  return v7;
}

id sub_1918A30F8()
{
  if (qword_1E92DB340 != -1) {
    dispatch_once(&qword_1E92DB340, &unk_1EE230058);
  }
  uint64_t v0 = (void *)qword_1E92DB338;
  return v0;
}

__CFString *sub_1918A314C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (qword_1E92DB248 != -1) {
    dispatch_once(&qword_1E92DB248, &unk_1EE22F6B8);
  }
  objc_msgSend_stringByRemovingCharactersFromSet_(a1, a2, qword_1E92DB240, a4);
  uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_1EE231AD8;
  }
  uint64_t v7 = v5;

  return v7;
}

id sub_1918A31CC(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (objc_msgSend_length(a1, a2, a3, a4))
  {
    uint64_t v8 = objc_msgSend_trimmedString(a1, v5, v6, v7);
    uint64_t v12 = objc_msgSend___stringByStrippingAttachmentAndControlCharacters(v8, v9, v10, v11);

    id v16 = (id)objc_msgSend_mutableCopy(v12, v13, v14, v15);
    objc_msgSend_replaceNewlinesWithSpaces(v16, v17, v18, v19);
  }
  else
  {
    id v16 = a1;
  }
  return v16;
}

uint64_t sub_1918A3248(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_stringWithFormat_(NSString, a2, @"\u202D%@\u202C", a4, a1);
}

BOOL sub_1918A3280(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x1E4F28B88], a2, a3, a4);
  uint64_t v9 = objc_msgSend_mutableCopy(v5, v6, v7, v8);

  objc_msgSend_invert(v9, v10, v11, v12);
  uint64_t v15 = objc_msgSend_stringByTrimmingCharactersInSet_(a1, v13, (uint64_t)v9, v14);
  BOOL v19 = (unint64_t)objc_msgSend_length(v15, v16, v17, v18) > 5;

  return v19;
}

id sub_1918A32FC(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    uint64_t v11 = objc_msgSend_query(a1, v8, v9, v10);
    uint64_t v12 = @"&";
    if (!v11) {
      uint64_t v12 = @"?";
    }
    id v13 = v12;

    id v14 = [NSString alloc];
    uint64_t v18 = objc_msgSend_absoluteString(a1, v15, v16, v17);
    uint64_t v21 = objc_msgSend_initWithFormat_(v14, v19, @"%@%@%@", v20, v18, v13, v4);

    objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v22, (uint64_t)v21, v23);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v24 = a1;
  }

  return v24;
}

uint64_t sub_1918A33F4(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_length(a1, a2, a3, a4);
  uint64_t result = objc_msgSend___rangeOfNewlineInRange_(a1, v6, 0, v5);
  if (v8)
  {
    uint64_t v9 = result;
    do
    {
      objc_msgSend_replaceCharactersInRange_withString_(a1, v8, v9, (uint64_t)v8, @" ");
      uint64_t result = objc_msgSend___rangeOfNewlineInRange_(a1, v10, 0, v9);
      uint64_t v9 = result;
    }
    while (v8);
  }
  return result;
}

id sub_1918A346C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_string(a1, a2, a3, a4);
  uint64_t v9 = objc_msgSend_trimmedString(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_length(v9, v10, v11, v12);
  if (v13 == objc_msgSend_length(a1, v14, v15, v16)) {
    goto LABEL_2;
  }
  if (v13)
  {
    uint64_t v20 = objc_msgSend_rangeOfString_(v5, v17, (uint64_t)v9, v18);
    if (v21)
    {
      objc_msgSend_attributedSubstringFromRange_(a1, v21, v20, (uint64_t)v21);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_2:
    id v19 = a1;
LABEL_6:
    uint64_t v22 = v19;
    goto LABEL_8;
  }
  uint64_t v22 = 0;
LABEL_8:

  return v22;
}

void *IMCreateSuperFormatStringWithAppendedFileTransfers(void *a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v7 = (id)objc_msgSend_mutableCopy(a1, v4, v5, v6);
  if (!v7) {
    id v7 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v3;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * v12);
        id v14 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        uint64_t v17 = objc_msgSend_initWithObjectsAndKeys_(v14, v15, v13, v16, @"__kIMFileTransferGUIDAttributeName", 0);
        id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
        uint64_t v20 = objc_msgSend_initWithString_attributes_(v18, v19, @"\uFFFC", (uint64_t)v17);
        objc_msgSend_appendAttributedString_(v7, v21, (uint64_t)v20, v22);

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v27, (uint64_t)v31, 16);
    }
    while (v10);
  }

  id v24 = IMCreateSuperFormatStringByAttachingMessageParts(v7);
  return v24;
}

void *IMCreateSuperFormatStringByAttachingMessageParts(void *a1)
{
  id v1 = a1;
  if (!objc_msgSend_length(v1, v2, v3, v4))
  {
    id v13 = (id)objc_msgSend_copy(v1, v5, v6, v7);
    goto LABEL_5;
  }
  uint64_t v8 = objc_msgSend_length(v1, v5, v6, v7);
  if (!objc_msgSend_attribute_existsInRange_(v1, v9, @"__kIMMessagePartAttributeName", 0, v8))
  {
    id v44 = v1;
    id v14 = objc_msgSend_mutableCopy(v1, v10, v11, v12);
    uint64_t v18 = objc_msgSend_length(v14, v15, v16, v17);
    objc_msgSend_removeAttribute_range_(v14, v19, @"__kIMMessagePartAttributeName", 0, v18);
    unint64_t v23 = objc_msgSend_length(v14, v20, v21, v22);
    long long v28 = objc_msgSend_string(v14, v24, v25, v26);
    if (!v23)
    {
LABEL_21:

      id v1 = v44;
      goto LABEL_22;
    }
    uint64_t v29 = 0;
    BOOL v30 = 0;
    unint64_t v31 = 0;
    char v32 = 1;
    while (1)
    {
      uint64_t v45 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v46 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v33 = objc_msgSend_attributesAtIndex_longestEffectiveRange_inRange_(v14, v27, v31, (uint64_t)&v45, v31, v23 - v31);
      int v36 = objc_msgSend_characterAtIndex_(v28, v34, v45, v35);
      if (v36 == 65532)
      {
        uint64_t v39 = objc_msgSend_objectForKey_(v33, v37, @"__kIMEmojiImageAttributeName", v38);

        if (!v39)
        {
          if ((v32 & 1) == 0) {
LABEL_17:
          }
            uint64_t v29 = (v29 + 1);
          BOOL v30 = 1;
LABEL_19:
          objc_msgSend_numberWithInt_(NSNumber, v37, v29, v38);
          goto LABEL_20;
        }
        if (v32)
        {
          BOOL v30 = 0;
          goto LABEL_19;
        }
      }
      else
      {
        if (v32)
        {
          BOOL v30 = v36 == 65533;
          goto LABEL_19;
        }
        if (v36 == 65533) {
          goto LABEL_17;
        }
      }
      int v40 = v30;
      BOOL v30 = 0;
      uint64_t v29 = (v29 + v40);
      objc_msgSend_numberWithInt_(NSNumber, v37, v29, v38);
      uint64_t v41 = LABEL_20:;
      objc_msgSend_addAttribute_value_range_(v14, v42, @"__kIMMessagePartAttributeName", (uint64_t)v41, v45, v46);

      unint64_t v31 = v46 + v45;
      char v32 = 0;
      if (v31 >= v23) {
        goto LABEL_21;
      }
    }
  }
  id v13 = v1;
LABEL_5:
  id v14 = v13;
LABEL_22:

  return v14;
}

void sub_1918A38B4(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_string(a1, a2, a3, a4);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E4F28B88], v5, v6, v7);
  uint64_t v12 = objc_msgSend_invertedSet(v8, v9, v10, v11);

  int v16 = objc_msgSend_length(a1, v13, v14, v15);
  uint64_t v18 = objc_msgSend_rangeOfCharacterFromSet_options_(v26, v17, (uint64_t)v12, 6);
  uint64_t v20 = v19;
  if (v19) {
    uint64_t v21 = v18;
  }
  else {
    uint64_t v21 = -1;
  }
  if (v16 > (unint64_t)&v19[v21]) {
    objc_msgSend_deleteCharactersInRange_(a1, v19, (uint64_t)&v19[v21], v16 - (void)&v19[v21]);
  }
  if (v20)
  {
    uint64_t v22 = objc_msgSend_rangeOfCharacterFromSet_options_(v26, v19, (uint64_t)v12, 2);
    if (!v23) {
      uint64_t v22 = objc_msgSend_length(v26, 0, v24, v25);
    }
    if (v22) {
      objc_msgSend_deleteCharactersInRange_(a1, v23, 0, v22);
    }
  }
}

void sub_1918A39A0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_string(a1, a2, a3, a4);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_length(v20, v5, v6, v7);
  uint64_t v10 = objc_msgSend___rangeOfNewlineInRange_(v20, v9, 0, v8);
  if (v11)
  {
    uint64_t v14 = v10;
    uint64_t v15 = (uint64_t)v11;
    objc_msgSend_beginEditing(a1, v11, v12, v13);
    do
    {
      objc_msgSend_replaceCharactersInRange_withString_(a1, v16, v14, v15, @" ");
      uint64_t v14 = objc_msgSend___rangeOfNewlineInRange_(v20, v17, 0, v14);
      uint64_t v15 = (uint64_t)v16;
    }
    while (v16);
    objc_msgSend_endEditing(a1, 0, v18, v19);
  }
}

void sub_1918A3A58(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = objc_msgSend_length(a1, v11, v12, v13);
  if (v14 << 32)
  {
    unint64_t v16 = 0;
    unint64_t v17 = (int)v14;
    do
    {
      uint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
      objc_msgSend_attribute_atIndex_effectiveRange_(a1, v15, (uint64_t)v8, v16, &v22);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = v18;
      if (v18 == v9 || objc_msgSend_isEqual_(v18, v19, (uint64_t)v9, v20))
      {
        if (v10) {
          objc_msgSend_addAttribute_value_range_(a1, v19, (uint64_t)v8, (uint64_t)v10, v22, v23);
        }
        else {
          objc_msgSend_removeAttribute_range_(a1, v19, (uint64_t)v8, v22, v23);
        }
      }
      unint64_t v16 = v23 + v22;
    }
    while (v16 < v17);
  }
}

void sub_1918A3B54(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  int v9 = objc_msgSend_length(a1, v5, v6, v7);
  if (v9)
  {
    unint64_t v10 = 0;
    do
    {
      uint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v12 = objc_msgSend_attribute_atIndex_effectiveRange_(a1, v8, (uint64_t)v4, v10, &v13);
      if (v12)
      {
        objc_msgSend_deleteCharactersInRange_(a1, v11, v13, v14);
        v9 -= v14;
      }
      else
      {
        unint64_t v10 = v14 + v13;
      }
    }
    while (v10 < v9);
  }
}

uint64_t sub_1918A3C04(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend___imArrayByApplyingBlock_(a1, a2, (uint64_t)&unk_1EE22F858, a4);
}

id sub_1918A3C10(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = (void *)MEMORY[0x192FDE5A0]();
  uint64_t v6 = objc_msgSend__stripPotentialTokenURIWithToken_(v2, v4, 0, v5);

  return v6;
}

id sub_1918A3C80(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (objc_msgSend_count(a1, a2, a3, a4))
  {
    id v4 = (void *)MEMORY[0x192FDE5A0]();
    uint64_t v5 = JWEncodeKeyedCodableObject(a1);
    uint64_t v6 = JWDecodeKeyedCodableObject(v5);

    return (id)v6;
  }
  else
  {
    return a1;
  }
}

uint64_t sub_1918A3D14(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_count(a1, v5, v6, v7);
  if (v8 == objc_msgSend_count(v4, v9, v10, v11))
  {
    id v12 = objc_alloc(MEMORY[0x1E4F28BD0]);
    uint64_t v15 = objc_msgSend_initWithArray_(v12, v13, (uint64_t)a1, v14);
    id v16 = objc_alloc(MEMORY[0x1E4F28BD0]);
    uint64_t v19 = objc_msgSend_initWithArray_(v16, v17, (uint64_t)v4, v18);
    uint64_t isEqual = objc_msgSend_isEqual_(v15, v20, (uint64_t)v19, v21);
  }
  else
  {
    uint64_t isEqual = 0;
  }

  return isEqual;
}

uint64_t sub_1918A3DB4(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  int v10 = objc_msgSend_count(a1, v7, v8, v9);
  if (v10 < 1)
  {
LABEL_8:
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v13 = 0;
    if (v10 <= 1uLL) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = v10;
    }
    while (1)
    {
      id v16 = objc_msgSend_objectAtIndex_(a1, v11, v13, v12);
      if (v16)
      {
        if (!objc_msgSend_performSelector_withObject_(v6, v15, a4, (uint64_t)v16)) {
          break;
        }
      }

      if (v14 == ++v13) {
        goto LABEL_8;
      }
    }
  }
  return v13;
}

BOOL sub_1918A3E60(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return a3 && objc_msgSend_indexOfObject_matchingComparison_(a1, a2, a3, a4) != 0x7FFFFFFFFFFFFFFFLL;
}

void sub_1918A3E94(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_count(a1, v5, v6, v7);
  if (v4 && v8)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1918A3F38;
    v11[3] = &unk_1E5722D20;
    id v12 = v4;
    objc_msgSend_enumerateObjectsUsingBlock_(a1, v9, (uint64_t)v11, v10);
  }
}

uint64_t sub_1918A3F38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_1918A3F48(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  int v40 = a3;
  uint64_t v6 = a4;
  uint64_t v10 = objc_msgSend_count(a1, v7, v8, v9);
  if (!v6 || !v40 || !v10)
  {
    if (objc_msgSend___imIsMutable(a1, v11, v12, v13)) {
      id v33 = (id)objc_msgSend_copy(a1, v30, v31, v32);
    }
    else {
      id v33 = a1;
    }
    uint64_t v34 = v33;
    goto LABEL_28;
  }
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v14 = a1;
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v41, (uint64_t)v45, 16);
  if (!v16)
  {

LABEL_24:
    if (objc_msgSend___imIsMutable(v14, v26, v27, v28, v39)) {
      id v29 = (id)objc_msgSend_copy(v14, v35, v36, v37);
    }
    else {
      id v29 = v14;
    }
    goto LABEL_27;
  }
  uint64_t v17 = v16;
  char v18 = 0;
  uint64_t v19 = *(void *)v42;
  do
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v42 != v19) {
        objc_enumerationMutation(v14);
      }
      uint64_t v21 = *(void **)(*((void *)&v41 + 1) + 8 * i);
      if (((unsigned int (**)(id, void *))v6)[2](v6, v21))
      {
        uint64_t v25 = ((void (**)(id, void *))v40)[2](v40, v21);
        if (v25)
        {
          objc_msgSend_addObject_(v39, v23, (uint64_t)v25, v24);
          v18 |= v25 != v21;
        }
        else
        {
          char v18 = 1;
        }
      }
      else
      {
        char v18 = 1;
      }
    }
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v22, (uint64_t)&v41, (uint64_t)v45, 16);
  }
  while (v17);

  if ((v18 & 1) == 0) {
    goto LABEL_24;
  }
  id v29 = v39;
LABEL_27:
  uint64_t v34 = v29;

LABEL_28:
  return v34;
}

id sub_1918A4168(void *a1, uint64_t a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = a3;
  if (v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = a1;
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v27, (uint64_t)v31, 16);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = sub_1918A4378;
          v25[3] = &unk_1E5722D48;
          id v26 = v9;
          v8[2](v8, v15, v25);
        }
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v27, (uint64_t)v31, 16);
      }
      while (v12);
    }

    uint64_t v20 = objc_msgSend_copy(v9, v17, v18, v19);
  }
  else
  {
    uint64_t v22 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6, v7);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, a2, (uint64_t)a1, @"IMFoundationUtil.m", 1599, @"Invalid parameter not satisfying: %@", @"map");

    uint64_t v20 = objc_opt_new();
  }

  return v20;
}

uint64_t sub_1918A4378(uint64_t result, const char *a2, uint64_t a3)
{
  if (a2)
  {
    if (a3) {
      return objc_msgSend_setObject_forKeyedSubscript_(*(void **)(result + 32), a2, a3, (uint64_t)a2);
    }
  }
  return result;
}

void sub_1918A4390(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_count(a1, v5, v6, v7);
  if (v4 && v8)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1918A4434;
    v11[3] = &unk_1E5722D70;
    id v12 = v4;
    objc_msgSend_enumerateObjectsUsingBlock_(a1, v9, (uint64_t)v11, v10);
  }
}

uint64_t sub_1918A4434(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_1918A4444(void *a1, uint64_t a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_count(a1, v5, v6, v7);
  if (v4 && v8)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = a1;
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v24, (uint64_t)v28, 16);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v13);
          }
          uint64_t v21 = v4[2](v4, *(void *)(*((void *)&v24 + 1) + 8 * i));
          if (v21) {
            objc_msgSend_addObject_(v12, v19, (uint64_t)v21, v20, (void)v24);
          }
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v22, (uint64_t)&v24, (uint64_t)v28, 16);
      }
      while (v16);
    }
  }
  else
  {
    objc_msgSend_set(MEMORY[0x1E4F1CAD0], v9, v10, v11);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

id sub_1918A45C0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (objc_msgSend_count(a1, a2, a3, a4))
  {
    id v4 = (void *)MEMORY[0x192FDE5A0]();
    uint64_t v5 = JWEncodeKeyedCodableObject(a1);
    uint64_t v6 = JWDecodeKeyedCodableObject(v5);

    return (id)v6;
  }
  else
  {
    return a1;
  }
}

CFMutableSetRef sub_1918A4654()
{
  long long v0 = *(_OWORD *)(MEMORY[0x1E4F1D548] + 16);
  *(_OWORD *)&v3.version = *MEMORY[0x1E4F1D548];
  *(_OWORD *)&v3.release = v0;
  *(_OWORD *)&v3.equal = *(_OWORD *)(MEMORY[0x1E4F1D548] + 32);
  v3.retain = 0;
  v3.release = 0;
  CFMutableSetRef v1 = CFSetCreateMutable(0, 0, &v3);
  return v1;
}

void sub_1918A46AC(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend___imFirstObject(a1, a2, a3, a4);
  if (v5)
  {
    id v8 = v5;
    objc_msgSend_removeObjectAtIndex_(a1, v6, 0, v7);
    uint64_t v5 = v8;
  }
}

unint64_t sub_1918A4704(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  unint64_t result = objc_msgSend_count(a1, a2, a3, a4);
  if (result >= 2)
  {
    unint64_t v6 = result;
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint32_t v8 = arc4random_uniform(v6);
      unint64_t result = objc_msgSend_exchangeObjectAtIndex_withObjectAtIndex_(a1, v9, i, v8);
    }
  }
  return result;
}

CFMutableArrayRef sub_1918A4764()
{
  long long v0 = *(_OWORD *)(MEMORY[0x1E4F1D510] + 16);
  *(_OWORD *)&v2.version = *MEMORY[0x1E4F1D510];
  *(_OWORD *)&v2.release = v0;
  v2.equal = *(CFArrayEqualCallBack *)(MEMORY[0x1E4F1D510] + 32);
  v2.retain = 0;
  v2.release = 0;
  return CFArrayCreateMutable(0, 0, &v2);
}

CFMutableArrayRef sub_1918A47AC()
{
  long long v0 = *(_OWORD *)(MEMORY[0x1E4F1D510] + 16);
  *(_OWORD *)&v3.version = *MEMORY[0x1E4F1D510];
  *(_OWORD *)&v3.release = v0;
  v3.equal = *(CFArrayEqualCallBack *)(MEMORY[0x1E4F1D510] + 32);
  v3.retain = 0;
  v3.release = 0;
  CFMutableArrayRef v1 = CFArrayCreateMutable(0, 0, &v3);
  return v1;
}

uint64_t sub_1918A4804(uint64_t a1)
{
  if (_CFDictionaryIsMutable()) {
    return 1;
  }
  uint64_t v3 = objc_opt_class();
  return MEMORY[0x1F4181798](a1, sel_isMemberOfClass_, v3, v4);
}

id sub_1918A4860(void *a1, uint64_t a2, void *a3)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v6 = a1;
  id v7 = v4;
  id v8 = v5;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v12 = objc_msgSend_allKeys(v6, v9, v10, v11, 0);
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v57, (uint64_t)v61, 16);
  if (v14)
  {
    uint64_t v17 = v14;
    uint64_t v18 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v58 != v18) {
          objc_enumerationMutation(v12);
        }
        uint64_t v20 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        uint64_t v21 = objc_msgSend_objectForKey_(v6, v15, v20, v16);
        uint64_t v24 = objc_msgSend_objectForKey_(v7, v22, v20, v23);
        long long v28 = (void *)v24;
        if (v21 != (void *)v24)
        {
          BOOL v29 = !v21 || v24 == 0;
          if (v29
            || (objc_msgSend_isNull(v21, v25, v26, v27) & 1) != 0
            || (objc_msgSend_isNull(v28, v25, v30, v27) & 1) != 0
            || (objc_msgSend_isEqual_(v21, v25, (uint64_t)v28, v27) & 1) == 0)
          {
            objc_msgSend_addObject_(v8, v25, v20, v27);
          }
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v57, (uint64_t)v61, 16);
    }
    while (v17);
  }

  id v31 = v7;
  id v32 = v6;
  id v33 = v8;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v37 = objc_msgSend_allKeys(v31, v34, v35, v36, 0);
  uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v57, (uint64_t)v61, 16);
  if (v39)
  {
    uint64_t v42 = v39;
    uint64_t v43 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v58 != v43) {
          objc_enumerationMutation(v37);
        }
        uint64_t v45 = *(void *)(*((void *)&v57 + 1) + 8 * j);
        uint64_t v46 = objc_msgSend_objectForKey_(v31, v40, v45, v41);
        uint64_t v49 = objc_msgSend_objectForKey_(v32, v47, v45, v48);
        uint64_t v53 = (void *)v49;
        if (v46 != (void *)v49)
        {
          BOOL v54 = !v46 || v49 == 0;
          if (v54
            || (objc_msgSend_isNull(v46, v50, v51, v52) & 1) != 0
            || (objc_msgSend_isNull(v53, v50, v55, v52) & 1) != 0
            || (objc_msgSend_isEqual_(v46, v50, (uint64_t)v53, v52) & 1) == 0)
          {
            objc_msgSend_addObject_(v33, v50, v45, v52);
          }
        }
      }
      uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v40, (uint64_t)&v57, (uint64_t)v61, 16);
    }
    while (v42);
  }

  return v33;
}

id sub_1918A4B54(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E4F28F98], v3, (uint64_t)v4, 0, 0, 0);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t sub_1918A4C0C(uint64_t a1, const char *a2)
{
  return objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E4F28F98], a2, a1, 200, 0, 0);
}

id sub_1918A4C28(void *a1, uint64_t a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v9 = objc_msgSend_count(a1, v6, v7, v8);
  id v12 = objc_msgSend_dictionaryWithCapacity_(v5, v10, v9, v11);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v16 = objc_msgSend_allKeys(v4, v13, v14, v15, 0);
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v35, (uint64_t)v39, 16);
  if (v18)
  {
    uint64_t v21 = v18;
    uint64_t v22 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v36 != v22) {
          objc_enumerationMutation(v16);
        }
        uint64_t v24 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        long long v25 = objc_msgSend_objectForKey_(a1, v19, v24, v20);
        uint64_t v28 = objc_msgSend_objectForKey_(v4, v26, v24, v27);
        id v31 = (void *)v28;
        if (v25) {
          BOOL v32 = 1;
        }
        else {
          BOOL v32 = v28 == 0;
        }
        if (!v32 || (v25 ? (BOOL v33 = v28 == 0) : (BOOL v33 = 1), !v33 && (objc_msgSend_isEqual_(v25, v29, v28, v30) & 1) == 0)) {
          objc_msgSend_setObject_forKey_(v12, v29, (uint64_t)v31, v24);
        }
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v35, (uint64_t)v39, 16);
    }
    while (v21);
  }

  return v12;
}

id sub_1918A4DD4(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (objc_msgSend_count(a1, a2, a3, a4))
  {
    id v4 = (void *)MEMORY[0x192FDE5A0]();
    id v5 = JWEncodeKeyedCodableObject(a1);
    uint64_t v6 = JWDecodeKeyedCodableObject(v5);

    return (id)v6;
  }
  else
  {
    return a1;
  }
}

id sub_1918A4E68(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v11 = objc_msgSend_count(v5, v8, v9, v10);
  uint64_t v14 = objc_msgSend_initWithCapacity_(v7, v12, v11, v13);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v5;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v23, (uint64_t)v27, 16);
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend_setObject_forKey_(v14, v18, (uint64_t)v6, *(void *)(*((void *)&v23 + 1) + 8 * i), (void)v23);
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v23, (uint64_t)v27, 16);
    }
    while (v19);
  }

  return v14;
}

id sub_1918A4FB8(void *a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = a1;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v6);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v15 = objc_msgSend_objectForKey_(v6, v9, v14, v10, (void)v18);
        if (v4[2](v4, v14, v15)) {
          objc_msgSend_setObject_forKeyedSubscript_(v5, v16, (uint64_t)v15, v14);
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v18, (uint64_t)v22, 16);
    }
    while (v11);
  }

  return v5;
}

uint64_t sub_1918A5124(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  unsigned int v5 = objc_msgSend_length(a1, a2, a3, a4);
  id v6 = a1;
  uint64_t v11 = objc_msgSend_bytes(v6, v7, v8, v9);
  return objc_msgSend___imHexStringOfBytes_withLength_(v6, v10, v11, v5);
}

id sub_1918A5178(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  unsigned int v7 = objc_msgSend_length(v3, v4, v5, v6);
  objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v8, (v7 + 1) >> 1, v9);
  id v10 = objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_mutableBytes(v10, v11, v12, v13);
  uint64_t v17 = v7;
  if (v7)
  {
    uint64_t v18 = v14;
    uint64_t v19 = 0;
    char v20 = 0;
    char v21 = 0;
    unsigned int v22 = 0;
    do
    {
      int v23 = objc_msgSend_characterAtIndex_(v3, v15, v19, v16);
      __int16 v24 = v23 - 48;
      if (v23 - 48) <= 0x36 && ((0x7E0000007E03FFuLL >> v24))
      {
        ++v21;
        char v20 = v23 + word_1918E7766[v24] + 16 * v20;
        if ((v21 & 1) == 0)
        {
          *(unsigned char *)(v18 + v22++) = v20;
          char v20 = 0;
        }
      }
      ++v19;
    }
    while (v17 != v19);
    if (v21) {
      *(unsigned char *)(v18 + v22++) = v20;
    }
  }
  else
  {
    unsigned int v22 = 0;
  }
  objc_msgSend_setLength_(v10, v15, v22, v16);

  return v10;
}

id sub_1918A52A0(uint64_t a1, uint64_t a2, size_t a3)
{
  id v4 = objc_alloc(MEMORY[0x1E4F1CA58]);
  id v7 = objc_msgSend_initWithLength_(v4, v5, a3, v6);
  uint64_t v11 = objc_msgSend_mutableBytes(v7, v8, v9, v10);
  arc4random_buf(v11, a3);
  return v7;
}

uint64_t SecureRandomBytes(void *a1, size_t a2)
{
  return 1;
}

id sub_1918A5318(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if ((unint64_t)objc_msgSend_length(a1, a2, a3, a4) > 0xC800000)
  {
    id v8 = 0;
    goto LABEL_20;
  }
  if (!objc_msgSend_length(a1, v5, v6, v7))
  {
    id v8 = a1;
    goto LABEL_20;
  }
  int v12 = objc_msgSend_length(a1, v9, v10, v11);
  int v16 = objc_msgSend_length(a1, v13, v14, v15);
  if (v16 >= 0) {
    int v19 = v16;
  }
  else {
    int v19 = v16 + 1;
  }
  char v20 = objc_msgSend_dataWithLength_(MEMORY[0x1E4F1CA58], v17, (v12 + (v19 >> 1)), v18);
  if (!v20) {
    goto LABEL_18;
  }
  *(void *)&long long v21 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v52.data_type = v21;
  *(_OWORD *)&v52.zfree = v21;
  *(_OWORD *)&v52.state = v21;
  *(_OWORD *)&v52.uLong total_out = v21;
  *(_OWORD *)&v52.next_out = v21;
  *(_OWORD *)&v52.avail_in = v21;
  id v22 = a1;
  uint64_t v26 = objc_msgSend_bytes(v22, v23, v24, v25);
  v52.avail_in = objc_msgSend_length(v22, v27, v28, v29, v26, *(_OWORD *)&v52.avail_in, *(_OWORD *)&v52.next_out, *(_OWORD *)&v52.total_out, *(_OWORD *)&v52.state, *(_OWORD *)&v52.zfree, *(_OWORD *)&v52.data_type, 0xAAAAAAAAAAAAAAAALL);
  v52.zalloc = 0;
  v52.zfree = 0;
  v52.uLong total_out = 0;
  id v8 = 0;
  if (!inflateInit2_(&v52, 47, "1.2.12", 112))
  {
    uint64_t v33 = (v19 >> 1);
    do
    {
      uLong total_out = v52.total_out;
      if (total_out >= objc_msgSend_length(v20, v30, v31, v32)) {
        objc_msgSend_increaseLengthBy_(v20, v35, v33, v36);
      }
      id v37 = v20;
      uint64_t v41 = objc_msgSend_mutableBytes(v37, v38, v39, v40);
      v52.next_out = (Bytef *)(v41 + v52.total_out);
      int v45 = objc_msgSend_length(v37, v42, v43, v44);
      v52.avail_out = v45 - LODWORD(v52.total_out);
      int v46 = inflate(&v52, 2);
    }
    while (!v46);
    if (v46 == 1)
    {
      if (!inflateEnd(&v52))
      {
        objc_msgSend_setLength_(v37, v47, v52.total_out, v48);
        objc_msgSend_dataWithData_(MEMORY[0x1E4F1C9B8], v49, (uint64_t)v37, v50);
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
    }
    else
    {
      inflateEnd(&v52);
    }
LABEL_18:
    id v8 = 0;
  }
LABEL_19:

LABEL_20:
  return v8;
}

id sub_1918A54E0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend__FTDecompressData(a1, a2, a3, a4);
  uint64_t v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (void *)v5;
  }
  else {
    uint64_t v7 = a1;
  }
  id v8 = v7;

  return v8;
}

id im_temporary_directory()
{
  unsigned __int8 v0 = atomic_load(byte_1E92DB0B0);
  if ((v0 & 1) == 0) {
    atomic_store(1u, byte_1E92DB0B0);
  }
  if (qword_1E92DB3F0)
  {
    id v1 = (id)qword_1E92DB3F0;
  }
  else
  {
    NSTemporaryDirectory();
    id v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

uint64_t im_set_temporary_directory(void *a1)
{
  id v1 = a1;
  unsigned __int8 v2 = atomic_load(byte_1E92DB0B0);
  if (v2) {
    abort();
  }
  qword_1E92DB3F0 = (uint64_t)v1;
  return MEMORY[0x1F41817F8]();
}

id sub_1918A55D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  if (!v10)
  {
    _IMWarn(@"Empty URL passed in for link generation", (uint64_t)v3, v4, v5, v6, v7, v8, v9, v46);
    id v22 = 0;
    goto LABEL_19;
  }
  uint64_t v11 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v3, v4, v5);
  uint64_t v15 = objc_msgSend_lastPathComponent(v10, v12, v13, v14);
  uint64_t v18 = objc_msgSend__randomTemporaryPathWithFileName_(v11, v16, (uint64_t)v15, v17);

  if (v18)
  {
    long long v21 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v19, (uint64_t)v18, v20);
  }
  else
  {
    long long v21 = 0;
  }
  if (_IMWillLog(@"IMFoundation")) {
    _IMAlwaysLog(0, @"IMFoundation", @"Attempting to link URL %@ to new URL %@", v25, v26, v27, v28, v29, (char)v10);
  }
  if (v21)
  {
    uint64_t v30 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v23, v24, v25);
    id v48 = 0;
    char v32 = objc_msgSend_linkItemAtURL_toURL_error_(v30, v31, (uint64_t)v10, (uint64_t)v21, &v48);
    id v33 = v48;

    if (v32) {
      goto LABEL_16;
    }
  }
  else
  {
    id v33 = 0;
  }
  if (_IMWillLog(@"IMFoundation")) {
    _IMAlwaysLog(0, @"IMFoundation", @"  => First link attempt failed, I'll trying copying (%@)", v36, v37, v38, v39, v40, (char)v33);
  }
  if (!v21) {
    goto LABEL_17;
  }
  uint64_t v41 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v34, v35, v36);
  id v47 = v33;
  char v43 = objc_msgSend_copyItemAtURL_toURL_error_(v41, v42, (uint64_t)v10, (uint64_t)v21, &v47);
  id v44 = v47;

  id v33 = v44;
  if ((v43 & 1) == 0)
  {
LABEL_17:
    _IMWarn(@"Linking failed with error %@", (uint64_t)v34, v35, v36, v37, v38, v39, v40, (char)v33);
    id v22 = 0;
    goto LABEL_18;
  }
LABEL_16:
  id v22 = v21;
LABEL_18:

LABEL_19:
  return v22;
}

uint64_t sub_1918A57C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4181798](a1, sel__randomTemporaryPathWithSuffix_fileName_, a3, 0);
}

uint64_t sub_1918A57C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4181798](a1, sel__randomTemporaryPathWithSuffix_fileName_withAppendedPathComponent_, a3, 0);
}

id sub_1918A57D4(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v10 = a4;
  if (v10)
  {
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  objc_msgSend_stringGUID(NSString, v7, v8, v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
LABEL_3:
    uint64_t v11 = objc_msgSend_stringByAppendingPathExtension_(v10, v7, (uint64_t)v6, v9);

    id v10 = (id)v11;
  }
LABEL_4:
  int v12 = objc_msgSend__randomTemporaryPathWithFileName_(a1, v7, (uint64_t)v10, v9);

  return v12;
}

id sub_1918A5880(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8 = a3;
  id v9 = a4;
  id v13 = a5;
  if (v9)
  {
    if (!v8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  objc_msgSend_stringGUID(NSString, v10, v11, v12);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
LABEL_3:
    uint64_t v14 = objc_msgSend_stringByAppendingPathExtension_(v9, v10, (uint64_t)v8, v12);

    id v9 = (id)v14;
  }
LABEL_4:
  uint64_t v15 = objc_msgSend__randomTemporaryPathWithFileName_withAppendedPathComponent_(a1, v10, (uint64_t)v9, (uint64_t)v13);

  return v15;
}

id sub_1918A5948(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = NSString;
  id v5 = a3;
  id v9 = objc_msgSend_stringGUID(v4, v6, v7, v8);
  id v10 = im_temporary_directory();
  uint64_t v12 = objc_msgSend_createUniqueDirectoryWithName_atPath_ofType_(a1, v11, (uint64_t)v9, (uint64_t)v10, 0);

  int v16 = objc_msgSend_lastPathComponent(v5, v13, v14, v15);
  uint64_t v20 = objc_msgSend_stringByDeletingPathExtension(v16, v17, v18, v19);
  uint64_t v24 = objc_msgSend_pathExtension(v5, v21, v22, v23);

  uint64_t v26 = objc_msgSend_uniqueFilename_atPath_ofType_(a1, v25, (uint64_t)v20, (uint64_t)v12, v24);

  return v26;
}

id sub_1918A5A38(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = im_temporary_directory();
  uint64_t v11 = objc_msgSend_stringByAppendingPathComponent_(v8, v9, (uint64_t)v6, v10);

  uint64_t v15 = objc_msgSend_stringGUID(NSString, v12, v13, v14);
  uint64_t v17 = objc_msgSend_createUniqueDirectoryWithName_atPath_ofType_(a1, v16, (uint64_t)v15, (uint64_t)v11, 0);

  long long v21 = objc_msgSend_lastPathComponent(v7, v18, v19, v20);
  uint64_t v25 = objc_msgSend_stringByDeletingPathExtension(v21, v22, v23, v24);
  uint64_t v29 = objc_msgSend_pathExtension(v7, v26, v27, v28);

  uint64_t v31 = objc_msgSend_uniqueFilename_atPath_ofType_(a1, v30, (uint64_t)v25, (uint64_t)v17, v29);

  return v31;
}

id sub_1918A5B50(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = NSString;
  id v5 = a3;
  id v9 = objc_msgSend_stringGUID(v4, v6, v7, v8);
  uint64_t v13 = objc_msgSend_stringByDeletingLastPathComponent(v5, v10, v11, v12);
  uint64_t v17 = objc_msgSend_pathExtension(v5, v14, v15, v16);

  uint64_t v19 = objc_msgSend_uniqueFilename_atPath_ofType_(a1, v18, (uint64_t)v9, (uint64_t)v13, v17);

  return v19;
}

uint64_t sub_1918A5C00(uint64_t a1, const char *a2, void *a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_stringByResolvingAndStandardizingPath(a3, a2, (uint64_t)a3, a4);
  uint64_t v8 = objc_msgSend_pathComponents(v4, v5, v6, v7);
  if (!objc_msgSend_hasPrefix_(v4, v9, @"/Volumes", v10)) {
    goto LABEL_4;
  }
  if ((unint64_t)objc_msgSend_count(v8, v11, v12, v13) < 3) {
    goto LABEL_4;
  }
  uint64_t v16 = objc_msgSend_objectAtIndex_(v8, v14, 2, v15);
  uint64_t v19 = objc_msgSend_stringByAppendingPathComponent_(@"/Volumes", v17, (uint64_t)v16, v18);

  uint64_t v23 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v20, v21, v22);
  int v26 = objc_msgSend_fileExistsAtPath_(v23, v24, (uint64_t)v19, v25);

  if (!v26) {
    uint64_t v27 = 1;
  }
  else {
LABEL_4:
  }
    uint64_t v27 = 0;

  return v27;
}

uint64_t sub_1918A5CE0(void *a1, const char *a2, void *a3, uint64_t a4)
{
  unsigned int v4 = a4;
  uint64_t v6 = objc_msgSend_stringByResolvingAndStandardizingPath(a3, a2, (uint64_t)a3, a4);
  if (objc_msgSend__isPathOnMissingVolume_(a1, v7, (uint64_t)v6, v8))
  {
    uint64_t DirectoryAtPath_withIntermediateDirectories_attributes_error = 0;
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v13 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v11, v4, v12);
    uint64_t v16 = objc_msgSend_initWithObjectsAndKeys_(v10, v14, (uint64_t)v13, v15, *MEMORY[0x1E4F28330], 0);

    uint64_t DirectoryAtPath_withIntermediateDirectories_attributes_error = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(a1, v17, (uint64_t)v6, 1, v16, 0);
  }

  return DirectoryAtPath_withIntermediateDirectories_attributes_error;
}

id sub_1918A5DB0(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v13 = objc_msgSend_lastPathComponent(a3, v10, v11, v12);
  uint64_t v16 = objc_msgSend_stringByAppendingPathComponent_(v8, v14, (uint64_t)v13, v15);
  uint64_t v20 = objc_msgSend_stringByResolvingAndStandardizingPath(v16, v17, v18, v19);

  if (!objc_msgSend_length(v9, v21, v22, v23))
  {

    id v9 = 0;
  }
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  while (1)
  {
    int v26 = v24;
    uint64_t v24 = sub_1918A5EDC(v20, v25, v9);

    if (v25 == 9999) {
      break;
    }
    uint64_t v25 = (v25 + 1);
    if ((objc_msgSend_fileExistsAtPath_(a1, v27, (uint64_t)v24, v29) & 1) == 0)
    {
      id v30 = v24;
      goto LABEL_8;
    }
  }
  objc_msgSend_stringGUID(NSString, v27, v28, v29);
  id v30 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  uint64_t v31 = v30;

  return v31;
}

id sub_1918A5EDC(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v8 = a3;
  if ((int)a2 <= 0)
  {
    id v16 = v5;
  }
  else
  {
    id v9 = NSString;
    id v10 = (void *)MEMORY[0x1E4F28EE0];
    uint64_t v11 = objc_msgSend_numberWithInt_(NSNumber, v6, a2, v7);
    uint64_t v13 = objc_msgSend_localizedStringFromNumber_numberStyle_(v10, v12, (uint64_t)v11, 1);
    objc_msgSend_stringWithFormat_(v9, v14, @"%@-%@", v15, v5, v13);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend_length(v8, v17, v18, v19))
  {
    uint64_t v22 = objc_msgSend_stringByAppendingPathExtension_(v16, v20, (uint64_t)v8, v21);

    id v16 = (id)v22;
  }

  return v16;
}

id sub_1918A5FE4(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v13 = objc_msgSend_lastPathComponent(a3, v10, v11, v12);
  id v16 = objc_msgSend_stringByAppendingPathComponent_(v8, v14, (uint64_t)v13, v15);
  uint64_t v20 = objc_msgSend_stringByResolvingAndStandardizingPath(v16, v17, v18, v19);

  if (objc_msgSend__isPathOnMissingVolume_(a1, v21, (uint64_t)v20, v22))
  {
    id v23 = 0;
  }
  else
  {
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    while (1)
    {
      int v26 = v24;
      uint64_t v24 = sub_1918A5EDC(v20, v25, v9);

      id v36 = 0;
      char v28 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(a1, v27, (uint64_t)v24, 1, 0, &v36);
      id v29 = v36;
      char v32 = v29;
      int v33 = 0;
      if ((v28 & 1) == 0 && v29) {
        int v33 = objc_msgSend_fileExistsAtPath_(a1, v30, (uint64_t)v24, v31);
      }
      int v34 = v32 ? v33 : 1;

      id v23 = 0;
      if (v34 != 1 || v25 == 99) {
        break;
      }
      uint64_t v25 = (v25 + 1);
      if ((v33 & 1) == 0)
      {
        id v23 = v24;
        break;
      }
    }
  }
  return v23;
}

uint64_t sub_1918A6158(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, int a7)
{
  id v11 = a4;
  uint64_t v15 = objc_msgSend_stringByResolvingAndStandardizingPath(a3, v12, v13, v14);
  uint64_t v19 = objc_msgSend_stringByResolvingAndStandardizingPath(v11, v16, v17, v18);

  id v23 = objc_msgSend_pathExtension(v19, v20, v21, v22);
  uint64_t v27 = objc_msgSend_stringByDeletingPathExtension(v19, v24, v25, v26);
  char v28 = 0;
  uint64_t v29 = 0;
  while (1)
  {
    id v30 = v28;
    char v28 = sub_1918A5EDC(v27, v29, v23);

    if (!a7) {
      break;
    }
    if (objc_msgSend_copyItemAtPath_toPath_error_(a1, v31, (uint64_t)v15, (uint64_t)v28, a6)) {
      goto LABEL_11;
    }
LABEL_6:
    uint64_t v34 = 0;
    if (objc_msgSend_fileExistsAtPath_(a1, v32, (uint64_t)v28, v33))
    {
      BOOL v35 = v29 >= 0x63;
      uint64_t v29 = (v29 + 1);
      if (!v35) {
        continue;
      }
    }
    goto LABEL_14;
  }
  if (!objc_msgSend_moveItemAtPath_toPath_error_(a1, v31, (uint64_t)v15, (uint64_t)v28, a6)) {
    goto LABEL_6;
  }
  objc_msgSend_removeItemAtPath_error_(a1, v32, (uint64_t)v15, a6);
LABEL_11:
  if (a5) {
    *a5 = v28;
  }
  uint64_t v34 = 1;
LABEL_14:

  return v34;
}

uint64_t sub_1918A62B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F4181798](a1, sel__moveItemAtPath_toPath_uniquePath_error_asCopy_, a3, a4);
}

uint64_t sub_1918A62BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F4181798](a1, sel__moveItemAtPath_toPath_uniquePath_error_asCopy_, a3, a4);
}

id IMTemporaryPath()
{
  unsigned __int8 v0 = im_temporary_directory();
  id v3 = objc_msgSend_stringByAppendingPathComponent_(v0, v1, @"FaceTime", v2);

  uint64_t v7 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v4, v5, v6);
  char v10 = objc_msgSend_fileExistsAtPath_(v7, v8, (uint64_t)v3, v9);

  if ((v10 & 1) == 0)
  {
    uint64_t v14 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v11, v12, v13);
    objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v14, v15, (uint64_t)v3, 1, 0, 0);
  }
  return v3;
}

id TemporaryTransfersPath()
{
  unsigned __int8 v0 = IMTemporaryPath();
  id v3 = objc_msgSend_stringByAppendingPathComponent_(v0, v1, @"Transfers", v2);

  uint64_t v7 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v4, v5, v6);
  char v10 = objc_msgSend_fileExistsAtPath_(v7, v8, (uint64_t)v3, v9);

  if ((v10 & 1) == 0)
  {
    uint64_t v14 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v11, v12, v13);
    objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v14, v15, (uint64_t)v3, 1, 0, 0);
  }
  return v3;
}

id TemporaryImagePath()
{
  unsigned __int8 v0 = IMTemporaryPath();
  id v3 = objc_msgSend_stringByAppendingPathComponent_(v0, v1, @"Images", v2);

  uint64_t v7 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v4, v5, v6);
  char v10 = objc_msgSend_fileExistsAtPath_(v7, v8, (uint64_t)v3, v9);

  if ((v10 & 1) == 0)
  {
    uint64_t v14 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v11, v12, v13);
    objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v14, v15, (uint64_t)v3, 1, 0, 0);
  }
  return v3;
}

id IMGetInlineImagePath(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = TemporaryImagePath();
  id v8 = objc_msgSend_stringByAppendingPathComponent_((void *)v5, v6, (uint64_t)v4, v7);

  uint64_t v12 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v9, v10, v11);
  LOBYTE(v5) = objc_msgSend_fileExistsAtPath_(v12, v13, (uint64_t)v8, v14);

  if ((v5 & 1) == 0)
  {
    uint64_t v18 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v15, v16, v17);
    objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v18, v19, (uint64_t)v8, 1, 0, 0);
  }
  uint64_t v20 = objc_msgSend_lastPathComponent(v3, v15, v16, v17);
  id v23 = objc_msgSend_stringByAppendingPathComponent_(v8, v21, (uint64_t)v20, v22);

  return v23;
}

id IMInlineImageURL(void *a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CB10];
  id v4 = a2;
  id v5 = a1;
  id v6 = [v3 alloc];
  uint64_t v7 = IMGetInlineImagePath(v5, v4);

  inited = objc_msgSend_initFileURLWithPath_(v6, v8, (uint64_t)v7, v9);
  return inited;
}

void sub_1918A6654()
{
  unsigned int v0 = time(0);
  srandom(v0);
}

uint64_t GetTimeoutDefault(void *a1)
{
  LODWORD(result) = IMGetAppIntForKey(a1);
  if ((int)result < 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return result;
  }
}

id ExtractURLQueries(void *a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  uint64_t v7 = objc_msgSend_rangeOfString_(v3, v5, @"?", v6);
  if (v8)
  {
    uint64_t v10 = v7;
    objc_msgSend_substringToIndex_(v3, v8, v7, v9);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = objc_msgSend_substringFromIndex_(v3, v12, v10 + 1, v13);

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v17 = objc_msgSend_componentsSeparatedByString_(v14, v15, @"&", v16);
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v50, (uint64_t)v54, 16);
    if (v19)
    {
      uint64_t v20 = v19;
      id v48 = v14;
      id v49 = v11;
      id v21 = 0;
      uint64_t v22 = *(void *)v51;
      do
      {
        uint64_t v23 = 0;
        uint64_t v24 = v21;
        do
        {
          if (*(void *)v51 != v22) {
            objc_enumerationMutation(v17);
          }
          id v21 = *(id *)(*((void *)&v50 + 1) + 8 * v23);

          uint64_t v27 = objc_msgSend_rangeOfString_(v21, v25, @"=", v26);
          if (v28)
          {
            uint64_t v30 = v27;
            uint64_t v31 = objc_msgSend_substringToIndex_(v21, v28, v27, v29);
            BOOL v35 = objc_msgSend_lowercaseString(v31, v32, v33, v34);

            objc_msgSend_substringFromIndex_(v21, v36, v30 + 1, v37);
            uint64_t v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_length(v35, v39, v40, v41) && objc_msgSend_length(v38, v42, v43, v44))
            {
              CFStringRef v45 = CFURLCreateStringByReplacingPercentEscapes(0, v38, &stru_1EE231AD8);

              objc_msgSend_setObject_forKey_(v4, v46, (uint64_t)v45, (uint64_t)v35);
              uint64_t v38 = (__CFString *)v45;
            }
          }
          ++v23;
          uint64_t v24 = v21;
        }
        while (v20 != v23);
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v28, (uint64_t)&v50, (uint64_t)v54, 16);
      }
      while (v20);

      uint64_t v14 = v48;
      id v11 = v49;
    }
  }
  else
  {
    id v11 = v3;
    uint64_t v14 = v11;
  }

  return v11;
}

void _FezStartTime()
{
  double Current = CFAbsoluteTimeGetCurrent();
  int v1 = dword_1E92DB9C0;
  if (dword_1E92DB9C0 <= 99) {
    dbl_1E92DB9C8[dword_1E92DB9C0] = Current;
  }
  dword_1E92DB9C0 = v1 + 1;
}

double _FezLogElapsedTimeWithTag(uint64_t a1, _DWORD *a2, double *a3)
{
  double Current = CFAbsoluteTimeGetCurrent();
  int v13 = dword_1E92DB9C0;
  int v14 = --dword_1E92DB9C0;
  if (v13 <= 100)
  {
    double v15 = dbl_1E92DB9C8[v14];
    if (a2)
    {
      ++*a2;
      *a3 = Current - v15 + *a3;
      if (dword_1E92DB9C0 <= 100) {
        _IMLog(@"   | %.*s[%s: \"%s\": %6.6f]", v5, v6, v7, v8, v9, v10, v11, dword_1E92DB9C0);
      }
      _IMLog(@"   | %.*s         ['%s' called %u times, cumulative time %6.6f]", v5, v6, v7, v8, v9, v10, v11, dword_1E92DB9C0);
    }
    else
    {
      _IMLog(@"   | %.*s[%s: \"%s\": %6.6f]", v5, v6, v7, v8, v9, v10, v11, v14);
    }
  }
  return Current;
}

id IMPathsForPlugInsWithExtension(void *a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v6 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v3, v4, v5);
  uint64_t v10 = objc_msgSend_builtInPlugInsPath(v6, v7, v8, v9);
  int v14 = objc_msgSend_stringByStandardizingPath(@"/System/Library/Messages/PlugIns", v11, v12, v13);
  uint64_t v17 = objc_msgSend_arrayWithObjects_(v2, v15, (uint64_t)v10, v16, v14, 0);

  id v21 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v18, v19, v20);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = v17;
  uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v57, (uint64_t)v62, 16);
  if (v51)
  {
    uint64_t v50 = *(void *)v58;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v58 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v52 = v26;
        uint64_t v27 = *(void **)(*((void *)&v57 + 1) + 8 * v26);
        char v28 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v23, v24, v25);
        uint64_t v30 = objc_msgSend_contentsOfDirectoryAtPath_error_(v28, v29, (uint64_t)v27, 0);

        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v31 = v30;
        uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v53, (uint64_t)v61, 16);
        if (v33)
        {
          uint64_t v37 = v33;
          uint64_t v38 = *(void *)v54;
          do
          {
            for (uint64_t i = 0; i != v37; ++i)
            {
              if (*(void *)v54 != v38) {
                objc_enumerationMutation(v31);
              }
              uint64_t v40 = *(void **)(*((void *)&v53 + 1) + 8 * i);
              uint64_t v41 = objc_msgSend_pathExtension(v40, v34, v35, v36);
              uint64_t v44 = objc_msgSend_caseInsensitiveCompare_(v41, v42, (uint64_t)v1, v43);

              if (!v44)
              {
                CFStringRef v45 = objc_msgSend_stringByAppendingPathComponent_(v27, v34, (uint64_t)v40, v36);
                objc_msgSend_addObject_(v21, v46, (uint64_t)v45, v47);
              }
            }
            uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v53, (uint64_t)v61, 16);
          }
          while (v37);
        }

        uint64_t v26 = v52 + 1;
      }
      while (v52 + 1 != v51);
      uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v57, (uint64_t)v62, 16);
    }
    while (v51);
  }

  return v21;
}

uint64_t IMGetMainBundle(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], a2, a3, a4);
}

BOOL _IMRunningInDaemon()
{
  if (qword_1E92DB3F8 != -1) {
    dispatch_once(&qword_1E92DB3F8, &unk_1EE22F898);
  }
  return dword_1E92DA410 != 0;
}

void sub_1918A6D64()
{
  IMGetMainBundleIdentifier();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  dword_1E92DA410 = objc_msgSend_isEqualToString_(v2, v0, @"com.apple.imagent", v1);
}

id _IMFrameworkBundle()
{
  if (qword_1E92DB408 != -1) {
    dispatch_once(&qword_1E92DB408, &unk_1EE22F8B8);
  }
  unsigned int v0 = (void *)qword_1E92DB400;
  return v0;
}

uint64_t sub_1918A6E0C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  qword_1E92DB400 = objc_msgSend_bundleWithPath_(MEMORY[0x1E4F28B50], a2, @"/System/Library/PrivateFrameworks/IMCore.framework", a4);
  return MEMORY[0x1F41817F8]();
}

double _IMGetTimeoutDefault(void *a1, double a2)
{
  id v3 = a1;
  uint64_t v11 = IMCopyAppValueForKey(v3);
  double v12 = a2;
  if (v11)
  {
    double v12 = a2;
    if (objc_opt_respondsToSelector())
    {
      objc_msgSend_doubleValue(v11, v4, v5, v6);
      double v12 = v13;
    }
  }
  if (v12 != a2) {
    _IMLog(@"WARNING: Timeout %@ is %g, connections may not behave as expected (default: %g)", (uint64_t)v4, v5, v6, v7, v8, v9, v10, (char)v3);
  }
  if (v12 >= 0.0) {
    double v14 = v12;
  }
  else {
    double v14 = INFINITY;
  }

  return v14;
}

uint64_t IMCopyURLEscapedString(void *a1)
{
  id v1 = a1;
  uint64_t v5 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x1E4F28B88], v2, v3, v4);
  uint64_t v9 = objc_msgSend_mutableCopy(v5, v6, v7, v8);

  objc_msgSend_removeCharactersInString_(v9, v10, @":/?#[]@!$&‚Äö√Ñ√¥()*+,;=", v11);
  if (v1 && objc_msgSend_length(v1, v12, v13, v14))
  {
    uint64_t v17 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v1, v15, (uint64_t)v9, v16);
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

uint64_t _IMDaemonIsRunning()
{
  if (qword_1E92DB148 != -1) {
    dispatch_once(&qword_1E92DB148, &unk_1EE22F8D8);
  }
  return byte_1E92DB154;
}

uint64_t sub_1918A6FD4()
{
  uint64_t v1 = 0;
  uint64_t result = im_notify_register_dispatch("_IMDaemonRunningNotifyToken", (int *)&unk_1E92DB158, &v1, 1, MEMORY[0x1E4F14428], &unk_1EE22F8F8);
  byte_1E92DB154 = v1 != 0;
  return result;
}

void sub_1918A7034(uint64_t a1, uint64_t a2, uint64_t a3)
{
  byte_1E92DB154 = a3 != 0;
}

void _IMGetAVAgentRemoteObject(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  uint64_t v14 = objc_msgSend_sharedInstance(IMLockdownManager, v11, v12, v13);
  int isNonUIInstall = objc_msgSend_isNonUIInstall(v14, v15, v16, v17);

  if (!isNonUIInstall)
  {
    if (v9)
    {
      uint64_t v23 = objc_msgSend_connection(v9, v19, v20, v21);
    }
    else
    {
      uint64_t v23 = 0;
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1918A71E8;
    v24[3] = &unk_1E5722E80;
    uint64_t v22 = &v25;
    id v25 = v10;
    IMAVDaemonRequestConnection(v7, v8, v23, v24);
    if (v9) {

    }
    goto LABEL_9;
  }
  if (v10)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1918A71D0;
    v26[3] = &unk_1E5722E30;
    uint64_t v22 = &v27;
    id v27 = v10;
    im_dispatch_after(v26, 0.0);
LABEL_9:
  }
}

uint64_t sub_1918A71D0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1918A71E8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v9 = a3;
  if (v5)
  {
    id v10 = [IMRemoteObject alloc];
    uint64_t v12 = objc_msgSend_initWithConnection_protocol_alreadyConfigured_(v10, v11, (uint64_t)v5, (uint64_t)&unk_1EE255B10, 1);
  }
  else
  {
    uint64_t v12 = 0;
  }
  if (*(void *)(a1 + 32))
  {
    uint64_t v13 = objc_msgSend_mainThread(MEMORY[0x1E4F29060], v6, v7, v8);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1918A7334;
    v15[3] = &unk_1E5722E58;
    id v18 = *(id *)(a1 + 32);
    id v16 = v12;
    id v17 = v9;
    objc_msgSend___im_performBlock_modes_(v13, v14, (uint64_t)v15, IMRemoteObjectsRunLoopModes);
  }
}

uint64_t sub_1918A7334(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

id _IMPathToAgent(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (qword_1E92DB3F8 != -1) {
    dispatch_once(&qword_1E92DB3F8, &unk_1EE22F898);
  }
  if (dword_1E92DA410)
  {
    uint64_t v4 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], a2, a3, a4);
    uint64_t v8 = objc_msgSend_bundlePath(v4, v5, v6, v7);
  }
  else
  {
    uint64_t v4 = _IMFrameworkBundle();
    uint64_t v12 = objc_msgSend_bundlePath(v4, v9, v10, v11);
    uint64_t v8 = objc_msgSend_stringByAppendingPathComponent_(v12, v13, @"imagent.app", v14);
  }
  return v8;
}

uint64_t _IMITunesInteropAvailable()
{
  return 1;
}

__CFString *_IMITunesMessageFormat(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend__IMAppObjectForKey_(MEMORY[0x1E4F1CB18], a2, @"iTunesMessageFormat", a4);
  uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (!v4) {
    uint64_t v4 = @"%Track - %Artist";
  }
  uint64_t v6 = v4;

  return v6;
}

id _IMStatusMessageWithFormatAndVariables(void *a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v7 = objc_msgSend_mutableCopy(a1, v4, v5, v6);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  objc_msgSend_allKeys(v3, v8, v9, v10);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v31, (uint64_t)v35, 16);
  if (v12)
  {
    uint64_t v16 = v12;
    uint64_t v17 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v20 = objc_msgSend_length(v7, v13, v14, v15);
        uint64_t v23 = objc_msgSend_stringByAppendingString_(@"%", v21, v19, v22);
        uint64_t v26 = objc_msgSend_objectForKey_(v3, v24, v19, v25);
        char v28 = (void *)v26;
        if (v26) {
          objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v7, v27, (uint64_t)v23, v26, 2, 0, v20);
        }
        else {
          objc_msgSend_replaceOccurrencesOfString_withString_options_range_(v7, v27, (uint64_t)v23, (uint64_t)&stru_1EE231AD8, 2, 0, v20);
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v31, (uint64_t)v35, 16);
    }
    while (v16);
  }

  return v7;
}

CFMutableDictionaryRef sub_1918A7614()
{
  long long v0 = *(_OWORD *)(MEMORY[0x1E4F1D048] + 16);
  *(_OWORD *)&v3.version = *MEMORY[0x1E4F1D048];
  *(_OWORD *)&v3.release = v0;
  *(_OWORD *)&v3.equal = *(_OWORD *)(MEMORY[0x1E4F1D048] + 32);
  v3.retain = (CFDictionaryRetainCallBack)sub_1918A7680;
  CFMutableDictionaryRef v1 = CFDictionaryCreateMutable(0, 0, &v3, MEMORY[0x1E4F1D540]);
  return v1;
}

CFTypeRef sub_1918A7680(int a1, CFTypeRef cf)
{
  return CFRetain(cf);
}

CFMutableDictionaryRef sub_1918A7688()
{
  long long v0 = *(_OWORD *)(MEMORY[0x1E4F1D048] + 16);
  *(_OWORD *)&keyCallBacks.version = *MEMORY[0x1E4F1D048];
  *(_OWORD *)&keyCallBacks.release = v0;
  *(_OWORD *)&keyCallBacks.equal = *(_OWORD *)(MEMORY[0x1E4F1D048] + 32);
  keyCallBacks.retain = (CFDictionaryRetainCallBack)sub_1918A7680;
  long long v1 = *(_OWORD *)(MEMORY[0x1E4F1D540] + 16);
  *(_OWORD *)&v4.version = *MEMORY[0x1E4F1D540];
  *(_OWORD *)&v4.release = v1;
  v4.equal = *(CFDictionaryEqualCallBack *)(MEMORY[0x1E4F1D540] + 32);
  v4.retain = 0;
  v4.release = 0;
  CFMutableDictionaryRef v2 = CFDictionaryCreateMutable(0, 0, &keyCallBacks, &v4);
  return v2;
}

CFMutableDictionaryRef sub_1918A770C()
{
  long long v0 = *(_OWORD *)(MEMORY[0x1E4F1D530] + 16);
  *(_OWORD *)&keyCallBacks.version = *MEMORY[0x1E4F1D530];
  *(_OWORD *)&keyCallBacks.release = v0;
  *(_OWORD *)&keyCallBacks.equal = *(_OWORD *)(MEMORY[0x1E4F1D530] + 32);
  keyCallBacks.release = 0;
  keyCallBacks.copyDescription = 0;
  keyCallBacks.retain = (CFDictionaryRetainCallBack)sub_1918A7794;
  long long v1 = *(_OWORD *)(MEMORY[0x1E4F1D540] + 16);
  *(_OWORD *)&v4.version = *MEMORY[0x1E4F1D540];
  *(_OWORD *)&v4.release = v1;
  v4.equal = *(CFDictionaryEqualCallBack *)(MEMORY[0x1E4F1D540] + 32);
  v4.retain = 0;
  v4.release = 0;
  CFMutableDictionaryRef v2 = CFDictionaryCreateMutable(0, 0, &keyCallBacks, &v4);
  return v2;
}

uint64_t sub_1918A7794(uint64_t a1, uint64_t a2)
{
  return a2;
}

id sub_1918A779C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v9 = objc_msgSend_stringWithCString_encoding_(NSString, a2, a3, 4);
  uint64_t v11 = objc_msgSend_stringWithCString_encoding_(NSString, v10, a4, 4);
  uint64_t v14 = objc_msgSend_numberWithInteger_(NSNumber, v12, a5, v13);
  uint64_t v17 = objc_msgSend_dictionaryWithObjectsAndKeys_(v8, v15, (uint64_t)v9, v16, @"File", v11, @"Function", v14, @"Line Number", 0);

  uint64_t v19 = objc_msgSend_errorWithDomain_code_userInfo_(a1, v18, @"IMGenericErrorDomain", 0, v17);

  return v19;
}

id sub_1918A78B0(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (qword_1E92DB3F8 != -1) {
    dispatch_once(&qword_1E92DB3F8, &unk_1EE22F898);
  }
  if (dword_1E92DA410) {
    IMCopyAppValueForKey(v5);
  }
  else {
  uint64_t v6 = objc_msgSend__IMObjectForKey_inDomain_(a1, v4, (uint64_t)v5, @"com.apple.imagent");
  }
  uint64_t v8 = v6;
  if (v6)
  {
    id v9 = v6;
  }
  else
  {
    objc_msgSend__IMObjectForKey_inDomain_(a1, v7, (uint64_t)v5, @"com.apple.iChatAgent");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v10 = v9;

  return v10;
}

id sub_1918A798C(int a1, int a2, CFStringRef key)
{
  return IMGetCachedDomainValueForKey(@"com.apple.iChat", key);
}

void sub_1918A79A0(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id value = a3;
  uint64_t v7 = a4;
  CFStringRef v8 = a5;
  id v9 = (__CFString *)v8;
  if (v7)
  {
    if (v8) {
      CFStringRef v10 = v8;
    }
    else {
      CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F1D3D8];
    }
    CFPreferencesSetAppValue(v7, value, v10);
    CFPreferencesAppSynchronize(v10);
  }
}

id sub_1918A7A38(int a1, int a2, CFStringRef key, CFStringRef applicationID)
{
  return IMGetCachedDomainValueForKey(applicationID, key);
}

void _IMSwapMethods(objc_class *a1, const char *a2, const char *a3, int a4)
{
  if (a4)
  {
    ClassMethod = class_getClassMethod(a1, a2);
    InstanceMethod = class_getClassMethod(a1, a3);
  }
  else
  {
    ClassMethod = class_getInstanceMethod(a1, a2);
    InstanceMethod = class_getInstanceMethod(a1, a3);
  }
  method_exchangeImplementations(ClassMethod, InstanceMethod);
}

CFIndex IMGetDomainIntForKey(CFStringRef applicationID, CFStringRef key)
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex result = CFPreferencesGetAppIntegerValue(key, applicationID, &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    return 0;
  }
  return result;
}

void IMSetDomainIntForKey(void *a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v5 = NSNumber;
    uint64_t v6 = a2;
    uint64_t v7 = a1;
    objc_msgSend_numberWithInteger_(v5, v8, a3, v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    IMSetDomainValueForKey(v7, v6, v10);
  }
  else
  {
    uint64_t v7 = a2;
    id v10 = a1;
    IMSetDomainValueForKey(v10, v7, 0);
  }
}

uint64_t IMSyncronizeAppPreferences()
{
  return CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E4F1D3D8]);
}

uint64_t sub_1918A7BC0()
{
  return CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E4F1D3D8]);
}

id IMCopyAppByHostValueForKey(void *a1)
{
  long long v1 = a1;
  if (objc_msgSend_length(v1, v2, v3, v4)) {
    id v5 = (void *)CFPreferencesCopyValue(v1, (CFStringRef)*MEMORY[0x1E4F1D3D8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  }
  else {
    id v5 = 0;
  }

  return v5;
}

void IMSetAppValueForKey(const __CFString *a1, const void *a2)
{
}

void IMSetAppByHostValueForKey(const __CFString *a1, const void *a2)
{
}

void IMRemoveAppValueForKey(const __CFString *a1)
{
}

void IMRemoveAppByHostValueForKey(const __CFString *a1)
{
}

uint64_t IMGetAppByHostIntForKey(void *a1)
{
  long long v1 = IMCopyAppByHostValueForKey(a1);
  uint64_t v5 = objc_msgSend_integerValue(v1, v2, v3, v4);

  return v5;
}

BOOL IMGetAppBoolForKey(void *a1)
{
  return IMGetAppIntForKey(a1) != 0;
}

BOOL IMGetAppByHostBoolForKey(void *a1)
{
  return IMGetAppByHostIntForKey(a1) != 0;
}

void IMSetAppBoolForKey(const __CFString *a1, int a2)
{
  if (a2) {
    CFMutableDictionaryRef v2 = (const void *)*MEMORY[0x1E4F1CFD0];
  }
  else {
    CFMutableDictionaryRef v2 = 0;
  }
  CFPreferencesSetAppValue(a1, v2, (CFStringRef)*MEMORY[0x1E4F1D3D8]);
}

void IMSetAppByHostBoolForKey(const __CFString *a1, int a2)
{
  if (a2) {
    CFMutableDictionaryRef v2 = (const void *)*MEMORY[0x1E4F1CFD0];
  }
  else {
    CFMutableDictionaryRef v2 = 0;
  }
  CFPreferencesSetValue(a1, v2, (CFStringRef)*MEMORY[0x1E4F1D3D8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
}

BOOL IMCanAccessPath(void *a1)
{
  id v1 = a1;
  getpid();
  id v2 = v1;
  objc_msgSend_UTF8String(v2, v3, v4, v5);

  return sandbox_check() == 0;
}

BOOL IMCanAccessPreferenceDomain(void *a1)
{
  id v1 = a1;
  getpid();
  id v2 = v1;
  objc_msgSend_UTF8String(v2, v3, v4, v5);
  if (sandbox_check())
  {
    CFStringRef v8 = objc_msgSend_stringWithFormat_(NSString, v6, @"~/Library/Preferences/%@.plist", v7, v2);
    uint64_t v12 = objc_msgSend_stringByResolvingAndStandardizingPath(v8, v9, v10, v11);
    BOOL v13 = IMCanAccessPath(v12);
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

id sub_1918A7EC8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_objectForKey_(a1, a2, a3, a4);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

id sub_1918A7F34(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_objectForKey_(a1, a2, a3, a4);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

id sub_1918A7FA0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_objectForKey_(a1, a2, a3, a4);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

id sub_1918A800C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_objectForKey_(a1, a2, a3, a4);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

uint64_t (*sub_1918A8078())(void, void)
{
  CFIndex result = (uint64_t (*)(void, void))IMWeakLinkSymbol();
  off_1EB273AC0 = result;
  return result;
}

uint64_t (*sub_1918A80A8())(void, void, void)
{
  CFIndex result = (uint64_t (*)(void, void, void))IMWeakLinkSymbol();
  off_1EB273AB8 = result;
  return result;
}

void *IMDAuditTokenTaskCopyValueForEntitlement(_OWORD *a1, void *a2)
{
  id v3 = a2;
  if (qword_1E92DB418 != -1) {
    dispatch_once(&qword_1E92DB418, &unk_1EE22F958);
  }
  if (qword_1E92DB428 != -1) {
    dispatch_once(&qword_1E92DB428, &unk_1EE230FF8);
  }
  uint64_t v4 = *MEMORY[0x1E4F1CF80];
  long long v5 = a1[1];
  *(_OWORD *)cf = *a1;
  long long v27 = v5;
  uint64_t v6 = off_1E92DB410(v4, cf);
  if (v6)
  {
    uint64_t v14 = (const void *)v6;
    cf[0] = 0;
    uint64_t v15 = (void *)off_1E92DB420(v6, v3, cf);
    uint64_t v16 = v15;
    if (cf[0])
    {

      _IMWarn(@"Unable to get entitlements for client task. Error: %@", v17, v18, v19, v20, v21, v22, v23, (char)cf[0]);
      if (cf[0]) {
        CFRelease(cf[0]);
      }
      uint64_t v16 = 0;
    }
    CFRelease(v14);
  }
  else
  {
    _IMWarn(@"Unable to create security task from audit token.", v7, v8, v9, v10, v11, v12, v13, v25);
    uint64_t v16 = 0;
  }

  return v16;
}

uint64_t (*sub_1918A81FC())(void, void)
{
  CFIndex result = (uint64_t (*)(void, void))IMWeakLinkSymbol();
  off_1E92DB410 = result;
  return result;
}

uint64_t (*sub_1918A822C())(void, void, void)
{
  CFIndex result = (uint64_t (*)(void, void, void))IMWeakLinkSymbol();
  off_1E92DB420 = result;
  return result;
}

uint64_t (*sub_1918A825C())(void, void)
{
  CFIndex result = (uint64_t (*)(void, void))IMWeakLinkSymbol();
  off_1E92DB220 = result;
  return result;
}

uint64_t (*sub_1918A828C())(void, void, void)
{
  CFIndex result = (uint64_t (*)(void, void, void))IMWeakLinkSymbol();
  off_1E92DB218 = result;
  return result;
}

void *IMDSelfTaskCopyValueForEntitlement(void *a1)
{
  id v1 = a1;
  if (qword_1EB273AF0 != -1) {
    dispatch_once(&qword_1EB273AF0, &unk_1EE22F9B8);
  }
  if (qword_1EB273AE8 != -1) {
    dispatch_once(&qword_1EB273AE8, &unk_1EE22F9D8);
  }
  uint64_t v2 = off_1EB273AD8(*MEMORY[0x1E4F1CF80]);
  if (v2)
  {
    uint64_t v10 = (const void *)v2;
    CFTypeRef cf = 0;
    uint64_t v11 = (void *)off_1EB273AE0(v2, v1, &cf);
    uint64_t v12 = v11;
    if (cf)
    {

      _IMWarn(@"Unable to get entitlements for client task. Error: %@", v13, v14, v15, v16, v17, v18, v19, (char)cf);
      if (cf) {
        CFRelease(cf);
      }
      uint64_t v12 = 0;
    }
    CFRelease(v10);
  }
  else
  {
    _IMWarn(@"Unable to create security task for self.", v3, v4, v5, v6, v7, v8, v9, v21);
    uint64_t v12 = 0;
  }

  return v12;
}

void *sub_1918A83D0()
{
  CFIndex result = (void *)IMWeakLinkSymbol();
  off_1EB273AD8 = result;
  return result;
}

void *sub_1918A8400()
{
  CFIndex result = (void *)IMWeakLinkSymbol();
  off_1EB273AE0 = result;
  return result;
}

uint64_t IMDSelfTaskHasTrueNSNumberForEntitlement(void *a1)
{
  id v1 = IMDSelfTaskCopyValueForEntitlement(a1);
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v5 = objc_msgSend_BOOLValue(v1, v2, v3, v4);
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

void sub_1918A8AB4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = a3;
  uint64_t v6 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], v3, v4, v5);
  uint64_t v10 = objc_msgSend_mainThread(MEMORY[0x1E4F29060], v7, v8, v9);

  if (v6 == v10)
  {
    v12[2]();
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x192FDE5A0]();
    v12[2]();
  }
}

void sub_1918A8B5C(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  id v9 = v7;
  uint64_t v17 = (void (**)(void))v6;
  uint64_t v13 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], v10, v11, v12);
  LOBYTE(v7) = objc_msgSend_isEqual_(v13, v14, (uint64_t)v8, v15);

  if (v7)
  {
    v17[2]();
  }
  else if (v9)
  {
    objc_msgSend___im_performBlock_waitUntilDone_modes_(v8, v16, (uint64_t)v17, 0, v9);
  }
  else
  {
    objc_msgSend___im_performBlock_waitUntilDone_(v8, v16, (uint64_t)v17, 0);
  }
}

void sub_1918A8C3C(uint64_t a1, const char *a2, void *a3, uint64_t a4)
{
  id v6 = (void *)MEMORY[0x1E4F29060];
  id v8 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, a4);
  objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(v6, v7, (uint64_t)sel__im_runBlock_, a1, v8, a4);
}

void sub_1918A8CB8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = (void *)MEMORY[0x1E4F29060];
  id v9 = a5;
  id v14 = (id)objc_msgSend_copy(a3, v10, v11, v12);
  objc_msgSend_performSelector_onThread_withObject_waitUntilDone_modes_(v8, v13, (uint64_t)sel__im_runBlock_, a1, v14, a4, v9);
}

void sub_1918A8D50(void *a1, double a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  objc_msgSend___im_afterDelay_(a1, v7, v8, v9, a2);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_msgSend_copy(v6, v10, v11, v12);

  objc_msgSend___im_performBlock_(v16, v14, (uint64_t)v13, v15);
}

void sub_1918A8DD4(void *a1, double a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a5;
  id v9 = a4;
  objc_msgSend___im_afterDelay_modes_(a1, v10, (uint64_t)v8, v11, a2);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = objc_msgSend_copy(v9, v12, v13, v14);

  objc_msgSend___im_performBlock_modes_(v17, v16, (uint64_t)v15, (uint64_t)v8);
}

void im_perform_with_task_assertion(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    if (qword_1E92DB1C8 != -1) {
      dispatch_once(&qword_1E92DB1C8, &unk_1EE22F9F8);
    }
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
    id v3 = objc_alloc((Class)qword_1E92DB1C0);
    uint64_t v4 = getpid();
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1918A9048;
    v20[3] = &unk_1E5722EA8;
    uint64_t v22 = &v23;
    uint64_t v5 = v2;
    char v21 = v5;
    id v7 = objc_msgSend_initWithPID_flags_reason_name_withHandler_(v3, v6, v4, 1, 4, @"com.apple.imcore.generic-task-assertion", v20);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    if (!*((unsigned char *)v24 + 24))
    {
      _IMWarn(@"Unable to take process assertion", v8, v9, v10, v11, v12, v13, v14, v20[0]);
      IMLogBacktrace(0);
    }
    v1[2](v1);
    objc_msgSend_setInvalidationHandler_(v7, v15, 0, v16);
    objc_msgSend_invalidate(v7, v17, v18, v19);

    _Block_object_dispose(&v23, 8);
  }
}

void sub_1918A9000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1918A9018()
{
  uint64_t result = IMWeakLinkClass();
  qword_1E92DB1C0 = result;
  return result;
}

intptr_t sub_1918A9048(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void im_main_thread(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    dispatch_block_t block = v1;
    if (objc_msgSend_isMainThread(MEMORY[0x1E4F29060], v2, v3, v4)) {
      block[2]();
    }
    else {
      dispatch_sync(MEMORY[0x1E4F14428], block);
    }
    id v1 = block;
  }
}

void im_dispatch_background_after(void *a1, double a2)
{
  if (a1)
  {
    int64_t v2 = (uint64_t)(a2 * 1000000000.0);
    id v3 = a1;
    dispatch_time_t v4 = dispatch_time(0, v2);
    uint64_t v5 = dispatch_get_global_queue(-32768, 0);
    dispatch_after(v4, v5, v3);
  }
}

void im_dispatch_thread_after(void *a1, void *a2, double a3)
{
  if (a2)
  {
    id v5 = a2;
    objc_msgSend___im_afterDelay_(a1, v6, v7, v8, a3);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend___im_performBlock_(v11, v9, (uint64_t)v5, v10);
  }
}

void im_dispatch_async_with_timeout(dispatch_time_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v11 = dispatch_queue_create("com.apple.ids.async_with_timeout_1", v10);
  uint64_t v12 = dispatch_queue_create("com.apple.ids.async_with_timeout_2", v10);
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  int v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  char v41 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1918A94D0;
  aBlock[3] = &unk_1E5722ED0;
  uint64_t v38 = v42;
  uint64_t v39 = v40;
  id v36 = v8;
  id v37 = v9;
  id v13 = v9;
  id v14 = v8;
  uint64_t v15 = _Block_copy(aBlock);
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  long long v32 = sub_1918A95C4;
  long long v33 = sub_1918A95D4;
  dispatch_source_t v34 = (dispatch_source_t)0xAAAAAAAAAAAAAAAALL;
  dispatch_source_t v34 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v12);
  dispatch_source_set_timer((dispatch_source_t)v30[5], a1, 0xFFFFFFFFFFFFFFFFLL, 0);
  uint64_t v16 = v30[5];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = sub_1918A95DC;
  handler[3] = &unk_1E5722EF8;
  char v28 = &v29;
  id v17 = v15;
  id v27 = v17;
  dispatch_source_set_event_handler(v16, handler);
  dispatch_resume((dispatch_object_t)v30[5]);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1918A9644;
  v21[3] = &unk_1E5722F48;
  uint64_t v22 = v12;
  id v23 = v7;
  id v24 = v17;
  uint64_t v25 = &v29;
  id v18 = v17;
  uint64_t v19 = v12;
  id v20 = v7;
  dispatch_async(v11, v21);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);
}

uint64_t sub_1918A94D0(uint64_t result, int a2)
{
  int64_t v2 = (void *)result;
  if (++*(_DWORD *)(*(void *)(*(void *)(result + 48) + 8) + 24) == 1)
  {
    uint64_t result = *(void *)(result + 32);
    if (result)
    {
      if (a2)
      {
        *(unsigned char *)(*(void *)(v2[7] + 8) + 24) = 1;
        uint64_t result = v2[4];
      }
      uint64_t result = (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(*(void *)(v2[7] + 8) + 24));
      if (!*(unsigned char *)(*(void *)(v2[7] + 8) + 24)) {
        uint64_t result = (*(uint64_t (**)(void))(v2[5] + 16))();
      }
    }
  }
  if (*(unsigned char *)(*(void *)(v2[7] + 8) + 24) && *(_DWORD *)(*(void *)(v2[6] + 8) + 24) == 2)
  {
    id v3 = *(uint64_t (**)(void))(v2[5] + 16);
    return v3();
  }
  return result;
}

uint64_t sub_1918A95C4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1918A95D4(uint64_t a1)
{
}

uint64_t sub_1918A95DC(uint64_t a1)
{
  int64_t v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    dispatch_time_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v5();
}

void sub_1918A9644(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1918A96F8;
  v5[3] = &unk_1E5722F20;
  uint64_t v2 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 48);
  id v3 = (id)v4;
  long long v7 = v4;
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);
}

void sub_1918A96F8(uint64_t a1)
{
  id v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1918A9790;
  block[3] = &unk_1E5722EF8;
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v5 = v3;
  dispatch_async(v1, block);
}

uint64_t sub_1918A9790(uint64_t a1)
{
  id v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
  long long v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v5();
}

id sub_1918A97F8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  long long v5 = objc_msgSend_mainThread(MEMORY[0x1E4F29060], a2, a3, a4);
  id v8 = objc_msgSend___im_onThread_(a1, v6, (uint64_t)v5, v7);

  return v8;
}

id sub_1918A9858(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  long long v5 = objc_msgSend_mainThread(MEMORY[0x1E4F29060], a2, a3, a4);
  uint64_t v7 = objc_msgSend___im_onThread_immediateForMatchingThread_(a1, v6, (uint64_t)v5, 1);

  return v7;
}

uint64_t sub_1918A98BC(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend___im_onThread_(a1, a2, 0, a4);
}

id sub_1918A98C4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  uint64_t v7 = [IMThreadedInvocationTrampoline alloc];
  id v9 = objc_msgSend_initWithTarget_thread_immediateForMatchingThread_(v7, v8, a1, (uint64_t)v6, a4);

  return v9;
}

uint64_t sub_1918A9934(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend___im_onThread_immediateForMatchingThread_(a1, a2, a3, 0);
}

id sub_1918A993C(uint64_t a1, double a2)
{
  long long v4 = [IMDelayedInvocationTrampoline alloc];
  id v6 = objc_msgSend_initWithTarget_delay_modes_(v4, v5, a1, 0, a2);
  return v6;
}

id sub_1918A9994(uint64_t a1, double a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v7 = [IMDelayedInvocationTrampoline alloc];
  id v9 = objc_msgSend_initWithTarget_delay_modes_(v7, v8, a1, (uint64_t)v6, a2);

  return v9;
}

id sub_1918A9A0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v5 = [IMCapturedInvocationTrampoline alloc];
  uint64_t v7 = objc_msgSend_initWithTarget_outInvocation_(v5, v6, a1, a3);
  return v7;
}

__CFString *_IMStringFromFZRegistrationErrorReason(int a1)
{
  if ((a1 + 1) > 0x1E) {
    return @"Unknown";
  }
  else {
    return off_1E5723038[a1 + 1];
  }
}

__CFString *_IMStringFromFZAliasValidationStatus(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 4) {
    return @"Invalid";
  }
  else {
    return off_1E5723168[a1 + 1];
  }
}

__CFString *_IMStringFromFZRegistrationStatus(int a1)
{
  if ((a1 + 1) > 6) {
    return @"Unknown";
  }
  else {
    return off_1E5723130[a1 + 1];
  }
}

__CFString *_IMStringFromFZProfileValidationStatus(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 4) {
    return @"Unknown";
  }
  else {
    return off_1E5723168[a1 + 1];
  }
}

id _IMStringFromFZListenerCapabilities(int a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F28E78]);
  long long v5 = objc_msgSend_initWithString_(v2, v3, @"("), v4;
  id v9 = v5;
  if (a1)
  {
    if ((unint64_t)objc_msgSend_length(v5, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v10, @", ", v11);
    }
    objc_msgSend_appendString_(v9, v10, @"Status", v11);
  }
  if ((a1 & 2) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v12, @", ", v13);
    }
    objc_msgSend_appendString_(v9, v12, @"Notifications", v13);
  }
  if ((a1 & 4) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v14, @", ", v15);
    }
    objc_msgSend_appendString_(v9, v14, @"Chats", v15);
  }
  if ((a1 & 8) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v16, @", ", v17);
    }
    objc_msgSend_appendString_(v9, v16, @"VC", v17);
  }
  if ((a1 & 0x80000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v18, @", ", v19);
    }
    objc_msgSend_appendString_(v9, v18, @"FTA", v19);
  }
  if ((a1 & 0x10) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v20, @", ", v21);
    }
    objc_msgSend_appendString_(v9, v20, @"AV Chat Info", v21);
  }
  if ((a1 & 0x20) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v22, @", ", v23);
    }
    objc_msgSend_appendString_(v9, v22, @"Aux Input", v23);
  }
  if ((a1 & 0x40) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v24, @", ", v25);
    }
    objc_msgSend_appendString_(v9, v24, @"VC Invitations", v25);
  }
  if ((a1 & 0x80) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v26, @", ", v27);
    }
    objc_msgSend_appendString_(v9, v26, @"Legacy VC", v27);
  }
  if ((a1 & 0x100) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v28, @", ", v29);
    }
    objc_msgSend_appendString_(v9, v28, @"Transfers", v29);
  }
  if ((a1 & 0x200) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v30, @", ", v31);
    }
    objc_msgSend_appendString_(v9, v30, @"Accounts", v31);
  }
  if ((a1 & 0x400) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v32, @", ", v33);
    }
    objc_msgSend_appendString_(v9, v32, @"Buddy List", v33);
  }
  if ((a1 & 0x1000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v34, @", ", v35);
    }
    objc_msgSend_appendString_(v9, v34, @"Send Messages", v35);
  }
  if ((a1 & 0x4000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v36, @", ", v37);
    }
    objc_msgSend_appendString_(v9, v36, @"ID Queries", v37);
  }
  if ((a1 & 0x2000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v38, @", ", v39);
    }
    objc_msgSend_appendString_(v9, v38, @"Message History", v39);
  }
  if ((a1 & 0x40000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v40, @", ", v41);
    }
    objc_msgSend_appendString_(v9, v40, @"Modify Read State", v41);
  }
  if ((a1 & 0x8000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v42, @", ", v43);
    }
    objc_msgSend_appendString_(v9, v42, @"Chat Counts", v43);
  }
  if ((a1 & 0x10000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v44, @", ", v45);
    }
    objc_msgSend_appendString_(v9, v44, @"Sent Messages", v45);
  }
  if ((a1 & 0x20000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v46, @", ", v47);
    }
    objc_msgSend_appendString_(v9, v46, @"Database Update", v47);
  }
  if ((a1 & 0x100000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v48, @", ", v49);
    }
    objc_msgSend_appendString_(v9, v48, @"AV", v49);
  }
  if ((a1 & 0x200000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v50, @", ", v51);
    }
    objc_msgSend_appendString_(v9, v50, @"On Demand Chats", v51);
  }
  if ((a1 & 0x400000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v52, @", ", v53);
    }
    objc_msgSend_appendString_(v9, v52, @"Truncated Chats", v53);
  }
  if ((a1 & 0x2000000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v54, @", ", v55);
    }
    objc_msgSend_appendString_(v9, v54, @"Even more Truncated Chats", v55);
  }
  if ((a1 & 0x800000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v56, @", ", v57);
    }
    objc_msgSend_appendString_(v9, v56, @"OneTimeCode", v57);
  }
  if ((a1 & 0x1000000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v58, @", ", v59);
    }
    objc_msgSend_appendString_(v9, v58, @"Skip Last Message", v59);
  }
  if ((a1 & 0x4000000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v60, @", ", v61);
    }
    objc_msgSend_appendString_(v9, v60, @"Blackhole Chats", v61);
  }
  if ((a1 & 0x8000000) != 0)
  {
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v62, @", ", v63);
    }
    objc_msgSend_appendString_(v9, v62, @"Send Emergency Messages", v63);
  }
  objc_msgSend_appendString_(v9, v6, @""), v8);
  id v64 = v9;

  return v64;
}

id _IMStringFromFZCapabilities(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F28E78]);
  long long v5 = objc_msgSend_initWithString_(v2, v3, @"("), v4;
  id v9 = v5;
  if (a1)
  {
    if ((unint64_t)objc_msgSend_length(v5, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v10, @", ", v11);
    }
    objc_msgSend_appendString_(v9, v10, @"Buddy Icon", v11);
    if ((a1 & 4) == 0)
    {
LABEL_3:
      if ((a1 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_53;
    }
  }
  else if ((a1 & 4) == 0)
  {
    goto LABEL_3;
  }
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v12, @", ", v13);
  }
  objc_msgSend_appendString_(v9, v12, @"IM Image", v13);
  if ((a1 & 8) == 0)
  {
LABEL_4:
    if ((a1 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_56;
  }
LABEL_53:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v14, @", ", v15);
  }
  objc_msgSend_appendString_(v9, v14, @"Chat", v15);
  if ((a1 & 0x10) == 0)
  {
LABEL_5:
    if ((a1 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_59;
  }
LABEL_56:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v16, @", ", v17);
  }
  objc_msgSend_appendString_(v9, v16, @"GetFile", v17);
  if ((a1 & 0x20) == 0)
  {
LABEL_6:
    if ((a1 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_62;
  }
LABEL_59:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v18, @", ", v19);
  }
  objc_msgSend_appendString_(v9, v18, @"SendFile", v19);
  if ((a1 & 0x40) == 0)
  {
LABEL_7:
    if ((a1 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_65;
  }
LABEL_62:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v20, @", ", v21);
  }
  objc_msgSend_appendString_(v9, v20, @"Chat Roomts", v21);
  if ((a1 & 0x80) == 0)
  {
LABEL_8:
    if ((a1 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_68;
  }
LABEL_65:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v22, @", ", v23);
  }
  objc_msgSend_appendString_(v9, v22, @"Registration", v23);
  if ((a1 & 0x100) == 0)
  {
LABEL_9:
    if ((a1 & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_71;
  }
LABEL_68:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v24, @", ", v25);
  }
  objc_msgSend_appendString_(v9, v24, @"Offline IM", v25);
  if ((a1 & 0x200) == 0)
  {
LABEL_10:
    if ((a1 & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_74;
  }
LABEL_71:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v26, @", ", v27);
  }
  objc_msgSend_appendString_(v9, v26, @"Broadcast Messages", v27);
  if ((a1 & 0x400) == 0)
  {
LABEL_11:
    if ((a1 & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_77;
  }
LABEL_74:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v28, @", ", v29);
  }
  objc_msgSend_appendString_(v9, v28, @"IM", v29);
  if ((a1 & 0x1000) == 0)
  {
LABEL_12:
    if ((a1 & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_80;
  }
LABEL_77:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v30, @", ", v31);
  }
  objc_msgSend_appendString_(v9, v30, @"Message Blocking", v31);
  if ((a1 & 0x2000) == 0)
  {
LABEL_13:
    if ((a1 & 0x8000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_83;
  }
LABEL_80:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v32, @", ", v33);
  }
  objc_msgSend_appendString_(v9, v32, @"Presence Blocking", v33);
  if ((a1 & 0x8000) == 0)
  {
LABEL_14:
    if ((a1 & 0x10000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_86;
  }
LABEL_83:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v34, @", ", v35);
  }
  objc_msgSend_appendString_(v9, v34, @"Buddy List", v35);
  if ((a1 & 0x10000) == 0)
  {
LABEL_15:
    if ((a1 & 0x20000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_89;
  }
LABEL_86:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v36, @", ", v37);
  }
  objc_msgSend_appendString_(v9, v36, @"Conference Active", v37);
  if ((a1 & 0x20000) == 0)
  {
LABEL_16:
    if ((a1 & 0x40000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_92;
  }
LABEL_89:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v38, @", ", v39);
  }
  objc_msgSend_appendString_(v9, v38, @"Viceroy", v39);
  if ((a1 & 0x40000) == 0)
  {
LABEL_17:
    if ((a1 & 0x80000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_95;
  }
LABEL_92:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v40, @", ", v41);
  }
  objc_msgSend_appendString_(v9, v40, @"Video Chat", v41);
  if ((a1 & 0x80000) == 0)
  {
LABEL_18:
    if ((a1 & 0x100000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_98;
  }
LABEL_95:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v42, @", ", v43);
  }
  objc_msgSend_appendString_(v9, v42, @"Audio Chat", v43);
  if ((a1 & 0x100000) == 0)
  {
LABEL_19:
    if ((a1 & 0x200000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_101;
  }
LABEL_98:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v44, @", ", v45);
  }
  objc_msgSend_appendString_(v9, v44, @"Conference Available", v45);
  if ((a1 & 0x200000) == 0)
  {
LABEL_20:
    if ((a1 & 0x400000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_104;
  }
LABEL_101:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v46, @", ", v47);
  }
  objc_msgSend_appendString_(v9, v46, @"AOL Video", v47);
  if ((a1 & 0x400000) == 0)
  {
LABEL_21:
    if ((a1 & 0x800000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_107;
  }
LABEL_104:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v48, @", ", v49);
  }
  objc_msgSend_appendString_(v9, v48, @"AOL Audio", v49);
  if ((a1 & 0x800000) == 0)
  {
LABEL_22:
    if ((a1 & 0x1000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_110;
  }
LABEL_107:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v50, @", ", v51);
  }
  objc_msgSend_appendString_(v9, v50, @"Multi Audio", v51);
  if ((a1 & 0x1000000) == 0)
  {
LABEL_23:
    if ((a1 & 0x2000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_113;
  }
LABEL_110:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v52, @", ", v53);
  }
  objc_msgSend_appendString_(v9, v52, @"Multi Video", v53);
  if ((a1 & 0x2000000) == 0)
  {
LABEL_24:
    if ((a1 & 0x4000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_116;
  }
LABEL_113:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v54, @", ", v55);
  }
  objc_msgSend_appendString_(v9, v54, @"AOL Multi Audio", v55);
  if ((a1 & 0x4000000) == 0)
  {
LABEL_25:
    if ((a1 & 0x8000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_119;
  }
LABEL_116:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v56, @", ", v57);
  }
  objc_msgSend_appendString_(v9, v56, @"RD Server", v57);
  if ((a1 & 0x8000000) == 0)
  {
LABEL_26:
    if ((a1 & 0x10000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_122;
  }
LABEL_119:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v58, @", ", v59);
  }
  objc_msgSend_appendString_(v9, v58, @"RD Client", v59);
  if ((a1 & 0x10000000) == 0)
  {
LABEL_27:
    if ((a1 & 0x20000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_125;
  }
LABEL_122:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v60, @", ", v61);
  }
  objc_msgSend_appendString_(v9, v60, @"Subscription", v61);
  if ((a1 & 0x20000000) == 0)
  {
LABEL_28:
    if ((a1 & 0x40000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_128;
  }
LABEL_125:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v62, @", ", v63);
  }
  objc_msgSend_appendString_(v9, v62, @"Profile", v63);
  if ((a1 & 0x40000000) == 0)
  {
LABEL_29:
    if ((a1 & 0x80000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_131;
  }
LABEL_128:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v64, @", ", v65);
  }
  objc_msgSend_appendString_(v9, v64, @"Notes", v65);
  if ((a1 & 0x80000000) == 0)
  {
LABEL_30:
    if ((a1 & 0x100000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_134;
  }
LABEL_131:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v66, @", ", v67);
  }
  objc_msgSend_appendString_(v9, v66, @"Forgot Password", v67);
  if ((a1 & 0x100000000) == 0)
  {
LABEL_31:
    if ((a1 & 0x200000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_137;
  }
LABEL_134:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v68, @", ", v69);
  }
  objc_msgSend_appendString_(v9, v68, @"Custom Ordering", v69);
  if ((a1 & 0x200000000) == 0)
  {
LABEL_32:
    if ((a1 & 0x400000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_140;
  }
LABEL_137:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v70, @", ", v71);
  }
  objc_msgSend_appendString_(v9, v70, @"Buddy Watching", v71);
  if ((a1 & 0x400000000) == 0)
  {
LABEL_33:
    if ((a1 & 0x800000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_143;
  }
LABEL_140:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v72, @", ", v73);
  }
  objc_msgSend_appendString_(v9, v72, @"Groups", v73);
  if ((a1 & 0x800000000) == 0)
  {
LABEL_34:
    if ((a1 & 0x1000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_146;
  }
LABEL_143:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v74, @", ", v75);
  }
  objc_msgSend_appendString_(v9, v74, @"AV Recording", v75);
  if ((a1 & 0x1000000000) == 0)
  {
LABEL_35:
    if ((a1 & 0x2000000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_149;
  }
LABEL_146:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v76, @", ", v77);
  }
  objc_msgSend_appendString_(v9, v76, @"Aux Video", v77);
  if ((a1 & 0x2000000000) == 0)
  {
LABEL_36:
    if ((a1 & 0x4000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_152;
  }
LABEL_149:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v78, @", ", v79);
  }
  objc_msgSend_appendString_(v9, v78, @"ICE", v79);
  if ((a1 & 0x4000000000) == 0)
  {
LABEL_37:
    if ((a1 & 0x8000000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_155;
  }
LABEL_152:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v80, @", ", v81);
  }
  objc_msgSend_appendString_(v9, v80, @"Invisible", v81);
  if ((a1 & 0x8000000000) == 0)
  {
LABEL_38:
    if ((a1 & 0x10000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_158;
  }
LABEL_155:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v82, @", ", v83);
  }
  objc_msgSend_appendString_(v9, v82, @"Require Chat Suffix", v83);
  if ((a1 & 0x10000000000) == 0)
  {
LABEL_39:
    if ((a1 & 0x20000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_161;
  }
LABEL_158:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v84, @", ", v85);
  }
  objc_msgSend_appendString_(v9, v84, @"Chat Ignore", v85);
  if ((a1 & 0x20000000000) == 0)
  {
LABEL_40:
    if ((a1 & 0x40000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_164;
  }
LABEL_161:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v86, @", ", v87);
  }
  objc_msgSend_appendString_(v9, v86, @"SMS", v87);
  if ((a1 & 0x40000000000) == 0)
  {
LABEL_41:
    if ((a1 & 0x80000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_167;
  }
LABEL_164:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v88, @", ", v89);
  }
  objc_msgSend_appendString_(v9, v88, @"RD Mux", v89);
  if ((a1 & 0x80000000000) == 0)
  {
LABEL_42:
    if ((a1 & 0x100000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_170;
  }
LABEL_167:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v90, @", ", v91);
  }
  objc_msgSend_appendString_(v9, v90, @"Directory Transfer", v91);
  if ((a1 & 0x100000000000) == 0)
  {
LABEL_43:
    if ((a1 & 0x200000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_173;
  }
LABEL_170:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v92, @", ", v93);
  }
  objc_msgSend_appendString_(v9, v92, @"FaceTime Blob", v93);
  if ((a1 & 0x200000000000) == 0)
  {
LABEL_44:
    if ((a1 & 0x400000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_176;
  }
LABEL_173:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v94, @", ", v95);
  }
  objc_msgSend_appendString_(v9, v94, @"FaceTime VC", v95);
  if ((a1 & 0x400000000000) == 0)
  {
LABEL_45:
    if ((a1 & 0x800000000000) == 0) {
      goto LABEL_182;
    }
    goto LABEL_179;
  }
LABEL_176:
  if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
    objc_msgSend_appendString_(v9, v96, @", ", v97);
  }
  objc_msgSend_appendString_(v9, v96, @"Delivery Receipts", v97);
  if ((a1 & 0x800000000000) != 0)
  {
LABEL_179:
    if ((unint64_t)objc_msgSend_length(v9, v6, v7, v8) >= 2) {
      objc_msgSend_appendString_(v9, v98, @", ", v99);
    }
    objc_msgSend_appendString_(v9, v98, @"Read Receipts", v99);
  }
LABEL_182:
  objc_msgSend_appendString_(v9, v6, @""), v8);
  id v100 = v9;

  return v100;
}

id IMGenerateLoginID(void *a1)
{
  id v1 = a1;
  uint64_t v5 = objc_msgSend__FZBestGuessFZIDType(v1, v2, v3, v4);
  uint64_t v8 = objc_msgSend__IDFromFZIDType_(v1, v6, v5, v7);

  return v8;
}

uint64_t IMCopyProcessNameForPid(int a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v1 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[0] = v1;
  v6[1] = v1;
  if (proc_name(a1, v6, 0x20u) < 1) {
    return 0;
  }
  id v2 = [NSString alloc];
  return objc_msgSend_initWithUTF8String_(v2, v3, (uint64_t)v6, v4);
}

id IMProcessNameForPid(int a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v1 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v7[0] = v1;
  v7[1] = v1;
  if (proc_name(a1, v7, 0x20u) < 1)
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v2 = [NSString alloc];
    uint64_t v5 = objc_msgSend_initWithUTF8String_(v2, v3, (uint64_t)v7, v4);
  }
  return v5;
}

id IMCreateSimpleComponentString(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v1;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v12, (uint64_t)v16, 16);
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend_appendString_(v2, v6, *(void *)(*((void *)&v12 + 1) + 8 * v10++), v7, (void)v12);
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v12, (uint64_t)v16, 16);
    }
    while (v8);
  }

  return v2;
}

void sub_1918AAF2C(void *a1)
{
  id obj = a1;
  objc_sync_enter(obj);
  unint64_t v4 = objc_msgSend_count(obj, v1, v2, v3);
  unint64_t v5 = v4;
  if (v4 >= 2)
  {
    uint64_t v6 = 0;
    unint64_t v7 = v4 - 1;
    do
    {
      unint64_t v9 = arc4random() % v7;
      if (v6 != v9) {
        objc_msgSend_exchangeObjectAtIndex_withObjectAtIndex_(obj, v8, v6, v9);
      }
      ++v6;
    }
    while (v5 != v6);
  }
  objc_sync_exit(obj);
}

void sub_1918AAFCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

id _PhotoSharingResponsesForString(void *a1, int a2)
{
  id v3 = a1;
  unint64_t v7 = objc_msgSend_dataDetector(IMIDSLog, v4, v5, v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v8) {
      sub_1918E0BB8();
    }
LABEL_15:

    id v29 = 0;
    goto LABEL_19;
  }
  if (v8) {
    sub_1918E0CC0();
  }

  if (!v3)
  {
    unint64_t v7 = objc_msgSend_dataDetector(IMIDSLog, v9, v10, v11);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1918E0BF0(v7);
    }
    goto LABEL_15;
  }
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x3032000000;
  uint64_t v43 = sub_1918A95C4;
  uint64_t v44 = sub_1918A95D4;
  id v45 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  long long v12 = (void *)MEMORY[0x192FDE5A0]();
  uint64_t v19 = objc_msgSend_sharedManager(IMRKMessageResponseManager, v13, v14, v15);
  if (v19)
  {
    id v20 = IMCurrentPreferredLanguage();
    dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = sub_1918AB2E4;
    v32[3] = &unk_1E5722F70;
    dispatch_source_t v34 = &v36;
    uint64_t v35 = &v40;
    uint64_t v22 = v21;
    uint64_t v33 = v22;
    objc_msgSend_responsesForMessage_maximumResponses_forContext_withLanguage_options_completionBlock_(v19, v23, (uint64_t)v3, 0, 0, v20, 512, v32);
    dispatch_time_t v24 = dispatch_time(0, 200000000);
    if (dispatch_semaphore_wait(v22, v24))
    {
      *((unsigned char *)v37 + 24) = 1;
      __dmb(0xBu);
      char v28 = objc_msgSend_dataDetector(IMIDSLog, v25, v26, v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_1918E0C80();
      }
    }
  }
  else
  {
    id v20 = objc_msgSend_dataDetector(IMIDSLog, v16, v17, v18);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v31 = 0;
      _os_log_impl(&dword_191892000, v20, OS_LOG_TYPE_DEFAULT, "Failed to link RKMessageResponseManager.", v31, 2u);
    }
  }

  id v29 = (id)v41[5];
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

LABEL_19:
  return v29;
}

void sub_1918AB2AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1918AB2E4(uint64_t a1, void *a2)
{
  id v4 = a2;
  __dmb(0xBu);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    id v4 = v5;
  }
}

uint64_t _AddDDPhotoSharingIntentResultToAttributedString(void *a1, void *a2)
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v91 = a1;
  id v3 = a2;
  if (!objc_msgSend_count(v3, v4, v5, v6))
  {
    uint64_t v82 = objc_msgSend_dataDetector(IMIDSLog, v7, v8, v9);
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
      sub_1918E0CF8();
    }
    goto LABEL_32;
  }
  uint64_t v10 = IMRKAttributedTokenTypeKey();
  if (v10)
  {
    uint64_t v14 = (void *)v10;
    uint64_t v15 = IMRKAttributedTokenPhotosharingType();
    if (v15)
    {
      uint64_t v16 = (void *)v15;
      uint64_t v17 = IMRKAttributedTokenPhotosharingKeywordsKey();
      if (v17)
      {
        uint64_t v18 = (void *)v17;
        uint64_t v19 = IMRKAttributedTokenPhotosharingKeywordRangesKey();

        if (v19)
        {
          id v20 = (void *)MEMORY[0x192FDE5A0]();
          long long v94 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          long long v97 = 0u;
          id v21 = v3;
          uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v94, (uint64_t)v102, 16);
          if (v23)
          {
            uint64_t v27 = v23;
            uint64_t v85 = v20;
            id v86 = v3;
            char v28 = 0;
            uint64_t v29 = *(void *)v95;
            uint64_t v87 = *(void *)v95;
            id v88 = v21;
            do
            {
              uint64_t v30 = 0;
              uint64_t v89 = v27;
              do
              {
                if (*(void *)v95 != v29) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v31 = objc_msgSend_attributes(*(void **)(*((void *)&v94 + 1) + 8 * v30), v24, v25, v26, v85, v86);
                long long v32 = IMRKAttributedTokenTypeKey();
                uint64_t v35 = objc_msgSend_objectForKeyedSubscript_(v31, v33, (uint64_t)v32, v34);

                uint64_t v36 = IMRKAttributedTokenPhotosharingType();
                v90 = v35;
                LODWORD(v35) = objc_msgSend_isEqualToString_(v35, v37, (uint64_t)v36, v38);

                if (v35)
                {
                  char v39 = IMRKAttributedTokenPhotosharingKeywordsKey();
                  uint64_t v42 = objc_msgSend_objectForKeyedSubscript_(v31, v40, (uint64_t)v39, v41);

                  uint64_t v43 = IMRKAttributedTokenPhotosharingKeywordRangesKey();
                  char v46 = objc_msgSend_objectForKeyedSubscript_(v31, v44, (uint64_t)v43, v45);

                  if (objc_msgSend_count(v42, v47, v48, v49))
                  {
                    unint64_t v53 = 0;
                    do
                    {
                      if (v53 >= objc_msgSend_count(v46, v50, v51, v52))
                      {
                        uint64_t v68 = objc_msgSend_dataDetector(IMIDSLog, v54, v55, v56);
                        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
                          sub_1918E0DA8(&v92, v93);
                        }
                      }
                      else
                      {
                        uint64_t v57 = objc_msgSend_objectAtIndexedSubscript_(v46, v54, v53, v56);
                        uint64_t v61 = objc_msgSend_rangeValue(v57, v58, v59, v60);
                        uint64_t v63 = v62;

                        objc_msgSend_addAttribute_value_range_(v91, v64, @"__kIMPhotoSharingAttributeName", MEMORY[0x1E4F1CC08], v61, v63);
                        uint64_t v68 = objc_msgSend_dataDetector(IMIDSLog, v65, v66, v67);
                        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
                        {
                          v74 = objc_msgSend_objectAtIndexedSubscript_(v42, v69, v53, v70);
                          uint64_t v77 = objc_msgSend_objectAtIndexedSubscript_(v46, v75, v53, v76);
                          *(_DWORD *)long long buf = 138412546;
                          uint64_t v99 = v74;
                          __int16 v100 = 2112;
                          v101 = v77;
                          _os_log_debug_impl(&dword_191892000, v68, OS_LOG_TYPE_DEBUG, "Found photo sharing intent:%@(%@)", buf, 0x16u);
                        }
                        char v28 = 1;
                      }

                      ++v53;
                    }
                    while (v53 < objc_msgSend_count(v42, v71, v72, v73));
                  }

                  uint64_t v29 = v87;
                  id v21 = v88;
                  uint64_t v27 = v89;
                }

                ++v30;
              }
              while (v30 != v27);
              uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v94, (uint64_t)v102, 16);
            }
            while (v27);

            id v20 = v85;
            id v3 = v86;
            if (v28)
            {
              uint64_t v81 = 1;
LABEL_38:
              goto LABEL_33;
            }
          }
          else
          {
          }
          v84 = objc_msgSend_dataDetector(IMIDSLog, v78, v79, v80);
          if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG)) {
            sub_1918E0D70();
          }

          uint64_t v81 = 0;
          goto LABEL_38;
        }
        goto LABEL_30;
      }
    }
  }
LABEL_30:
  uint64_t v82 = objc_msgSend_dataDetector(IMIDSLog, v11, v12, v13);
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_191892000, v82, OS_LOG_TYPE_DEFAULT, "Failed to link ResponseKit symbols. Bailing.", buf, 2u);
  }
LABEL_32:

  uint64_t v81 = 0;
LABEL_33:

  return v81;
}

uint64_t IMSharedDDScanner()
{
  pthread_mutex_lock(&stru_1E92DA328);
  if (qword_1E92DB2A8 != -1) {
    dispatch_once(&qword_1E92DB2A8, &unk_1EE22F558);
  }
  uint64_t v1 = 0;
  if (!qword_1E92DB2B8)
  {
    qword_1E92DB2B8 = off_1E92DB298(0, 0, &v1);
    if (qword_1E92DB2B8)
    {
      if (qword_1E92DB2B0 != -1) {
        dispatch_once(&qword_1E92DB2B0, &unk_1EE22F578);
      }
      if (qword_1E92DB0A8 != -1) {
        dispatch_once(&qword_1E92DB0A8, &unk_1EE22F598);
      }
      off_1E92DB2A0(qword_1E92DB2B8, 2, 1);
      off_1E92DB2A0(qword_1E92DB2B8, 8, 1);
      off_1E92DB0A0(qword_1E92DB2B8, 2);
    }
  }
  pthread_mutex_unlock(&stru_1E92DA328);
  return qword_1E92DB2B8;
}

void *sub_1918AB90C()
{
  uint64_t result = (void *)IMWeakLinkSymbol();
  off_1E92DB298 = result;
  return result;
}

void *sub_1918AB93C()
{
  uint64_t result = (void *)IMWeakLinkSymbol();
  off_1E92DB2A0 = result;
  return result;
}

void *sub_1918AB96C()
{
  uint64_t result = (void *)IMWeakLinkSymbol();
  off_1E92DB0A0 = result;
  return result;
}

uint64_t IMSharedDDShortNumberScanner()
{
  pthread_mutex_lock(&stru_1E92DA328);
  if (qword_1E92DB2C8 != -1) {
    dispatch_once(&qword_1E92DB2C8, &unk_1EE22F5B8);
  }
  uint64_t v1 = 0;
  if (!qword_1E92DB2D0) {
    qword_1E92DB2D0 = off_1E92DB2C0(1, 0, &v1);
  }
  pthread_mutex_unlock(&stru_1E92DA328);
  return qword_1E92DB2D0;
}

void *sub_1918ABA30()
{
  uint64_t result = (void *)IMWeakLinkSymbol();
  off_1E92DB2C0 = result;
  return result;
}

BOOL IMDDScanAttributedStringWithContext(void *a1, void *a2, void *a3, void *a4, void *a5, char a6)
{
  return IMDDScanAttributedStringWithExtendedContext(a1, a2, a3, a4, a5, 0, a6);
}

BOOL IMDDScanAttributedStringWithExtendedContext(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, char a7)
{
  id v13 = a1;
  id v14 = a2;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  if (qword_1E92DB288 != -1) {
    dispatch_once(&qword_1E92DB288, &unk_1EE22F5D8);
  }
  BOOL v19 = 0;
  if (v13 && v14)
  {
    uint64_t v31 = 0;
    long long v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    id v20 = qword_1E92DB290;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1918ABCA0;
    v22[3] = &unk_1E5722FB0;
    id v23 = v14;
    char v30 = a7;
    id v24 = v18;
    uint64_t v29 = &v31;
    id v25 = v13;
    id v26 = v15;
    id v27 = v16;
    id v28 = v17;
    dispatch_sync(v20, v22);
    BOOL v19 = *((unsigned char *)v32 + 24) != 0;

    _Block_object_dispose(&v31, 8);
  }

  return v19;
}

void sub_1918ABC3C()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("IMDDScannerQueue", v2);
  uint64_t v1 = (void *)qword_1E92DB290;
  qword_1E92DB290 = (uint64_t)v0;
}

void sub_1918ABCA0(uint64_t a1)
{
  uint64_t v207 = *MEMORY[0x1E4F143B8];
  if (qword_1E92DB330 != -1) {
    dispatch_once(&qword_1E92DB330, &unk_1EE22F5F8);
  }
  if (qword_1E92DB328 != -1) {
    dispatch_once(&qword_1E92DB328, &unk_1EE22F618);
  }
  if (qword_1E92DB320 != -1) {
    dispatch_once(&qword_1E92DB320, &unk_1EE22F638);
  }
  if (qword_1E92DB318 != -1) {
    dispatch_once(&qword_1E92DB318, &unk_1EE22F658);
  }
  if (qword_1E92DB310 != -1) {
    dispatch_once(&qword_1E92DB310, &unk_1EE22F678);
  }
  uint64_t v2 = (uint64_t (*)(uint64_t, uint64_t, void *))off_1E92DB308;
  uint64_t v3 = IMSharedDDScanner();
  uint64_t v4 = *(void *)(a1 + 32);
  unint64_t v7 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 40), v5, @"ConversationID", v6);
  int v8 = v2(v3, v4, v7);

  uint64_t v9 = (uint64_t (*)(uint64_t, void))off_1E92DB300;
  uint64_t v10 = IMSharedDDShortNumberScanner();
  int v11 = v9(v10, *(void *)(a1 + 32));
  v185 = _PhotoSharingResponsesForString(*(void **)(a1 + 32), *(unsigned __int8 *)(a1 + 88));
  if (!v8 && !v11 && !v185)
  {
    id v15 = objc_msgSend_dataDetector(IMIDSLog, v12, v13, v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_1918E1150();
    }

    goto LABEL_173;
  }
  id v16 = objc_msgSend_dataDetector(IMIDSLog, v12, v13, v14);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_1918E1118();
  }

  if (v8)
  {
    id v20 = (uint64_t (*)(uint64_t, uint64_t))off_1E92DB2F0;
    uint64_t v21 = IMSharedDDScanner();
    if (qword_1E92DAEB0 != -1) {
      dispatch_once(&qword_1E92DAEB0, &unk_1EE22F6D8);
    }
    CFArrayRef theArray = (const __CFArray *)v20(v21, qword_1E92DAEA8);
    if (v11) {
      goto LABEL_23;
    }
LABEL_25:
    CFArrayRef v186 = 0;
    goto LABEL_26;
  }
  CFArrayRef theArray = 0;
  if (!v11) {
    goto LABEL_25;
  }
LABEL_23:
  uint64_t v22 = (uint64_t (*)(uint64_t, uint64_t))off_1E92DB2F0;
  uint64_t v23 = IMSharedDDShortNumberScanner();
  CFArrayRef v186 = (const __CFArray *)v22(v23, 8);
LABEL_26:
  id v24 = objc_msgSend_dataDetector(IMIDSLog, v17, v18, v19);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    sub_1918E10B0();
  }

  id v28 = objc_msgSend_dataDetector(IMIDSLog, v25, v26, v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    sub_1918E1048();
  }

  MutableCopy = 0;
  if (theArray && v186)
  {
    MutableCopy = CFArrayCreateMutableCopy(0, 0, v186);
    v208.size_t length = (int)CFArrayGetCount(theArray);
    v208.location = 0;
    CFArrayAppendArray(MutableCopy, theArray, v208);
    uint64_t v33 = (void (*)(__CFArray *, uint64_t, uint64_t))off_1E92DB2E8;
    uint64_t v34 = IMSharedDDScanner();
    v33(MutableCopy, v34, 32);
  }
  CFTypeRef cf = MutableCopy;
  if (v186) {
    uint64_t v35 = MutableCopy;
  }
  else {
    uint64_t v35 = theArray;
  }
  if (theArray) {
    CFArrayRef v36 = v35;
  }
  else {
    CFArrayRef v36 = v186;
  }
  uint64_t v37 = objc_msgSend_dataDetector(IMIDSLog, v29, v30, v31);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
    sub_1918E0FE0();
  }

  if (!v36) {
    goto LABEL_158;
  }
  uint64_t v41 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 40), v38, @"ConversationID", v40);
  uint64_t v44 = objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 40), v42, @"ServiceName", v43);
  uint64_t v45 = *(void **)(a1 + 56);
  char v46 = *(void **)(a1 + 64);
  uint64_t v47 = *(void **)(a1 + 72);
  int v168 = *(unsigned __int8 *)(a1 + 88);
  id v187 = *(id *)(a1 + 48);
  id v180 = v45;
  id v181 = v46;
  id v182 = v47;
  id v178 = v44;
  id v179 = v41;
  if (qword_1E92DAE98 != -1) {
    dispatch_once(&qword_1E92DAE98, &unk_1EE22F6F8);
  }
  if (qword_1E92DAEA0 != -1) {
    dispatch_once(&qword_1E92DAEA0, &unk_1EE230098);
  }
  if (!qword_1E92DAE80)
  {
    uint64_t v48 = (void **)IMWeakLinkSymbol();
    if (v48) {
      uint64_t v49 = *v48;
    }
    else {
      uint64_t v49 = 0;
    }
    objc_storeStrong((id *)&qword_1E92DAE80, v49);
  }
  if (!CFArrayGetCount(v36))
  {
    char v141 = 0;
    goto LABEL_157;
  }
  unint64_t v53 = objc_msgSend_dataDetector(IMIDSLog, v50, v51, v52);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
    sub_1918E0F78();
  }

  if ((int)CFArrayGetCount(v36) < 1)
  {
    LOBYTE(v55) = 0;
    goto LABEL_156;
  }
  CFIndex v54 = 0;
  uint64_t v169 = 0;
  uint64_t v170 = 0;
  LOBYTE(v55) = 0;
  while (2)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v36, v54);
    int v60 = off_1E92DAE88();
    switch(v60)
    {
      case 0:
        if (!off_1E92DAE90(ValueAtIndex, qword_1E92DAE80))
        {
          uint64_t v103 = objc_msgSend_dataDetector(IMIDSLog, v61, v62, v63);
          if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
          {
            *(void *)long long buf = 67109120;
            _os_log_impl(&dword_191892000, v103, OS_LOG_TYPE_DEFAULT, "Found result of type: %d", buf, 8u);
          }
          goto LABEL_84;
        }
        LOBYTE(v55) = sub_1918ADCF4(v187, v169, (uint64_t)ValueAtIndex);
        goto LABEL_151;
      case 1:
        int v104 = (sub_1918AD7AC(v187, (uint64_t)ValueAtIndex, @"__kIMDataDetectedAttributeName") | v55) & 1;
        int v55 = sub_1918ADA30(v187, (uint64_t)ValueAtIndex) | v104;
        goto LABEL_151;
      case 2:
        id v65 = v187;
        id v173 = v180;
        id v175 = v181;
        id v66 = v182;
        uint64_t v70 = objc_msgSend_dataDetector(IMIDSLog, v67, v68, v69);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
          sub_1918E0EE8(&v192, v193);
        }

        BOOL v71 = v187 == 0;
        if (!ValueAtIndex) {
          BOOL v71 = 1;
        }
        if (v71)
        {
          char v127 = 0;
        }
        else
        {
          id context = (void *)MEMORY[0x192FDE5A0]();
          uint64_t v72 = sub_1918ADFCC((uint64_t)ValueAtIndex);
          uint64_t v76 = objc_msgSend_dataDetector(IMIDSLog, v73, v74, v75);
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v72;
            _os_log_debug_impl(&dword_191892000, v76, OS_LOG_TYPE_DEBUG, "Found an phone number category %@", buf, 0xCu);
          }

          char v164 = sub_1918AD7AC(v65, (uint64_t)ValueAtIndex, @"__kIMPhoneNumberAttributeName");
          char v163 = sub_1918ADA30(v65, (uint64_t)ValueAtIndex);
          id v77 = v72;
          id v171 = v173;
          id v78 = v175;
          id v82 = v66;
          if (v168)
          {
            uint64_t v83 = objc_msgSend_dataDetector(IMIDSLog, v79, v80, v81);
            if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG)) {
              sub_1918E0EB8(&v194, v195);
            }
          }
          else
          {
            if (!qword_1E92DB4A8)
            {
              v133 = (void **)IMWeakLinkSymbol();
              if (v133) {
                v134 = *v133;
              }
              else {
                v134 = 0;
              }
              objc_storeStrong((id *)&qword_1E92DB4A8, v134);
            }
            v138 = (void *)qword_1E92DB4B0;
            if (!qword_1E92DB4B0)
            {
              id v139 = (void **)IMWeakLinkSymbol();
              if (v139) {
                id v140 = *v139;
              }
              else {
                id v140 = 0;
              }
              objc_storeStrong((id *)&qword_1E92DB4B0, v140);
              v138 = (void *)qword_1E92DB4B0;
            }
            sub_1918AE06C(v77, v171, v78, v82, (void *)qword_1E92DB4A8, v138);
          }

          char v127 = v164 | v163;
        }

        char v126 = v127 | v55;
        goto LABEL_150;
      case 3:
        id v172 = v187;
        id v174 = v180;
        id v176 = v181;
        id v84 = v182;
        id v88 = objc_msgSend_dataDetector(IMIDSLog, v85, v86, v87);
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG)) {
          sub_1918E0EE8(&v188, v189);
        }

        BOOL v89 = v187 == 0;
        if (!ValueAtIndex) {
          BOOL v89 = 1;
        }
        if (v89)
        {
          char v96 = 0;
        }
        else
        {
          v90 = (void *)MEMORY[0x192FDE5A0]();
          id v91 = sub_1918ADFCC((uint64_t)ValueAtIndex);
          long long v95 = objc_msgSend_dataDetector(IMIDSLog, v92, v93, v94);
          if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v91;
            _os_log_debug_impl(&dword_191892000, v95, OS_LOG_TYPE_DEBUG, "Found an address category %@", buf, 0xCu);
          }

          char v96 = sub_1918AD7AC(v172, (uint64_t)ValueAtIndex, @"__kIMAddressAttributeName");
          id v97 = v91;
          id v165 = v174;
          id contexta = v176;
          id v101 = v84;
          if (v168)
          {
            uint64_t v102 = objc_msgSend_dataDetector(IMIDSLog, v98, v99, v100);
            if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG)) {
              sub_1918E0EB8(&v190, v191);
            }
          }
          else
          {
            if (!qword_1E92DB450)
            {
              v131 = (void **)IMWeakLinkSymbol();
              if (v131) {
                uint64_t v132 = *v131;
              }
              else {
                uint64_t v132 = 0;
              }
              objc_storeStrong((id *)&qword_1E92DB450, v132);
            }
            uint64_t v135 = (void *)qword_1E92DB458;
            if (!qword_1E92DB458)
            {
              uint64_t v136 = (void **)IMWeakLinkSymbol();
              if (v136) {
                int v137 = *v136;
              }
              else {
                int v137 = 0;
              }
              objc_storeStrong((id *)&qword_1E92DB458, v137);
              uint64_t v135 = (void *)qword_1E92DB458;
            }
            sub_1918AE06C(v97, v165, contexta, v101, (void *)qword_1E92DB450, v135);
          }
        }

        goto LABEL_139;
      case 4:
        char v64 = sub_1918AD7AC(v187, (uint64_t)ValueAtIndex, @"__kIMCalendarEventAttributeName");
        goto LABEL_109;
      case 5:
        if (off_1E92DAE90(ValueAtIndex, qword_1E92DAE80))
        {
          uint64_t v105 = v169;
          if (!v169) {
            uint64_t v105 = (uint64_t)ValueAtIndex;
          }
          uint64_t v169 = v105;
          goto LABEL_151;
        }
        char v64 = sub_1918AD7AC(v187, (uint64_t)ValueAtIndex, @"__kIMDataDetectedAttributeName");
LABEL_109:
        char v126 = v64 | v55;
        goto LABEL_150;
      case 6:
        uint64_t v106 = v170;
        if (!v170) {
          uint64_t v106 = (uint64_t)ValueAtIndex;
        }
        uint64_t v170 = v106;
        id v107 = v187;
        uint64_t v108 = @"__kIMMoneyAttributeName";
        id v177 = v178;
        id v109 = v179;
        v113 = objc_msgSend_dataDetector(IMIDSLog, v110, v111, v112);
        if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG)) {
          sub_1918E0F48(&v200, v201);
        }

        if (ValueAtIndex) {
          BOOL v117 = v187 != 0;
        }
        else {
          BOOL v117 = 0;
        }
        if (v117)
        {
          uint64_t v118 = (void *)MEMORY[0x192FDE5A0]();
          double v198 = 0.0;
          uint64_t v199 = 0;
          if (qword_1E92DB4E0 != -1) {
            dispatch_once(&qword_1E92DB4E0, &unk_1EE22F7D8);
          }
          if (off_1E92DB4D8(ValueAtIndex, &v198, &v199) && v199 && (double v122 = v198, v198 != 0.0))
          {
            if (sub_1918AD7AC(v107, (uint64_t)ValueAtIndex, v108))
            {
              char v96 = 1;
LABEL_121:
              goto LABEL_122;
            }
          }
          else
          {
            v129 = objc_msgSend_dataDetector(IMIDSLog, v119, v120, v121, v122);
            if (os_log_type_enabled(v129, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 138412802;
              *(void *)&uint8_t buf[4] = ValueAtIndex;
              __int16 v203 = 2048;
              double v204 = v198;
              __int16 v205 = 2112;
              uint64_t v206 = v199;
              _os_log_debug_impl(&dword_191892000, v129, OS_LOG_TYPE_DEBUG, "Failed to extract amount and currency from money result. Result: %@, amount: %f, currencyCode: %@", buf, 0x20u);
            }
          }
          id v130 = objc_msgSend_dataDetector(IMIDSLog, v123, v124, v125);
          if (os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG)) {
            sub_1918E0F18(&v196, v197);
          }

          char v96 = 0;
          goto LABEL_121;
        }
        v128 = objc_msgSend_dataDetector(IMIDSLog, v114, v115, v116);
        if (os_log_type_enabled(v128, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = v187;
          __int16 v203 = 2112;
          double v204 = *(double *)&ValueAtIndex;
          _os_log_debug_impl(&dword_191892000, v128, OS_LOG_TYPE_DEBUG, "Failed to add detected money result due to invalid preconditions. attributedString: %@, result: %@", buf, 0x16u);
        }

        char v96 = 0;
LABEL_122:

LABEL_139:
        char v126 = v96 | v55;
LABEL_150:
        LOBYTE(v55) = v126 & 1;
LABEL_151:
        if (++v54 < (int)CFArrayGetCount(v36)) {
          continue;
        }
        if (v169) {
          LOBYTE(v55) = (sub_1918ADCF4(v187, v169, v170) | v55) & 1;
        }
LABEL_156:
        char v141 = v55 & 1;
LABEL_157:

        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = v141;
LABEL_158:
        v142 = objc_msgSend_dataDetector(IMIDSLog, v38, v39, v40);
        if (os_log_type_enabled(v142, OS_LOG_TYPE_DEBUG)) {
          sub_1918E0E50();
        }

        if (objc_msgSend_count(v185, v143, v144, v145))
        {
          char v149 = _AddDDPhotoSharingIntentResultToAttributedString(*(void **)(a1 + 48), v185);
          uint64_t v150 = *(void *)(*(void *)(a1 + 80) + 8);
          if (*(unsigned char *)(v150 + 24)) {
            char v151 = 1;
          }
          else {
            char v151 = v149;
          }
          *(unsigned char *)(v150 + 24) = v151;
        }
        v152 = objc_msgSend_dataDetector(IMIDSLog, v146, v147, v148);
        if (os_log_type_enabled(v152, OS_LOG_TYPE_DEBUG)) {
          sub_1918E0DE0(a1, v152, v153, v154, v155, v156, v157, v158);
        }

        v159 = (void (*)(uint64_t))off_1E92DB2F8;
        uint64_t v160 = IMSharedDDScanner();
        v159(v160);
        v161 = (void (*)(uint64_t))off_1E92DB2F8;
        uint64_t v162 = IMSharedDDShortNumberScanner();
        v161(v162);
        if (theArray) {
          CFRelease(theArray);
        }
        if (cf) {
          CFRelease(cf);
        }
        if (v186) {
          CFRelease(v186);
        }
LABEL_173:

        return;
      default:
        uint64_t v103 = objc_msgSend_dataDetector(IMIDSLog, v57, v58, v59);
        if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v60;
          _os_log_impl(&dword_191892000, v103, OS_LOG_TYPE_DEFAULT, "Found result of type: %d", buf, 8u);
        }
LABEL_84:

        goto LABEL_151;
    }
  }
}

void sub_1918ACD20(void *a1, int a2)
{
  objc_end_catch();
  if (a2 == 1)
  {
    id v12 = objc_begin_catch(a1);
    _IMWarn(@"Exception processing scanned message ID: %@   (%@)", v5, v6, v7, v8, v9, v10, v11, *(void *)(v2 + 56));

    objc_end_catch();
    JUMPOUT(0x1918ACBA0);
  }
  JUMPOUT(0x1918ACDE0);
}

void sub_1918ACD30(void *a1, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(a1);
    _IMWarn(@"Exception processing scanned message ID: %@   (%@)");

    objc_end_catch();
    JUMPOUT(0x1918ACBA0);
  }
  JUMPOUT(0x1918ACDE0);
}

void sub_1918ACDC8(void *a1, int a2)
{
  objc_end_catch();
  if (a2 == 1)
  {
    id v12 = objc_begin_catch(a1);
    _IMWarn(@"Exception scanning messageID: %@   (%@)", v5, v6, v7, v8, v9, v10, v11, *(void *)(v2 + 56));

    objc_end_catch();
    JUMPOUT(0x1918ACC24);
  }
  JUMPOUT(0x1918ACE28);
}

void sub_1918ACE18(_Unwind_Exception *a1)
{
}

void *sub_1918ACE4C()
{
  uint64_t result = (void *)IMWeakLinkSymbol();
  off_1E92DB308 = result;
  return result;
}

void *sub_1918ACE7C()
{
  uint64_t result = (void *)IMWeakLinkSymbol();
  off_1E92DB300 = result;
  return result;
}

void *sub_1918ACEAC()
{
  uint64_t result = (void *)IMWeakLinkSymbol();
  off_1E92DB2F8 = result;
  return result;
}

void *sub_1918ACEDC()
{
  uint64_t result = (void *)IMWeakLinkSymbol();
  off_1E92DB2F0 = result;
  return result;
}

void *sub_1918ACF0C()
{
  uint64_t result = (void *)IMWeakLinkSymbol();
  off_1E92DB2E8 = result;
  return result;
}

uint64_t IMSetThreadPriority(int a1)
{
  uint64_t v2 = pthread_self();
  sched_param v5 = (sched_param)0xAAAAAAAAAAAAAAAALL;
  int v4 = -1431655766;
  uint64_t result = pthread_getschedparam(v2, &v4, &v5);
  if (!result)
  {
    v5.sched_priority = a1;
    return pthread_setschedparam(v2, v4, &v5);
  }
  return result;
}

void IMEnumerateArrayInRange(void *a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  uint64_t v8 = a4;
  char v23 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v7;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v19, (uint64_t)v24, 16);
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = 0;
    unint64_t v15 = a2 + a3;
    uint64_t v16 = *(void *)v20;
LABEL_3:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v20 != v16) {
        objc_enumerationMutation(v9);
      }
      if (v14 + v17 >= a2) {
        v8[2](v8, *(void *)(*((void *)&v19 + 1) + 8 * v17));
      }
      if (v23 || v14 + v17 + 1 >= v15) {
        break;
      }
      if (v13 == ++v17)
      {
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v19, (uint64_t)v24, 16);
        v14 += v17;
        if (v13) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

BOOL IMPerformSystem(const char *a1)
{
  uint64_t v1 = popen(a1, "r");
  return pclose(v1) == 0;
}

void IMSubmitSimpleAggegateMetric(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (v3)
  {
    int v4 = dispatch_get_global_queue(-32768, 0);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = sub_1918AD1E4;
    v5[3] = &unk_1E5722FD8;
    id v6 = v3;
    uint64_t v7 = a2;
    dispatch_async(v4, v5);
  }
}

void sub_1918AD1E4(uint64_t a1)
{
  if (qword_1E92DB438 != -1) {
    dispatch_once(&qword_1E92DB438, &unk_1EE22F698);
  }
  uint64_t v2 = (void (*)(uint64_t, uint64_t))off_1E92DB430;
  if (off_1E92DB430)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v2(v3, v4);
  }
}

void *sub_1918AD258()
{
  uint64_t result = (void *)IMWeakLinkSymbol();
  off_1E92DB430 = result;
  return result;
}

void IMSubmitSimpleAWDMetric(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = dispatch_get_global_queue(-32768, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1918AD324;
  v5[3] = &unk_1E5722FF8;
  void v5[4] = a1;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

uint64_t sub_1918AD324(uint64_t a1)
{
  uint64_t result = IMWeakLinkClass();
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return MEMORY[0x1F4181798](result, sel_postMetricWithId_integerValue_, v3, v4);
  }
  return result;
}

__CFString *_IMFastCreateFormatString(void *a1, va_list a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = a1;
  CFMutableDictionaryRef Mutable = CFStringCreateMutable(0, 300);
  CFStringAppendFormatAndArguments(Mutable, 0, v3, a2);

  return Mutable;
}

__CFString *sub_1918AD3E4(uint64_t a1, uint64_t a2, void *a3, va_list a4)
{
  return _IMFastCreateFormatString(a3, a4);
}

id IMPreviewCachesDirectoryWithAttachmentURL(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    uint64_t v4 = objc_msgSend_path(a1, a2, a3, a4);
    uint64_t v6 = objc_msgSend_rangeOfString_options_(v4, v5, @"/var/mobile/Library/SMS/", 8);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v9 = 0;
    }
    else
    {
      uint64_t v10 = objc_msgSend_substringFromIndex_(v4, v7, (uint64_t)&v7[v6], v8);
      uint64_t v14 = objc_msgSend_stringByDeletingLastPathComponent(v10, v11, v12, v13);

      uint64_t v17 = objc_msgSend_arrayWithObjects_(MEMORY[0x1E4F1C978], v15, @"/var/mobile/Library/Caches/com.apple.MobileSMS", v16, @"Previews", v14, 0);
      long long v21 = objc_msgSend_pathWithComponents_(NSString, v18, (uint64_t)v17, v19);
      if (v21)
      {
        id v9 = objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x1E4F1CB10], v20, (uint64_t)v21, 1);
      }
      else
      {
        id v9 = 0;
      }
    }
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

__CFString *IMGetHostUUID()
{
  memset(v5, 170, sizeof(v5));
  v4.tv_sec = 0;
  v4.tv_nsec = 0;
  if (gethostuuid(v5, &v4) == -1)
  {
    uint64_t v2 = 0;
  }
  else
  {
    CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x1E4F1CFB0];
    CFUUIDRef v1 = CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], *(CFUUIDBytes *)v5);
    uint64_t v2 = (__CFString *)CFUUIDCreateString(v0, v1);
    if (v1) {
      CFRelease(v1);
    }
  }
  return v2;
}

void sub_1918AD5AC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  timespec v4 = objc_msgSend_controlCharacterSet(MEMORY[0x1E4F28B88], a2, a3, a4);
  uint64_t v8 = objc_msgSend_mutableCopy(v4, v5, v6, v7);

  objc_msgSend_invert(v8, v9, v10, v11);
  unint64_t v15 = objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E4F28B88], v12, v13, v14);
  objc_msgSend_formUnionWithCharacterSet_(v8, v16, (uint64_t)v15, v17);

  objc_msgSend_invert(v8, v18, v19, v20);
  __int16 v32 = 6158;
  int v31 = 537731084;
  id v21 = [NSString alloc];
  char v23 = objc_msgSend_initWithCharactersNoCopy_length_freeWhenDone_(v21, v22, (uint64_t)&v31, 3, 0);
  objc_msgSend_removeCharactersInString_(v8, v24, (uint64_t)v23, v25);
  uint64_t v29 = objc_msgSend_copy(v8, v26, v27, v28);
  uint64_t v30 = (void *)qword_1E92DB338;
  qword_1E92DB338 = v29;
}

void sub_1918AD688()
{
  CFAllocatorRef v0 = sub_1918A30F8();
  id v13 = (id)objc_msgSend_mutableCopy(v0, v1, v2, v3);

  objc_msgSend_addCharactersInString_(v13, v4, @"\uFFFC", v5);
  objc_msgSend_addCharactersInString_(v13, v6, @"\uFFFD", v7);
  uint64_t v11 = objc_msgSend_copy(v13, v8, v9, v10);
  uint64_t v12 = (void *)qword_1E92DB240;
  qword_1E92DB240 = v11;
}

uint64_t *sub_1918AD718()
{
  uint64_t result = (uint64_t *)IMWeakLinkSymbol();
  qword_1E92DAEA8 = *result;
  return result;
}

uint64_t (*sub_1918AD74C())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DAE88 = result;
  return result;
}

uint64_t (*sub_1918AD77C())(void, void)
{
  uint64_t result = (uint64_t (*)(void, void))IMWeakLinkSymbol();
  off_1E92DAE90 = result;
  return result;
}

uint64_t sub_1918AD7AC(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  uint64_t v10 = objc_msgSend_dataDetector(IMIDSLog, v7, v8, v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1918E120C();
  }

  uint64_t v11 = 0;
  if (v5 && a2)
  {
    if (qword_1E92DAE78 != -1) {
      dispatch_once(&qword_1E92DAE78, &unk_1EE22F778);
    }
    uint64_t v12 = (void *)MEMORY[0x192FDE5A0]();
    id v13 = (void *)IMWeakLinkClass();
    uint64_t v11 = objc_msgSend_resultFromCoreResult_(v13, v14, a2, v15);
    if (v11)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28DB0]);
      inited = objc_msgSend_initRequiringSecureCoding_(v16, v17, 0, v18);
      objc_msgSend_encodeObject_forKey_(inited, v20, v11, @"dd-result");
      objc_msgSend_encodeObject_forKey_(inited, v21, (uint64_t)&unk_1EE244B30, @"version");
      id v22 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      uint64_t v26 = objc_msgSend_encodedData(inited, v23, v24, v25);
      uint64_t v29 = objc_msgSend_initWithData_(v22, v27, (uint64_t)v26, v28);

      if (!v29)
      {
        uint64_t v33 = objc_msgSend_dataDetector(IMIDSLog, v30, v31, v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          sub_1918E1188();
        }

        uint64_t v29 = 0;
      }

      if (v29)
      {
        uint64_t v34 = off_1E92DAE70(a2);
        objc_msgSend_addAttribute_value_range_(v5, v35, (uint64_t)v6, (uint64_t)v29, v34, v35);

        uint64_t v11 = 1;
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
  }

  return v11;
}

#error "1918ADA0C: call analysis failed (funcsize=17)"

uint64_t sub_1918ADA30(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v7 = objc_msgSend_dataDetector(IMIDSLog, v4, v5, v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1918E12DC();
  }

  uint64_t v8 = 0;
  if (v3 && a2)
  {
    if (qword_1E92DB4C0 != -1) {
      dispatch_once(&qword_1E92DB4C0, &unk_1EE22F798);
    }
    if (qword_1E92DB4D0 != -1) {
      dispatch_once(&qword_1E92DB4D0, &unk_1EE22F7B8);
    }
    uint64_t v9 = (void *)MEMORY[0x192FDE5A0]();
    uint64_t v10 = off_1E92DB4B8(a2);
    uint64_t v12 = v11;
    id v13 = (void *)off_1E92DB4C8(a2);
    uint64_t v17 = v13;
    if (!v13)
    {
      uint64_t v8 = 0;
LABEL_31:

      goto LABEL_32;
    }
    objc_msgSend_urlFromString(v13, v14, v15, v16);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    id v22 = objc_msgSend_scheme(v18, v19, v20, v21);
    uint64_t v26 = objc_msgSend_lowercaseString(v22, v23, v24, v25);

    if ((objc_msgSend_isEqualToString_(v26, v27, @"http", v28) & 1) == 0
      && !objc_msgSend_isEqualToString_(v26, v29, @"https", v30))
    {
      int v42 = 0;
LABEL_23:

      if (v18) {
        int v54 = v42;
      }
      else {
        int v54 = 1;
      }
      if ((v54 & 1) == 0)
      {
        objc_msgSend_addAttribute_value_range_(v3, v53, @"__kIMLinkAttributeName", (uint64_t)v18, v10, v12);
        uint64_t v58 = objc_msgSend_dataDetector(IMIDSLog, v55, v56, v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
          sub_1918E1274();
        }
      }
      uint64_t v8 = v54 ^ 1u;

      goto LABEL_31;
    }
    id v31 = objc_alloc((Class)IMWeakLinkClass());
    uint64_t v35 = objc_msgSend_absoluteString(v18, v32, v33, v34);
    uint64_t v38 = objc_msgSend_initWithString_(v31, v36, (uint64_t)v35, v37);

    if (v38)
    {
      if (objc_opt_respondsToSelector())
      {
        int v42 = objc_msgSend__lp_userVisibleStringUsesEncodedHost(v38, v39, v40, v41);
LABEL_22:

        goto LABEL_23;
      }
      if (_IMWillLog(@"IMFoundationUtil")) {
        _IMAlwaysLog(0, @"IMFoundationUtil", @"Unable to invoke NSURL (LPExtras)", v48, v49, v50, v51, v52, v60);
      }
    }
    else if (_IMWillLog(@"IMFoundationUtil"))
    {
      _IMAlwaysLog(0, @"IMFoundationUtil", @"Either invalid URL:%@ OR URLForLP:%@", v43, v44, v45, v46, v47, (char)v18);
    }
    int v42 = 0;
    goto LABEL_22;
  }
LABEL_32:

  return v8;
}

uint64_t sub_1918ADCF4(void *a1, uint64_t a2, uint64_t a3)
{
  v33[3] = *MEMORY[0x1E4F143B8];
  id v8 = a1;
  if (qword_1E92DB4F0 != -1) {
    dispatch_once(&qword_1E92DB4F0, &unk_1EE22F7F8);
  }
  if (qword_1E92DB500 != -1) {
    dispatch_once(&qword_1E92DB500, &unk_1EE22F818);
  }
  if (qword_1E92DB510 != -1) {
    dispatch_once(&qword_1E92DB510, &unk_1EE22F838);
  }
  uint64_t v9 = objc_msgSend_dataDetector(IMIDSLog, v5, v6, v7);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_191892000, v9, OS_LOG_TYPE_DEFAULT, "Found an one time code result", buf, 2u);
  }

  uint64_t v10 = 0;
  if (v8 && a2)
  {
    uint64_t v11 = (void *)MEMORY[0x192FDE5A0]();
    uint64_t v12 = off_1E92DB4F8(a2);
    uint64_t v13 = off_1E92DB508(a2);
    uint64_t v14 = (void *)v13;
    if (v12) {
      BOOL v15 = v13 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    uint64_t v10 = !v15;
    if (!v15)
    {
      uint64_t v16 = off_1E92DB508(a3);
      if (objc_msgSend_length(v16, v17, v18, v19))
      {
        v32[0] = @"code";
        v32[1] = @"displayCode";
        v33[0] = v12;
        v33[1] = v14;
        v32[2] = @"displayMoneyAmount";
        v33[2] = v16;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v20, (uint64_t)v33, (uint64_t)v32, 3);
      }
      else
      {
        v30[0] = @"code";
        v30[1] = @"displayCode";
        v31[0] = v12;
        v31[1] = v14;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v20, (uint64_t)v31, (uint64_t)v30, 2);
      uint64_t v21 = };
      uint64_t v22 = off_1E92DB4E8(a2);
      off_1E92DB4E8(a2);
      objc_msgSend_addAttribute_value_range_(v8, v23, @"__kIMOneTimeCodeAttributeName", (uint64_t)v21, v22, v23);
      sub_1918AD7AC(v8, a2, @"__kIMDataDetectedAttributeName");
      uint64_t v27 = objc_msgSend_dataDetector(IMIDSLog, v24, v25, v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        sub_1918E1344();
      }
    }
  }

  return v10;
}

id sub_1918ADFCC(uint64_t a1)
{
  if (qword_1E92DB448 != -1) {
    dispatch_once(&qword_1E92DB448, &unk_1EE22F718);
  }
  uint64_t v2 = (void *)off_1E92DB440(a1);
  if (v2) {
    uint64_t v2 = (void *)CFRetain(v2);
  }
  return v2;
}

uint64_t (*sub_1918AE03C())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DB440 = result;
  return result;
}

void sub_1918AE06C(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v87 = a1;
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v85 = a6;
  if (!v12 || !v13 || !v11 || !v14 || !v87 || !v85) {
    _IMWarn(@"Trying to add event to core recents with missing arguments", v15, v16, v17, v18, v19, v20, v21, v84);
  }
  id v22 = v11;
  id v23 = v12;
  id v86 = v13;
  if (!qword_1E92DB460)
  {
    uint64_t v27 = (void **)IMWeakLinkSymbol();
    if (v27) {
      uint64_t v28 = *v27;
    }
    else {
      uint64_t v28 = 0;
    }
    objc_storeStrong((id *)&qword_1E92DB460, v28);
  }
  if (!qword_1E92DB468)
  {
    uint64_t v29 = (void **)IMWeakLinkSymbol();
    if (v29) {
      uint64_t v30 = *v29;
    }
    else {
      uint64_t v30 = 0;
    }
    objc_storeStrong((id *)&qword_1E92DB468, v30);
  }
  if (!qword_1E92DB470)
  {
    id v31 = (void **)IMWeakLinkSymbol();
    if (v31) {
      uint64_t v32 = *v31;
    }
    else {
      uint64_t v32 = 0;
    }
    objc_storeStrong((id *)&qword_1E92DB470, v32);
  }
  if (!qword_1E92DB478)
  {
    uint64_t v33 = (void **)IMWeakLinkSymbol();
    if (v33) {
      uint64_t v34 = *v33;
    }
    else {
      uint64_t v34 = 0;
    }
    objc_storeStrong((id *)&qword_1E92DB478, v34);
  }
  if (!qword_1E92DB480)
  {
    uint64_t v35 = (void **)IMWeakLinkSymbol();
    if (v35) {
      CFArrayRef v36 = *v35;
    }
    else {
      CFArrayRef v36 = 0;
    }
    objc_storeStrong((id *)&qword_1E92DB480, v36);
  }
  if (!qword_1E92DB488)
  {
    uint64_t v37 = (void **)IMWeakLinkSymbol();
    if (v37) {
      uint64_t v38 = *v37;
    }
    else {
      uint64_t v38 = 0;
    }
    objc_storeStrong((id *)&qword_1E92DB488, v38);
  }
  if (!qword_1E92DB490)
  {
    uint64_t v39 = (void **)IMWeakLinkSymbol();
    if (v39) {
      uint64_t v40 = *v39;
    }
    else {
      uint64_t v40 = 0;
    }
    objc_storeStrong((id *)&qword_1E92DB490, v40);
  }
  int v41 = objc_msgSend__appearsToBePhoneNumber(v23, v24, v25, v26);
  if (v41) {
    uint64_t v42 = 3;
  }
  else {
    uint64_t v42 = 2;
  }
  if (v41) {
    uint64_t v43 = &qword_1E92DB468;
  }
  else {
    uint64_t v43 = &qword_1E92DB460;
  }
  uint64_t v44 = IMNormalizeFormattedString(v23, v42);
  uint64_t v47 = objc_msgSend_stringWithFormat_(NSString, v45, @"sms:/open?message-guid=%@", v46, v22);
  uint64_t v50 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E4F1C9E8], v48, (uint64_t)v44, v49, qword_1E92DB480, *v43, qword_1E92DB488, 0);
  unint64_t v53 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E4F1C9E8], v51, (uint64_t)v86, v52, qword_1E92DB470, v50, qword_1E92DB490, v47, qword_1E92DB478, 0);
  uint64_t v57 = objc_msgSend_dataDetector(IMIDSLog, v54, v55, v56);
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
    sub_1918E1414();
  }

  uint64_t v58 = IMWeakLinkClass();
  if (v58)
  {
    uint64_t v62 = (void *)v58;
    id v66 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v59, v60, v61);
    uint64_t v67 = NSNumber;
    if (qword_1E92DB498 != -1) {
      dispatch_once(&qword_1E92DB498, &unk_1EE22F758);
    }
    uint64_t v68 = objc_msgSend_numberWithDouble_(v67, v63, v64, v65, *(double *)&qword_1E92DB4A0);
    uint64_t v70 = objc_msgSend_recentEventForAddress_displayName_kind_date_weight_metadata_options_(v62, v69, (uint64_t)v87, 0, v14, v66, v68, v53, 0);

    uint64_t v74 = objc_msgSend_defaultInstance(v62, v71, v72, v73);
    id v78 = IMSingleObjectArray(v70, v75, v76, v77);
    objc_msgSend_recordContactEvents_recentsDomain_sendingAddress_completion_(v74, v79, (uint64_t)v78, (uint64_t)v85, 0, &unk_1EE22F738);

    uint64_t v83 = objc_msgSend_dataDetector(IMIDSLog, v80, v81, v82);
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG)) {
      sub_1918E13AC();
    }
  }
}

void sub_1918AE540(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    uint64_t v6 = objc_msgSend_dataDetector(IMIDSLog, v2, v3, v4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1918E147C();
    }
  }
}

double sub_1918AE5A0()
{
  double result = *(double *)IMWeakLinkSymbol();
  qword_1E92DB4A0 = *(void *)&result;
  return result;
}

uint64_t (*sub_1918AE5D4())(void)
{
  double result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DAE70 = result;
  return result;
}

uint64_t (*sub_1918AE604())(void)
{
  double result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DB4B8 = result;
  return result;
}

uint64_t (*sub_1918AE634())(void)
{
  double result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DB4C8 = result;
  return result;
}

uint64_t (*sub_1918AE664())(void, void, void)
{
  double result = (uint64_t (*)(void, void, void))IMWeakLinkSymbol();
  off_1E92DB4D8 = result;
  return result;
}

uint64_t (*sub_1918AE694())(void)
{
  double result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DB4E8 = result;
  return result;
}

uint64_t (*sub_1918AE6C4())(void)
{
  double result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DB4F8 = result;
  return result;
}

uint64_t (*sub_1918AE6F4())(void)
{
  double result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DB508 = result;
  return result;
}

void sub_1918AE724(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

unsigned char *sub_1918AE740(unsigned char *result, unsigned char *a2)
{
  *double result = 0;
  *a2 = 0;
  return result;
}

void sub_1918AE750(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void sub_1918AE7B0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

uint64_t sub_1918AEDB8()
{
  qword_1E92DB368 = objc_alloc_init(IMFileManager);
  return MEMORY[0x1F41817F8]();
}

void *sub_1918AEFE8()
{
  double result = (void *)IMWeakLinkSymbol();
  off_1E92DB518 = result;
  return result;
}

void *sub_1918AF1F8()
{
  double result = (void *)IMWeakLinkSymbol();
  off_1E92DB200 = result;
  return result;
}

void *sub_1918AF330()
{
  double result = (void *)IMWeakLinkSymbol();
  off_1E92DB1A0 = result;
  return result;
}

void *sub_1918AF41C()
{
  double result = (void *)IMWeakLinkSymbol();
  off_1E92DB528 = result;
  return result;
}

uint64_t sub_1918AF44C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_objectForKey_(a1, a2, @"HFSFileFlags", a4);
  uint64_t v8 = objc_msgSend_unsignedShortValue(v4, v5, v6, v7);

  return v8;
}

uint64_t sub_1918AF48C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_objectForKey_(a1, a2, @"HFSResourceForkSize", a4);
  uint64_t v8 = v4;
  if (v4) {
    uint64_t v9 = objc_msgSend_unsignedLongLongValue(v4, v5, v6, v7);
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

CFTypeRef sub_1918AF4DC()
{
  CFTypeRef result = *(CFTypeRef *)IMWeakLinkSymbol();
  qword_1E92DB540 = (uint64_t)result;
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

CFTypeRef sub_1918AF52C()
{
  CFTypeRef result = *(CFTypeRef *)IMWeakLinkSymbol();
  qword_1E92DB258 = (uint64_t)result;
  if (result)
  {
    return CFRetain(result);
  }
  return result;
}

uint64_t sub_1918AFFBC()
{
  qword_1EB273C30 = objc_alloc_init(IMWeakObjectCache);
  return MEMORY[0x1F41817F8]();
}

__CFString *MachineNameString()
{
  return @"Home";
}

CFTypeRef IMStringForSocketAddress(void *a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v1 = a1;
  uint64_t v5 = objc_msgSend_bytes(v1, v2, v3, v4);
  uint64_t v6 = v5;
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v34[11] = v7;
  *(_OWORD *)uint64_t v34 = v7;
  long long v33 = v7;
  long long v32 = v7;
  long long v31 = v7;
  long long v30 = v7;
  long long v29 = v7;
  long long v28 = v7;
  long long v27 = v7;
  long long v26 = v7;
  long long v25 = v7;
  long long v24 = v7;
  long long v23 = v7;
  long long v22 = v7;
  long long v21 = v7;
  long long v20 = v7;
  *(_DWORD *)__s = 0;
  if (v5)
  {
    int v8 = *(unsigned __int8 *)(v5 + 1);
    if (v8 == 2)
    {
      id v13 = (char *)malloc_type_calloc(1uLL, 0x11uLL, 0x842C5DDBuLL);
      if (inet_ntop(2, (const void *)(v6 + 4), v13, 0x11u))
      {
        id v14 = [NSString alloc];
        size_t v15 = strlen(v13);
        uint64_t v6 = objc_msgSend_initWithBytes_length_encoding_(v14, v16, (uint64_t)v13, v15, 1);
      }
      else
      {
        uint64_t v6 = 0;
      }
      free(v13);
    }
    else if (v8 == 30 && inet_ntop(30, (const void *)(v5 + 8), __s, 0x2Fu))
    {
      id v9 = [NSString alloc];
      size_t v10 = strlen(__s);
      uint64_t v6 = objc_msgSend_initWithBytes_length_encoding_(v9, v11, (uint64_t)__s, v10, 1);
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  id v17 = (id)v6;
  CFTypeRef v12 = CFAutorelease(v17);

  return v12;
}

uint64_t IsPersonalFirewallOn(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x1E4F1C9E8], a2, @"/Library/Preferences/com.apple.sharing.firewall.plist", a4);
  long long v7 = objc_msgSend_objectForKey_(v4, v5, @"state", v6);
  uint64_t v11 = objc_msgSend_BOOLValue(v7, v8, v9, v10);

  return v11;
}

uint64_t IsPersonalFirewallBlockingPort(int a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x1E4F1C9E8], a2, @"/Library/Preferences/com.apple.sharing.firewall.plist", a4);
  int v8 = objc_msgSend_objectForKey_(v5, v6, @"state", v7);
  int v12 = objc_msgSend_BOOLValue(v8, v9, v10, v11);

  if (!v12)
  {
    uint64_t v50 = 0;
    goto LABEL_24;
  }
  size_t v15 = objc_msgSend_objectForKey_(v5, v13, @"allports", v14);
  int v19 = objc_msgSend_count(v15, v16, v17, v18);
  unsigned int v22 = v19 - 1;
  if (v19 < 1)
  {
    uint64_t v50 = 1;
    goto LABEL_23;
  }
  uint64_t v52 = v5;
  uint64_t v23 = v19 + 1;
  while (1)
  {
    objc_msgSend_objectAtIndex_(v15, v20, v22, v21);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = objc_msgSend_rangeOfString_(v24, v25, @"-", v26);
    if (v28) {
      break;
    }
    if (objc_msgSend_isEqualToString_(v24, 0, @"*", v29))
    {
    }
    else
    {
      int v49 = objc_msgSend_intValue(v24, v42, v43, v44);

      if (v49 == a1) {
        goto LABEL_21;
      }
    }
LABEL_17:
    --v23;
    --v22;
    if (v23 <= 1)
    {
      uint64_t v50 = 1;
      goto LABEL_22;
    }
  }
  uint64_t v30 = v27;
  long long v31 = objc_msgSend_substringToIndex_(v24, v28, v27, v29);
  uint64_t v34 = objc_msgSend_substringFromIndex_(v24, v32, v30 + 1, v33);
  if (objc_msgSend_length(v31, v35, v36, v37)) {
    int v41 = objc_msgSend_intValue(v31, v38, v39, v40);
  }
  else {
    int v41 = 0;
  }
  if (objc_msgSend_length(v34, v38, v39, v40)) {
    int v48 = objc_msgSend_intValue(v34, v45, v46, v47);
  }
  else {
    int v48 = 0xFFFF;
  }

  if (v41 > a1 || v48 < a1) {
    goto LABEL_17;
  }
LABEL_21:
  uint64_t v50 = 0;
LABEL_22:
  uint64_t v5 = v52;
LABEL_23:

LABEL_24:
  return v50;
}

uint64_t OpenSystemPreferencePaneAnchor()
{
  return 1;
}

uint64_t IMPCInterfaceName()
{
  CFAllocatorRef v0 = (void *)IMWeakLinkClass();
  uint64_t v3 = objc_msgSend_sharedInstanceForIdentifier_(v0, v1, 1, v2);
  if (objc_opt_respondsToSelector()) {
    uint64_t v7 = objc_msgSend_wwanInterfaceName(v3, v4, v5, v6);
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

BOOL IMPCDoesInterfaceExist()
{
  CFAllocatorRef v0 = IMPCInterfaceName();
  uint64_t v4 = v0;
  if (v0) {
    BOOL v5 = objc_msgSend_length(v0, v1, v2, v3) != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

BOOL IMGetIDSSettings(void *a1, char *a2, void *a3, unsigned char *a4, unsigned char *a5)
{
  uint64_t v10 = objc_msgSend_arrayWithObjects_(MEMORY[0x1E4F1C978], a2, @"com.apple.private.ids", (uint64_t)a4, 0);
  BOOL v11 = sub_191899AFC(a1, a2, a3, a4, a5, @"/AppleInternal/Library/Conference/Environments.plist", v10, @"https://init.ess.apple.com/WebObjects/VCInit.woa/wa/getBag?ix=3");

  return v11;
}

id IMGetiMessageTopic()
{
  id v6 = 0;
  IMGetiMessageSettings(0, 0, &v6, 0, 0);
  id v0 = v6;
  uint64_t v4 = objc_msgSend_lastObject(v0, v1, v2, v3);

  return v4;
}

id IMGetSPSEnvironmentName()
{
  if (_IMWillLog(@"Settings")) {
    _IMAlwaysLog(0, @"Settings", @"in IMGetSPSEnvironmentName", v2, v3, v4, v5, v6, v31);
  }
  uint64_t v7 = (void *)qword_1E92DB548;
  if (!qword_1E92DB548)
  {
    uint64_t v8 = IMGetCachedDomainValueForKey(@"com.apple.ids", @"sps-env");
    uint64_t v9 = (void *)qword_1E92DB548;
    qword_1E92DB548 = v8;

    uint64_t v7 = (void *)qword_1E92DB548;
  }
  uint64_t v10 = objc_msgSend_length(v7, v0, v1, v2);
  if (!v10) {
    goto LABEL_10;
  }
  uint64_t isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_((void *)qword_1E92DB548, v11, @"canary", v13);
  if (isEqualToIgnoringCase)
  {
    uint64_t v18 = IMGetEnvironmentName(isEqualToIgnoringCase, v15, v16, v17);
    uint64_t v21 = objc_msgSend_isEqualToIgnoringCase_(v18, v19, @"ven1-external", v20);
    if (v21)
    {

LABEL_10:
      IMGetEnvironmentName(v10, v11, v12, v13);
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    long long v25 = IMGetEnvironmentName(v21, v22, v23, v24);
    char v28 = objc_msgSend_isEqualToIgnoringCase_(v25, v26, @"ven2-external", v27);

    if (v28) {
      goto LABEL_10;
    }
  }
  id v29 = (id)qword_1E92DB548;
LABEL_12:
  return v29;
}

id IMGetSPSCustomURL()
{
  id v0 = (void *)qword_1E92DAFA0;
  if (!qword_1E92DAFA0)
  {
    uint64_t v1 = IMGetCachedDomainValueForKey(@"com.apple.ids", @"custom-sps-bag-url");
    uint64_t v2 = (void *)qword_1E92DAFA0;
    qword_1E92DAFA0 = v1;

    id v0 = (void *)qword_1E92DAFA0;
  }
  return v0;
}

uint64_t IMShouldUseSystemAuthentication()
{
  return 1;
}

uint64_t IMShouldUseCustomAuthentication()
{
  return 0;
}

void IMTimingStartTimingForKey(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v13 = a1;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  if (IMShouldLog(v14, a2))
  {
    id v17 = v13;
    id v18 = v14;
    id v19 = v15;
    id v22 = v16;
    if (qword_1E92DB558 != -1) {
      dispatch_once(&qword_1E92DB558, &unk_1EE22FAD8);
    }
    objc_msgSend_startTimingForKey_((void *)qword_1E92DB550, v20, (uint64_t)v17, v21);
    id v23 = objc_alloc(MEMORY[0x1E4F28E78]);
    long long v25 = objc_msgSend_initWithFormat_arguments_(v23, v24, (uint64_t)v22, (uint64_t)&a9);
    double v26 = IMTimeOfDay();
    objc_msgSend_appendFormat_(v25, v27, @" (Time Started: %f)", v28, *(void *)&v26, &a9);
    IMLogString();
    if (IMOSLoggingEnabled())
    {
      id v29 = OSLogHandleForIMFoundationCategory("Timing");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v36 = v25;
        _os_log_impl(&dword_191892000, v29, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }
    }
    if (IMShouldLog(@"Messages", 0)) {
      sub_1918B11B8();
    }
    if (_IMWillLog(@"Timing")) {
      _IMAlwaysLog(0, @"Timing", @"%@", v30, v31, v32, v33, v34, (char)v25);
    }
  }
}

void IMTimingStopTimingForKey(void *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v13 = a1;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  if (IMShouldLog(v14, a2))
  {
    id v17 = v13;
    id v18 = v14;
    id v19 = v15;
    id v20 = v16;
    if (objc_msgSend_hasKey_((void *)qword_1E92DB550, v21, (uint64_t)v17, v22))
    {
      objc_msgSend_stopTimingForKey_((void *)qword_1E92DB550, v23, (uint64_t)v17, v24);
      objc_msgSend_totalTimeForKey_((void *)qword_1E92DB550, v25, (uint64_t)v17, v26);
      uint64_t v28 = v27;
      id v29 = objc_alloc(MEMORY[0x1E4F28E78]);
      uint64_t v31 = objc_msgSend_initWithFormat_arguments_(v29, v30, (uint64_t)v20, (uint64_t)&a9);
      double v32 = IMTimeOfDay();
      objc_msgSend_appendFormat_(v31, v33, @" (Time Finished: %f   Total Time: %f)", v34, *(void *)&v32, v28);
      uint64_t v42 = 0;
      IMLogString();
      if (IMOSLoggingEnabled())
      {
        uint64_t v35 = OSLogHandleForIMFoundationCategory("Timing");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v44 = v31;
          _os_log_impl(&dword_191892000, v35, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
        }
      }
      if (IMShouldLog(@"Messages", 0))
      {
        uint64_t v42 = v31;
        sub_1918B11B8();
      }
      if (_IMWillLog(@"Timing")) {
        _IMAlwaysLog(0, @"Timing", @"%@", v37, v38, v39, v40, v41, (char)v31);
      }
      objc_msgSend_removeTimingForKey_((void *)qword_1E92DB550, v36, (uint64_t)v17, v37, v42);
    }
  }
}

uint64_t sub_1918B117C()
{
  qword_1E92DB550 = objc_alloc_init(IMTimingCollection);
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918B11B8()
{
  uint64_t result = IMShouldLog(@"Messages", 0);
  if (result) {
    return IMLogString_V();
  }
  return result;
}

id sub_1918B1820(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  memset(v13, 170, 20);
  id v1 = a1;
  uint64_t v5 = (const void *)objc_msgSend_bytes(v1, v2, v3, v4, *(void *)v13, *(void *)&v13[8], *(void *)&v13[16], v14);
  CC_LONG v9 = objc_msgSend_length(v1, v6, v7, v8);
  CC_SHA1(v5, v9, v13);
  BOOL v11 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v10, (uint64_t)v13, 20);
  return v11;
}

id sub_1918B18CC(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v1 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v14 = v1;
  long long v15 = v1;
  id v2 = a1;
  uint64_t v6 = (const void *)objc_msgSend_bytes(v2, v3, v4, v5, v14, v15);
  CC_LONG v10 = objc_msgSend_length(v2, v7, v8, v9);
  CC_SHA256(v6, v10, (unsigned __int8 *)&v14);
  uint64_t v12 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v11, (uint64_t)&v14, 32);
  return v12;
}

uint64_t sub_1918B1974(void *a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  *(void *)&c.wbuf[14] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&c.wbuf[6] = v5;
  *(_OWORD *)&c.wbuf[10] = v5;
  *(_OWORD *)&c.hash[6] = v5;
  *(_OWORD *)&c.wbuf[2] = v5;
  *(_OWORD *)c.count = v5;
  *(_OWORD *)&c.hash[2] = v5;
  CC_SHA256_Init(&c);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = a1;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v24, (uint64_t)v29, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v6);
        }
        long long v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend_maximumLengthOfBytesUsingEncoding_(v14, v9, 4, v10);
        uint64_t v16 = malloc_type_malloc(2 * v15, 0x1000040BDFB0063uLL);
        *(void *)len = 0;
        uint64_t v20 = objc_msgSend_length(v14, v17, v18, v19);
        if (objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_(v14, v21, (uint64_t)v16, v15, len, 4, 0, 0, v20, 0))CC_SHA256_Update(&c, v16, len[0]); {
        free(v16);
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v24, (uint64_t)v29, 16);
    }
    while (v11);
  }

  return CC_SHA256_Final(a3, &c);
}

id sub_1918B1B18(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v8[0] = v4;
  v8[1] = v4;
  objc_msgSend__SHA256Bytes_(a1, a2, (uint64_t)v8, a4);
  id v6 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v5, (uint64_t)v8, 32);
  return v6;
}

id sub_1918B1B98(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v8[0] = v4;
  v8[1] = v4;
  objc_msgSend__SHA256Bytes_(a1, a2, (uint64_t)v8, a4);
  id v6 = objc_msgSend___imHexStringOfBytes_withLength_(MEMORY[0x1E4F1C9B8], v5, (uint64_t)v8, 32);
  return v6;
}

uint64_t sub_1918B1C6C()
{
  qword_1EB273C38 = objc_alloc_init(IMDeviceSupport);
  return MEMORY[0x1F41817F8]();
}

uint64_t (*sub_1918B1F34())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1EB2738F8 = result;
  return result;
}

void *sub_1918B1F64()
{
  uint64_t result = (void *)IMWeakLinkSymbol();
  off_1EB2738C0 = result;
  return result;
}

uint64_t (*sub_1918B1F94())(void, void, void, void)
{
  uint64_t result = (uint64_t (*)(void, void, void, void))IMWeakLinkSymbol();
  off_1EB2738D0 = result;
  return result;
}

uint64_t (*sub_1918B1FC4())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1EB2738E0 = result;
  return result;
}

void sub_1918B207C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (!v2[2] || !v2[4] || !v2[3])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v21 = (id)objc_msgSend_initWithContentsOfFile_(v3, v4, @"/System/Library/CoreServices/SystemVersion.plist", v5);
    uint64_t v8 = objc_msgSend_objectForKey_(v21, v6, @"ProductBuildVersion", v7);
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 32);
    *(void *)(v9 + 32) = v8;

    uint64_t v13 = objc_msgSend_objectForKey_(v21, v11, @"ProductVersion", v12);
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void **)(v14 + 24);
    *(void *)(v14 + 24) = v13;

    uint64_t v18 = objc_msgSend_objectForKey_(v21, v16, @"ProductName", v17);
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v20 = *(void **)(v19 + 16);
    *(void *)(v19 + 16) = v18;
  }
}

int *sub_1918B25D8()
{
  uint64_t result = (int *)IMWeakLinkSymbol();
  dword_1EB273790 = *result;
  return result;
}

BOOL sub_1918B260C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  long long v4 = objc_msgSend_methodSignature(a1, a2, a3, a4);
  BOOL v8 = objc_msgSend_methodReturnLength(v4, v5, v6, v7) != 0;

  return v8;
}

void sub_1918B2E6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1918B3060(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1918B31C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1918B32D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1918B33BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1918B3484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t IMGetKeychainPassword(void *a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v9 = a3;
  if (a1 && objc_msgSend_length(v5, v6, v7, v8) && objc_msgSend_length(v9, v10, v11, v12))
  {
    OSStatus v24 = 0;
    id v23 = 0;
    uint64_t v13 = IMGetKeychainData(&v23, v5, v9, 0, &v24);
    id v14 = v23;
    uint64_t v18 = v14;
    if (v13)
    {
      if (objc_msgSend_length(v14, v15, v16, v17))
      {
        id v19 = [NSString alloc];
        *a1 = (id)objc_msgSend_initWithData_encoding_(v19, v20, (uint64_t)v18, 4);
      }
    }
    else
    {
      id v21 = objc_msgSend_keychain(IMRGLog, v15, v16, v17);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67109120;
        OSStatus v26 = v24;
        _os_log_impl(&dword_191892000, v21, OS_LOG_TYPE_DEFAULT, "IMGetKeychainPassword: Could not get password (error %d)", buf, 8u);
      }
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

uint64_t IMGetKeychainData(void *a1, void *a2, void *a3, void *a4, OSStatus *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = v9;
  id v13 = v10;
  id v17 = v11;
  if (a5) {
    *a5 = 0;
  }
  if (!objc_msgSend_length(v12, v14, v15, v16))
  {
    long long v25 = objc_msgSend_warning(IMRGLog, v18, v19, v20);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      sub_1918E14E4((uint64_t)v13, v25);
    }
    goto LABEL_25;
  }
  if (!objc_msgSend_length(v13, v18, v19, v20))
  {
    long long v25 = objc_msgSend_warning(IMRGLog, v21, v22, v23);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      sub_1918E155C((uint64_t)v12, v25);
    }
LABEL_25:
    uint64_t v36 = 0;
    goto LABEL_26;
  }
  OSStatus v24 = (const void *)*MEMORY[0x1E4F3B880];
  long long v25 = v17;
  CFAllocatorRef v26 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  id v27 = v13;
  id v28 = v12;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v26, 0, 0, 0);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B878], v24);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B850], v28);

  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5C0], v27);
  if (objc_msgSend_length(v25, v30, v31, v32)) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B550], v25);
  }
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BC70], (const void *)*MEMORY[0x1E4F1CFD0]);
  CFTypeRef result = 0;
  OSStatus v33 = SecItemCopyMatching(Mutable, &result);
  uint64_t v34 = (void *)result;
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (a5) {
    *a5 = v33;
  }
  if (v33) {
    BOOL v35 = 1;
  }
  else {
    BOOL v35 = v34 == 0;
  }
  uint64_t v36 = !v35;
  if (a1 && v36) {
    *a1 = v34;
  }

LABEL_26:
  return v36;
}

BOOL IMSetKeychainPassword(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (objc_msgSend_length(v5, v8, v9, v10)
    && objc_msgSend_length(v6, v11, v12, v13)
    && objc_msgSend_length(v7, v14, v15, v16))
  {
    uint64_t v19 = objc_msgSend_dataUsingEncoding_(v5, v17, 4, v18);
    OSStatus v26 = 0;
    BOOL v23 = sub_1918B4CF4(v19, v6, v7, @"apple", &v26, 1, 1, 2);
    if (!v23)
    {
      OSStatus v24 = objc_msgSend_warning(IMRGLog, v20, v21, v22);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        sub_1918E15D4();
      }
    }
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

BOOL IMRemoveKeychainPassword(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v3;
  id v6 = v4;
  if (objc_msgSend_length(v5, v7, v8, v9) && objc_msgSend_length(v6, v10, v11, v12))
  {
    OSStatus v19 = 0;
    BOOL v16 = sub_1918B53A4(v5, v6, (const void *)*MEMORY[0x1E4F3B880], &v19);
    if (!v16)
    {
      id v17 = objc_msgSend_warning(IMRGLog, v13, v14, v15);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        sub_1918E163C();
      }
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

uint64_t IMGetKeychainAuthToken(void *a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (sub_1918B3D68(a1, v5, v6))
  {
    uint64_t v10 = 1;
  }
  else if (objc_msgSend_hasMobileMeSuffix(v6, v7, v8, v9))
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v11 = ValidMobileMeDomains();
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v26, (uint64_t)v30, 16);
    if (v13)
    {
      uint64_t v17 = v13;
      uint64_t v18 = *(void *)v27;
      while (2)
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v11);
          }
          uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * v19);
          uint64_t v21 = objc_msgSend_stripMobileMSuffixIfPresent(v6, v14, v15, v16);
          OSStatus v24 = objc_msgSend_stringByAppendingFormat_((void *)v21, v22, @"@%@", v23, v20);

          LOBYTE(v21) = sub_1918B3D68(a1, v5, v24);
          if (v21)
          {
            uint64_t v10 = 1;
            goto LABEL_15;
          }
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v26, (uint64_t)v30, 16);
        if (v17) {
          continue;
        }
        break;
      }
    }
    uint64_t v10 = 0;
LABEL_15:
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t sub_1918B3D68(void *a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v9 = a3;
  if (a1 && objc_msgSend_length(v5, v6, v7, v8) && objc_msgSend_length(v9, v10, v11, v12))
  {
    uint64_t v16 = objc_msgSend_lowercaseString(v9, v13, v14, v15);
    if (objc_msgSend_hasPrefix_(v16, v17, @"e:", v18))
    {
      uint64_t v21 = objc_msgSend_substringFromIndex_(v16, v19, 2, v20);

      uint64_t v16 = (void *)v21;
    }

    objc_msgSend_stringWithFormat_(NSString, v22, @"%@-AuthToken", v23, v16);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    OSStatus v35 = 0;
    id v34 = 0;
    uint64_t v24 = IMGetKeychainData(&v34, v5, v9, @"apple", &v35);
    id v25 = v34;
    long long v29 = v25;
    if (v24)
    {
      if (objc_msgSend_length(v25, v26, v27, v28))
      {
        id v30 = [NSString alloc];
        *a1 = (id)objc_msgSend_initWithData_encoding_(v30, v31, (uint64_t)v29, 4);
      }
    }
    else
    {
      uint64_t v32 = objc_msgSend_keychain(IMRGLog, v26, v27, v28);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67109120;
        OSStatus v37 = v35;
        _os_log_impl(&dword_191892000, v32, OS_LOG_TYPE_DEFAULT, "IMGetKeychainAuthToken: Could not get auth token (error: %d)", buf, 8u);
      }
    }
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

BOOL IMSetKeychainAuthToken(void *a1, void *a2, void *a3)
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (objc_msgSend_length(v6, v8, v9, v10) && objc_msgSend_length(v7, v11, v12, v13))
  {
    if (objc_msgSend_hasMobileMeSuffix(v7, v14, v15, v16))
    {
      id v67 = v5;
      uint64_t v20 = objc_msgSend_mobileMeDomain(v7, v17, v18, v19);
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      uint64_t v21 = ValidMobileMeDomains();
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v68, (uint64_t)v73, 16);
      if (v23)
      {
        uint64_t v26 = v23;
        uint64_t v27 = *(void *)v69;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v69 != v27) {
              objc_enumerationMutation(v21);
            }
            long long v29 = *(void **)(*((void *)&v68 + 1) + 8 * i);
            if ((objc_msgSend_hasSuffix_(v29, v24, (uint64_t)v20, v25) & 1) == 0)
            {
              uint64_t v31 = objc_msgSend_stripMobileMSuffixIfPresent(v7, v24, v30, v25);
              id v34 = objc_msgSend_stringByAppendingFormat_(v31, v32, @"@%@", v33, v29);

              sub_1918B4228(v6, v34);
            }
          }
          uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v68, (uint64_t)v73, 16);
        }
        while (v26);
      }

      id v5 = v67;
    }
    id v35 = v5;
    id v36 = v6;
    id v37 = v7;
    if (objc_msgSend_length(v35, v38, v39, v40)
      && objc_msgSend_length(v36, v41, v42, v43)
      && objc_msgSend_length(v37, v44, v45, v46))
    {
      uint64_t v50 = objc_msgSend_lowercaseString(v37, v47, v48, v49);
      if (objc_msgSend_hasPrefix_(v50, v51, @"e:", v52))
      {
        uint64_t v55 = objc_msgSend_substringFromIndex_(v50, v53, 2, v54);

        uint64_t v50 = (void *)v55;
      }

      objc_msgSend_stringWithFormat_(NSString, v56, @"%@-AuthToken", v57, v50);
      id v37 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v60 = objc_msgSend_dataUsingEncoding_(v35, v58, 4, v59);
      OSStatus v72 = 0;
      BOOL v64 = sub_1918B4CF4(v60, v36, v37, @"apple", &v72, 0, 1, 2);
      if (!v64)
      {
        uint64_t v65 = objc_msgSend_warning(IMRGLog, v61, v62, v63);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT)) {
          sub_1918E16A4();
        }
      }
    }
    else
    {
      BOOL v64 = 0;
    }
  }
  else
  {
    BOOL v64 = 0;
  }

  return v64;
}

BOOL sub_1918B4228(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (objc_msgSend_length(v3, v5, v6, v7) && objc_msgSend_length(v4, v8, v9, v10))
  {
    uint64_t v14 = objc_msgSend_lowercaseString(v4, v11, v12, v13);
    if (objc_msgSend_hasPrefix_(v14, v15, @"e:", v16))
    {
      uint64_t v19 = objc_msgSend_substringFromIndex_(v14, v17, 2, v18);

      uint64_t v14 = (void *)v19;
    }

    objc_msgSend_stringWithFormat_(NSString, v20, @"%@-AuthToken", v21, v14);
    id v4 = (id)objc_claimAutoreleasedReturnValue();

    OSStatus v28 = 0;
    BOOL v25 = sub_1918B53A4(v3, v4, (const void *)*MEMORY[0x1E4F3B880], &v28);
    if (!v25)
    {
      uint64_t v26 = objc_msgSend_warning(IMRGLog, v22, v23, v24);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        sub_1918E170C();
      }
    }
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

BOOL IMRemoveKeychainAuthToken(void *a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if (objc_msgSend_length(v3, v5, v6, v7) && objc_msgSend_length(v4, v8, v9, v10))
  {
    if (objc_msgSend_hasMobileMeSuffix(v4, v11, v12, v13))
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v14 = ValidMobileMeDomains();
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v30, (uint64_t)v34, 16);
      if (v16)
      {
        uint64_t v20 = v16;
        uint64_t v21 = *(void *)v31;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v31 != v21) {
              objc_enumerationMutation(v14);
            }
            uint64_t v23 = *(void *)(*((void *)&v30 + 1) + 8 * v22);
            uint64_t v24 = objc_msgSend_stripMobileMSuffixIfPresent(v4, v17, v18, v19);
            uint64_t v27 = objc_msgSend_stringByAppendingFormat_(v24, v25, @"@%@", v26, v23);

            sub_1918B4228(v3, v27);
            ++v22;
          }
          while (v20 != v22);
          uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v30, (uint64_t)v34, 16);
        }
        while (v20);
      }
    }
    BOOL v28 = sub_1918B4228(v3, v4);
  }
  else
  {
    BOOL v28 = 0;
  }

  return v28;
}

void IMSetKeychainDataWithProtectionWithCompletion(void *a1, void *a2, void *a3, void *a4, int a5, void *a6)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  if (objc_msgSend_length(v12, v16, v17, v18)
    && objc_msgSend_length(v13, v19, v20, v21)
    && objc_msgSend_length(v11, v22, v23, v24))
  {
    uint64_t v68 = 0;
    long long v69 = &v68;
    uint64_t v70 = 0x2020000000;
    int v71 = 0;
    BOOL v25 = (const void **)MEMORY[0x1E4F3B578];
    if (a5) {
      BOOL v25 = (const void **)MEMORY[0x1E4F3B590];
    }
    if (a5 == 1) {
      uint64_t v26 = (const void **)MEMORY[0x1E4F3B5B8];
    }
    else {
      uint64_t v26 = v25;
    }
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
    BOOL v28 = (const void *)*MEMORY[0x1E4F3B878];
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B878], (const void *)*MEMORY[0x1E4F3B880]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B558], *v26);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B850], v12);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5C0], v13);
    if (objc_msgSend_length(v14, v29, v30, v31)) {
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B550], v14);
    }
    long long v32 = (const void *)*MEMORY[0x1E4F1CFD0];
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BC68], (const void *)*MEMORY[0x1E4F1CFD0]);
    CFTypeRef result = 0;
    OSStatus v33 = SecItemCopyMatching(Mutable, &result);
    *((_DWORD *)v69 + 6) = v33;
    id v37 = objc_msgSend_keychain(IMRGLog, v34, v35, v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = *((_DWORD *)v69 + 6);
      *(_DWORD *)long long buf = 134218240;
      CFTypeRef v75 = result;
      __int16 v76 = 1024;
      int v77 = v38;
      _os_log_impl(&dword_191892000, v37, OS_LOG_TYPE_DEFAULT, "Found existing item %p error: %d", buf, 0x12u);
    }

    uint64_t v42 = objc_msgSend_keychain(IMRGLog, v39, v40, v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_191892000, v42, OS_LOG_TYPE_DEFAULT, "Trying to add query as item", buf, 2u);
    }

    CFDictionarySetValue(Mutable, v28, v32);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD38], v11);
    uint64_t v61 = MEMORY[0x1E4F143A8];
    uint64_t v62 = 3221225472;
    uint64_t v63 = sub_1918B4AD0;
    BOOL v64 = &unk_1E57232C0;
    id v66 = &v68;
    id v43 = v15;
    id v65 = v43;
    *((_DWORD *)v69 + 6) = _SecItemAddAndNotifyOnSync();
    uint64_t v47 = objc_msgSend_keychain(IMRGLog, v44, v45, v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      int v48 = *((_DWORD *)v69 + 6);
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v75) = v48;
      _os_log_impl(&dword_191892000, v47, OS_LOG_TYPE_DEFAULT, "   _SecItemAddAndNotifyOnSync result: %d", buf, 8u);
    }

    if (objc_msgSend_length(v14, v49, v50, v51))
    {
      objc_msgSend_stringWithFormat_(NSString, v52, @"   accessGroup: %@", v53, v14);
      uint64_t v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v54 = &stru_1EE231AD8;
    }
    if (*((_DWORD *)v69 + 6))
    {
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = sub_1918B4C58;
      v55[3] = &unk_1E57232E8;
      uint64_t v60 = &v68;
      id v56 = v12;
      id v57 = v13;
      uint64_t v58 = v54;
      id v59 = v43;
      dispatch_async(MEMORY[0x1E4F14428], v55);
    }
    if (result)
    {
      CFRelease(result);
      CFTypeRef result = 0;
    }
    if (Mutable) {
      CFRelease(Mutable);
    }

    _Block_object_dispose(&v68, 8);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1918B4A88;
    block[3] = &unk_1E5722E30;
    id v73 = v15;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void sub_1918B4A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

uint64_t sub_1918B4A88(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t IMGetSecAttrDataProtectionClassFromKeychainDataProtectionClass(int a1)
{
  uint64_t v1 = MEMORY[0x1E4F3B5B8];
  uint64_t v2 = MEMORY[0x1E4F3B578];
  if (a1) {
    uint64_t v2 = MEMORY[0x1E4F3B590];
  }
  if (a1 != 1) {
    uint64_t v1 = v2;
  }
  return *(void *)v1;
}

void sub_1918B4AD0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  int v5 = (int)a2;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v7 = objc_msgSend_warning(IMRGLog, a2, a3, a4);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      uint64_t v8 = @"NO";
      int v9 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      if (v5) {
        uint64_t v8 = @"YES";
      }
      *(_DWORD *)long long buf = 67109634;
      int v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      uint64_t v20 = a3;
      _os_log_fault_impl(&dword_191892000, v7, OS_LOG_TYPE_FAULT, "IMSetKeychainData: %d -- Got callback from _SecItemAddAndNotifyOnSync despite original call failing. didSync: %@ CallbackError: %@", buf, 0x1Cu);
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1918B4C40;
    block[3] = &unk_1E5723298;
    uint64_t v10 = *(id *)(a1 + 32);
    char v14 = v5;
    id v12 = v10;
    uint64_t v13 = a3;
    dispatch_async(MEMORY[0x1E4F14428], block);
    uint64_t v7 = v12;
  }
}

uint64_t sub_1918B4C40(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

uint64_t sub_1918B4C58(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  int v5 = objc_msgSend_warning(IMRGLog, a2, a3, a4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    sub_1918E1774();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

BOOL IMSetKeychainData(void *a1, void *a2, void *a3, void *a4, int a5, OSStatus *a6)
{
  return sub_1918B4CF4(a1, a2, a3, a4, a6, a5, 1, 2);
}

BOOL IMSetKeychainDataWithProtection(void *a1, void *a2, void *a3, void *a4, int a5, char a6, int a7, OSStatus *a8)
{
  return sub_1918B4CF4(a1, a2, a3, a4, a8, a5, a6, a7);
}

BOOL sub_1918B4CF4(void *a1, void *a2, void *a3, void *a4, OSStatus *a5, int a6, char a7, int a8)
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v15 = a1;
  id v16 = a2;
  id v17 = a3;
  id v21 = a4;
  if (a5) {
    *a5 = 0;
  }
  if (objc_msgSend_length(v16, v18, v19, v20)
    && objc_msgSend_length(v17, v22, v23, v24)
    && objc_msgSend_length(v15, v25, v26, v27))
  {
    char v80 = a7;
    uint64_t v81 = v15;
    BOOL v28 = (void **)MEMORY[0x1E4F3B578];
    if (a8) {
      BOOL v28 = (void **)MEMORY[0x1E4F3B590];
    }
    if (a8 == 1) {
      long long v29 = (void **)MEMORY[0x1E4F3B5B8];
    }
    else {
      long long v29 = v28;
    }
    CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
    int v77 = (const void *)*MEMORY[0x1E4F3B880];
    CFTypeRef v75 = (const void *)*MEMORY[0x1E4F1CFC8];
    if (a6) {
      uint64_t v31 = (const void *)*MEMORY[0x1E4F3B880];
    }
    else {
      uint64_t v31 = (const void *)*MEMORY[0x1E4F1CFC8];
    }
    key = (void *)*MEMORY[0x1E4F3B878];
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B878], v31);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B850], v16);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5C0], v17);
    if (objc_msgSend_length(v21, v32, v33, v34)) {
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B550], v21);
    }
    id value = *v29;
    uint64_t v35 = (const void *)*MEMORY[0x1E4F3BC68];
    uint64_t v36 = (const void *)*MEMORY[0x1E4F1CFD0];
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BC68], (const void *)*MEMORY[0x1E4F1CFD0]);
    CFTypeRef result = 0;
    OSStatus v37 = SecItemCopyMatching(Mutable, &result);
    uint64_t v41 = objc_msgSend_keychain(IMRGLog, v38, v39, v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218240;
      *(void *)char v84 = result;
      *(_WORD *)&v84[8] = 1024;
      *(_DWORD *)&v84[10] = v37;
      _os_log_impl(&dword_191892000, v41, OS_LOG_TYPE_DEFAULT, "Found item %p  error: %d", buf, 0x12u);
    }

    if (result)
    {
      CFDictionaryRemoveValue(Mutable, v35);
      uint64_t v45 = (const void *)*MEMORY[0x1E4F3B550];
      CFDictionaryRemoveValue(Mutable, (const void *)*MEMORY[0x1E4F3B550]);
      uint64_t v46 = CFDictionaryCreateMutable(allocator, 0, 0, 0);
      if (objc_msgSend_length(v21, v47, v48, v49)) {
        CFDictionaryAddValue(v46, v45, v21);
      }
      CFDictionaryAddValue(Mutable, key, v77);
      if ((v80 & 1) == 0) {
        CFDictionaryAddValue(v46, (const void *)*MEMORY[0x1E4F3B888], &unk_1EE244B60);
      }
      CFDictionaryAddValue(v46, (const void *)*MEMORY[0x1E4F3B558], value);
      uint64_t v53 = objc_msgSend_keychain(IMRGLog, v50, v51, v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)char v84 = Mutable;
        *(_WORD *)&v84[8] = 2112;
        *(void *)&v84[10] = v46;
        _os_log_impl(&dword_191892000, v53, OS_LOG_TYPE_DEFAULT, "Trying to update item with query: %@   update: %@", buf, 0x16u);
      }

      CFDictionaryAddValue(v46, (const void *)*MEMORY[0x1E4F3BD38], v81);
      OSStatus v54 = SecItemUpdate(Mutable, v46);
      uint64_t v58 = objc_msgSend_keychain(IMRGLog, v55, v56, v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)char v84 = v54;
        _os_log_impl(&dword_191892000, v58, OS_LOG_TYPE_DEFAULT, "   Result: %d", buf, 8u);
      }

      if (v46) {
        CFRelease(v46);
      }
    }
    else
    {
      uint64_t v63 = objc_msgSend_keychain(IMRGLog, v42, v43, v44);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_191892000, v63, OS_LOG_TYPE_DEFAULT, "Trying to add query as item", buf, 2u);
      }

      if (a6) {
        BOOL v64 = v36;
      }
      else {
        BOOL v64 = v75;
      }
      CFDictionarySetValue(Mutable, key, v64);
      if ((v80 & 1) == 0) {
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B888], &unk_1EE244B60);
      }
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BD38], v81);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B558], value);
      OSStatus v54 = SecItemAdd(Mutable, 0);
      uint64_t v68 = objc_msgSend_keychain(IMRGLog, v65, v66, v67);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)char v84 = v54;
        _os_log_impl(&dword_191892000, v68, OS_LOG_TYPE_DEFAULT, "   Result: %d", buf, 8u);
      }
    }
    if (result)
    {
      CFRelease(result);
      CFTypeRef result = 0;
    }
    if (objc_msgSend_length(v21, v59, v60, v61))
    {
      objc_msgSend_stringWithFormat_(NSString, v69, @"   accessGroup: %@", v71, v21);
      OSStatus v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      OSStatus v72 = &stru_1EE231AD8;
    }
    BOOL v62 = v54 == 0;
    if (v54)
    {
      id v73 = objc_msgSend_warning(IMRGLog, v69, v70, v71);
      if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)long long buf = 67109890;
        *(_DWORD *)char v84 = v54;
        *(_WORD *)&v84[4] = 2112;
        *(void *)&v84[6] = v16;
        *(_WORD *)&v84[14] = 2112;
        *(void *)&v84[16] = v17;
        __int16 v85 = 2112;
        id v86 = v72;
        _os_log_fault_impl(&dword_191892000, v73, OS_LOG_TYPE_FAULT, "IMSetKeychainData: %d -- Could not store data for service: %@   account: %@%@", buf, 0x26u);
      }
    }
    else
    {
      id v73 = objc_msgSend_keychain(IMRGLog, v69, v70, v71);
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)char v84 = v16;
        *(_WORD *)&v84[8] = 2112;
        *(void *)&v84[10] = v17;
        _os_log_impl(&dword_191892000, v73, OS_LOG_TYPE_DEFAULT, "Stored password data for service: %@   account: %@", buf, 0x16u);
      }
    }

    if (Mutable) {
      CFRelease(Mutable);
    }
    if (a5) {
      *a5 = v54;
    }

    id v15 = (id)v81;
  }
  else
  {
    BOOL v62 = 0;
  }

  return v62;
}

BOOL IMRemoveKeychainData(void *a1, void *a2, OSStatus *a3)
{
  return sub_1918B53A4(a1, a2, (const void *)*MEMORY[0x1E4F3B880], a3);
}

BOOL sub_1918B53A4(void *a1, void *a2, const void *a3, OSStatus *a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v11 = a2;
  if (a4) {
    *a4 = 0;
  }
  if (objc_msgSend_length(v7, v8, v9, v10) && objc_msgSend_length(v11, v12, v13, v14))
  {
    id v15 = v7;
    id v16 = v11;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B878], a3);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B850], v15);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B5C0], v16);
    id v21 = objc_msgSend_keychain(IMRGLog, v18, v19, v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 138412290;
      *(void *)uint64_t v31 = Mutable;
      _os_log_impl(&dword_191892000, v21, OS_LOG_TYPE_DEFAULT, "IMRemoveKeychainData: Removing item matching: %@", (uint8_t *)&v30, 0xCu);
    }

    OSStatus v22 = SecItemDelete(Mutable);
    if (v22 == -25300) {
      OSStatus v26 = 0;
    }
    else {
      OSStatus v26 = v22;
    }
    BOOL v27 = v26 == 0;
    if (v26)
    {
      BOOL v28 = objc_msgSend_warning(IMRGLog, v23, v24, v25);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        int v30 = 67109634;
        *(_DWORD *)uint64_t v31 = v26;
        *(_WORD *)&v31[4] = 2112;
        *(void *)&v31[6] = v15;
        __int16 v32 = 2112;
        id v33 = v16;
        _os_log_fault_impl(&dword_191892000, v28, OS_LOG_TYPE_FAULT, "IMRemoveKeychainData: %d -- Could not remove data for service: %@   account: %@", (uint8_t *)&v30, 0x1Cu);
      }
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (a4) {
      *a4 = v26;
    }
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

uint64_t IMGetTemporaryKeychainPassword(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = sub_1918B5670(a2);
  uint64_t v10 = objc_msgSend_lowercaseString(v5, v7, v8, v9);

  uint64_t v11 = IMGetKeychainPassword(a1, v6, v10);
  return v11;
}

id sub_1918B5670(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_length(v1, v2, v3, v4))
  {
    objc_msgSend_stringWithFormat_(NSString, v5, @"%@_temporary", v6, v1);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v1;
  }
  uint64_t v8 = v7;

  return v8;
}

BOOL IMSetTemporaryKeychainPassword(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (objc_msgSend_length(v5, v8, v9, v10)
    && objc_msgSend_length(v6, v11, v12, v13)
    && objc_msgSend_length(v7, v14, v15, v16))
  {
    id v17 = sub_1918B5670(v6);

    uint64_t v20 = objc_msgSend_dataUsingEncoding_(v5, v18, 4, v19);
    OSStatus v31 = 0;
    uint64_t v24 = objc_msgSend_lowercaseString(v7, v21, v22, v23);
    BOOL v25 = sub_1918B4CF4(v20, v17, v24, @"apple", &v31, 0, 1, 2);

    if (!v25)
    {
      long long v29 = objc_msgSend_warning(IMRGLog, v26, v27, v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        sub_1918E1818();
      }
    }
    id v6 = v17;
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

BOOL IMRemoveTemporaryKeychainPassword(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1918B5670(a1);
  BOOL v5 = IMRemoveKeychainPassword(v4, v3);

  return v5;
}

uint64_t IMIterateOverItemsOfService(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v11 = a2;
  if (!v11)
  {
    _IMWarn(@"Empty iterator for service iteration: %@", (uint64_t)v4, v5, v6, v7, v8, v9, v10, (char)v3);
LABEL_20:
    uint64_t v23 = 0;
    goto LABEL_21;
  }
  if (!objc_msgSend_length(v3, v4, v5, v6))
  {
    _IMWarn(@"Empty service query", v12, v13, v14, v15, v16, v17, v18, v27);
    goto LABEL_20;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)*MEMORY[0x1E4F3B988]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B878], (const void *)*MEMORY[0x1E4F3B880]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3B850], v3);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BB80], (const void *)*MEMORY[0x1E4F3BB88]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E4F3BC68], (const void *)*MEMORY[0x1E4F1CFD0]);
  CFTypeRef result = 0;
  OSStatus v20 = SecItemCopyMatching(Mutable, &result);
  if (Mutable) {
    CFRelease(Mutable);
  }
  CFTypeRef v21 = result;
  if (v20) {
    BOOL v22 = 1;
  }
  else {
    BOOL v22 = result == 0;
  }
  uint64_t v23 = !v22;
  if (!v22)
  {
    if (CFArrayGetCount((CFArrayRef)result) >= 1)
    {
      CFIndex v24 = 0;
      do
      {
        BOOL v25 = CFArrayGetValueAtIndex((CFArrayRef)result, v24);
        v11[2](v11, v25);

        ++v24;
      }
      while (v24 < CFArrayGetCount((CFArrayRef)result));
    }
    CFTypeRef v21 = result;
  }
  if (v21) {
    CFRelease(v21);
  }
LABEL_21:

  return v23;
}

uint64_t IMDeleteItemsForService(void *a1)
{
  id v1 = a1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1918B5AD8;
  v5[3] = &unk_1E5722CC0;
  id v6 = v1;
  id v2 = v1;
  uint64_t v3 = IMIterateOverItemsOfService(v2, v5);

  return v3;
}

void sub_1918B5AD8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void **)(a1 + 32);
  objc_msgSend_objectForKey_(a2, (const char *)a2, *MEMORY[0x1E4F3B5C0], a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  sub_1918B53A4(v4, v5, (const void *)*MEMORY[0x1E4F3B880], 0);
}

uint64_t IMGetKeychainDataProtectionClassFromSecAttrDataProtectionClass(CFStringRef theString2)
{
  if (CFStringCompare((CFStringRef)*MEMORY[0x1E4F3B5B8], theString2, 0)) {
    return 2 * (CFStringCompare((CFStringRef)*MEMORY[0x1E4F3B578], theString2, 0) != kCFCompareEqualTo);
  }
  else {
    return 1;
  }
}

void sub_1918B5BB4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 8u);
}

void sub_1918B5EFC(uint64_t a1, char a2, void *a3)
{
  id v5 = (void *)MEMORY[0x192FDE5A0]();
  id v6 = a3;
  if (_IMWillLog(@"Network")) {
    _IMAlwaysLog(0, @"Network", @"Change to %@, posting notification in %f seconds", v9, v10, v11, v12, v13, a2);
  }
  objc_msgSend__clearIPCache(v6, v7, v8, v9);
}

void sub_1918B6510(const __SCDynamicStore *a1, char *a2, CFTypeRef *a3)
{
  uint64_t v3 = a3;
  if (a2) {
    *a2 = 0;
  }
  if (a3) {
    *a3 = 0;
  }
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  id v6 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  CFStringRef v8 = (const __CFString *)*MEMORY[0x1E4F41AC8];
  NetworkGlobalEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkGlobalEntity(v5, (CFStringRef)*MEMORY[0x1E4F41AC8], (CFStringRef)*MEMORY[0x1E4F41B10]);
  CFArrayAppendValue(Mutable, NetworkGlobalEntity);
  uint64_t v10 = (__CFString *)SCDynamicStoreKeyCreateNetworkGlobalEntity(v5, v8, (CFStringRef)*MEMORY[0x1E4F41B18]);
  CFArrayAppendValue(Mutable, v10);
  uint64_t v11 = CFArrayCreateMutable(v5, 0, v6);
  CFStringRef entity = (const __CFString *)*MEMORY[0x1E4F41AF8];
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(v5, v8, (CFStringRef)*MEMORY[0x1E4F41AB8], (CFStringRef)*MEMORY[0x1E4F41AF8]);
  CFArrayAppendValue(v11, NetworkServiceEntity);
  CFRelease(NetworkServiceEntity);
  CFDictionaryRef v13 = SCDynamicStoreCopyMultiple(a1, Mutable, v11);
  CFRelease(Mutable);
  CFRelease(v11);
  Value = (__CFString *)CFDictionaryGetValue(v13, NetworkGlobalEntity);
  if (_IMWillLog(@"Network"))
  {
    objc_msgSend_description(NetworkGlobalEntity, v15, v16, v17);
    id v18 = objc_claimAutoreleasedReturnValue();
    char v22 = objc_msgSend_UTF8String(v18, v19, v20, v21);
    objc_msgSend_description(Value, v23, v24, v25);
    id v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_UTF8String(v26, v27, v28, v29);
    _IMAlwaysLog(0, @"Network", @"UpdateNetworkLinkQuality - IPv4 netKey: %s, netValue: %s", v30, v31, v32, v33, v34, v22);
  }
  if (!Value) {
    goto LABEL_11;
  }
  CFTypeID v35 = CFGetTypeID(Value);
  if (v35 != CFDictionaryGetTypeID())
  {
    Value = 0;
LABEL_11:
    uint64_t v36 = 0;
    goto LABEL_12;
  }
  uint64_t v36 = CFDictionaryGetValue((CFDictionaryRef)Value, (const void *)*MEMORY[0x1E4F41AD8]);
  Value = (__CFString *)CFDictionaryGetValue((CFDictionaryRef)Value, (const void *)*MEMORY[0x1E4F41AE0]);
LABEL_12:
  CFRelease(NetworkGlobalEntity);
  if (!v36 || !Value)
  {
    OSStatus v37 = (void *)CFDictionaryGetValue(v13, v10);
    if (_IMWillLog(@"Network"))
    {
      objc_msgSend_description(v10, v38, v39, v40);
      id v41 = objc_claimAutoreleasedReturnValue();
      char v45 = objc_msgSend_UTF8String(v41, v42, v43, v44);
      objc_msgSend_description(v37, v46, v47, v48);
      uint64_t v70 = v3;
      id v49 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_UTF8String(v49, v50, v51, v52);
      _IMAlwaysLog(0, @"Network", @"UpdateNetworkLinkQuality - IPv6 netKey: %s, netValue: %s", v53, v54, v55, v56, v57, v45);

      uint64_t v3 = v70;
    }
    if (v37)
    {
      CFTypeID v58 = CFGetTypeID(v37);
      if (v58 == CFDictionaryGetTypeID())
      {
        uint64_t v36 = CFDictionaryGetValue((CFDictionaryRef)v37, (const void *)*MEMORY[0x1E4F41AD8]);
        Value = (__CFString *)CFDictionaryGetValue((CFDictionaryRef)v37, (const void *)*MEMORY[0x1E4F41AE0]);
      }
    }
  }
  CFRelease(v10);
  char v59 = 0;
  if (!v36)
  {
    uint64_t v60 = a2;
    if (!a2) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  uint64_t v60 = a2;
  if (Value)
  {
    CFStringRef v61 = SCDynamicStoreKeyCreateNetworkServiceEntity(v5, v8, Value, entity);
    BOOL v62 = v3;
    uint64_t v63 = CFDictionaryGetValue(v13, v61);
    CFRelease(v61);
    BOOL v64 = v63 == 0;
    uint64_t v3 = v62;
    char v59 = !v64;
  }
  if (a2) {
LABEL_25:
  }
    char *v60 = v59;
LABEL_26:
  if (v3 && v36) {
    CFTypeRef *v3 = CFRetain(v36);
  }
  if (_IMWillLog(@"Network")) {
    _IMAlwaysLog(0, @"Network", @"UpdateNetworkLinkQuality - primaryLinkIsCellular = %d", v65, v66, v67, v68, v69, v59);
  }
  if (v13)
  {
    CFRelease(v13);
  }
}

__CFString *MobileMeBrandName(int a1)
{
  if (a1 == 1) {
    return @"me.com";
  }
  else {
    return @"Mac.com";
  }
}

id MobileMeSuffix(uint64_t a1, char a2)
{
  unsigned int v2 = a1;
  if (a2)
  {
    uint64_t v3 = NSString;
    uint64_t v4 = MobileMeSuffix(a1, 0);
    uint64_t v7 = objc_msgSend_stringWithFormat_(v3, v5, @"@%@", v6, v4);
  }
  else
  {
    uint64_t v4 = ValidMobileMeDomains();
    unint64_t v11 = objc_msgSend_count(v4, v8, v9, v10);
    uint64_t v12 = ValidMobileMeDomains();
    uint64_t v15 = v12;
    if (v11 <= v2) {
      objc_msgSend_objectAtIndex_(v12, v13, 0, v14);
    }
    else {
    uint64_t v7 = objc_msgSend_objectAtIndex_(v12, v13, v2, v14);
    }
  }
  return v7;
}

id sub_1918B6D24(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unsigned int v2 = ValidMobileMeDomains();
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v4)
  {
    uint64_t v7 = v4;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v2);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        unint64_t v11 = objc_msgSend_stringWithFormat_(NSString, v5, @"@%@", v6, v10);
        char hasSuffix = objc_msgSend_hasSuffix_(a1, v12, (uint64_t)v11, v13);

        if (hasSuffix)
        {
          id v15 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v5, (uint64_t)&v17, (uint64_t)v21, 16);
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_11:

  return v15;
}

BOOL sub_1918B6E80(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_mobileMeDomain(a1, a2, a3, a4);
  BOOL v5 = v4 != 0;

  return v5;
}

id sub_1918B6EB4(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = objc_msgSend_mobileMeDomain(a1, a2, a3, a4);
  if (v8)
  {
    uint64_t v9 = objc_msgSend_length(a1, v5, v6, v7);
    uint64_t v13 = objc_msgSend_length(v8, v10, v11, v12);
    objc_msgSend_substringWithRange_(a1, v14, 0, v9 + ~v13);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = a1;
  }
  uint64_t v16 = v15;

  return v16;
}

uint64_t sub_1918B7058()
{
  qword_1E92DB560 = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

uint64_t IMSetAssertionFailureHandler(uint64_t result)
{
  qword_1E92DB570 = result;
  return result;
}

uint64_t IMGetAssertionFailureHandler()
{
  return qword_1E92DB570;
}

void sub_1918B761C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1918B7688(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1918B7A60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F4181798](a2, sel__postScreenLocked, a3, a4);
}

uint64_t sub_1918B7A68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F4181798](a2, sel__postScreenSaverStarted, a3, a4);
}

void sub_1918B7AF4()
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB273AD0);
  if (dword_1E92DB260)
  {
    IONotificationPortSetDispatchQueue((IONotificationPortRef)qword_1E92DB268, 0);
    IODeregisterForSystemPower(dword_1E92DB270);
    IOServiceClose(dword_1E92DB260);
    IONotificationPortDestroy((IONotificationPortRef)qword_1E92DB268);
    dword_1E92DB260 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB273AD0);
}

void sub_1918B7E08(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_sharedInstance(IMSystemMonitor, a2, a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWatchesSystemLockState_(v6, v4, 1, v5);
}

void sub_1918B81F0()
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB273AD0);
  if (!dword_1E92DB260)
  {
    dword_1E92DB260 = IORegisterForSystemPower(0, (IONotificationPortRef *)&qword_1E92DB268, (IOServiceInterestCallback)sub_1918BA078, dword_1E92DB270);
    if (dword_1E92DB260)
    {
      uint64_t v7 = (IONotificationPort *)qword_1E92DB268;
      uint64_t v8 = im_primary_queue();
      IONotificationPortSetDispatchQueue(v7, v8);
    }
    else
    {
      _IMWarn(@"IORegisterForSystemPower failed", v0, v1, v2, v3, v4, v5, v6, v9);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB273AD0);
}

uint64_t sub_1918B9264(uint64_t a1)
{
  uint64_t result = IMGetDomainBoolForKey(@"com.apple.conference", @"restoredFromBackup");
  if (result)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    return objc_msgSend__deliverNotificationSelector_(v5, v3, (uint64_t)sel_systemDidFinishMigration, v4);
  }
  return result;
}

uint64_t sub_1918B93B0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend__deliverNotificationSelector_(*(void **)(a1 + 32), a2, (uint64_t)sel_systemDidStopBackup, a4);
}

uint64_t sub_1918B9430(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend__deliverNotificationSelector_(*(void **)(a1 + 32), a2, (uint64_t)sel_systemRestoreStateDidChange, a4);
}

void sub_1918B9560(uint64_t a1, uint64_t a2)
{
  if (_IMWillLog(@"SystemMonitor")) {
    _IMAlwaysLog(0, @"SystemMonitor", @"Setup state changed", v4, v5, v6, v7, v8, v9);
  }
  if (a2)
  {
    MEMORY[0x1F4181798](a2, sel__setupStateChanged, v3, v4);
  }
}

id sub_1918B95CC()
{
  if (qword_1E92DB018 != -1) {
    dispatch_once(&qword_1E92DB018, &unk_1EE230F78);
  }
  uint64_t v0 = (void *)qword_1E92DB010;
  return v0;
}

void sub_1918B9620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2) {
    MEMORY[0x1F4181798](a2, sel__checkRestoredFromBackup, a3, a4);
  }
}

void sub_1918B9630(uint64_t a1, uint64_t a2)
{
  if (_IMWillLog(@"SystemMonitor")) {
    _IMAlwaysLog(0, @"SystemMonitor", @"Restore started", v4, v5, v6, v7, v8, v9);
  }
  if (a2)
  {
    MEMORY[0x1F4181798](a2, sel__restoreDidStart, v3, v4);
  }
}

void sub_1918B969C(uint64_t a1, uint64_t a2)
{
  if (_IMWillLog(@"SystemMonitor")) {
    _IMAlwaysLog(0, @"SystemMonitor", @"Restore stopped", v4, v5, v6, v7, v8, v9);
  }
  if (a2)
  {
    MEMORY[0x1F4181798](a2, sel__restoreDidStop, v3, v4);
  }
}

void sub_1918B997C()
{
  uint64_t v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    uint64_t v1 = v0;
    byte_1E92DB588 = CFEqual(v0, @"AppleTV") != 0;
    byte_1E92DB589 = CFEqual(v1, @"AudioAccessory") != 0;
    CFRelease(v1);
  }
}

uint64_t (*sub_1918B9A0C())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DAD78 = result;
  return result;
}

uint64_t (*sub_1918B9A3C())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DAD80 = result;
  return result;
}

void sub_1918B9C64(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_sharedInstance(IMSystemMonitor, a2, a3, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__receivedMemoryNotification(v7, v4, v5, v6);
}

void sub_1918B9E40(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_registration(IMRGLog, a2, a3, a4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_191892000, v4, OS_LOG_TYPE_DEFAULT, "IMSystemMonitor: Received IMSystemMonitorSBShutdownCallback", v5, 2u);
  }

  sub_1918B9F28();
}

void sub_1918B9EB4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_registration(IMRGLog, a2, a3, a4);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_191892000, v4, OS_LOG_TYPE_DEFAULT, "IMSystemMonitor: kMobileObliterationNotification received", v5, 2u);
  }

  sub_1918B9F28();
}

void sub_1918B9F28()
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EB273AD0);
  if (byte_1E92DB584)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB273AD0);
  }
  else
  {
    uint64_t v3 = objc_msgSend_registration(IMRGLog, v0, v1, v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_191892000, v3, OS_LOG_TYPE_DEFAULT, "IMSystemMonitor: Updating to note that system is currently shutting down", v12, 2u);
    }

    byte_1E92DB584 = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB273AD0);
    id v7 = objc_msgSend_sharedInstance(IMSystemMonitor, v4, v5, v6);
    objc_msgSend__systemWillShutdown(v7, v8, v9, v10);

    uint64_t v11 = im_primary_queue();
    dispatch_async(v11, &unk_1EE230DF8);
  }
}

void sub_1918BA024(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postNotificationName_object_(v5, v4, @"IMSystemShuttingDownNotification", 0);
}

void sub_1918BA078(uint64_t a1, uint64_t a2, int a3, intptr_t a4)
{
  uint64_t v6 = (void *)MEMORY[0x192FDE5A0]();
  if (a3 > -536870273)
  {
    switch(a3)
    {
      case -536870272:
        if (_IMWillLog(@"IMSystemMonitor")) {
          _IMAlwaysLog(0, @"IMSystemMonitor", @"SLEEP -- going to sleep now", v26, v27, v28, v29, v30, v64);
        }
        uint64_t v31 = objc_msgSend_sharedInstance(IMSystemMonitor, v24, v25, v26);
        objc_msgSend__systemWillSleep(v31, v32, v33, v34);
        break;
      case -536870144:
        if (_IMWillLog(@"IMSystemMonitor")) {
          _IMAlwaysLog(0, @"IMSystemMonitor", @"WAKE -- just woke up!", v37, v38, v39, v40, v41, v64);
        }
        uint64_t v31 = objc_msgSend_sharedInstance(IMSystemMonitor, v35, v36, v37);
        char v45 = objc_msgSend___im_afterDelay_(v31, v42, v43, v44, 0.0);
        objc_msgSend__systemDidWake(v45, v46, v47, v48);

        break;
      case -536870128:
        if (_IMWillLog(@"IMSystemMonitor")) {
          _IMAlwaysLog(0, @"IMSystemMonitor", @"SYSTEM RESTART -- posting", v9, v10, v11, v12, v13, v64);
        }
        uint64_t v14 = objc_msgSend_registration(IMRGLog, v7, v8, v9);
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_27;
        }
        __int16 v67 = 0;
        id v15 = "IMSystemMonitor: SYSTEM RESTART -- posting";
        uint64_t v16 = (uint8_t *)&v67;
        goto LABEL_26;
      default:
        goto LABEL_28;
    }

    goto LABEL_28;
  }
  if (a3 == -536870384)
  {
    if (_IMWillLog(@"IMSystemMonitor")) {
      _IMAlwaysLog(0, @"IMSystemMonitor", @"DEVICE POWER OFF -- posting", v51, v52, v53, v54, v55, v64);
    }
    uint64_t v14 = objc_msgSend_registration(IMRGLog, v49, v50, v51);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    *(_WORD *)long long buf = 0;
    id v15 = "IMSystemMonitor: DEVICE POWER OFF -- posting";
    uint64_t v16 = buf;
  }
  else
  {
    if (a3 != -536870320) {
      goto LABEL_28;
    }
    if (_IMWillLog(@"IMSystemMonitor")) {
      _IMAlwaysLog(0, @"IMSystemMonitor", @"SYSTEM POWER OFF -- posting", v19, v20, v21, v22, v23, v64);
    }
    uint64_t v14 = objc_msgSend_registration(IMRGLog, v17, v18, v19);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_27;
    }
    __int16 v66 = 0;
    id v15 = "IMSystemMonitor: SYSTEM POWER OFF -- posting";
    uint64_t v16 = (uint8_t *)&v66;
  }
LABEL_26:
  _os_log_impl(&dword_191892000, v14, OS_LOG_TYPE_DEFAULT, v15, v16, 2u);
LABEL_27:

  sub_1918B9F28();
LABEL_28:
  IOReturn v56 = IOAllowPowerChange(dword_1E92DB260, a4);
  if (v56) {
    _IMWarn(@"IOAllowPowerChange failed!  Error: %d", v57, v58, v59, v60, v61, v62, v63, v56);
  }
}

#error "1918BA354: call analysis failed (funcsize=16)"

void sub_1918BA374()
{
  int v0 = MKBGetDeviceLockState();
  uint64_t v1 = im_primary_queue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1918BA404;
  block[3] = &unk_1E5723E10;
  int v3 = v0;
  dispatch_async(v1, block);
}

void sub_1918BA404(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_sharedInstance(IMSystemMonitor, a2, a3, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setDataProtectionLockState_(v7, v5, *(unsigned int *)(a1 + 32), v6);
}

void sub_1918BA45C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_sharedInstance(IMSystemMonitor, a2, a3, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setSystemLockState_(v7, v5, a3 != 0, v6);
}

void sub_1918BA4B8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_sharedInstance(IMSystemMonitor, a2, a3, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__setSystemScreenState_(v7, v5, a3 == 0, v6);
}

void sub_1918BA514()
{
  if (!qword_1E92DB010)
  {
    int v0 = (void **)IMWeakLinkSymbol();
    if (v0) {
      uint64_t v1 = *v0;
    }
    else {
      uint64_t v1 = 0;
    }
    objc_storeStrong((id *)&qword_1E92DB010, v1);
  }
}

uint64_t sub_1918BAF5C()
{
  qword_1EB273C48 = objc_alloc_init(IMUserNotificationCenter);
  return MEMORY[0x1F41817F8]();
}

void sub_1918BB9A8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_sharedInstance(IMUserNotificationCenter, a2, a3, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__handleUserNotification_responseFlags_(v7, v6, a1, (uint64_t)a2);
}

uint64_t (*sub_1918BC588())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DB590 = result;
  return result;
}

uint64_t (*sub_1918BC5B8())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DAF40 = result;
  return result;
}

void *sub_1918BC904()
{
  uint64_t result = (void *)IMWeakLinkSymbol();
  off_1E92DB5A0 = result;
  return result;
}

uint64_t sub_1918BCAC8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 72) + 16))();
}

uint64_t sub_1918BCF24()
{
  uint64_t result = IMWeakLinkSymbol();
  qword_1E92DAEC0 = result;
  return result;
}

uint64_t (*sub_1918BCF54())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DAEC8 = result;
  return result;
}

uint64_t (*sub_1918BCF84())(void, void)
{
  uint64_t result = (uint64_t (*)(void, void))IMWeakLinkSymbol();
  off_1E92DAEF8 = result;
  return result;
}

uint64_t (*sub_1918BCFB4())(void, void)
{
  uint64_t result = (uint64_t (*)(void, void))IMWeakLinkSymbol();
  off_1E92DAED8 = result;
  return result;
}

uint64_t (*sub_1918BCFE4())(void, void)
{
  uint64_t result = (uint64_t (*)(void, void))IMWeakLinkSymbol();
  off_1E92DAEE0 = result;
  return result;
}

uint64_t (*sub_1918BD014())(void, void)
{
  uint64_t result = (uint64_t (*)(void, void))IMWeakLinkSymbol();
  off_1E92DAEF0 = result;
  return result;
}

uint64_t (*sub_1918BD044())(void, void)
{
  uint64_t result = (uint64_t (*)(void, void))IMWeakLinkSymbol();
  off_1E92DAEE8 = result;
  return result;
}

uint64_t (*sub_1918BD074())(void, void)
{
  uint64_t result = (uint64_t (*)(void, void))IMWeakLinkSymbol();
  off_1E92DAED0 = result;
  return result;
}

uint64_t (*sub_1918BD0A4())(void, void, void, void)
{
  uint64_t result = (uint64_t (*)(void, void, void, void))IMWeakLinkSymbol();
  off_1E92DAEB8 = result;
  return result;
}

uint64_t sub_1918BD0D4(uint64_t a1)
{
  if (qword_1E92DAF50 != -1) {
    dispatch_once(&qword_1E92DAF50, &unk_1EE230378);
  }
  uint64_t v2 = off_1E92DAF48(a1);
  uint64_t v6 = v2;
  uint64_t v7 = 2;
  if (v2)
  {
    if (objc_msgSend_wasCancelled(v2, v3, v4, v5)) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

uint64_t sub_1918BD154(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (qword_1E92DB5B8 != -1) {
    dispatch_once(&qword_1E92DB5B8, &unk_1EE2303B8);
  }
  uint64_t v6 = off_1E92DB5B0(a1);
  uint64_t v7 = sub_1918BD674();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412802;
    uint64_t v10 = v6;
    __int16 v11 = 2080;
    uint64_t v12 = a2;
    __int16 v13 = 1024;
    int v14 = a3;
    _os_log_impl(&dword_191892000, v7, OS_LOG_TYPE_DEFAULT, "%@: File Error: %s, %d", (uint8_t *)&v9, 0x1Cu);
  }

  return 0;
}

uint64_t sub_1918BD268(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (qword_1E92DB5D8 != -1) {
    dispatch_once(&qword_1E92DB5D8, &unk_1EE230438);
  }
  uint64_t v4 = off_1E92DB5D0(a1);
  uint64_t v5 = sub_1918BD674();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    uint64_t v8 = v4;
    __int16 v9 = 2080;
    uint64_t v10 = a2;
    _os_log_impl(&dword_191892000, v5, OS_LOG_TYPE_DEFAULT, "%@: File Conflict Error: %s", (uint8_t *)&v7, 0x16u);
  }

  return 3;
}

void sub_1918BD36C(uint64_t a1)
{
  if (qword_1E92DB5E8 != -1) {
    dispatch_once(&qword_1E92DB5E8, &unk_1EE2304D8);
  }
  uint64_t v2 = off_1E92DB5E0(a1);
  int v3 = sub_1918BD674();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1918E1880((uint64_t)v2, v3);
  }
}

void sub_1918BD3FC(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (qword_1E92DB5F8 != -1) {
    dispatch_once(&qword_1E92DB5F8, &unk_1EE2304F8);
  }
  uint64_t v6 = off_1E92DB5F0(a1);
  int v7 = sub_1918BD674();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412802;
    __int16 v9 = v6;
    __int16 v10 = 2080;
    uint64_t v11 = a2;
    __int16 v12 = 1024;
    int v13 = a3;
    _os_log_impl(&dword_191892000, v7, OS_LOG_TYPE_DEFAULT, "%@: Fatal File Error: %s, %d", (uint8_t *)&v8, 0x1Cu);
  }
}

uint64_t (*sub_1918BD614())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DAF48 = result;
  return result;
}

uint64_t (*sub_1918BD644())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DB5B0 = result;
  return result;
}

id sub_1918BD674()
{
  if (qword_1E92DB5C8 != -1) {
    dispatch_once(&qword_1E92DB5C8, &unk_1EE2303F8);
  }
  int v0 = (void *)qword_1E92DB5C0;
  return v0;
}

uint64_t sub_1918BD6C8()
{
  qword_1E92DB5C0 = (uint64_t)os_log_create("com.apple.imfoundation", "fileCopier");
  return MEMORY[0x1F41817F8]();
}

uint64_t (*sub_1918BD70C())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DB5D0 = result;
  return result;
}

uint64_t (*sub_1918BD73C())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DB5E0 = result;
  return result;
}

uint64_t (*sub_1918BD76C())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DB5F0 = result;
  return result;
}

void sub_1918BDACC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x192FDE5A0]();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _OWORD v7[2] = sub_1918BE2E0;
  v7[3] = &unk_1E5722FD8;
  id v6 = v4;
  id v8 = v6;
  uint64_t v9 = a1;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t sub_1918BDB80(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend__handleCallbackForSCNetworkReachability_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), a4);
}

void sub_1918BE2E0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_object(*(void **)(a1 + 32), a2, a3, a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__handleCallbackForSCNetworkReachability_(v7, v5, *(void *)(a1 + 40), v6);
}

uint64_t sub_1918BE474()
{
  qword_1E92DB600 = objc_alloc_init(IMPerfProfiler);
  return MEMORY[0x1F41817F8]();
}

void sub_1918BE738(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1918BF7C4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend__doCallbackNow(a2, (const char *)a2, a3, a4);
}

void sub_1918BFFB8(void *a1)
{
  if (a1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
    }
  }
}

dispatch_queue_t sub_1918C00C0()
{
  int v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create("IMLocalObjectQueue", v0);
  qword_1EB273B68 = (uint64_t)result;
  return result;
}

dispatch_queue_t sub_1918C013C()
{
  int v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v1 = im_primary_base_queue();
  dispatch_queue_t result = dispatch_queue_create_with_target_V2("IMLocalObjectQueueWithTargetWorkloop", v0, v1);
  qword_1E92DB618 = (uint64_t)result;
  return result;
}

uint64_t sub_1918C0628(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((dword_1EB273738 & 0x80000000) == 0)
  {
    if (!dword_1EB273738) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (qword_1EB273BF0 != -1) {
    dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
  }
  if (dword_1EB273738 > 0) {
LABEL_3:
  }
    _IMWarn(@"IMLocalObject died: %@", (uint64_t)a2, a3, a4, a5, a6, a7, a8, *(void *)(a1 + 32));
LABEL_4:
  objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E4FBA8A8], a2, *(void *)(a1 + 32), (uint64_t)sel__handleNewInvocations, 0);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 100) = 0;
  int isMainThread = objc_msgSend_isMainThread(MEMORY[0x1E4F29060], v9, v10, v11);
  uint64_t v16 = *(void **)(a1 + 32);
  if (isMainThread)
  {
    return objc_msgSend__portDidBecomeInvalid(v16, v12, v13, v14);
  }
  else
  {
    return MEMORY[0x1F4181798](v16, sel_performSelectorOnMainThread_withObject_waitUntilDone_modes_, sel__portDidBecomeInvalid, 0);
  }
}

void sub_1918C0734(uint64_t a1, xpc_connection_t connection, void *a3, uint64_t a4)
{
  if (!connection) {
    return;
  }
  im_configure_connection_with_local_object(connection, *(const char **)(a1 + 32), (uint64_t)a3, a4);
  p_superclass = &OBJC_METACLASS____IMTimingInstance.superclass;
  if (dword_1EB273738 < 0)
  {
    if (qword_1EB273BF0 != -1)
    {
      dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
      p_superclass = (__objc2_class **)(&OBJC_METACLASS____IMTimingInstance + 8);
    }
    if (*((int *)p_superclass + 462) <= 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (dword_1EB273738)
  {
LABEL_4:
    char context = xpc_connection_get_context(connection);
    _IMLog(@"* Incoming event for IMLocalObject: %@   (object: %p)", v8, v9, v10, v11, v12, v13, v14, context);
  }
LABEL_5:
  im_local_object_peer_event_handler_is_syncReply(connection, a3, 0);
}

uint64_t sub_1918C0B2C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, a3, a4);
  uint64_t v7 = *(void *)(a1 + 32);
  return objc_msgSend_postNotificationName_object_(v5, v6, @"IMLocalObjectDidDisconnect", v7);
}

uint64_t sub_1918C0B74(uint64_t a1)
{
  uint64_t v2 = OSLogHandleForIDSCategory("IMLocalObject");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_191892000, v2, OS_LOG_TYPE_DEFAULT, "_clearPort posting IMLocalObjectDidDisconnectNotification after waking main thread", v9, 2u);
  }
  uint64_t v6 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v3, v4, v5);
  return objc_msgSend___mainThreadPostNotificationName_object_(v6, v7, @"IMLocalObjectDidDisconnect", *(void *)(a1 + 32));
}

void sub_1918C1098(uint64_t a1, uint64_t a2)
{
}

void sub_1918C10A8(uint64_t a1)
{
}

uint64_t sub_1918C14D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F4181798](*(void *)(a1 + 32), sel__handleNewInvocations, a3, a4);
}

uint64_t sub_1918C1A70(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_invalidate(*(void **)(a1 + 32), a2, a3, a4);
}

uint64_t sub_1918C1A78(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = OSLogHandleForIDSCategory("IMLocalObject");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(unsigned char *)(v6 + 101)) {
      uint64_t v7 = @"YES";
    }
    else {
      uint64_t v7 = @"NO";
    }
    if (*(unsigned char *)(v6 + 100)) {
      uint64_t v8 = @"YES";
    }
    else {
      uint64_t v8 = @"NO";
    }
    int v12 = 138412546;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_impl(&dword_191892000, v2, OS_LOG_TYPE_DEFAULT, "Posting IMLocalObjectDidDisconnectNotification as we detected run loop was blocked. _localInternal(busyForwarding) %@ or had pending component processing %@ ", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v9 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v3, v4, v5);
  return objc_msgSend___mainThreadPostNotificationName_object_(v9, v10, @"IMLocalObjectDidDisconnect", *(void *)(a1 + 32));
}

uint64_t sub_1918C1CB4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((dword_1EB273738 & 0x80000000) == 0)
  {
    if (!dword_1EB273738) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (qword_1EB273BF0 != -1) {
    dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
  }
  if (dword_1EB273738 > 0) {
LABEL_3:
  }
    _IMLog(@"Remote object died: %@", (uint64_t)a2, a3, a4, a5, a6, a7, a8, *(void *)(a1 + 32));
LABEL_4:
  uint64_t v9 = *(void **)(a1 + 32);
  return objc_msgSend__portDidBecomeInvalid(v9, a2, a3, a4);
}

dispatch_queue_t sub_1918C2230()
{
  int v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t result = dispatch_queue_create(0, v0);
  qword_1E92DB168 = (uint64_t)result;
  return result;
}

void sub_1918C2264(uint64_t a1, void *a2)
{
}

void sub_1918C297C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void **)(a1 + 32);
  if (!v4) {
    return;
  }
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = (void *)v5[1];
  uint64_t v7 = (void *)v5[4];
  uint64_t v46 = v5[6];
  if (objc_msgSend_count(v6, a2, a3, a4)) {
    uint64_t v11 = objc_msgSend__copyForEnumerating(v6, v8, v9, v10);
  }
  else {
    uint64_t v11 = 0;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v8, (uint64_t)&v48, (uint64_t)v52, 16);
  if (!v12) {
    goto LABEL_29;
  }
  uint64_t v16 = v12;
  uint64_t v17 = *(void *)v49;
  while (2)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v49 != v17) {
        objc_enumerationMutation(v11);
      }
      uint64_t v19 = *(void **)(*((void *)&v48 + 1) + 8 * i);
      if ((objc_msgSend_isValid(v19, v13, v14, v15) & 1) == 0)
      {
        if (dword_1EB273738 < 0)
        {
          if (qword_1EB273BF0 != -1) {
            dispatch_once(&qword_1EB273BF0, &unk_1EE230D38);
          }
          if (dword_1EB273738 <= 0) {
            goto LABEL_29;
          }
        }
        else if (!dword_1EB273738)
        {
          goto LABEL_29;
        }
        _IMLog(@"* Object is no longer valid, skipping this enqueue: %@", (uint64_t)v20, v21, v22, v23, v24, v25, v26, (char)v19);
        goto LABEL_29;
      }
      uint64_t v27 = objc_msgSend__queue(v19, v20, v21, v22);
      if (v27)
      {
        uint64_t v28 = v27;
        dispatch_retain(v27);
        xpc_retain(v4);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_191894540;
        block[3] = &unk_1E5723FA8;
        void block[4] = v19;
        void block[5] = v4;
        block[7] = v28;
        block[8] = v46;
        block[6] = v7;
        uint64_t v32 = (void (**)(void))dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
        if (v7
          && ((objc_msgSend_isReply(v7, v29, v30, v31) & 1) != 0 || objc_msgSend_isSync(v7, v33, v34, v35)))
        {
          if ((_os_feature_enabled_impl() & 1) != 0
            || (uint64_t v39 = objc_msgSend_currentThread(MEMORY[0x1E4F29060], v36, v37, v38),
                uint64_t v43 = objc_msgSend_threadDictionary(v39, v40, v41, v42),
                objc_msgSend_objectForKey_(v43, v44, @"com.apple.IMRemoteObjectDeliveringMessageKey", v45) == v19))
          {
            v32[2](v32);
LABEL_22:
            _Block_release(v32);
            continue;
          }
          dispatch_sync(v28, v32);
        }
        else
        {
          dispatch_async(v28, v32);
        }
        if (v32) {
          goto LABEL_22;
        }
      }
    }
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v48, (uint64_t)v52, 16);
    if (v16) {
      continue;
    }
    break;
  }
LABEL_29:
}

uint64_t sub_1918C2C9C()
{
  qword_1E92DAE10 = (uint64_t)os_log_create("com.apple.IDS", "Registration-oversized");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C2D38()
{
  qword_1EB273850 = (uint64_t)os_log_create("com.apple.Registration", "Warning");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C2DD0()
{
  qword_1E92DB620 = (uint64_t)os_log_create("com.apple.Registration", "ACKTracker");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C2E68()
{
  qword_1E92DB630 = (uint64_t)os_log_create("com.apple.Registration", "Engram");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C2F00()
{
  qword_1E92DACB8 = (uint64_t)os_log_create("com.apple.Registration", "FTMessageDelivery-oversized");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C2F98()
{
  qword_1E92DACC8 = (uint64_t)os_log_create("com.apple.Registration", "GDR");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C3030()
{
  qword_1E92DACD8 = (uint64_t)os_log_create("com.apple.Registration", "GDR-oversized");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C30C8()
{
  qword_1E92DB188 = (uint64_t)os_log_create("com.apple.Registration", "IDSService");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C3160()
{
  qword_1EB273A18 = (uint64_t)os_log_create("com.apple.Registration", "IDSService-oversized");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C31F8()
{
  qword_1E92DB068 = (uint64_t)os_log_create("com.apple.Registration", "NRPairing");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C3290()
{
  qword_1EB2739B8 = (uint64_t)os_log_create("com.apple.Registration", "NSUUID");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C3328()
{
  qword_1E92DB640 = (uint64_t)os_log_create("com.apple.Registration", "OTRStore");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C33C0()
{
  qword_1E92DAF90 = (uint64_t)os_log_create("com.apple.Registration", "AccountCleanup");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C3458()
{
  qword_1EB273B48 = (uint64_t)os_log_create("com.apple.Registration", "AccountEnabled");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C34F0()
{
  qword_1E92DACE8 = (uint64_t)os_log_create("com.apple.Registration", "AccountSync");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C3588()
{
  qword_1E92DACF8 = (uint64_t)os_log_create("com.apple.Registration", "AccountUpdate");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C3620()
{
  qword_1E92DAFE0 = (uint64_t)os_log_create("com.apple.Registration", "AccountsDebugging");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C36B8()
{
  qword_1EB2739E8 = (uint64_t)os_log_create("com.apple.Registration", "ActiveID");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C3750()
{
  qword_1E92DB650 = (uint64_t)os_log_create("com.apple.Registration", "AppleCare");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C37E8()
{
  qword_1E92DB660 = (uint64_t)os_log_create("com.apple.Registration", "ClassKeys");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C3880()
{
  qword_1E92DAD28 = (uint64_t)os_log_create("com.apple.Registration", "DataProtectionClass");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C3918()
{
  qword_1E92DAD38 = (uint64_t)os_log_create("com.apple.Registration", "DeviceHeartbeat");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C39B0()
{
  qword_1E92DB670 = (uint64_t)os_log_create("com.apple.Registration", "DeviceIDMap");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C3A48()
{
  qword_1E92DAD48 = (uint64_t)os_log_create("com.apple.Registration", "DeviceState");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C3AE0()
{
  qword_1E92DAD58 = (uint64_t)os_log_create("com.apple.Registration", "HealthDebug");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C3B78()
{
  qword_1E92DAFB0 = (uint64_t)os_log_create("com.apple.Registration", "HealthDebugging");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C3C10()
{
  qword_1E92DB048 = (uint64_t)os_log_create("com.apple.Registration", "iCloud");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C3CA8()
{
  qword_1E92DB680 = (uint64_t)os_log_create("com.apple.Registration", "IMMacNotificationCenterManager");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C3D40()
{
  qword_1E92DB690 = (uint64_t)os_log_create("com.apple.Registration", "iMessageSpam");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C3DD8()
{
  qword_1E92DB6A0 = (uint64_t)os_log_create("com.apple.Registration", "SpamReporting");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C3E70()
{
  qword_1E92DAD68 = (uint64_t)os_log_create("com.apple.Registration", "InternalCleanup");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C3F08()
{
  qword_1E92DB6B0 = (uint64_t)os_log_create("com.apple.Registration", "isActive");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C3FA0()
{
  qword_1E92DB6C0 = (uint64_t)os_log_create("com.apple.Registration", "KeyRoll");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C4038()
{
  qword_1E92DADA0 = (uint64_t)os_log_create("com.apple.Registration", "Keychain");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C40D0()
{
  qword_1E92DB378 = (uint64_t)os_log_create("com.apple.Registration", "KeychainManager");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C4168()
{
  qword_1E92DADB0 = (uint64_t)os_log_create("com.apple.Registration", "LiveMigration");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C4200()
{
  qword_1E92DADC0 = (uint64_t)os_log_create("com.apple.Registration", "MessageDelivery-oversized");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C4298()
{
  qword_1E92DADD0 = (uint64_t)os_log_create("com.apple.Registration", "Migration");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C4330()
{
  qword_1E92DB178 = (uint64_t)os_log_create("com.apple.Registration", "Nonce");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C43C8()
{
  qword_1E92DB6D0 = (uint64_t)os_log_create("com.apple.Registration", "PairedDeviceRepo");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C4460()
{
  qword_1E92DB6E0 = (uint64_t)os_log_create("com.apple.Registration", "PairedIdentities");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C44F8()
{
  qword_1E92DB6F0 = (uint64_t)os_log_create("com.apple.Registration", "Pairing");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C4590()
{
  qword_1E92DB700 = (uint64_t)os_log_create("com.apple.Registration", "PairingIdentities");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C4628()
{
  qword_1E92DAFF0 = (uint64_t)os_log_create("com.apple.Registration", "PairingProtocolDebug");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C46C0()
{
  qword_1E92DADE0 = (uint64_t)os_log_create("com.apple.Registration", "PhoneRepair");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C4758()
{
  qword_1E92DADF0 = (uint64_t)os_log_create("com.apple.Registration", "PushToken");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C47F0()
{
  qword_1E92DB710 = (uint64_t)os_log_create("com.apple.Registration", "QueryRetry");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C4888()
{
  qword_1E92DB720 = (uint64_t)os_log_create("com.apple.Registration", "Regeneration");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C4920()
{
  qword_1E92DAF60 = (uint64_t)os_log_create("com.apple.Registration", "RegistrationAuthKit");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C49B8()
{
  qword_1E92DAE00 = (uint64_t)os_log_create("com.apple.Registration", "RegistrationListener");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C4A50()
{
  qword_1E92DB730 = (uint64_t)os_log_create("com.apple.Registration", "ReloadAccounts");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C4AE8()
{
  qword_1EB2739F8 = (uint64_t)os_log_create("com.apple.Registration", "ServerBag");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C4B80()
{
  qword_1EB273970 = (uint64_t)os_log_create("com.apple.Registration", "SMS");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C4C18()
{
  qword_1E92DAE28 = (uint64_t)os_log_create("com.apple.Registration", "Sub-services");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C4CB0()
{
  qword_1E92DAE38 = (uint64_t)os_log_create("com.apple.Registration", "Sysdiagnose-oversized");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C4D48()
{
  qword_1E92DAFC8 = (uint64_t)os_log_create("com.apple.Registration", "Sysdiagnose-KeyTransparency");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C4DE0()
{
  qword_1E92DB740 = (uint64_t)os_log_create("com.apple.Registration", "UniqueID");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C4E78()
{
  qword_1E92DB750 = (uint64_t)os_log_create("com.apple.Registration", "VoicemailSync");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C4F10()
{
  qword_1E92DB108 = (uint64_t)os_log_create("com.apple.Registration", "WatchPairing");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C4FA8()
{
  qword_1E92DB3B8 = (uint64_t)os_log_create("com.apple.Registration", "SignInController");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C5040()
{
  qword_1E92DB760 = (uint64_t)os_log_create("com.apple.Registration", "VM");
  return MEMORY[0x1F41817F8]();
}

void _IMLog(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void sub_1918C50B8(uint64_t a1, void *a2, va_list a3)
{
  id v5 = a2;
  id v48 = v5;
  if (!qword_1EB273860)
  {
    uint64_t v9 = IMGetMainBundle((uint64_t)v5, v6, v7, v8);
    uint64_t v13 = v9;
    if (v9)
    {
      uint64_t v14 = objc_msgSend_bundleIdentifier(v9, v10, v11, v12);
      uint64_t v15 = (void *)qword_1EB273860;
      qword_1EB273860 = v14;
    }
    if (!objc_msgSend_length((void *)qword_1EB273860, v10, v11, v12))
    {
      uint64_t v16 = (void *)qword_1EB273860;
      qword_1EB273860 = @"com.apple.imlogging";
    }
  }
  uint64_t v17 = (void *)MEMORY[0x192FDE5A0]();
  FormatString = _IMFastCreateFormatString(v48, a3);
  if ((unint64_t)(a1 - 1) >= 4) {
    objc_msgSend_numberWithInt_(NSNumber, v18, 5, v19);
  }
  else {
  uint64_t v28 = objc_msgSend_numberWithInt_(NSNumber, v18, (6 - a1), v19);
  }
  if (byte_1E92DB790)
  {
    IMPrintf(@"%@", (uint64_t)v21, v22, v23, v24, v25, v26, v27, (uint64_t)FormatString);
  }
  else if (objc_msgSend_length(FormatString, v21, v22, v23))
  {
    uint64_t v32 = (const char *)objc_msgSend_UTF8String((void *)qword_1EB273860, v29, v30, v31);
    uint64_t v33 = asl_open(0, v32, 2u);
    uint64_t v34 = asl_new(0);
    objc_msgSend_stringValue(v28, v35, v36, v37);
    id v38 = objc_claimAutoreleasedReturnValue();
    uint64_t v42 = (const char *)objc_msgSend_UTF8String(v38, v39, v40, v41);
    asl_set(v34, "Level", v42);

    uint64_t v43 = FormatString;
    uint64_t v47 = (const char *)objc_msgSend_UTF8String(v43, v44, v45, v46);
    asl_set(v34, "Message", v47);
    asl_send(v33, v34);
    MEMORY[0x192FDE0C0](v34);
    MEMORY[0x192FDE0B0](v33);
  }
}

void _IMLogLevel(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void _IMWarn(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void _IMAlwaysLogV(uint64_t a1, void *a2, void *a3, va_list a4)
{
  id v16 = a2;
  id v7 = a3;
  uint64_t v8 = (void *)MEMORY[0x192FDE5A0]();
  FormatString = _IMFastCreateFormatString(v7, a4);
  _IMLogLevel(a1, @"[%@] %@", v9, v10, v11, v12, v13, v14, (char)v16);
}

void _IMAlwaysLog(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void _IMSyncLoggingSettings()
{
  dword_1EB273744 = -1;
  dword_1E92DA7E8 = -1;
}

id _IMLogCategoryFromMessage(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_hasPrefix_(v1, v2, @"[", v3)
    && (uint64_t v7 = objc_msgSend_length(v1, v4, v5, v6),
        uint64_t v9 = objc_msgSend_rangeOfString_options_range_(v1, v8, @"]", 0, 1, v7 - 1),
        v10))
  {
    uint64_t v11 = objc_msgSend_substringWithRange_(v1, v10, 1, v9 - 1);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

id _IMLogMessageFromMessage(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_hasPrefix_(v1, v2, @"[", v3)
    && (uint64_t v7 = objc_msgSend_length(v1, v4, v5, v6),
        uint64_t v9 = objc_msgSend_rangeOfString_options_range_(v1, v8, @"]", 0, 1, v7 - 1),
        v10))
  {
    objc_msgSend_substringFromIndex_(v1, v10, v9 + 1, v11);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = v1;
  }
  uint64_t v13 = v12;

  return v13;
}

void _IMLogBacktraceForException(void *a1)
{
  id v71 = a1;
  OSStatus v72 = objc_msgSend_callStackReturnAddresses(v71, v1, v2, v3);
  int ClassList = objc_getClassList(0, -1);
  uint64_t v5 = (Class *)malloc_type_calloc(8uLL, ClassList, 0x85B97272uLL);
  int v6 = objc_getClassList(v5, ClassList);
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, 0);
  uint64_t v8 = CFDictionaryCreateMutable(0, 0, 0, 0);
  uint64_t v9 = CFDictionaryCreateMutable(0, 0, 0, 0);
  id v73 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if (v6 >= 1)
  {
    uint64_t v10 = 0;
    uint64_t v11 = v6;
    while (1)
    {
      LODWORD(outCount.dli_fname) = 0;
      id v12 = class_copyMethodList(v5[v10], (unsigned int *)&outCount);
      uint64_t v13 = v12;
      if (LODWORD(outCount.dli_fname)) {
        break;
      }
      if (v12) {
        goto LABEL_8;
      }
LABEL_9:
      if (++v10 == v11) {
        goto LABEL_10;
      }
    }
    unint64_t v14 = 0;
    do
    {
      SEL Name = method_getName(v13[v14]);
      IMP Implementation = method_getImplementation(v13[v14]);
      CFDictionarySetValue(v8, Implementation, Name);
      CFDictionarySetValue(v9, Implementation, v5[v10]);
      CFArrayAppendValue(Mutable, Implementation);
      ++v14;
    }
    while (v14 < LODWORD(outCount.dli_fname));
LABEL_8:
    free(v13);
    goto LABEL_9;
  }
LABEL_10:
  int Count = CFArrayGetCount(Mutable);
  CFIndex v18 = Count;
  v77.location = 0;
  v77.size_t length = Count;
  CFArraySortValues(Mutable, v77, (CFComparatorFunction)sub_1918C5910, 0);
  uint64_t v19 = v72;
  uint64_t v23 = objc_msgSend_count(v72, v20, v21, v22);
  uint64_t v74 = v23 - 1;
  uint64_t v75 = v23;
  uint64_t v26 = v73;
  if (v23 >= 1)
  {
    for (uint64_t i = 0; v75 != i; ++i)
    {
      memset(&outCount, 0, sizeof(outCount));
      uint64_t v28 = objc_msgSend_objectAtIndex_(v19, v24, i, v25);
      uint64_t v32 = (const void *)objc_msgSend_integerValue(v28, v29, v30, v31);

      if (!dladdr(v32, &outCount)) {
        goto LABEL_30;
      }
      v78.location = 0;
      v78.size_t length = v18;
      unsigned int v35 = CFArrayBSearchValues(Mutable, v78, v32, (CFComparatorFunction)sub_1918C5910, 0);
      int v38 = v35;
      if ((v35 & 0x80000000) != 0 || (CFIndex v36 = v35, v35 >= v18)) {
        ValueAtIndex = 0;
      }
      else {
        ValueAtIndex = CFArrayGetValueAtIndex(Mutable, v35);
      }
      if (ValueAtIndex == v32)
      {
        uint64_t v40 = v32;
        if (!v32) {
          goto LABEL_25;
        }
      }
      else if (v38 < 1 {
             || (CFIndex v36 = (v38 - 1), v36 >= v18)
      }
             || (uint64_t v40 = CFArrayGetValueAtIndex(Mutable, v36)) == 0)
      {
LABEL_25:
        objc_msgSend_stringWithFormat_(NSString, (const char *)v36, @"%s", v37, outCount.dli_sname, v69);
        goto LABEL_26;
      }
      if ((unsigned char *)v32 - v40 >= (unint64_t)v32 - (unint64_t)outCount.dli_saddr) {
        goto LABEL_25;
      }
      Value = (objc_class *)CFDictionaryGetValue(v9, v40);
      uint64_t v42 = (const char *)CFDictionaryGetValue(v8, v40);
      uint64_t v43 = NSString;
      uint64_t v68 = class_getName(Value);
      uint64_t v70 = sel_getName(v42);
      uint64_t v44 = v43;
      uint64_t v19 = v72;
      uint64_t v26 = v73;
      objc_msgSend_stringWithFormat_(v44, v45, @"[%s %s]", v46, v68, v70);
      uint64_t v47 = LABEL_26:;
      long long v50 = v47;
      if (!outCount.dli_fname || !outCount.dli_sname)
      {

LABEL_30:
        uint64_t v69 = "???";
        objc_msgSend_appendFormat_(v26, v33, @"%3d. %-24s %lu", v34, i);
        goto LABEL_31;
      }
      long long v51 = objc_msgSend_stringWithFormat_(NSString, v48, @"%s", v49, outCount.dli_fname);
      objc_msgSend_lastPathComponent(v51, v52, v53, v54);
      id v55 = objc_claimAutoreleasedReturnValue();
      uint64_t v69 = (const char *)objc_msgSend_UTF8String(v55, v56, v57, v58);
      objc_msgSend_appendFormat_(v73, v59, @"%3d. %-24s 0x%08lx %@", v60, i);

      uint64_t v26 = v73;
      uint64_t v19 = v72;

LABEL_31:
      if (v74 != i) {
        objc_msgSend_appendString_(v26, v24, @"\n", v25);
      }
    }
  }
  if (v8) {
    CFRelease(v8);
  }
  if (v9) {
    CFRelease(v9);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  free(v5);
  _IMLog(@"Backtrace:\n%@", v61, v62, v63, v64, v65, v66, v67, (char)v26);
}

uint64_t sub_1918C5910(unint64_t a1, unint64_t a2)
{
  uint64_t v2 = 1;
  if (a1 <= a2) {
    uint64_t v2 = -1;
  }
  if (a1 == a2) {
    return 0;
  }
  else {
    return v2;
  }
}

void IMSetBacktraceLogBlock(void *a1)
{
  id v1 = a1;
  uint64_t v5 = (void *)qword_1E92DB780;
  id v8 = v1;
  if (qword_1E92DB780)
  {
    qword_1E92DB780 = 0;

    id v1 = v8;
  }
  if (v1)
  {
    uint64_t v6 = objc_msgSend_copy(v8, v2, v3, v4);
    uint64_t v7 = (void *)qword_1E92DB780;
    qword_1E92DB780 = v6;

    id v1 = v8;
  }
}

void IMSetBacktraceWarnBlock(void *a1)
{
  id v1 = a1;
  uint64_t v5 = (void *)qword_1E92DB778;
  id v8 = v1;
  if (qword_1E92DB778)
  {
    qword_1E92DB778 = 0;

    id v1 = v8;
  }
  if (v1)
  {
    uint64_t v6 = objc_msgSend_copy(v8, v2, v3, v4);
    uint64_t v7 = (void *)qword_1E92DB778;
    qword_1E92DB778 = v6;

    id v1 = v8;
  }
}

id sub_1918C5A04(uint64_t a1)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a1 + 1) < 0x80) {
    uint64_t v1 = a1 + 1;
  }
  else {
    uint64_t v1 = 128;
  }
  id v2 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = objc_msgSend_initWithCapacity_(v2, v3, v1, v4);
  MEMORY[0x1F4188790](v5);
  id v8 = (void **)((char *)v23 - v7);
  if (v1) {
    memset((char *)v23 - v7, 170, v6);
  }
  int v9 = backtrace(v8, v1);
  uint64_t v10 = backtrace_symbols(v8, v9);
  uint64_t v11 = v10;
  if (v9 >= 2)
  {
    uint64_t v12 = v9;
    uint64_t v13 = (uint64_t *)(v10 + 1);
    uint64_t v14 = v12 - 1;
    do
    {
      id v15 = [NSString alloc];
      uint64_t v16 = *v13++;
      uint64_t v19 = objc_msgSend_initWithUTF8String_(v15, v17, v16, v18);
      objc_msgSend_addObject_(v5, v20, (uint64_t)v19, v21);

      --v14;
    }
    while (v14);
  }
  free(v11);
  return v5;
}

void sub_1918C5B58(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  id v10 = [NSString alloc];
  uint64_t v12 = objc_msgSend_initWithFormat_arguments_(v10, v11, @"%@", (uint64_t)&a9);
  if (qword_1E92DB780) {
    (*(void (**)(void))(qword_1E92DB780 + 16))();
  }
}

void sub_1918C5BD4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = (objc_class *)NSString;
  id v10 = a1;
  id v11 = [v9 alloc];
  uint64_t v13 = objc_msgSend_initWithFormat_arguments_(v11, v12, (uint64_t)v10, (uint64_t)&a9);

  if (qword_1E92DB778) {
    (*(void (**)(void))(qword_1E92DB778 + 16))();
  }
}

uint64_t IMCurrentBacktraceHasSelector(const char *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = NSStringFromSelector(a1);
  sub_1918C5A04(128);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v10, (uint64_t)v14, 16);
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend_rangeOfString_(*(void **)(*((void *)&v10 + 1) + 8 * i), v4, (uint64_t)v1, v5, (void)v10) != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v6 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v4, (uint64_t)&v10, (uint64_t)v14, 16);
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

void IMLogExceptionBacktrace(void *a1)
{
  id v1 = a1;
  id v22 = v1;
  if (qword_1E92DB778) {
    sub_1918C5BD4(@"Exception: %@", v2, v3, v4, v5, v6, v7, v8, (uint64_t)v1);
  }
  else {
    _IMWarn(@"Exception: %@", v2, v3, v4, v5, v6, v7, v8, (char)v1);
  }
  uint64_t v12 = qword_1E92DB778;
  uint64_t v13 = objc_msgSend_callStackSymbols(v22, v9, v10, v11);
  uint64_t v21 = (void *)v13;
  if (v12) {
    sub_1918C5BD4(@"  Symbols: %@", v14, v15, v16, v17, v18, v19, v20, v13);
  }
  else {
    _IMWarn(@"  Symbols: %@", v14, v15, v16, v17, v18, v19, v20, v13);
  }
}

void IMLogGenerateStackshotWithReason(void *a1, uint64_t a2)
{
  uint64_t v3 = a1;
  if (qword_1E92DAF78 != -1)
  {
    uint64_t v5 = v3;
    dispatch_once(&qword_1E92DAF78, &unk_1EE22FC18);
    uint64_t v3 = v5;
  }
  if (off_1E92DAF70)
  {
    uint64_t v4 = v3;
    if (!v3) {
      uint64_t v3 = @"IMGeneratedStackShot";
    }
    off_1E92DAF70(v3, a2);
    uint64_t v3 = v4;
  }
}

uint64_t (*sub_1918C5EC0())(void, void)
{
  dispatch_queue_t result = (uint64_t (*)(void, void))IMWeakLinkSymbol();
  off_1E92DAF70 = result;
  return result;
}

void IMLogSimulateCrashForException(void *a1)
{
  id v1 = a1;
  id v33 = v1;
  if (qword_1E92DB778) {
    sub_1918C5BD4(@"Exception: %@", v2, v3, v4, v5, v6, v7, v8, (uint64_t)v1);
  }
  else {
    _IMWarn(@"Exception: %@", v2, v3, v4, v5, v6, v7, v8, (char)v1);
  }
  uint64_t v12 = qword_1E92DB778;
  uint64_t v13 = objc_msgSend_callStackSymbols(v33, v9, v10, v11);
  uint64_t v21 = (void *)v13;
  if (v12) {
    sub_1918C5BD4(@"  Symbols: %@", v14, v15, v16, v17, v18, v19, v20, v13);
  }
  else {
    _IMWarn(@"  Symbols: %@", v14, v15, v16, v17, v18, v19, v20, v13);
  }

  uint64_t v25 = objc_msgSend_processInfo(MEMORY[0x1E4F28F80], v22, v23, v24);
  uint64_t v29 = objc_msgSend_processName(v25, v26, v27, v28);
  uint64_t v30 = getpid();
  uint64_t v32 = objc_msgSend_stringWithFormat_(NSString, (const char *)v33, @"Exception: %@", v31, v33);
  IMLogSimulateCrashForProcessAndPID(v29, v30, v32, 4277006349);
}

void IMLogSimulateCrashForProcessAndPID(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v23 = a1;
  uint64_t v7 = a3;
  if (objc_msgSend_length(v23, v8, v9, v10))
  {
    if (qword_1E92DB778) {
      sub_1918C5BD4(@"Simulating crash for process: %@", v11, v12, v13, v14, v15, v16, v17, (uint64_t)v23);
    }
    else {
      _IMWarn(@"Simulating crash for process: %@", v11, v12, v13, v14, v15, v16, v17, (char)v23);
    }
    if (!objc_msgSend_length(v7, v18, v19, v20))
    {

      uint64_t v7 = @"None Supplied";
    }
    id v22 = objc_msgSend_stringWithFormat_(NSString, v23, @"Simulating crash for %@ from IMLogSimulateCrashForProcess (Reason: %@)", v21, v23, v7);
    if (qword_1E92DB190 != -1) {
      dispatch_once(&qword_1E92DB190, &unk_1EE231358);
    }
    if (off_1E92DB198) {
      off_1E92DB198(a2, a4, v22);
    }
  }
}

void IMLogSimulateCrashForProcess(void *a1, void *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (!objc_msgSend_length(v5, v7, v8, v9)) {
    goto LABEL_12;
  }
  id v10 = v5;
  uint64_t v14 = (const char *)objc_msgSend_UTF8String(v10, v11, v12, v13);
  *(_OWORD *)uint64_t v21 = xmmword_1918E78C0;
  uint64_t v22 = 0;
  size_t size = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v15 = sysctl(v21, 3u, 0, &size, 0, 0);
  if (!v15)
  {
    uint64_t v16 = (char *)malloc_type_malloc(size, 0x91FF846DuLL);
    uint64_t v17 = sysctl(v21, 3u, v16, &size, 0, 0);
    if (v17)
    {
      uint64_t v15 = v17;
LABEL_5:
      free(v16);
      goto LABEL_13;
    }
    if ((int)(size / 0x288) >= 1)
    {
      uint64_t v18 = 0;
      uint64_t v19 = 648 * (size / 0x288);
      do
      {
        uint64_t v15 = *(unsigned int *)&v16[v18 + 40];
        if ((int)v15 >= 1 && !strncmp(v14, &v16[v18 + 243], 0x10uLL)) {
          goto LABEL_5;
        }
        v18 += 648;
      }
      while (v19 != v18);
    }
    free(v16);
LABEL_12:
    uint64_t v15 = 0xFFFFFFFFLL;
  }
LABEL_13:
  IMLogSimulateCrashForProcessAndPID(v5, v15, v6, a3);
}

uint64_t (*sub_1918C62F0())(void, void, void)
{
  dispatch_queue_t result = (uint64_t (*)(void, void, void))IMWeakLinkSymbol();
  off_1E92DB198 = result;
  return result;
}

void IMPrintf(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = (void *)MEMORY[0x192FDE5A0]();
  id v11 = [NSString alloc];
  id v13 = objc_msgSend_initWithFormat_arguments_(v11, v12, (uint64_t)v9, (uint64_t)&a9);
  uint64_t v17 = (const char *)objc_msgSend_UTF8String(v13, v14, v15, v16);
  puts(v17);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v19 = v17;
    _os_log_impl(&dword_191892000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  fflush((FILE *)*MEMORY[0x1E4F143D8]);
}

uint64_t _IMLogForceWriteToStdout(uint64_t result)
{
  byte_1E92DB790 = result;
  return result;
}

uint64_t _IMLogForceEnable(uint64_t result)
{
  byte_1E92DB788 = result;
  return result;
}

uint64_t _IMLogForceEnableEverything(uint64_t result)
{
  byte_1E92DB789 = result;
  return result;
}

void _IMLogForceEnableCategory(void *a1, int a2)
{
  id v18 = a1;
  uint64_t v3 = (void *)MEMORY[0x192FDE5A0]();
  if (objc_msgSend_length(v18, v4, v5, v6))
  {
    if (!qword_1E92DB770)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      id v10 = (void *)qword_1E92DB770;
      qword_1E92DB770 = (uint64_t)Mutable;
    }
    id v11 = (void *)qword_1E92DB770;
    if (a2)
    {
      uint64_t v12 = objc_msgSend_numberWithBool_(NSNumber, v7, 1, v8);
      objc_msgSend_setObject_forKey_(v11, v13, (uint64_t)v12, (uint64_t)v18);
    }
    else
    {
      objc_msgSend_removeObjectForKey_((void *)qword_1E92DB770, v7, (uint64_t)v18, v8);
    }
    if (!objc_msgSend_count((void *)qword_1E92DB770, v14, v15, v16))
    {
      uint64_t v17 = (void *)qword_1E92DB770;
      qword_1E92DB770 = 0;
    }
  }
}

_DWORD *sub_1918C6544(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 16) != 3) {
    return 0;
  }
  uint64_t v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v6 = objc_msgSend_dataUsingEncoding_(v3, v4, 4, v5);
  size_t v10 = objc_msgSend_length(v6, v7, v8, v9);
  id v11 = malloc_type_calloc(1uLL, v10 + 200, 0xC5BFDEEBuLL);
  uint64_t v14 = v11;
  if (v11)
  {
    *id v11 = 1;
    v11[1] = v10;
    uint64_t v15 = objc_msgSend_dataUsingEncoding_(*(void **)(a1 + 32), v12, 4, v13);
    uint64_t v16 = v15;
    if (v15)
    {
      id v17 = v15;
      uint64_t v21 = (const void *)objc_msgSend_bytes(v17, v18, v19, v20);
      unint64_t v25 = objc_msgSend_length(v17, v22, v23, v24);
      if (v25 >= 0x3F) {
        size_t v26 = 63;
      }
      else {
        size_t v26 = v25;
      }
      memcpy(v14 + 34, v21, v26);
    }
    id v27 = v6;
    uint64_t v31 = (const void *)objc_msgSend_bytes(v27, v28, v29, v30);
    memcpy(v14 + 50, v31, v10);
  }
  return v14;
}

id IMTruncatedLoggingStringForString(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_description(a1, a2, a3, a4);
  if ((unint64_t)objc_msgSend_length(v4, v5, v6, v7) > 0x1D)
  {
    id v11 = NSString;
    uint64_t v12 = objc_msgSend_substringToIndex_(v4, v8, 30, v9);
    objc_msgSend_stringWithFormat_(v11, v13, @"<%@...>", v14, v12);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = v4;
  }

  return v10;
}

id JWEncodeCodableObject(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    a1 = objc_msgSend_archivedDataWithRootObject_(MEMORY[0x1E4F28AF8], a2, (uint64_t)a1, a4);
    uint64_t v4 = vars8;
  }
  return a1;
}

id JWDecodeKeyedCodableObject(void *a1)
{
  id v1 = a1;
  uint64_t v5 = v1;
  if (v1 && objc_msgSend_length(v1, v2, v3, v4))
  {
    id v6 = objc_alloc(MEMORY[0x1E4F28DC0]);
    uint64_t v8 = objc_msgSend_initForReadingFromData_error_(v6, v7, (uint64_t)v5, 0);
    objc_msgSend_setDecodingFailurePolicy_(v8, v9, 0, v10);
    objc_msgSend_setRequiresSecureCoding_(v8, v11, 0, v12);
    uint64_t v15 = objc_msgSend_decodeObjectForKey_(v8, v13, *MEMORY[0x1E4F284E8], v14);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

id JWDecodeKeyedCodableObjectWithSecureCodingAllowedClasses(void *a1, void *a2)
{
  return sub_19189D638(a1, 0, a2);
}

id JWDecodeKeyedCodableObjectWithStrictSecureCoding(void *a1, uint64_t a2)
{
  return sub_1918C7034(a1, a2, 0);
}

id JWDecodeKeyedCodableObjectWithStrictSecureCodingAllowedClasses(void *a1, void *a2)
{
  return sub_1918C7034(a1, 0, a2);
}

id JWEncodeArray(void *a1)
{
  id v1 = a1;
  uint64_t v5 = v1;
  if (v1 && objc_msgSend_count(v1, v2, v3, v4))
  {
    uint64_t v19 = 0;
    uint64_t v7 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E4F28F98], v6, (uint64_t)v5, 200, 0, &v19);
    uint64_t v15 = v7;
    if (v7) {
      BOOL v16 = 1;
    }
    else {
      BOOL v16 = v19 == 0;
    }
    if (v16)
    {
      id v17 = v7;
    }
    else
    {
      _IMWarn(@"Error while encoding array %@", v8, v9, v10, v11, v12, v13, v14, v19);
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

id JWDecodeArray(void *a1)
{
  id v1 = a1;
  uint64_t v5 = v1;
  if (v1 && objc_msgSend_length(v1, v2, v3, v4))
  {
    uint64_t v10 = 0;
    unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v7 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E4F28F98], v6, (uint64_t)v5, 0, &v11, &v10);
    id v8 = 0;
    if (!v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v8 = v7;
      }
      else {
        id v8 = 0;
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

__CFString *StringGUID()
{
  CFUUIDRef v0 = CFUUIDCreate(0);
  id v1 = (__CFString *)CFUUIDCreateString(0, v0);
  if (v0) {
    CFRelease(v0);
  }
  return v1;
}

uint64_t jw_string_to_uuid(const char *a1, uint64_t a2)
{
  if (!a1) {
    return 22;
  }
  if (strlen(a1) > 0x25) {
    return 22;
  }
  char v4 = *a1;
  if (!*a1) {
    return 22;
  }
  __int16 v5 = 0;
  id v6 = (unsigned __int8 *)(a1 + 1);
  int v7 = 1;
  uint64_t result = 22;
  do
  {
    char v9 = v4 - 48;
    if ((v4 - 48) < 0xAu) {
      goto LABEL_8;
    }
    if ((v4 - 65) <= 5u)
    {
      char v9 = v4 - 55;
LABEL_8:
      if (v7) {
        goto LABEL_12;
      }
LABEL_9:
      *(unsigned char *)(a2 + v5++) |= v9;
      int v7 = 1;
      goto LABEL_14;
    }
    if ((v4 - 97) <= 5u)
    {
      char v9 = v4 - 87;
      if (v7)
      {
LABEL_12:
        int v7 = 0;
        *(unsigned char *)(a2 + v5) = 16 * v9;
        goto LABEL_14;
      }
      goto LABEL_9;
    }
    if (v4 != 45) {
      return result;
    }
LABEL_14:
    int v10 = *v6++;
    char v4 = v10;
  }
  while (v10 && v5 < 16);
  if (v5 == 16) {
    return 0;
  }
  else {
    return 22;
  }
}

uint64_t jw_cfstring_to_uuid(const __CFString *a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v5[2] = v3;
  v5[3] = v3;
  v5[0] = v3;
  v5[1] = v3;
  if (CFStringGetCString(a1, (char *)v5, 64, 0x600u)) {
    return jw_string_to_uuid((const char *)v5, a2);
  }
  else {
    return 22;
  }
}

uint64_t jw_data_to_uuid(void *a1, const char *a2)
{
  return 0;
}

uint64_t jw_uuid_to_data(uint64_t a1, char *a2)
{
  if (!a2) {
    return 22;
  }
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], a2, a1, 16);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  *(void *)a2 = v3;
  if (v3) {
    return 0;
  }
  else {
    return 22;
  }
}

id JWUUIDPushObjectToString(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (objc_msgSend_length(v1, v2, v3, v4))
  {
    v13[0] = 0;
    v13[1] = 0;
    objc_msgSend_getBytes_length_(v1, v5, (uint64_t)v13, 16);
    *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    out[2] = v6;
    out[3] = v6;
    out[0] = v6;
    out[1] = v6;
    uuid_unparse_upper((const unsigned __int8 *)v13, (char *)out);
    int v7 = (__CFString *)CFStringCreateWithCString(0, (const char *)out, 0x8000100u);
    unint64_t v11 = objc_msgSend_uppercaseString(v7, v8, v9, v10);
    if (v7) {
      CFRelease(v7);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

uint64_t sub_1918C6D80()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C978]);
  qword_1E92DB3A8 = objc_msgSend_initWithObjects_(v0, v1, @"NSString", v2, @"NSNumber", @"NSArray", @"NSDictionary", @"NSNull", 0);
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C6DFC()
{
  qword_1EB273840 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1C9B8]);
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918C6E38()
{
  id v27 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v26 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v13 = objc_msgSend_setWithObjects_(v27, v11, v26, v12, v25, v24, v23, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, 0);
  uint64_t v14 = (void *)qword_1EB273B40;
  qword_1EB273B40 = v13;

  uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  qword_1EB273B38 = objc_msgSend_setWithObjects_(v15, v20, v16, v21, v17, v18, v19, 0);
  return MEMORY[0x1F41817F8]();
}

id sub_1918C7034(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v9 = a3;
  if (v5 && objc_msgSend_length(v5, v6, v7, v8))
  {
    if (qword_1E92DB798 != -1) {
      dispatch_once(&qword_1E92DB798, &unk_1EE2306F8);
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v13 = v10;
    if (v9) {
      objc_msgSend_addObjectsFromArray_(v10, v11, (uint64_t)v9, v12);
    }
    if (a2)
    {
      if (objc_msgSend_containsObject_((void *)qword_1E92DB7A8, v11, a2, v12)) {
        objc_msgSend_unionSet_(v13, v14, qword_1E92DB7A0, v15);
      }
      objc_msgSend_addObject_(v13, v14, a2, v15);
    }
    else
    {
      objc_msgSend_unionSet_(v13, v11, qword_1E92DB7A0, v12);
    }
    id v24 = 0;
    uint64_t v17 = objc_msgSend__strictlyUnarchivedObjectOfClasses_fromData_error_(MEMORY[0x1E4F28DC0], v16, (uint64_t)v13, (uint64_t)v5, &v24);
    id v21 = v24;
    if (v21)
    {
      uint64_t v22 = objc_msgSend_XPC(IMIDSLog, v18, v19, v20);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1918E19FC((uint64_t)v21, v22);
      }
    }
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

uint64_t sub_1918C71B4()
{
  unsigned int v35 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v34 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  objc_msgSend_setWithObjects_(v35, v11, v34, v12, v33, v32, v31, v30, v29, v28, v27, v0, v1, v2, v3, v4, v5, v6, v7,
    v8,
    v9,
    v10,
  uint64_t v13 = 0);
  uint64_t v14 = (void *)qword_1E92DB7A0;
  qword_1E92DB7A0 = v13;

  uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  qword_1E92DB7A8 = objc_msgSend_setWithObjects_(v15, v24, v16, v25, v17, v18, v19, v20, v21, v22, v23, 0);
  return MEMORY[0x1F41817F8]();
}

uint64_t IMRegisterForPreferredAccountChangeNotificationsInternal()
{
  if (qword_1EB273748 != -1) {
    dispatch_once(&qword_1EB273748, &unk_1EE22FC58);
  }
  return 1;
}

void sub_1918C7498()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1918C74E4, @"__k_IMPreferredAccountForServiceChangedNotificationInternal", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_1918C74E4()
{
}

id IMPreferredAccountMap()
{
  if (qword_1EB273748 != -1) {
    dispatch_once(&qword_1EB273748, &unk_1EE22FC58);
  }
  return IMGetCachedDomainValueForKey(@"com.apple.conference", @"registration.callerIDMap");
}

BOOL IMUpdatePreferredAccountForService(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v3;
  id v6 = v4;
  uint64_t v13 = objc_msgSend_length(v5, v7, v8, v9);
  if (v13)
  {
    if (objc_msgSend_length(v6, v10, v11, v12))
    {
      uint64_t v16 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E4F1C9E8], v14, (uint64_t)v6, v15, @"guid", 0);
    }
    else
    {
      uint64_t v16 = 0;
    }
    uint64_t v17 = IMGetCachedDomainValueForKey(@"com.apple.conference", @"registration.callerIDMap");
    CFMutableDictionaryRef Mutable = objc_msgSend_mutableCopy(v17, v18, v19, v20);

    if (!Mutable) {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    }
    if (objc_msgSend_count(v16, v22, v23, v24)) {
      objc_msgSend_setObject_forKey_(Mutable, v25, (uint64_t)v16, (uint64_t)v5);
    }
    else {
      objc_msgSend_removeObjectForKey_(Mutable, v25, (uint64_t)v5, v26);
    }
    IMSetDomainValueForKey(@"com.apple.conference", @"registration.callerIDMap", Mutable);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"__k_IMPreferredAccountForServiceChangedNotificationInternal", 0, 0, 1u);
  }
  return v13 != 0;
}

void sub_1918C76BC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend___mainThreadPostNotificationName_object_(v5, v4, @"__kIMPreferredAccountForServiceChangedNotificationInternal", 0);
}

void sub_1918C8738(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = OSLogHandleForIDSCategory("Network");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    uint64_t v7 = a2;
    __int16 v8 = 2112;
    uint64_t v9 = a3;
    _os_log_impl(&dword_191892000, v5, OS_LOG_TYPE_DEFAULT, "Received CTServerConnection callback { notification: %@, notificationInfo: %@ }", (uint8_t *)&v6, 0x16u);
  }
}

void sub_1918C9D58(uint64_t a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1918CA3BC;
  void v2[3] = &unk_1E5723248;
  v2[4] = a2;
  im_dispatch_after(v2, 0.0);
}

uint64_t (*sub_1918CA084())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DAF80 = result;
  return result;
}

uint64_t sub_1918CA3BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x1F4181798](*(void *)(a1 + 32), sel__resetActivationState, a3, a4);
}

id IMLocalizedStringFromTableInBundleForLanguage(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (!objc_msgSend_length(v7, v11, v12, v13)) {
    goto LABEL_13;
  }
  if (!objc_msgSend_length(v8, v14, v15, v16)) {
    goto LABEL_13;
  }
  uint64_t v19 = objc_msgSend_length(v10, v14, v17, v18);
  if (!v9 || !v19) {
    goto LABEL_13;
  }
  objc_msgSend_localizations(v9, v14, v20, v21);
  CFArrayRef v22 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1C978], v23, (uint64_t)v10, v24);
  CFArrayRef v25 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v22, v26, v27, v28))
  {
    CFArrayRef v32 = CFBundleCopyLocalizationsForPreferences(v22, v25);
    uint64_t v36 = objc_msgSend_count(v32, v33, v34, v35);
  }
  else
  {
    CFArrayRef v32 = 0;
    uint64_t v36 = objc_msgSend_count(0, v29, v30, v31);
  }
  if (v36
    && (objc_msgSend___imFirstObject(v32, v37, v38, v39),
        uint64_t v40 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_pathForResource_ofType_inDirectory_forLocalization_(v9, v41, (uint64_t)v8, @"strings", 0, v40), uint64_t v42 = objc_claimAutoreleasedReturnValue(), v40, v42))
  {
    uint64_t v45 = objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x1E4F1C9E8], v43, (uint64_t)v42, v44);
    id v48 = objc_msgSend_objectForKey_(v45, v46, (uint64_t)v7, v47);
  }
  else
  {
    id v48 = 0;
  }

  if (!v48)
  {
LABEL_13:
    id v48 = objc_msgSend_localizedStringForKey_value_table_(v9, v14, (uint64_t)v7, (uint64_t)&stru_1EE231AD8, v8);
  }

  return v48;
}

id IMLocalizedStringFromTableInBundle(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  id v8 = IMCurrentPreferredLanguage();
  id v9 = IMLocalizedStringFromTableInBundleForLanguage(v7, v6, v5, v8);

  return v9;
}

id IMCurrentPreferredLanguage()
{
  if (qword_1E92DB210 != -1) {
    dispatch_once(&qword_1E92DB210, &unk_1EE22FCB8);
  }
  uint64_t v0 = (void *)qword_1E92DB9A8;
  return v0;
}

void sub_1918CA660()
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)sub_1918CA6B8, (CFStringRef)*MEMORY[0x1E4F1D200], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  sub_1918CA6C0(0);
}

void sub_1918CA6B8()
{
}

void sub_1918CA6C0(int a1)
{
  id v22 = (id)CFPreferencesCopyValue(@"AppleLanguages", (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  id v2 = (id)qword_1E92DB9A8;
  id v3 = (void *)qword_1E92DB9A8;
  qword_1E92DB9A8 = 0;

  uint64_t v7 = objc_msgSend___imFirstObject(v22, v4, v5, v6);
  id v8 = (void *)qword_1E92DB9A8;
  qword_1E92DB9A8 = v7;

  if (qword_1E92DB9A8) {
    goto LABEL_3;
  }
  uint64_t v12 = objc_msgSend_autoupdatingCurrentLocale(MEMORY[0x1E4F1CA20], v9, v10, v11);
  uint64_t v15 = objc_msgSend_objectForKey_(v12, v13, *MEMORY[0x1E4F1C438], v14);
  uint64_t v16 = (void *)qword_1E92DB9A8;
  qword_1E92DB9A8 = v15;

  if (qword_1E92DB9A8)
  {
LABEL_3:
    if (!a1) {
      goto LABEL_8;
    }
  }
  else
  {
    qword_1E92DB9A8 = @"en";

    if (!a1) {
      goto LABEL_8;
    }
  }
  if ((id)qword_1E92DB9A8 != v2 && (objc_msgSend_isEqualToString_(v2, v9, qword_1E92DB9A8, v11) & 1) == 0)
  {
    uint64_t v20 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v17, v18, v19);
    objc_msgSend___mainThreadPostNotificationName_object_(v20, v21, @"__kIMCurrentPreferredLanguageChangedNotification", 0);
  }
LABEL_8:
}

uint64_t sub_1918CA868()
{
  qword_1EB273C60 = objc_alloc_init(_IMLogFileCompressor);
  return MEMORY[0x1F41817F8]();
}

id IMCreateStringFromDate(unint64_t a1)
{
  if (qword_1E92DB7B8 != -1) {
    dispatch_once(&qword_1E92DB7B8, &unk_1EE230718);
  }
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_1918CAC9C;
  uint64_t v14 = sub_1918CACAC;
  id v15 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1918CACB4;
  block[3] = &unk_1E57241D0;
  void block[4] = &v10;
  dispatch_sync((dispatch_queue_t)qword_1E92DB7B0, block);
  if (a1)
  {
    if (qword_1E92DB7D8 != -1) {
      dispatch_once(&qword_1E92DB7D8, &unk_1EE2308B8);
    }
    id v2 = (id)v11[5];
    uint64_t v5 = objc_msgSend_stringByAppendingFormat_(v2, v3, @" [%013.06f]", v4, *(double *)&qword_1E92DB7D0 * (double)a1);
    uint64_t v6 = (void *)v11[5];
    v11[5] = v5;
  }
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void sub_1918CAC44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1918CAC5C()
{
  qword_1E92DB7B0 = (uint64_t)dispatch_queue_create("com.apple.FileLoggingDateQueue", 0);
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918CAC9C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1918CACAC(uint64_t a1)
{
}

void sub_1918CACB4(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (qword_1E92DB7C0) {
    BOOL v2 = *(double *)&qword_1E92DB7C8 < 1.0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2 || vabdd_f64(floor(CFAbsoluteTimeGetCurrent()), floor(*(double *)&qword_1E92DB7C8)) > 0.9)
  {
    qword_1E92DB7C8 = floor(CFAbsoluteTimeGetCurrent());
    time_t v3 = (uint64_t)(*(double *)&qword_1E92DB7C8 + *MEMORY[0x1E4F1CF78]);
    v10.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
    time_t v11 = v3;
    *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v10.tm_mon = v4;
    *(_OWORD *)&v10.tm_isdst = v4;
    *(_OWORD *)&v10.tm_seCC_SHA256_CTX c = v4;
    *(_OWORD *)uint64_t v12 = 0u;
    long long v13 = 0u;
    localtime_r(&v11, &v10);
    strftime(v12, 0x20uLL, "%Y-%m-%d %X %z", &v10);
    id v5 = [NSString alloc];
    uint64_t v8 = objc_msgSend_initWithUTF8String_(v5, v6, (uint64_t)v12, v7);
    id v9 = (void *)qword_1E92DB7C0;
    qword_1E92DB7C0 = v8;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), (id)qword_1E92DB7C0);
}

double sub_1918CADE8()
{
  mach_timebase_info info = (mach_timebase_info)0xAAAAAAAAAAAAAAAALL;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  double result = (double)v0 / (double)v1 / 1000000000.0;
  qword_1E92DB7D0 = *(void *)&result;
  return result;
}

void sub_1918CB0A0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_processInfo(MEMORY[0x1E4F28F80], a2, a3, a4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_processName(v9, v4, v5, v6);
  uint64_t v8 = (void *)qword_1E92DB7E0;
  qword_1E92DB7E0 = v7;
}

uint64_t sub_1918CB1D0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  qword_1E92DB7F8 = objc_msgSend_stringByAppendingPathComponent_(@"/var/mobile/Library", a2, @"Logs", a4);
  return MEMORY[0x1F41817F8]();
}

void sub_1918CB4E4(uint64_t a1)
{
  BOOL v2 = (void *)MEMORY[0x192FDE5A0]();
  time_t v3 = (__CFString *)*(id *)(a1 + 32);
  if (v3) {
    uint64_t v7 = v3;
  }
  else {
    uint64_t v7 = @"FaceTime";
  }
  uint64_t v8 = objc_msgSend_logFileDirectory(*(void **)(a1 + 56), v4, v5, v6);
  time_t v11 = objc_msgSend_stringByAppendingPathComponent_(v8, v9, (uint64_t)v7, v10);

  id v15 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v12, v13, v14);
  uint64_t v18 = objc_msgSend_stringByAppendingPathComponent_(v11, v16, *(void *)(a1 + 40), v17);
  if (!sub_1918CB92C(v18) && (objc_msgSend_fileExistsAtPath_(v15, v19, (uint64_t)v11, v20) & 1) == 0) {
    objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v15, v21, (uint64_t)v11, 1, 0, 0);
  }
  v22.tv_seCC_SHA256_CTX c = 0xAAAAAAAAAAAAAAAALL;
  v22.tv_nseCC_SHA256_CTX c = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v115.st_blksize_t size = v22;
  *(timespec *)v115.st_qspare = v22;
  v115.st_birthtimespeCC_SHA256_CTX c = v22;
  *(timespec *)&v115.st_size_t size = v22;
  v115.st_mtimespeCC_SHA256_CTX c = v22;
  v115.st_ctimespeCC_SHA256_CTX c = v22;
  *(timespec *)&v115.st_uid = v22;
  v115.st_atimespeCC_SHA256_CTX c = v22;
  *(timespec *)&v115.st_dev = v22;
  int v23 = dword_1E92DB808++;
  if (v23 >= 1001)
  {
    id v24 = v18;
    uint64_t v28 = (const char *)objc_msgSend_fileSystemRepresentation(v24, v25, v26, v27);
    if (stat(v28, &v115))
    {
      sub_1918CB988(v24);
      dword_1E92DB808 = 0;
    }
    else
    {
      dword_1E92DB808 = 0;
      if (v115.st_size > 10485760)
      {
        uint64_t v112 = v11;
        uint64_t v31 = objc_msgSend_stringWithFormat_(NSString, v29, @"%d.zip", v30, 9);
        uint64_t v34 = objc_msgSend_stringByAppendingPathExtension_(v24, v32, (uint64_t)v31, v33);

        id v35 = v24;
        if (sub_1918CB92C(v35))
        {
          int v36 = sub_1918CB9D8(v35);
          close(v36);
          sub_1918CB988(v35);
        }
        v113 = v7;

        if (objc_msgSend_fileExistsAtPath_(v15, v37, v34, v38)) {
          objc_msgSend_removeItemAtPath_error_(v15, v39, v34, 0);
        }
        uint64_t v111 = (void *)v34;
        uint64_t v41 = 9;
        do
        {
          unint64_t v42 = v41 - 1;
          uint64_t v43 = objc_msgSend_stringWithFormat_(NSString, v39, @"%d.zip", v40, v41 - 1);
          uint64_t v46 = objc_msgSend_stringByAppendingPathExtension_(v35, v44, (uint64_t)v43, v45);

          uint64_t v49 = objc_msgSend_stringWithFormat_(NSString, v47, @"%d.zip", v48, v41);
          uint64_t v52 = objc_msgSend_stringByAppendingPathExtension_(v35, v50, (uint64_t)v49, v51);

          if (objc_msgSend_fileExistsAtPath_(v15, v53, (uint64_t)v46, v54)) {
            objc_msgSend_moveItemAtPath_toPath_error_(v15, v55, (uint64_t)v46, (uint64_t)v52, 0);
          }

          uint64_t v41 = v42;
        }
        while (v42 > 1);
        uint64_t v57 = objc_msgSend_lastPathComponent(v35, v39, v56, v40);
        uint64_t v61 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v58, v59, v60);
        uint64_t v110 = (void *)v57;
        uint64_t v64 = objc_msgSend__randomTemporaryPathWithFileName_(v61, v62, v57, v63);

        uint64_t v67 = objc_msgSend_stringByAppendingPathExtension_(v35, v65, @"1.zip", v66);
        id v114 = 0;
        objc_msgSend_moveItemAtPath_toPath_error_(v15, v68, (uint64_t)v35, v64, &v114);
        id v69 = v114;
        CFRange v77 = v69;
        if (v69)
        {
          uint64_t v107 = v64;
          id v108 = v69;
          _IMWarn(@"Failed to move main item from %@ to %@ (%@)", (uint64_t)v70, v71, v72, v73, v74, v75, v76, (char)v35);
        }
        CFRange v78 = objc_msgSend_sharedInstance(_IMLogFileCompressor, v70, v71, v72);
        id v109 = (void *)v64;
        objc_msgSend_compressPath_toPath_(v78, v79, v64, (uint64_t)v67);

        unint64_t v82 = 10;
        do
        {
          uint64_t v83 = objc_msgSend_stringWithFormat_(NSString, v80, @"%d", v81, --v82, v107, v108);
          id v86 = objc_msgSend_stringByAppendingPathExtension_(v35, v84, (uint64_t)v83, v85);

          if (objc_msgSend_fileExistsAtPath_(v15, v87, (uint64_t)v86, v88)) {
            objc_msgSend_removeItemAtPath_error_(v15, v89, (uint64_t)v86, 0);
          }
        }
        while (v82 > 1);

        uint64_t v7 = v113;
        time_t v11 = v112;
      }
    }
  }
  int v90 = sub_1918CB9D8(v18);
  if (v90 == -1)
  {
    _IMWarn(@"Unable to open logging file '%@'", v91, v92, v93, v94, v95, v96, v97, (char)v18);
  }
  else
  {
    int v98 = v90;
    id v99 = *(id *)(a1 + 48);
    uint64_t v103 = (const void *)objc_msgSend_UTF8String(v99, v100, v101, v102);
    size_t v106 = objc_msgSend_lengthOfBytesUsingEncoding_(*(void **)(a1 + 48), v104, 4, v105);
    write(v98, v103, v106);
  }
}

BOOL sub_1918CB92C(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_length(v1, v2, v3, v4))
  {
    uint64_t v7 = objc_msgSend_objectForKey_((void *)qword_1E92DB800, v5, (uint64_t)v1, v6);
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void sub_1918CB988(void *a1)
{
  id v6 = a1;
  if (objc_msgSend_length(v6, v1, v2, v3)) {
    objc_msgSend_removeObjectForKey_((void *)qword_1E92DB800, v4, (uint64_t)v6, v5);
  }
}

uint64_t sub_1918CB9D8(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_length(v1, v2, v3, v4))
  {
    if (qword_1E92DB820 != -1) {
      dispatch_once(&qword_1E92DB820, &unk_1EE230178);
    }
    uint64_t v7 = objc_msgSend_objectForKey_((void *)qword_1E92DB800, v5, (uint64_t)v1, v6);
    if (v7)
    {
      time_t v11 = v7;
      uint64_t v12 = objc_msgSend_intValue(v7, v8, v9, v10);
    }
    else
    {
      id v13 = v1;
      uint64_t v17 = (const char *)objc_msgSend_fileSystemRepresentation(v13, v14, v15, v16);
      uint64_t v12 = open(v17, 521, 384);
      time_t v11 = objc_msgSend_numberWithInt_(NSNumber, v18, v12, v19);
      objc_msgSend_setObject_forKey_((void *)qword_1E92DB800, v20, (uint64_t)v11, (uint64_t)v13);
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

void sub_1918CBAD8()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.IMFileLoggingQueue", 0);
  id v1 = (void *)qword_1E92DB810;
  qword_1E92DB810 = (uint64_t)v0;

  uint64_t v2 = qword_1E92DB810;
  if (qword_1E92DB810)
  {
    uint64_t v3 = dispatch_get_global_queue(-2, 0);
    dispatch_set_target_queue(v2, v3);
  }
}

uint64_t sub_1918CBB68()
{
  qword_1E92DB800 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return MEMORY[0x1F41817F8]();
}

void sub_1918CBC98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (_IMWillLog(@"IMRemoteURLMockScheduler"))
  {
    _IMAlwaysLog(0, @"IMRemoteURLMockScheduler", @"URL Loading service disconnected", v9, v10, v11, v12, v13, a9);
  }
}

uint64_t sub_1918CBE60()
{
  qword_1EB273C68 = objc_alloc_init(IMCallMonitor);
  return MEMORY[0x1F41817F8]();
}

uint64_t IMInsertOptionallyCodableDictionariesToXPCDictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a1;
  char v12 = 0;
  if (v10 && a2)
  {
    uint64_t v31 = (id *)&a9;
    char v12 = 1;
    *(void *)&long long v11 = 138412290;
    long long v30 = v11;
    do
    {
      uint64_t v13 = v31;
      CFArrayRef v32 = v31 + 1;
      id v14 = *v13;
      uint64_t v15 = JWEncodeDictionary(v14);
      if (!objc_msgSend_length(v15, v16, v17, v18))
      {
        uint64_t v22 = JWEncodeKeyedCodableObject(v14);

        uint64_t v15 = (void *)v22;
      }
      if (!objc_msgSend_length(v15, v19, v20, v21, v30))
      {
        int v23 = OSLogHandleForIDSCategory("Warning");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = v30;
          id v34 = v14;
          _os_log_impl(&dword_191892000, v23, OS_LOG_TYPE_DEFAULT, "Failed to encode codable: %@", buf, 0xCu);
        }

        uint64_t v27 = objc_msgSend_data(MEMORY[0x1E4F1C9B8], v24, v25, v26);

        char v12 = 0;
        uint64_t v15 = (void *)v27;
      }
      sub_191899730(v15, a2, v10);

      uint64_t v28 = (const char **)v32;
      uint64_t v31 = (id *)(v32 + 1);
      a2 = *v28;
    }
    while (*v28);
  }

  return v12 & 1;
}

uint64_t IMCreateInvocationFromXPCObject(void *a1, void *a2)
{
  return IMCreateInvocationFromXPCObjectWithProtocol(a1, a2, 0, 0);
}

id IMGetXPCArrayFromDictionary(void *a1, const char *a2)
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    uint64_t v3 = sub_19189D580(a2, a1, 0);
    uint64_t v2 = JWDecodeArray(v3);
  }
  return v2;
}

id IMGetXPCKeyedCodableFromDictionaryWithSecureCodingAllowedClasses(void *a1, const char *a2, void *a3)
{
  uint64_t v3 = 0;
  if (a1 && a2)
  {
    id v6 = a3;
    uint64_t v7 = sub_19189D580(a2, a1, 0);
    uint64_t v3 = JWDecodeKeyedCodableObjectWithSecureCodingAllowedClasses(v7, v6);
  }
  return v3;
}

int64_t IMGetXPCIntFromDictionary(void *a1, const char *a2)
{
  if (a1 && a2) {
    return xpc_dictionary_get_int64(a1, a2);
  }
  else {
    return 0;
  }
}

BOOL IMGetXPCBoolFromDictionary(void *a1, const char *a2)
{
  return a1 && a2 && xpc_dictionary_get_BOOL(a1, a2);
}

uint64_t IMInsertStringsToXPCDictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a1;
  if (v10) {
    BOOL v11 = a2 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  uint64_t v12 = !v11;
  if (!v11)
  {
    uint64_t v16 = (const char **)&a9;
    do
    {
      uint64_t v13 = v16;
      uint64_t v17 = v16 + 1;
      if (*v13) {
        xpc_dictionary_set_string(v10, a2, *v13);
      }
      id v14 = v17;
      uint64_t v16 = v17 + 1;
      a2 = *v14;
    }
    while (*v14);
  }

  return v12;
}

uint64_t IMInsertArraysToXPCDictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a1;
  if (v10) {
    BOOL v11 = a2 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  uint64_t v12 = !v11;
  if (!v11)
  {
    uint64_t v22 = (id *)&a9;
    do
    {
      uint64_t v13 = v22;
      int v23 = v22 + 1;
      id v14 = *v13;
      uint64_t v15 = JWEncodeArray(v14);
      if (!v15)
      {
        uint64_t v16 = OSLogHandleForIDSCategory("Warning");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v25 = v14;
          _os_log_impl(&dword_191892000, v16, OS_LOG_TYPE_DEFAULT, "Failed to encode array: %@", buf, 0xCu);
        }

        uint64_t v15 = objc_msgSend_data(MEMORY[0x1E4F1C9B8], v17, v18, v19);
      }
      sub_191899730(v15, a2, v10);

      uint64_t v20 = (const char **)v23;
      uint64_t v22 = (id *)(v23 + 1);
      a2 = *v20;
    }
    while (*v20);
  }

  return v12;
}

uint64_t IMInsertKeyedCodableObjectsToXPCDictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a1;
  if (v10) {
    BOOL v11 = a2 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  uint64_t v12 = !v11;
  if (!v11)
  {
    uint64_t v21 = (id *)&a9;
    do
    {
      uint64_t v13 = v21;
      uint64_t v22 = v21 + 1;
      id v14 = *v13;
      uint64_t v18 = JWEncodeKeyedCodableObject(v14);
      if (!v18)
      {
        uint64_t v18 = objc_msgSend_data(MEMORY[0x1E4F1C9B8], v15, v16, v17);
      }
      sub_191899730(v18, a2, v10);

      uint64_t v19 = (const char **)v22;
      uint64_t v21 = (id *)(v22 + 1);
      a2 = *v19;
    }
    while (*v19);
  }

  return v12;
}

uint64_t IMInsertDatasToXPCDictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a1;
  if (v10) {
    BOOL v11 = a2 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  uint64_t v12 = !v11;
  if (!v11)
  {
    uint64_t v20 = (id *)&a9;
    do
    {
      uint64_t v13 = v20;
      uint64_t v21 = v20 + 1;
      id v17 = *v13;
      if (!v17)
      {
        objc_msgSend_data(MEMORY[0x1E4F1C9B8], v14, v15, v16);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      sub_191899730(v17, a2, v10);

      uint64_t v18 = (const char **)v21;
      uint64_t v20 = (id *)(v21 + 1);
      a2 = *v18;
    }
    while (*v18);
  }

  return v12;
}

uint64_t IMInsertIntsToXPCDictionary(xpc_object_t xdict, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (xdict) {
    BOOL v9 = a2 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  uint64_t v10 = !v9;
  if (!v9)
  {
    id v14 = &a9;
    do
    {
      xpc_dictionary_set_int64(xdict, a2, *(int *)v14);
      uint64_t v12 = (const char **)(v14 + 1);
      v14 += 2;
      a2 = *v12;
    }
    while (*v12);
  }
  return v10;
}

uint64_t IMInsertBoolsToXPCDictionary(xpc_object_t xdict, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (xdict) {
    BOOL v9 = a2 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  uint64_t v10 = !v9;
  if (!v9)
  {
    id v14 = &a9;
    do
    {
      xpc_dictionary_set_BOOL(xdict, a2, *(_DWORD *)v14 != 0);
      uint64_t v12 = (const char **)(v14 + 1);
      v14 += 2;
      a2 = *v12;
    }
    while (*v12);
  }
  return v10;
}

void sub_1918CD008(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  if (MEMORY[0x192FDEE90]() != MEMORY[0x1E4F145A8])
  {
    uint64_t v4 = OSLogHandleForIDSCategory("XPC");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      name = xpc_connection_get_name(*(xpc_connection_t *)(a1 + 32));
      int v16 = 136315394;
      id v17 = name;
      __int16 v18 = 2048;
      uint64_t v19 = v3;
      _os_log_impl(&dword_191892000, v4, OS_LOG_TYPE_DEFAULT, "Received unexpected event in hander for service %s: %p", (uint8_t *)&v16, 0x16u);
    }

    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      (*(void (**)(uint64_t, char *))(v6 + 16))(v6, v3);
    }
    goto LABEL_6;
  }
  if (v3 == (char *)MEMORY[0x1E4F14520])
  {
    uint64_t v10 = OSLogHandleForIDSCategory("XPC");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = xpc_connection_get_name(*(xpc_connection_t *)(a1 + 32));
      int v16 = 136315138;
      id v17 = v11;
      _os_log_impl(&dword_191892000, v10, OS_LOG_TYPE_DEFAULT, "Interrupted connection to service %s", (uint8_t *)&v16, 0xCu);
    }

    uint64_t v12 = *(void *)(a1 + 40);
    if (v12) {
      goto LABEL_16;
    }
  }
  else
  {
    if (v3 != (char *)MEMORY[0x1E4F14528])
    {
      if (v3 == (char *)MEMORY[0x1E4F14550])
      {
        uint64_t v7 = OSLogHandleForIDSCategory("XPC");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = xpc_connection_get_name(*(xpc_connection_t *)(a1 + 32));
          int v16 = 136315138;
          id v17 = v15;
          _os_log_impl(&dword_191892000, v7, OS_LOG_TYPE_DEFAULT, "Imminent connection termination for service %s", (uint8_t *)&v16, 0xCu);
        }
      }
      else
      {
        uint64_t v7 = OSLogHandleForIDSCategory("XPC");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v8 = xpc_connection_get_name(*(xpc_connection_t *)(a1 + 32));
          string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E4F14530]);
          int v16 = 136315394;
          id v17 = v8;
          __int16 v18 = 2080;
          uint64_t v19 = string;
          _os_log_impl(&dword_191892000, v7, OS_LOG_TYPE_DEFAULT, "Unxpected error for service %s: %s", (uint8_t *)&v16, 0x16u);
        }
      }

      goto LABEL_6;
    }
    uint64_t v13 = OSLogHandleForIDSCategory("XPC");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = xpc_connection_get_name(*(xpc_connection_t *)(a1 + 32));
      int v16 = 136315138;
      id v17 = v14;
      _os_log_impl(&dword_191892000, v13, OS_LOG_TYPE_DEFAULT, "Connection Invalid error for service %s", (uint8_t *)&v16, 0xCu);
    }

    uint64_t v12 = *(void *)(a1 + 40);
    if (v12) {
LABEL_16:
    }
      (*(void (**)(void))(v12 + 16))();
  }
LABEL_6:
}

void sub_1918CD314(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x1918CD0D4);
  }
  _Unwind_Resume(a1);
}

_xpc_connection_s *IMXPCCreateConnectionForService(char a1, const char *a2, void *a3, void *a4)
{
  return IMXPCCreateConnectionForServiceWithQueue(a1, 1, a2, 0, a3, a4);
}

uint64_t IMXPCCreateServerConnectionWithQueue(const char *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t IMXPCCreateSim2HostServerConnection(const char *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v10 = dispatch_get_global_queue(2, 0);
  uint64_t v11 = sub_191896B24(a1, v10, a2, a3, a4, a5, 1);

  return v11;
}

void sub_1918CD490()
{
  dispatch_queue_t v0 = [IMURLRequestSession alloc];
  objc_msgSend_defaultSessionConfiguration(MEMORY[0x1E4F290F0], v1, v2, v3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = sub_1918CD520();
  uint64_t v6 = objc_msgSend_initWithConfiguration_queue_requiresIDSHost_(v0, v5, (uint64_t)v8, (uint64_t)v4, 0);
  uint64_t v7 = (void *)qword_1E92DB828;
  qword_1E92DB828 = v6;
}

id sub_1918CD520()
{
  if (qword_1E92DB850 != -1) {
    dispatch_once(&qword_1E92DB850, &unk_1EE2302B8);
  }
  dispatch_queue_t v0 = (void *)qword_1E92DB848;
  return v0;
}

void sub_1918CD5C8()
{
  dispatch_queue_t v0 = [IMURLRequestSession alloc];
  objc_msgSend_defaultSessionConfiguration(MEMORY[0x1E4F290F0], v1, v2, v3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = sub_1918CD520();
  uint64_t v6 = objc_msgSend_initWithConfiguration_queue_requiresIDSHost_(v0, v5, (uint64_t)v8, (uint64_t)v4, 1);
  uint64_t v7 = (void *)qword_1E92DB838;
  qword_1E92DB838 = v6;
}

uint64_t sub_1918CD850(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1918CD988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1918CD9A0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1918CD9B0(uint64_t a1)
{
}

void sub_1918CD9B8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v18 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v15 = objc_msgSend__timingData(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v9, v10, v11);
  uint64_t v16 = *(void *)(a1 + 32);
  if (v16)
  {
    uint64_t v17 = objc_msgSend_statusCode(v7, v12, v13, v14);
    (*(void (**)(uint64_t, id, uint64_t, id, id, void *))(v16 + 16))(v16, v7, v17, v18, v8, v15);
  }
}

void sub_1918CE24C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_sharedInstance(IMLockdownManager, a2, a3, a4);
  int isInternalInstall = objc_msgSend_isInternalInstall(v4, v5, v6, v7);

  if (isInternalInstall) {
    byte_1EB273798 = 1;
  }
}

void sub_1918CE298(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  int v5 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_URLLoading(IMIDSLog, a2, a3, a4);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (a4 || (v5 & 1) == 0)
  {
    if (v8)
    {
      uint64_t v23 = *(void *)(a1 + 48);
      int v24 = 67109634;
      *(_DWORD *)id v25 = v5;
      *(_WORD *)&void v25[4] = 2112;
      *(void *)&v25[6] = a4;
      __int16 v26 = 2048;
      uint64_t v27 = v23;
      _os_log_impl(&dword_191892000, v7, OS_LOG_TYPE_DEFAULT, "SecTrustEvaluateAsyncWithError() failed with result=%d error=%@ {identifier: %llu}", (uint8_t *)&v24, 0x1Cu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 48);
      int v24 = 134217984;
      *(void *)id v25 = v9;
      _os_log_impl(&dword_191892000, v7, OS_LOG_TYPE_DEFAULT, "Server trust validation succeeded {identifier: %llu}", (uint8_t *)&v24, 0xCu);
    }

    uint64_t v10 = (void *)MEMORY[0x1E4F29098];
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v15 = objc_msgSend_protectionSpace(*(void **)(a1 + 32), v12, v13, v14);
    uint64_t v19 = objc_msgSend_serverTrust(v15, v16, v17, v18);
    uint64_t v22 = objc_msgSend_credentialForTrust_(v10, v20, v19, v21);
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v22);
  }
}

void sub_1918CE468()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.IdentityServices.SessionQ", v2);
  id v1 = (void *)qword_1E92DB848;
  qword_1E92DB848 = (uint64_t)v0;
}

uint64_t sub_1918CE520()
{
  qword_1E92DB398 = (uint64_t)os_log_create("com.apple.IDS", "Encryption");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918CE5B8()
{
  qword_1E92DAF58 = (uint64_t)os_log_create("com.apple.IDS", "Daemon");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918CE5FC()
{
  qword_1E92DAD18 = (uint64_t)os_log_create("com.apple.IDS", "Daemon-oversized");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918CE694()
{
  qword_1E92DB2D8 = (uint64_t)os_log_create("com.apple.IDS", "DataDetector");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918CE72C()
{
  qword_1E92DAD08 = (uint64_t)os_log_create("com.apple.IDS", "ActivityMonitor");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918CE7C4()
{
  qword_1E92DAFC0 = (uint64_t)os_log_create("com.apple.IDS", "Security");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918CE85C()
{
  qword_1EB273820 = (uint64_t)os_log_create("com.apple.IDS", "URLLoading");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918CE8A0()
{
  qword_1E92DB358 = (uint64_t)os_log_create("com.apple.IDS", "timer");
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918CE938()
{
  qword_1E92DB0C8 = (uint64_t)os_log_create("com.apple.IDS", "XPC");
  return MEMORY[0x1F41817F8]();
}

id IMUnformattedPhoneNumberForCFPhoneNumberRef(void *a1)
{
  if (a1)
  {
    uint64_t v2 = a1;
    if (qword_1E92DB1F8 != -1) {
      dispatch_once(&qword_1E92DB1F8, &unk_1EE231278);
    }
    a1 = (void *)off_1E92DB1F0(v2);
    uint64_t v1 = vars8;
  }
  return a1;
}

void *sub_1918CEA10()
{
  double result = (void *)IMWeakLinkSymbol();
  off_1E92DB1F0 = result;
  return result;
}

id IMCountryCodeCFPhoneNumberRef(void *a1)
{
  if (a1)
  {
    uint64_t v2 = a1;
    if (qword_1E92DB1E8 != -1) {
      dispatch_once(&qword_1E92DB1E8, &unk_1EE2312B8);
    }
    a1 = (void *)off_1E92DB1E0(v2);
    uint64_t v1 = vars8;
  }
  return a1;
}

uint64_t (*sub_1918CEAAC())(void)
{
  double result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DB1E0 = result;
  return result;
}

id IMFormattedPhoneNumberForCFPhoneNumberRef(uint64_t a1)
{
  if (qword_1E92DB088 != -1) {
    dispatch_once(&qword_1E92DB088, &unk_1EE231418);
  }
  if (qword_1E92DB090 == -1)
  {
    if (a1) {
      goto LABEL_5;
    }
LABEL_8:
    uint64_t v2 = 0;
    goto LABEL_9;
  }
  dispatch_once(&qword_1E92DB090, &unk_1EE231478);
  if (!a1) {
    goto LABEL_8;
  }
LABEL_5:
  uint64_t v2 = (void *)off_1E92DB078(a1);
  if (!v2) {
    uint64_t v2 = (void *)off_1E92DB080(a1);
  }
LABEL_9:
  return v2;
}

void *sub_1918CEB8C()
{
  double result = (void *)IMWeakLinkSymbol();
  off_1E92DB078 = result;
  return result;
}

void *sub_1918CEBBC()
{
  double result = (void *)IMWeakLinkSymbol();
  off_1E92DB080 = result;
  return result;
}

id IMCountryCodeForNumber(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    if (qword_1E92DB280 != -1) {
      dispatch_once(&qword_1E92DB280, &unk_1EE2314B8);
    }
    uint64_t v2 = (void *)off_1E92DB278(v1);
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t (*sub_1918CEC70())(void)
{
  double result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DB278 = result;
  return result;
}

id IMNormalizedPhoneNumberForPhoneNumber(void *a1)
{
  return IMFormatPhoneNumber(a1, 0);
}

__CFString *IMUnformattedDisplayStringForID(void *a1, void *a2)
{
  return IMUnformattedDisplayStringForIDWithCountryCode(a1, 0, a2);
}

__CFString *IMUnformattedDisplayStringForIDWithCountryCode(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  if (IMStringIsEmail(v5))
  {
    if (a3) {
      *a3 = 2;
    }
    objc_msgSend_lowercaseString(v5, v7, v8, v9);
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (IMStringIsPhoneNumber(v5))
    {
      if (a3) {
        *a3 = 3;
      }
      uint64_t v11 = (void *)IMPhoneNumberRefCopyForPhoneNumber(v5, v6, 0);
      IMUnformattedPhoneNumberForCFPhoneNumberRef(v11);
      uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v11) {
        CFRelease(v11);
      }
      if (objc_msgSend_length(v15, v12, v13, v14))
      {
        uint64_t v16 = IMCopyStringWithLocalizedNumbers(v15);
        if (objc_msgSend_length(v16, v17, v18, v19)) {
          uint64_t v20 = v16;
        }
        else {
          uint64_t v20 = v15;
        }
        uint64_t v21 = v20;

        goto LABEL_20;
      }
    }
    if (a3) {
      *a3 = 0;
    }
    uint64_t v10 = (__CFString *)v5;
  }
  uint64_t v21 = v10;
LABEL_20:

  return v21;
}

id IMUnformattedNumberForUnformattedNumber(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    if (qword_1E92DB860 != -1) {
      dispatch_once(&qword_1E92DB860, &unk_1EE22FF78);
    }
    uint64_t v2 = (void *)off_1E92DB858(v1);
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t (*sub_1918CEE50())(void)
{
  double result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DB858 = result;
  return result;
}

id IMUnformattedDisplayStringForNumber(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v7 = v3;
  switch(a2)
  {
    case 3:
      uint64_t v12 = (void *)IMPhoneNumberRefCopyForPhoneNumber(v3, 0, 0);
      uint64_t v13 = IMUnformattedPhoneNumberForCFPhoneNumberRef(v12);
      if (v12) {
        CFRelease(v12);
      }
      break;
    case 2:
      objc_msgSend_lowercaseString(v3, v4, v5, v6);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
      id v8 = v3;
LABEL_8:
      uint64_t v13 = v8;
      uint64_t v14 = objc_msgSend_length(v8, v9, v10, v11);
      goto LABEL_11;
    default:
      uint64_t v13 = 0;
      break;
  }
  uint64_t v14 = objc_msgSend_length(v13, v4, v5, v6);
LABEL_11:
  if (v14)
  {
    id v15 = v13;
LABEL_13:
    uint64_t v16 = v15;
    uint64_t v13 = v15;
    goto LABEL_24;
  }
  if (IMStringIsEmail(v7))
  {
    uint64_t v20 = objc_msgSend_lowercaseString(v7, v17, v18, v19);
  }
  else
  {
    if (IMStringIsPhoneNumber(v7))
    {
      int v24 = (void *)IMPhoneNumberRefCopyForPhoneNumber(v7, 0, 0);
      id v25 = IMUnformattedPhoneNumberForCFPhoneNumberRef(v24);

      if (v24) {
        CFRelease(v24);
      }
      if (objc_msgSend_length(v25, v26, v27, v28))
      {
        id v15 = v25;
        goto LABEL_13;
      }
      uint64_t v13 = v25;
    }
    uint64_t v20 = objc_msgSend_trimmedString(v7, v21, v22, v23);
  }
  uint64_t v16 = (void *)v20;
LABEL_24:

  return v16;
}

__CFString *IMFormattedDisplayStringForID(void *a1, void *a2)
{
  return IMFormattedDisplayStringForIDWithCountryCode(a1, 0, a2);
}

__CFString *IMFormattedDisplayStringForIDWithCountryCode(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  if (IMStringIsEmail(v5))
  {
    if (a3) {
      *a3 = 2;
    }
    uint64_t v10 = objc_msgSend_lowercaseString(v5, v7, v8, v9);
    goto LABEL_15;
  }
  if (!IMStringIsPhoneNumber(v5))
  {
    uint64_t v10 = objc_msgSend_trimmedString(v5, v11, v12, v13);
LABEL_15:
    uint64_t v21 = (__CFString *)v10;
    goto LABEL_16;
  }
  uint64_t v14 = (const void *)IMPhoneNumberRefCopyForPhoneNumber(v5, v6, 0);
  IMFormattedPhoneNumberForCFPhoneNumberRef((uint64_t)v14);
  id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v14) {
    CFRelease(v14);
  }
  if (a3) {
    *a3 = 3;
  }
  uint64_t v16 = IMCopyStringWithLocalizedNumbers(v15);
  if (objc_msgSend_length(v16, v17, v18, v19)) {
    uint64_t v20 = v16;
  }
  else {
    uint64_t v20 = v15;
  }
  uint64_t v21 = v20;

LABEL_16:
  return v21;
}

id IMNormalizeFormattedString(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v7 = v3;
  switch(a2)
  {
    case 3:
      IMFormatPhoneNumber(v3, 0);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      objc_msgSend_lowercaseString(v3, v4, v5, v6);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      id v8 = v3;
LABEL_7:
      uint64_t v12 = v8;
      uint64_t v13 = objc_msgSend_length(v8, v9, v10, v11);
      goto LABEL_9;
  }
  uint64_t v12 = 0;
  uint64_t v13 = objc_msgSend_length(0, v4, v5, v6);
LABEL_9:
  if (v13)
  {
    id v14 = v12;
  }
  else if (IMStringIsEmail(v7) || !IMStringIsPhoneNumber(v7))
  {
    objc_msgSend_lowercaseString(v7, v15, v16, v17);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    IMFormatPhoneNumber(v7, 0);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v18 = v14;

  return v18;
}

id IMCanonicalizeFormattedString(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = IMNormalizeFormattedString(v3, a2);
    if (objc_msgSend_length(v5, v6, v7, v8) && (a2 == 3 || !a2 && IMStringIsPhoneNumber(v4)))
    {
      objc_msgSend_stringByAppendingString_(@"+", v9, (uint64_t)v5, v10);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = v4;
    }
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

uint64_t sub_1918CF830(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_objectForKey_(*(void **)(*(void *)(a1 + 32) + 8), a2, (uint64_t)a2, a4);
}

uint64_t sub_1918CFB08(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_postNotificationName_object_(a1, a2, a3, 0);
}

void _IMNotificationObservationHelperHelper(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id v10 = a1;
  id v11 = [_IMNotificationObservationHelper alloc];
  id value = (id)objc_msgSend_initWithObserver_name_object_block_(v11, v12, (uint64_t)v10, (uint64_t)v9, v8, v7);

  objc_setAssociatedObject(v10, value, value, (void *)0x301);
}

unsigned char *IMFileLocationTrimFileName(unsigned char *result)
{
  if (result)
  {
    id v1 = (unsigned __int8 **)result;
    double result = (unsigned char *)*((void *)result + 1);
    if (!result)
    {
      double result = *v1;
      int v2 = **v1;
      if (**v1)
      {
        id v3 = result + 1;
        do
        {
          if (v2 == 47) {
            double result = v3;
          }
          int v4 = *v3++;
          int v2 = v4;
        }
        while (v4);
      }
      v1[1] = result;
    }
  }
  return result;
}

void _IMDebugLog(void *a1)
{
  uint64_t v1 = qword_1E92DB870;
  id v2 = a1;
  id v3 = v2;
  if (v1 != -1)
  {
    dispatch_once(&qword_1E92DB870, &unk_1EE22FD98);
    id v2 = v3;
  }
  NSLog(&stru_1EE239958.isa, qword_1E92DB868, v2);
}

void sub_1918CFE88(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_processInfo(MEMORY[0x1E4F28F80], a2, a3, a4);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend_processName(v9, v4, v5, v6);
  id v8 = (void *)qword_1E92DB868;
  qword_1E92DB868 = v7;
}

__n128 IMPerfMeasurementInit(uint64_t a1, long long *a2, __CFString *a3)
{
  if (a1)
  {
    if (a3) {
      uint64_t v5 = a3;
    }
    else {
      uint64_t v5 = &stru_1EE231AD8;
    }
    *(void *)(a1 + 56) = CFRetain(v5);
    *(void *)(a1 + 40) = ++qword_1E92DB878;
    long long v7 = *a2;
    __n128 result = (__n128)a2[1];
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    *(_OWORD *)a1 = v7;
    *(__n128 *)(a1 + 16) = result;
    *(void *)(a1 + 72) = 0;
    *(void *)(a1 + 80) = 0;
    *(void *)(a1 + 64) = 0;
  }
  return result;
}

uint64_t IMPerfMeasurementStart(uint64_t result, const char *a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    uint64_t v4 = result;
    *(void *)(result + 72) = 0;
    *(void *)(result + 80) = 0;
    __n128 result = objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], a2, a3, a4);
    *(void *)(v4 + 64) = v5;
  }
  return result;
}

uint64_t IMPerfMeasurementInitAndStart(uint64_t result, long long *a2, __CFString *a3)
{
  long long v11 = *a2;
  long long v12 = a2[1];
  uint64_t v13 = *((void *)a2 + 4);
  if (result)
  {
    uint64_t v3 = result;
    if (a3) {
      uint64_t v4 = a3;
    }
    else {
      uint64_t v4 = &stru_1EE231AD8;
    }
    CFTypeRef v5 = CFRetain(v4);
    uint64_t v6 = ++qword_1E92DB878;
    *(_OWORD *)uint64_t v3 = v11;
    *(_OWORD *)(v3 + 16) = v12;
    *(void *)(v3 + 32) = v13;
    *(void *)(v3 + 40) = v6;
    *(void *)(v3 + 56) = v5;
    *(void *)(v3 + 64) = 0;
    *(void *)(v3 + 72) = 0;
    *(void *)(v3 + 80) = 0;
    __n128 result = objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v7, v8, v9);
    *(void *)(v3 + 64) = v10;
  }
  return result;
}

double IMPerfMeasurementStop(double *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], a2, a3, a4);
    double v6 = result - a1[8];
    a1[9] = result;
    a1[10] = v6;
  }
  return result;
}

void IMPerfMeasurementRelease(uint64_t a1)
{
  if (a1)
  {
    id v2 = *(const void **)(a1 + 56);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(a1 + 56) = 0;
    }
  }
}

void IMAVDaemonRequestConnection(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v13 = a4;
  if (qword_1E92DB888 != -1) {
    dispatch_once(&qword_1E92DB888, &unk_1EE22FDB8);
  }
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  uint64_t v45 = sub_1918D0410;
  uint64_t v46 = sub_1918D0420;
  uint64_t v47 = (_xpc_connection_s *)0xAAAAAAAAAAAAAAAALL;
  id v14 = (const char *)objc_msgSend_UTF8String(@"com.apple.imavagent.embedded.auth", v10, v11, v12);
  uint64_t v47 = IMXPCCreateConnectionForServiceWithQueue(1, 0, v14, (void *)qword_1E92DB880, 0, 0);
  id v15 = (_xpc_connection_s *)v43[5];
  if (v15)
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = sub_1918D0428;
    handler[3] = &unk_1E5724500;
    void handler[4] = &v42;
    xpc_connection_set_event_handler(v15, handler);
    xpc_connection_resume((xpc_connection_t)v43[5]);
    xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
    uint64_t v17 = v16;
    if (v16)
    {
      xpc_dictionary_set_BOOL(v16, "setup-request", 1);
      IMInsertNSStringsToXPCDictionary(v17, "portName", v18, v19, v20, v21, v22, v23, (uint64_t)v7);
      if (objc_msgSend_count(v8, v24, v25, v26)) {
        IMInsertDictionariesToXPCDictionary(v17, "setupInfo", v27, v28, v29, v30, v31, v32, (uint64_t)v8);
      }
      uint64_t v33 = (_xpc_connection_s *)v43[5];
      id v34 = dispatch_get_global_queue(2, 0);
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = sub_1918D0438;
      v38[3] = &unk_1E5724528;
      id v39 = v13;
      uint64_t v40 = &v42;
      xpc_connection_send_message_with_reply(v33, v17, v34, v38);

      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = nullsub_4;
      v35[3] = &unk_1E5724550;
      id v36 = v17;
      uint64_t v37 = &v42;
      im_dispatch_after(v35, 2.0);
    }
  }
  else if (v13)
  {
    (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
  }
  _Block_object_dispose(&v42, 8);
}

void sub_1918D0390(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1918D03AC()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.IMAVDaemonRequestConnectionQueue", v2);
  uint64_t v1 = (void *)qword_1E92DB880;
  qword_1E92DB880 = (uint64_t)v0;
}

uint64_t sub_1918D0410(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1918D0420(uint64_t a1)
{
}

void sub_1918D0428(uint64_t a1, void *a2)
{
}

void sub_1918D0438(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v33 = v3;
  if (v3)
  {
    uint64_t v11 = xpc_dictionary_get_value(v3, "response");
    uint64_t v12 = (void *)IMCreateDictionaryFromXPCObjectWithStandardAllowlist(v11);
    if (objc_msgSend_count(v12, v13, v14, v15))
    {
      xpc_object_t v16 = v12;
    }
    else
    {
      if (_IMWillLog(@"IMAVDaemon")) {
        _IMAlwaysLog(0, @"IMAVDaemon", @" => Empty response, trying codable response", v17, v18, v19, v20, v21, v32);
      }
      xpc_object_t v16 = IMGetXPCCodableFromDictionaryWithStandardAllowlist(v33, "response");

      if (_IMWillLog(@"IMAVDaemon"))
      {
        char v25 = objc_msgSend_count(v16, v22, v23, v24);
        _IMAlwaysLog(0, @"IMAVDaemon", @" => Found response with %d keys", v26, v27, v28, v29, v30, v25);
      }
    }
  }
  else
  {
    _IMWarn(@"Failed IMAVDaemonRequestPortConnection, no reply", v4, v5, v6, v7, v8, v9, v10, v32);
    xpc_object_t v16 = 0;
  }
  uint64_t v31 = *(void *)(a1 + 32);
  if (v31) {
    (*(void (**)(uint64_t, void, void *))(v31 + 16))(v31, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v16);
  }
}

void IMDaemonRequestConnectionWithSync(void *a1, void *a2, void *a3, int a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v15 = a5;
  if (qword_1EB273770 != -1) {
    dispatch_once(&qword_1EB273770, &unk_1EE2306B8);
  }
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x3032000000;
  uint64_t v45 = sub_1918D0410;
  uint64_t v46 = sub_1918D0420;
  uint64_t v47 = (_xpc_connection_s *)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v16 = (const char *)objc_msgSend_UTF8String(@"com.apple.imagent.embedded.auth", v12, v13, v14);
  uint64_t v47 = IMXPCCreateConnectionForServiceWithQueue(1, 0, v16, (void *)qword_1EB273768, 0, 0);
  uint64_t v17 = (_xpc_connection_s *)v43[5];
  if (v17)
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = sub_1918D0930;
    handler[3] = &unk_1E5724500;
    void handler[4] = &v42;
    xpc_connection_set_event_handler(v17, handler);
    xpc_connection_resume((xpc_connection_t)v43[5]);
    xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
    char v25 = v18;
    if (v18)
    {
      IMInsertNSStringsToXPCDictionary(v18, "portName", v19, v20, v21, v22, v23, v24, (uint64_t)v9);
      IMInsertDictionariesToXPCDictionary(v25, "setupInfo", v26, v27, v28, v29, v30, v31, (uint64_t)v10);
      xpc_dictionary_set_BOOL(v25, "setup-request", 1);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_1918D0940;
      aBlock[3] = &unk_1E5724578;
      uint64_t v40 = &v42;
      id v39 = v15;
      char v32 = (void (**)(void *, NSObject *))_Block_copy(aBlock);
      id v33 = (_xpc_connection_s *)v43[5];
      if (a4)
      {
        id v34 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)v43[5], v25);
        v32[2](v32, v34);
      }
      else
      {
        id v34 = dispatch_get_global_queue(2, 0);
        xpc_connection_send_message_with_reply(v33, v25, v34, v32);
      }

      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = nullsub_5;
      v35[3] = &unk_1E5724550;
      id v36 = v25;
      uint64_t v37 = &v42;
      im_dispatch_after(v35, 2.0);
    }
  }
  else if (v15)
  {
    (*((void (**)(id, void, void))v15 + 2))(v15, 0, 0);
  }
  _Block_object_dispose(&v42, 8);
}

void sub_1918D08AC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1918D08CC()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.IMDaemonRequestConnectionQueue", v2);
  uint64_t v1 = (void *)qword_1EB273768;
  qword_1EB273768 = (uint64_t)v0;
}

void sub_1918D0930(uint64_t a1, void *a2)
{
}

void sub_1918D0940(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (!xdict || MEMORY[0x192FDEE90](xdict) != MEMORY[0x1E4F14590])
  {
    _IMWarn(@"Failed IMDRequestPortConnection, no reply", v3, v4, v5, v6, v7, v8, v9, v39);
    xpc_connection_cancel(*(xpc_connection_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    id v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)(a1 + 32);
    if (!v12) {
      goto LABEL_16;
    }
LABEL_15:
    (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, v11, v10);
    goto LABEL_16;
  }
  uint64_t v13 = xpc_dictionary_get_value(xdict, "response");
  uint64_t v14 = (void *)IMCreateDictionaryFromXPCObjectWithStandardAllowlist(v13);
  if (objc_msgSend_count(v14, v15, v16, v17))
  {
    id v10 = v14;
  }
  else
  {
    if (_IMWillLog(@"IMDaemon")) {
      _IMAlwaysLog(0, @"IMDaemon", @" => Empty response, trying codable response", v18, v19, v20, v21, v22, v39);
    }
    id v10 = IMGetXPCCodableFromDictionaryWithStandardAllowlist(xdict, "response");

    if (_IMWillLog(@"IMDaemon"))
    {
      char v26 = objc_msgSend_count(v10, v23, v24, v25);
      _IMAlwaysLog(0, @"IMDaemon", @" => Found response with %d keys", v27, v28, v29, v30, v31, v26);
    }
    if (!objc_msgSend_count(v10, v23, v24, v25)) {
      _IMWarn(@"Bad response from daemon for setup info", v32, v33, v34, v35, v36, v37, v38, v39);
    }
  }

  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    goto LABEL_15;
  }
LABEL_16:
}

void IMDaemonRequestConnection(void *a1, void *a2, void *a3, void *a4)
{
}

void IMDaemonRequestPlugInConnection(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v13 = a4;
  if (qword_1E92DB898 != -1) {
    dispatch_once(&qword_1E92DB898, &unk_1EE230A18);
  }
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = sub_1918D0410;
  uint64_t v43 = sub_1918D0420;
  uint64_t v44 = (_xpc_connection_s *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v14 = (const char *)objc_msgSend_UTF8String(@"com.apple.imagent.embedded.auth", v10, v11, v12);
  uint64_t v44 = IMXPCCreateConnectionForServiceWithQueue(1, 0, v14, (void *)qword_1E92DB890, 0, 0);
  id v15 = (_xpc_connection_s *)v40[5];
  if (v15)
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = sub_1918D0E08;
    handler[3] = &unk_1E5724500;
    void handler[4] = &v39;
    xpc_connection_set_event_handler(v15, handler);
    xpc_connection_resume((xpc_connection_t)v40[5]);
    xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
    uint64_t v17 = v16;
    if (v16)
    {
      xpc_dictionary_set_BOOL(v16, "setup-request", 1);
      xpc_dictionary_set_BOOL(v17, "plugin-request", 1);
      IMInsertNSStringsToXPCDictionary(v17, "portName", v18, v19, v20, v21, v22, v23, (uint64_t)v7);
      if (objc_msgSend_count(v8, v24, v25, v26)) {
        IMInsertDictionariesToXPCDictionary(v17, "setupInfo", v27, v28, v29, v30, v31, v32, (uint64_t)v8);
      }
      uint64_t v33 = (_xpc_connection_s *)v40[5];
      uint64_t v34 = dispatch_get_global_queue(2, 0);
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = sub_1918D0E18;
      v35[3] = &unk_1E5724528;
      id v36 = v13;
      uint64_t v37 = &v39;
      xpc_connection_send_message_with_reply(v33, v17, v34, v35);
    }
  }
  else if (v13)
  {
    (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
  }
  _Block_object_dispose(&v39, 8);
}

void sub_1918D0D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1918D0DA4()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.IMDaemonPlugInRequestConnectionQueue", v2);
  uint64_t v1 = (void *)qword_1E92DB890;
  qword_1E92DB890 = (uint64_t)v0;
}

void sub_1918D0E08(uint64_t a1, void *a2)
{
}

void sub_1918D0E18(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v15 = v3;
  if (v3)
  {
    uint64_t v11 = xpc_dictionary_get_value(v3, "response");
    uint64_t v12 = (void *)IMCreateDictionaryFromXPCObjectWithStandardAllowlist(v11);
  }
  else
  {
    _IMWarn(@"Failed IMDRequestPortConnection, no reply", v4, v5, v6, v7, v8, v9, v10, v14);
    uint64_t v12 = 0;
    uint64_t v11 = 0;
  }
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v12);
  }
}

id IMRKAttributedTokenTypeKey()
{
  if (qword_1E92DB138 != -1) {
    dispatch_once(&qword_1E92DB138, &unk_1EE22FDD8);
  }
  dispatch_queue_t v0 = (void *)qword_1E92DB130;
  return v0;
}

void sub_1918D0F1C()
{
  dispatch_queue_t v0 = (void **)IMWeakLinkSymbol();
  if (v0)
  {
    uint64_t v1 = *v0;
    objc_storeStrong((id *)&qword_1E92DB130, v1);
  }
}

id IMRKAttributedTokenPhotosharingType()
{
  if (qword_1E92DB128 != -1) {
    dispatch_once(&qword_1E92DB128, &unk_1EE230C98);
  }
  dispatch_queue_t v0 = (void *)qword_1E92DB120;
  return v0;
}

void sub_1918D0FC0()
{
  dispatch_queue_t v0 = (void **)IMWeakLinkSymbol();
  if (v0)
  {
    uint64_t v1 = *v0;
    objc_storeStrong((id *)&qword_1E92DB120, v1);
  }
}

__CFString *IMRKAttributedTokenPhotosharingKeywordsKey()
{
  return @"keywords";
}

__CFString *IMRKAttributedTokenPhotosharingKeywordRangesKey()
{
  return @"keywordranges";
}

uint64_t sub_1918D107C()
{
  uint64_t result = IMWeakLinkClass();
  qword_1E92DB118 = result;
  return result;
}

uint64_t sub_1918D1150()
{
  uint64_t result = IMWeakLinkClass();
  qword_1E92DB8A0 = result;
  return result;
}

const void *IMSharedResourcesDirectory()
{
  pthread_mutex_lock(&stru_1E92DA370);
  uid_t v0 = geteuid();
  if (!v0) {
    uid_t v0 = getuid();
  }
  if (qword_1E92DB370)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)qword_1E92DB370, (const void *)v0);
    if (Value) {
      goto LABEL_13;
    }
  }
  else
  {
    qword_1E92DB370 = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
  }
  pw_dir = getenv("IPHONE_SHARED_RESOURCES_DIRECTORY");
  if (pw_dir || (id v3 = getpwuid(v0)) != 0 && (pw_dir = v3->pw_dir) != 0)
  {
    Value = CFStringCreateWithFileSystemRepresentation(0, pw_dir);
    if (Value)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)qword_1E92DB370, (const void *)v0, Value);
      CFRelease(Value);
    }
  }
  else
  {
    Value = 0;
  }
LABEL_13:
  pthread_mutex_unlock(&stru_1E92DA370);
  return Value;
}

void IMResetCachedUserSettings()
{
  dword_1E92DA318 = -1;
}

uint64_t IMResetCachedCarrierSettings()
{
  uint64_t result = CFPreferencesSynchronize(@"com.apple.carrier", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  dword_1E92DA31C = -1;
  dword_1E92DA2C8 = -1;
  dword_1E92DABDC = -1;
  dword_1E92DABE0 = -1;
  dword_1E92DA2C4 = -1;
  dword_1E92DA310 = -1;
  return result;
}

uint64_t IMSMSEnabled()
{
  uid_t v0 = (void *)IMWeakLinkClass();
  uint64_t v4 = objc_msgSend_sharedInstance(v0, v1, v2, v3);
  uint64_t v8 = objc_msgSend_supportsSMS(v4, v5, v6, v7);

  return v8;
}

CFStringRef IMSMSFallbackEnabled()
{
  uid_t v0 = IMSharedResourcesDirectory();
  CFStringRef result = CFStringCreateWithFormat(0, 0, @"%@/Library/Preferences/%@", v0, @"com.apple.MobileSMS");
  if (result)
  {
    CFStringRef v2 = result;
    uint64_t v3 = IMGetDomainBoolForKeyWithDefaultValue(result, @"SendAsSMS", 0);
    CFRelease(v2);
    return (const __CFString *)v3;
  }
  return result;
}

uint64_t IMMMSMaximumSlideCount()
{
  if (qword_1EB273758 != -1) {
    dispatch_once(&qword_1EB273758, &unk_1EE2314D8);
  }
  if (!qword_1EB273760) {
    return 0;
  }
  int v0 = dword_1E92DA2C4;
  if (dword_1E92DA2C4 == -1)
  {
    dword_1E92DA2C4 = 0x7FFFFFFF;
    CFDictionaryRef v1 = (const __CFDictionary *)CFPreferencesCopyAppValue(@"MMS", @"com.apple.carrier");
    if (v1)
    {
      CFDictionaryRef v2 = v1;
      int valuePtr = 0;
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v1, @"MaxSlidesPerMessage");
      if (Value) {
        CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      }
      CFRelease(v2);
      if (valuePtr >= 1) {
        dword_1E92DA2C4 = valuePtr;
      }
    }
    sub_1918D155C();
    return dword_1E92DA2C4;
  }
  return v0;
}

BOOL IMMMSEnabled()
{
  if (qword_1EB273758 != -1) {
    dispatch_once(&qword_1EB273758, &unk_1EE2314D8);
  }
  return qword_1EB273760 != 0;
}

void sub_1918D155C()
{
  if ((byte_1E92DB239 & 1) == 0)
  {
    byte_1E92DB239 = 1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFStringRef v1 = (const __CFString *)*MEMORY[0x1E4F23E80];
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1918D50E0, v1, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

uint64_t IMMMSMaximumSlideDuration()
{
  if (qword_1EB273758 != -1) {
    dispatch_once(&qword_1EB273758, &unk_1EE2314D8);
  }
  if (!qword_1EB273760) {
    return 0;
  }
  CFDictionaryRef v0 = (const __CFDictionary *)CFPreferencesCopyAppValue(@"MMS", @"com.apple.carrier");
  if (!v0) {
    return 0x7FFFFFFFLL;
  }
  CFDictionaryRef v1 = v0;
  int valuePtr = 0;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v0, @"MaxSMILDuration");
  if (Value) {
    CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
  }
  CFRelease(v1);
  if (valuePtr <= 0) {
    return 0x7FFFFFFFLL;
  }
  else {
    return valuePtr;
  }
}

uint64_t IMMMSMaximumMessageByteCount(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (qword_1EB273758 != -1) {
    dispatch_once(&qword_1EB273758, &unk_1EE2314D8);
  }
  if (!qword_1EB273760) {
    return 0x7FFFFFFFLL;
  }
  if (qword_1E92DB1B8 != -1) {
    dispatch_once(&qword_1E92DB1B8, &unk_1EE22FDF8);
  }
  uint64_t v4 = objc_msgSend_sharedInstance((void *)qword_1E92DB1B0, a2, a3, a4);
  uint64_t v8 = objc_msgSend_deviceType(v4, v5, v6, v7);

  if (v8 == 2)
  {
    if (dword_1E92DA310 != -1) {
      return dword_1E92DA310;
    }
    dword_1E92DA310 = 0x100000;
    CFDictionaryRef v9 = (const __CFDictionary *)CFPreferencesCopyAppValue(@"MMS", @"com.apple.mms_override");
    CFDictionaryRef v10 = v9;
    if (!v9 || !CFDictionaryGetValue(v9, @"MaxMessageSize"))
    {
      CFDictionaryRef v22 = (const __CFDictionary *)CFPreferencesCopyAppValue(@"MMS", @"com.apple.carrier");
      if (v22)
      {
        CFDictionaryRef v23 = v22;
        CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v22, @"MaxMessageSize");
        int v27 = 0;
        if (Value) {
          CFNumberGetValue(Value, kCFNumberIntType, &v27);
        }
        CFRelease(v23);
        if (v27 >= 1) {
          dword_1E92DA310 = v27;
        }
      }
      sub_1918D155C();
      if (!v10) {
        return dword_1E92DA310;
      }
      goto LABEL_32;
    }
    CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(v10, @"MaxMessageSize");
    SInt32 valuePtr = 0;
    if (v11)
    {
      CFNumberRef v12 = v11;
      CFTypeID v13 = CFGetTypeID(v11);
      if (v13 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v12, kCFNumberIntType, &valuePtr);
        IntCFNumberRef Value = valuePtr;
        goto LABEL_30;
      }
      CFTypeID v25 = CFGetTypeID(v12);
      if (v25 == CFStringGetTypeID())
      {
        IntCFNumberRef Value = CFStringGetIntValue((CFStringRef)v12);
LABEL_30:
        if (IntValue >= 1) {
          dword_1E92DA310 = IntValue;
        }
      }
    }
LABEL_32:
    CFRelease(v10);
    return dword_1E92DA310;
  }
  if (IMOSLoggingEnabled())
  {
    xpc_object_t v16 = OSLogHandleForIMFoundationCategory("MMS Max Size");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_191892000, v16, OS_LOG_TYPE_INFO, "We are a relay device, returning 2 Megabytes", buf, 2u);
    }
  }
  IMLogString();
  if (_IMWillLog(@"MMS Max Size")) {
    _IMAlwaysLog(0, @"MMS Max Size", @"We are a relay device, returning 2 Megabytes", v17, v18, v19, v20, v21, v26);
  }
  return 0x200000;
}

uint64_t sub_1918D1928()
{
  uint64_t result = IMWeakLinkClass();
  qword_1E92DB1B0 = result;
  return result;
}

id IMMMSAllowableImageDimensions(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, a3, a4);
  uint64_t v7 = IMMMSMaxImageDimension();
  if ((int)v7 >= 160)
  {
    do
    {
      uint64_t v8 = objc_msgSend_numberWithInt_(NSNumber, v5, v7, v6);
      objc_msgSend_addObject_(v4, v9, (uint64_t)v8, v10);

      uint64_t v7 = (int)((double)(int)v7 * 0.9);
    }
    while ((int)v7 > 159);
  }
  if (IMOSLoggingEnabled())
  {
    CFNumberRef v11 = OSLogHandleForIMFoundationCategory("Attachments");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v19 = v4;
      _os_log_impl(&dword_191892000, v11, OS_LOG_TYPE_INFO, "Allowable image dimensions: %@", buf, 0xCu);
    }
  }
  IMLogString();
  if (_IMWillLog(@"Attachments")) {
    _IMAlwaysLog(0, @"Attachments", @"Allowable image dimensions: %@", v12, v13, v14, v15, v16, (char)v4);
  }
  return v4;
}

uint64_t IMMMSMaxImageDimension()
{
  if (qword_1EB273758 != -1) {
    dispatch_once(&qword_1EB273758, &unk_1EE2314D8);
  }
  if (!qword_1EB273760) {
    return 0x7FFFFFFFLL;
  }
  CFDictionaryRef v0 = IMGetDomainValueForKey(@"com.apple.carrier", @"MMS");
  uint64_t v3 = v0;
  if (v0)
  {
    uint64_t v4 = objc_msgSend_objectForKey_(v0, v1, @"MaxImageDimension", v2);
    uint64_t v8 = v4;
    if (v4) {
      LODWORD(v9) = objc_msgSend_intValue(v4, v5, v6, v7);
    }
    else {
      LODWORD(v9) = 0x7FFFFFFF;
    }
  }
  else
  {
    LODWORD(v9) = 0x7FFFFFFF;
  }
  uint64_t v9 = (int)v9;

  return v9;
}

uint64_t IMMMSMaxVideoBitrate()
{
  if (qword_1EB273758 != -1) {
    dispatch_once(&qword_1EB273758, &unk_1EE2314D8);
  }
  if (!qword_1EB273760) {
    return 0x7FFFFFFFLL;
  }
  int v0 = dword_1E92DABDC;
  if (dword_1E92DABDC == -1)
  {
    dword_1E92DABDC = 0x20000;
    CFDictionaryRef v1 = (const __CFDictionary *)CFPreferencesCopyAppValue(@"MMS", @"com.apple.carrier");
    if (v1)
    {
      CFDictionaryRef v2 = v1;
      int valuePtr = 0;
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v1, @"MaxVideoBitrate");
      if (Value) {
        CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      }
      CFRelease(v2);
      int v4 = valuePtr;
      if (valuePtr >= 1)
      {
        if (valuePtr <= 0x10000) {
          int v4 = 0x10000;
        }
        dword_1E92DABDC = v4;
      }
    }
    sub_1918D155C();
    return dword_1E92DABDC;
  }
  return v0;
}

BOOL IMMMSSupportsH264Video()
{
  if (qword_1EB273758 != -1) {
    dispatch_once(&qword_1EB273758, &unk_1EE2314D8);
  }
  if (!qword_1EB273760) {
    return 0;
  }
  int v0 = dword_1E92DABE0;
  if (dword_1E92DABE0 == -1)
  {
    dword_1E92DABE0 = 0;
    CFDictionaryRef v1 = (const __CFDictionary *)CFPreferencesCopyAppValue(@"MMS", @"com.apple.carrier");
    if (v1)
    {
      CFDictionaryRef v2 = v1;
      int valuePtr = 0;
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v1, @"SupportsH264Video");
      if (Value) {
        CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      }
      CFRelease(v2);
      if (valuePtr >= 1) {
        dword_1E92DABE0 = 1;
      }
    }
    sub_1918D155C();
    int v0 = dword_1E92DABE0;
  }
  return v0 != 0;
}

uint64_t IMMMSMaxRecipients()
{
  if (qword_1EB273758 != -1) {
    dispatch_once(&qword_1EB273758, &unk_1EE2314D8);
  }
  if (!qword_1EB273760) {
    return 0x7FFFFFFFLL;
  }
  int v0 = dword_1E92DA31C;
  if (dword_1E92DA31C == -1)
  {
    dword_1E92DA31C = 0x7FFFFFFF;
    CFDictionaryRef v1 = (const __CFDictionary *)CFPreferencesCopyAppValue(@"MMS", @"com.apple.carrier");
    if (v1)
    {
      CFDictionaryRef v2 = v1;
      int valuePtr = 0;
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v1, @"MaxRecipients");
      if (Value) {
        CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      }
      CFRelease(v2);
      int v4 = valuePtr;
      if (valuePtr >= 1)
      {
        if (valuePtr <= 10) {
          int v4 = 10;
        }
        dword_1E92DA31C = v4;
      }
    }
    sub_1918D155C();
    return dword_1E92DA31C;
  }
  return v0;
}

uint64_t IMSMSMaxRecipients()
{
  int v0 = dword_1E92DA2C8;
  if (dword_1E92DA2C8 == -1)
  {
    dword_1E92DA2C8 = 0x7FFFFFFF;
    CFDictionaryRef v1 = (const __CFDictionary *)CFPreferencesCopyAppValue(@"SMS", @"com.apple.carrier");
    if (v1)
    {
      CFDictionaryRef v2 = v1;
      int valuePtr = 0;
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v1, @"MaxRecipients");
      if (Value) {
        CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      }
      CFRelease(v2);
      int v4 = valuePtr;
      if (valuePtr >= 1)
      {
        if (valuePtr <= 10) {
          int v4 = 10;
        }
        dword_1E92DA2C8 = v4;
      }
    }
    sub_1918D155C();
    return dword_1E92DA2C8;
  }
  return v0;
}

BOOL IMMMSRestrictedModeEnabled()
{
  return sub_1918D1F20(0);
}

BOOL sub_1918D1F20(int a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (dword_1E92DA318 == -1 || a1 != 0)
  {
    if ((byte_1E92DB0DA & 1) == 0)
    {
      byte_1E92DB0DA = 1;
      if (IMOSLoggingEnabled())
      {
        CFDictionaryRef v2 = OSLogHandleForIMFoundationCategory("Restricted");
        if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_191892000, v2, OS_LOG_TYPE_INFO, "Now listening for restricted mode changed notifications", buf, 2u);
        }
      }
      IMLogString();
      if (_IMWillLog(@"Restricted")) {
        _IMAlwaysLog(0, @"Restricted", @"Now listening for restricted mode changed notifications", v3, v4, v5, v6, v7, v19);
      }
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1918D514C, @"com.apple.MobileSMS.MMSRestricted.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    uint64_t v9 = IMSharedResourcesDirectory();
    CFStringRef v10 = CFStringCreateWithFormat(0, 0, @"%@/Library/Preferences/%@", v9, @"com.apple.MobileSMS");
    CFStringRef v11 = v10;
    if (v10)
    {
      dword_1E92DA318 = IMGetDomainBoolForKey(v10, @"MMSRestricted");
      if (IMOSLoggingEnabled())
      {
        uint64_t v12 = OSLogHandleForIMFoundationCategory("Restricted");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 67109120;
          int v21 = dword_1E92DA318;
          _os_log_impl(&dword_191892000, v12, OS_LOG_TYPE_INFO, "Restricted Mode enabled: %d", buf, 8u);
        }
      }
      IMLogString();
      if (_IMWillLog(@"Restricted")) {
        _IMAlwaysLog(0, @"Restricted", @"Restricted Mode enabled: %d", v13, v14, v15, v16, v17, dword_1E92DA318);
      }
      CFRelease(v11);
    }
  }
  return dword_1E92DA318 != 0;
}

BOOL IMMMSPartCanBeSent(void *a1, uint64_t a2, double a3, double a4)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a1;
  if (!sub_1918D1F20(0))
  {
    BOOL v21 = 1;
    goto LABEL_64;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory("Restricted");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138413058;
      double v59 = *(double *)&v7;
      __int16 v60 = 2048;
      uint64_t v61 = a2;
      __int16 v62 = 2048;
      double v63 = a3;
      __int16 v64 = 2048;
      double v65 = a4;
      _os_log_impl(&dword_191892000, v8, OS_LOG_TYPE_INFO, "will check conformance for %@: %lld bytes, (%.0f,%.0f)", buf, 0x2Au);
    }
  }
  char v57 = (char)v7;
  IMLogString();
  if (_IMWillLog(@"Restricted")) {
    _IMAlwaysLog(0, @"Restricted", @"will check conformance for %@: %lld bytes, (%.0f,%.0f)", v9, v10, v11, v12, v13, (char)v7);
  }
  uint64_t v14 = 0;
  while (CFStringCompare(*(__CFString **)((char *)&off_1E5724598 + v14), v7, 1uLL))
  {
    v14 += 16;
    if (v14 == 208)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v15 = OSLogHandleForIMFoundationCategory("Restricted");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_191892000, v15, OS_LOG_TYPE_INFO, "Not found in restricted content class", buf, 2u);
        }
      }
      IMLogString();
      if (_IMWillLog(@"Restricted")) {
        _IMAlwaysLog(0, @"Restricted", @"Not found in restricted content class", v16, v17, v18, v19, v20, v57);
      }
      BOOL v21 = 0;
      goto LABEL_64;
    }
  }
  char v22 = *((unsigned char *)&off_1E5724598 + v14 + 8);
  if (a2 > 307200)
  {
    if (IMOSLoggingEnabled())
    {
      CFDictionaryRef v23 = OSLogHandleForIMFoundationCategory("Restricted");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 134218240;
        double v59 = *(double *)&a2;
        __int16 v60 = 1024;
        LODWORD(v61) = 307200;
        _os_log_impl(&dword_191892000, v23, OS_LOG_TYPE_INFO, "exceeds max message size (%lld, max: %d)", buf, 0x12u);
      }
    }
    char v57 = a2;
    IMLogString();
    if (_IMWillLog(@"Restricted")) {
      _IMAlwaysLog(0, @"Restricted", @"exceeds max message size (%lld, max: %d)", v24, v25, v26, v27, v28, a2);
    }
    int v29 = 0;
    if ((v22 & 1) == 0) {
      goto LABEL_51;
    }
    goto LABEL_29;
  }
  int v29 = 1;
  if (v22)
  {
LABEL_29:
    if (IMOSLoggingEnabled())
    {
      uint64_t v30 = OSLogHandleForIMFoundationCategory("Restricted");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_191892000, v30, OS_LOG_TYPE_INFO, "will check image conformance", buf, 2u);
      }
    }
    IMLogString();
    if (_IMWillLog(@"Restricted")) {
      _IMAlwaysLog(0, @"Restricted", @"will check image conformance", v31, v32, v33, v34, v35, v57);
    }
    if (a3 > 640.0)
    {
      if (IMOSLoggingEnabled())
      {
        id v36 = OSLogHandleForIMFoundationCategory("Restricted");
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 134218240;
          double v59 = a3;
          __int16 v60 = 2048;
          uint64_t v61 = 0x4084000000000000;
          _os_log_impl(&dword_191892000, v36, OS_LOG_TYPE_INFO, "exceeds dimension width (%.0f, max: %.0f)", buf, 0x16u);
        }
      }
      IMLogString();
      if (_IMWillLog(@"Restricted")) {
        _IMAlwaysLog(0, @"Restricted", @"exceeds dimension width (%.0f, max: %.0f)", v37, v38, v39, v40, v41, SLOBYTE(a3));
      }
      int v29 = 0;
    }
    if (a4 > 480.0)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v42 = OSLogHandleForIMFoundationCategory("Restricted");
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 134218240;
          double v59 = a4;
          __int16 v60 = 2048;
          uint64_t v61 = 0x407E000000000000;
          _os_log_impl(&dword_191892000, v42, OS_LOG_TYPE_INFO, "exceeds dimension height (%.0f, max: %.0f)", buf, 0x16u);
        }
      }
      IMLogString();
      if (_IMWillLog(@"Restricted")) {
        _IMAlwaysLog(0, @"Restricted", @"exceeds dimension height (%.0f, max: %.0f)", v43, v44, v45, v46, v47, SLOBYTE(a4));
      }
      int v29 = 0;
    }
  }
LABEL_51:
  if (IMOSLoggingEnabled())
  {
    uint64_t v48 = OSLogHandleForIMFoundationCategory("Restricted");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      if (v29) {
        uint64_t v49 = @"YES";
      }
      else {
        uint64_t v49 = @"NO";
      }
      *(_DWORD *)long long buf = 138412290;
      double v59 = *(double *)&v49;
      _os_log_impl(&dword_191892000, v48, OS_LOG_TYPE_INFO, "Accepted? %@", buf, 0xCu);
    }
  }
  if (v29) {
    long long v50 = @"YES";
  }
  else {
    long long v50 = @"NO";
  }
  IMLogString();
  if (_IMWillLog(@"Restricted")) {
    _IMAlwaysLog(0, @"Restricted", @"Accepted? %@", v51, v52, v53, v54, v55, (char)v50);
  }
  BOOL v21 = v29 != 0;
LABEL_64:

  return v21;
}

void sub_1918D28DC()
{
  im_notify_register_dispatch("com.apple.MobileSMS.MMSCapable", (int *)&unk_1EB273750, (uint64_t *)&qword_1EB273760, 1, MEMORY[0x1E4F14428], &unk_1EE22FF98);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1918D29D4, @"com.apple.MobileSMS.MMSEnabled.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

uint64_t sub_1918D2958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  qword_1EB273760 = a3;
  uint64_t result = CFPreferencesSynchronize(@"com.apple.carrier", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  dword_1E92DA31C = -1;
  dword_1E92DA2C8 = -1;
  dword_1E92DABDC = -1;
  dword_1E92DABE0 = -1;
  dword_1E92DA2C4 = -1;
  dword_1E92DA310 = -1;
  dword_1E92DA318 = -1;
  return result;
}

void sub_1918D29D4()
{
  int v0 = (void *)MEMORY[0x192FDE5A0]();
  char v8 = IMSharedResourcesDirectory();
  CFStringRef v1 = CFStringCreateWithFormat(0, 0, @"%@/Library/Preferences/%@");
  CFRelease(v1);
  if (IMOSLoggingEnabled())
  {
    CFDictionaryRef v2 = OSLogHandleForIMFoundationCategory("Enablement");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_191892000, v2, OS_LOG_TYPE_INFO, "Refresh: User setting for MMS changed", buf, 2u);
    }
  }
  IMLogString();
  if (_IMWillLog(@"Enablement")) {
    _IMAlwaysLog(0, @"Enablement", @"Refresh: User setting for MMS changed", v3, v4, v5, v6, v7, v8);
  }
  dispatch_async(MEMORY[0x1E4F14428], &unk_1EE230958);
}

BOOL IMReadMMSUserOverride()
{
  Boolean keyExistsAndHasValidFormat = 0;
  int v0 = IMSharedResourcesDirectory();
  CFStringRef v1 = CFStringCreateWithFormat(0, 0, @"%@/Library/Preferences/%@", v0, @"com.apple.MobileSMS");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"MMSEnabled", v1, &keyExistsAndHasValidFormat);
  CFRelease(v1);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 0;
  }
  return !v3;
}

uint64_t IMReadSMSRelayUserOverride()
{
  return 1;
}

uint64_t IMShouldShowSMSRelayRestriction()
{
  return 0;
}

uint64_t IMSMSRelayDisabled()
{
  return 0;
}

CFBooleanRef IMShouldURLifyUnquotedShorts()
{
  CFBooleanRef result = (const __CFBoolean *)CFPreferencesCopyAppValue(@"URLifyUnquotedShorts", @"com.apple.carrier");
  if (result)
  {
    CFBooleanRef v1 = result;
    int Value = CFBooleanGetValue(result);
    CFRelease(v1);
    return (const __CFBoolean *)(Value != 0);
  }
  return result;
}

uint64_t IMMMSGroupTextOnlyMessagesSendAsMMS(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (qword_1EB273758 != -1) {
    dispatch_once(&qword_1EB273758, &unk_1EE2314D8);
  }
  if (!qword_1EB273760) {
    return 0;
  }
  if (qword_1E92DB1D8 != -1) {
    dispatch_once(&qword_1E92DB1D8, &unk_1EE2300B8);
  }
  uint64_t v4 = objc_msgSend_sharedInstance((void *)qword_1E92DB1D0, a2, a3, a4);
  uint64_t v8 = objc_msgSend_deviceType(v4, v5, v6, v7);

  if (v8 != 2) {
    return 1;
  }
  uint64_t v9 = IMSharedResourcesDirectory();
  CFStringRef v10 = CFStringCreateWithFormat(0, 0, @"%@/Library/Preferences/%@", v9, @"com.apple.MobileSMS");
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"MMSGroupModeOverride", v10, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    BOOL v12 = AppBooleanValue != 0;
  }
  else
  {
    CFDictionaryRef v13 = (const __CFDictionary *)CFPreferencesCopyAppValue(@"MMS", @"com.apple.carrier");
    if (v13)
    {
      CFDictionaryRef v14 = v13;
      CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(v13, @"GroupModeEnabled");
      if (Value) {
        BOOL v12 = CFBooleanGetValue(Value) != 0;
      }
      else {
        BOOL v12 = 1;
      }
      CFRelease(v14);
    }
    else
    {
      BOOL v12 = 1;
    }
  }
  if (v10) {
    CFRelease(v10);
  }
  return v12;
}

uint64_t sub_1918D2D5C()
{
  uint64_t result = IMWeakLinkClass();
  qword_1E92DB1D0 = result;
  return result;
}

double IMMMSMaximumAudioDuration()
{
  int v0 = (void *)qword_1E92DB8B0;
  if (!qword_1E92DB8B0)
  {
    CFBooleanRef v1 = (void **)IMWeakLinkSymbol();
    if (v1) {
      CFDictionaryRef v2 = *v1;
    }
    else {
      CFDictionaryRef v2 = 0;
    }
    objc_storeStrong((id *)&qword_1E92DB8B0, v2);
    int v0 = (void *)qword_1E92DB8B0;
  }
  return sub_1918D2DFC(v0);
}

double sub_1918D2DFC(void *a1)
{
  id v1 = a1;
  if (qword_1E92DB8D0 != -1) {
    dispatch_once(&qword_1E92DB8D0, &unk_1EE230978);
  }
  if (qword_1E92DB8E0 != -1) {
    dispatch_once(&qword_1E92DB8E0, &unk_1EE230998);
  }
  id v2 = objc_alloc(NSNumber);
  uint64_t v6 = IMMMSMaximumMessageByteCount((uint64_t)v2, v3, v4, v5);
  uint64_t v9 = objc_msgSend_initWithLongLong_(v2, v7, v6, v8);
  id v10 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  CFDictionaryRef v14 = objc_msgSend_initWithObjectsAndKeys_(v10, v11, (uint64_t)v9, v12, @"fileLengthLimit", 0);
  memset(v19, 170, sizeof(v19));
  if (qword_1E92DB8C8) {
    objc_msgSend_maximumDurationForPreset_properties_((void *)qword_1E92DB8C8, v13, (uint64_t)v1, (uint64_t)v14);
  }
  else {
    memset(v19, 0, sizeof(v19));
  }
  long long v17 = *(_OWORD *)v19;
  uint64_t v18 = *(void *)&v19[16];
  double v15 = off_1E92DB8D8(&v17);

  return v15;
}

double IMMMSMaximumVideoDuration()
{
  int v0 = (void *)qword_1E92DB8B8;
  if (!qword_1E92DB8B8)
  {
    id v1 = (void **)IMWeakLinkSymbol();
    if (v1) {
      id v2 = *v1;
    }
    else {
      id v2 = 0;
    }
    objc_storeStrong((id *)&qword_1E92DB8B8, v2);
    int v0 = (void *)qword_1E92DB8B8;
  }
  return sub_1918D2DFC(v0);
}

id IMMMSEmailAddressToMatch()
{
  if (qword_1EB273758 != -1) {
    dispatch_once(&qword_1EB273758, &unk_1EE2314D8);
  }
  if (!qword_1EB273760) {
    goto LABEL_11;
  }
  CFDictionaryRef v0 = (const __CFDictionary *)CFPreferencesCopyAppValue(@"MMS", @"com.apple.carrier");
  if (!v0) {
    goto LABEL_11;
  }
  CFStringRef v1 = (CFStringRef)v0;
  CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(v0, @"ShowMMSEmailAddress");
  if (!Value)
  {
    uint64_t v5 = 0;
LABEL_13:
    CFRelease(v1);
    goto LABEL_14;
  }
  int v3 = CFBooleanGetValue(Value);
  CFRelease(v1);
  if (!v3)
  {
LABEL_11:
    uint64_t v5 = 0;
    goto LABEL_14;
  }
  uint64_t v4 = IMSharedResourcesDirectory();
  CFStringRef v1 = CFStringCreateWithFormat(0, 0, @"%@/Library/Preferences/%@", v4, @"com.apple.MobileSMS");
  uint64_t v5 = (void *)CFPreferencesCopyAppValue(@"MMSEmailAddress", v1);
  if ((byte_1E92DB8C0 & 1) == 0)
  {
    byte_1E92DB8C0 = 1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1918D30EC, @"com.apple.MobileSMS.MMSEmailAddress.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  if (v1) {
    goto LABEL_13;
  }
LABEL_14:
  return v5;
}

void sub_1918D30EC()
{
  CFDictionaryRef v0 = IMSharedResourcesDirectory();
  CFStringRef v1 = CFStringCreateWithFormat(0, 0, @"%@/Library/Preferences/%@", v0, @"com.apple.MobileSMS");
  if (v1)
  {
    CFRelease(v1);
  }
}

uint64_t IMiMessageShouldSendLowResolutionOnly()
{
  if (IMGetCachedDomainBoolForKey(@"com.apple.imessage", @"AlwaysDownloadHighResolutionImages")) {
    return 0;
  }
  uint64_t v4 = objc_msgSend_sharedInstance(IMMobileNetworkManager, v0, v1, v2);
  if (objc_msgSend_isWiFiEnabled(v4, v5, v6, v7))
  {
    uint64_t v11 = objc_msgSend_sharedInstance(IMMobileNetworkManager, v8, v9, v10);
    if (objc_msgSend_isWiFiUsable(v11, v12, v13, v14))
    {
      uint64_t v18 = objc_msgSend_sharedInstance(IMMobileNetworkManager, v15, v16, v17);
      int isHostingWiFiHotSpot = objc_msgSend_isHostingWiFiHotSpot(v18, v19, v20, v21);
    }
    else
    {
      int isHostingWiFiHotSpot = 1;
    }
  }
  else
  {
    int isHostingWiFiHotSpot = 1;
  }

  uint64_t v26 = objc_msgSend_sharedInstance(IMMobileNetworkManager, v23, v24, v25);
  uint64_t v3 = isHostingWiFiHotSpot & (objc_msgSend_hasLTEDataConnection(v26, v27, v28, v29) ^ 1);

  return v3;
}

void IMiMessageMaxTransferFileSizeForWifi(unint64_t *a1, unint64_t *a2, void *a3)
{
  id v5 = a3;
  uint64_t v8 = objc_msgSend_objectForKey_(v5, v6, @"att-wifi-max-file-size", v7);
  uint64_t v12 = objc_msgSend_unsignedIntegerValue(v8, v9, v10, v11);

  double v15 = objc_msgSend_objectForKey_(v5, v13, @"att-cellular-max-file-size", v14);

  unint64_t v19 = objc_msgSend_unsignedIntegerValue(v15, v16, v17, v18);
  if (v12) {
    unint64_t v24 = v12;
  }
  else {
    unint64_t v24 = 10485760;
  }
  if (!v19) {
    unint64_t v19 = 0x400000;
  }
  if (a1)
  {
    if (qword_1EB273758 != -1) {
      dispatch_once(&qword_1EB273758, &unk_1EE2314D8);
    }
    if (qword_1EB273760)
    {
      unint64_t v20 = IMMMSMaximumMessageByteCount(v20, v21, v22, v23);
      if (v24 <= v20) {
        unint64_t v24 = v20;
      }
    }
    *a1 = v24;
  }
  if (a2)
  {
    if (qword_1EB273758 != -1) {
      dispatch_once(&qword_1EB273758, &unk_1EE2314D8);
    }
    if (qword_1EB273760)
    {
      unint64_t v25 = IMMMSMaximumMessageByteCount(v20, v21, v22, v23);
      if (v19 <= v25) {
        unint64_t v19 = v25;
      }
    }
    *a2 = v19;
  }
}

uint64_t IMiMessageMaxTransferAudioFileSizeForWifi(uint64_t *a1, unint64_t *a2, void *a3)
{
  id v5 = a3;
  uint64_t v8 = objc_msgSend_objectForKey_(v5, v6, @"att-wifi-audio-max-file-size", v7);
  uint64_t v12 = objc_msgSend_unsignedIntegerValue(v8, v9, v10, v11);

  double v15 = objc_msgSend_objectForKey_(v5, v13, @"att-wifi-audio-cellular-file-size", v14);

  uint64_t v19 = objc_msgSend_unsignedIntegerValue(v15, v16, v17, v18);
  if (v12) {
    uint64_t v24 = v12;
  }
  else {
    uint64_t v24 = 10485760;
  }
  if (v19) {
    unint64_t v25 = v19;
  }
  else {
    unint64_t v25 = 0x400000;
  }
  if (a1) {
    *a1 = v24;
  }
  if (a2)
  {
    if (qword_1EB273758 != -1) {
      dispatch_once(&qword_1EB273758, &unk_1EE2314D8);
    }
    if (qword_1EB273760)
    {
      unint64_t v26 = IMMMSMaximumMessageByteCount(v20, v21, v22, v23);
      if (v25 <= v26) {
        unint64_t v25 = v26;
      }
    }
    *a2 = v25;
  }
  return v24;
}

uint64_t IMiMessageMaxTransferVideoFileSizeForWifi(uint64_t *a1, unint64_t *a2, void *a3)
{
  id v5 = a3;
  uint64_t v8 = objc_msgSend_objectForKey_(v5, v6, @"att-wifi-video-max-file-size", v7);
  uint64_t v12 = objc_msgSend_unsignedIntegerValue(v8, v9, v10, v11);

  double v15 = objc_msgSend_objectForKey_(v5, v13, @"att-wifi-video-cellular-file-size", v14);

  uint64_t v19 = objc_msgSend_unsignedIntegerValue(v15, v16, v17, v18);
  if (v12) {
    uint64_t v24 = v12;
  }
  else {
    uint64_t v24 = 10485760;
  }
  if (v19) {
    unint64_t v25 = v19;
  }
  else {
    unint64_t v25 = 0x400000;
  }
  if (a1) {
    *a1 = v24;
  }
  if (a2)
  {
    if (qword_1EB273758 != -1) {
      dispatch_once(&qword_1EB273758, &unk_1EE2314D8);
    }
    if (qword_1EB273760)
    {
      unint64_t v26 = IMMMSMaximumMessageByteCount(v20, v21, v22, v23);
      if (v25 <= v26) {
        unint64_t v25 = v26;
      }
    }
    *a2 = v25;
  }
  return v24;
}

unint64_t IMiMessageMaxFileSizeForUTI(void *a1, unsigned char *a2)
{
  uint64_t v155 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v7 = objc_msgSend_sharedInstance(IMMobileNetworkManager, v4, v5, v6);
  if (objc_msgSend_isWiFiEnabled(v7, v8, v9, v10))
  {
    uint64_t v14 = objc_msgSend_sharedInstance(IMMobileNetworkManager, v11, v12, v13);
    char isWiFiUsable = objc_msgSend_isWiFiUsable(v14, v15, v16, v17);

    if (isWiFiUsable)
    {
      int hasLTEDataConnection = 0;
      int v23 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v24 = objc_msgSend_sharedInstance(IMMobileNetworkManager, v19, v20, v21);
  int hasLTEDataConnection = objc_msgSend_hasLTEDataConnection(v24, v25, v26, v27);

  int v23 = 1;
LABEL_6:
  uint64_t v28 = objc_msgSend_sharedInstance(IMMobileNetworkManager, v19, v20, v21);
  int v32 = objc_msgSend_isWiFiUsable(v28, v29, v30, v31);

  uint64_t v33 = (void *)IMWeakLinkClass();
  uint64_t v37 = objc_msgSend_sharedInstance(v33, v34, v35, v36);
  int v41 = objc_msgSend_allowAnyNetwork(v37, v38, v39, v40);

  if (v41)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v42 = OSLogHandleForIMFoundationCategory("Attachments");
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_191892000, v42, OS_LOG_TYPE_INFO, "Forcing wifi", buf, 2u);
      }
    }
    IMLogString();
    if (_IMWillLog(@"Attachments")) {
      _IMAlwaysLog(0, @"Attachments", @"Forcing wifi", v43, v44, v45, v46, v47, v151);
    }
    int v32 = 1;
  }
  if (a2) {
    *a2 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v48 = OSLogHandleForIMFoundationCategory("Attachments");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v154 = v3;
      _os_log_impl(&dword_191892000, v48, OS_LOG_TYPE_INFO, "Max File Size For UTI: %@", buf, 0xCu);
    }
  }
  IMLogString();
  if (_IMWillLog(@"Attachments")) {
    _IMAlwaysLog(0, @"Attachments", @"Max File Size For UTI: %@", v49, v50, v51, v52, v53, (char)v3);
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v54 = OSLogHandleForIMFoundationCategory("Attachments");
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      if (v23) {
        uint64_t v55 = @"YES";
      }
      else {
        uint64_t v55 = @"NO";
      }
      *(_DWORD *)long long buf = 138412290;
      uint64_t v154 = v55;
      _os_log_impl(&dword_191892000, v54, OS_LOG_TYPE_INFO, "  Low Bandwidth Cell: %@", buf, 0xCu);
    }
  }
  if (v23) {
    uint64_t v56 = @"YES";
  }
  else {
    uint64_t v56 = @"NO";
  }
  IMLogString();
  if (_IMWillLog(@"Attachments")) {
    _IMAlwaysLog(0, @"Attachments", @"  Low Bandwidth Cell: %@", v57, v58, v59, v60, v61, (char)v56);
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v62 = OSLogHandleForIMFoundationCategory("Attachments");
    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      if (hasLTEDataConnection) {
        double v63 = @"YES";
      }
      else {
        double v63 = @"NO";
      }
      *(_DWORD *)long long buf = 138412290;
      uint64_t v154 = v63;
      _os_log_impl(&dword_191892000, v62, OS_LOG_TYPE_INFO, " High Bandwidth Cell: %@", buf, 0xCu);
    }
  }
  if (hasLTEDataConnection) {
    __int16 v64 = @"YES";
  }
  else {
    __int16 v64 = @"NO";
  }
  IMLogString();
  if (_IMWillLog(@"Attachments")) {
    _IMAlwaysLog(0, @"Attachments", @" High Bandwidth Cell: %@", v65, v66, v67, v68, v69, (char)v64);
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v70 = OSLogHandleForIMFoundationCategory("Attachments");
    if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
    {
      if (v32) {
        uint64_t v71 = @"YES";
      }
      else {
        uint64_t v71 = @"NO";
      }
      *(_DWORD *)long long buf = 138412290;
      uint64_t v154 = v71;
      _os_log_impl(&dword_191892000, v70, OS_LOG_TYPE_INFO, "      High Bandwidth: %@", buf, 0xCu);
    }
  }
  if (v32) {
    uint64_t v72 = @"YES";
  }
  else {
    uint64_t v72 = @"NO";
  }
  IMLogString();
  if (_IMWillLog(@"Attachments")) {
    _IMAlwaysLog(0, @"Attachments", @"      High Bandwidth: %@", v73, v74, v75, v76, v77, (char)v72);
  }
  if (IMOSLoggingEnabled())
  {
    CFRange v78 = OSLogHandleForIMFoundationCategory("Attachments");
    if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v154 = @"YES";
      _os_log_impl(&dword_191892000, v78, OS_LOG_TYPE_INFO, "    Wants Misc Types: %@", buf, 0xCu);
    }
  }
  v152 = @"YES";
  IMLogString();
  if (_IMWillLog(@"Attachments")) {
    _IMAlwaysLog(0, @"Attachments", @"    Wants Misc Types: %@", v79, v80, v81, v82, v83, (char)@"YES");
  }
  if (sub_1918D43E4(v3))
  {
    if (IMOSLoggingEnabled())
    {
      char v84 = OSLogHandleForIMFoundationCategory("Attachments");
      if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v154 = v3;
        _os_log_impl(&dword_191892000, v84, OS_LOG_TYPE_INFO, "      ** This is an image type: %@", buf, 0xCu);
      }
    }
    IMLogString();
    if (_IMWillLog(@"Attachments")) {
      _IMAlwaysLog(0, @"Attachments", @"      ** This is an image type: %@", v85, v86, v87, v88, v89, (char)v3);
    }
LABEL_71:
    if ((v23 ^ 1 | hasLTEDataConnection | v32) != 1)
    {
      unint64_t v99 = 0x400000;
      goto LABEL_97;
    }
    BOOL v90 = (hasLTEDataConnection ^ 1 | v32) == 0;
    uint64_t v91 = 6291456;
LABEL_73:
    uint64_t v92 = 10485760;
LABEL_91:
    if (v90) {
      unint64_t v99 = v91;
    }
    else {
      unint64_t v99 = v92;
    }
    if (a2) {
      goto LABEL_95;
    }
    goto LABEL_97;
  }
  if (sub_1918D4494(v3))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v93 = OSLogHandleForIMFoundationCategory("Attachments");
      if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v154 = v3;
        _os_log_impl(&dword_191892000, v93, OS_LOG_TYPE_INFO, "      ** This is an audio type: %@", buf, 0xCu);
      }
    }
    IMLogString();
    if (_IMWillLog(@"Attachments")) {
      _IMAlwaysLog(0, @"Attachments", @"      ** This is an audio type: %@", v94, v95, v96, v97, v98, (char)v3);
    }
LABEL_89:
    if ((v23 ^ 1 | hasLTEDataConnection | v32) != 1)
    {
      unint64_t v99 = 5242880;
      goto LABEL_97;
    }
    BOOL v90 = (hasLTEDataConnection ^ 1 | v32) == 0;
    uint64_t v91 = 20971520;
    uint64_t v92 = 41943040;
    goto LABEL_91;
  }
  if (sub_1918D4544(v3))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v100 = OSLogHandleForIMFoundationCategory("Attachments");
      if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v154 = v3;
        _os_log_impl(&dword_191892000, v100, OS_LOG_TYPE_INFO, "      ** This is an video type: %@", buf, 0xCu);
      }
    }
    IMLogString();
    if (_IMWillLog(@"Attachments")) {
      _IMAlwaysLog(0, @"Attachments", @"      ** This is an video type: %@", v101, v102, v103, v104, v105, (char)v3);
    }
    goto LABEL_89;
  }
  if (sub_1918D45F4(v3))
  {
    if (IMOSLoggingEnabled())
    {
      stat v115 = OSLogHandleForIMFoundationCategory("Attachments");
      if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v154 = v3;
        _os_log_impl(&dword_191892000, v115, OS_LOG_TYPE_INFO, "      ** This is a vcard type: %@", buf, 0xCu);
      }
    }
    IMLogString();
    if (_IMWillLog(@"Attachments")) {
      _IMAlwaysLog(0, @"Attachments", @"      ** This is a vcard type: %@", v116, v117, v118, v119, v120, (char)v3);
    }
    unint64_t v99 = 0x100000;
    if (!a2) {
      goto LABEL_97;
    }
  }
  else
  {
    if (objc_msgSend_isEqualToString_(v3, v113, @"com.apple.pkpass", v114, v152))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v123 = OSLogHandleForIMFoundationCategory("Attachments");
        if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v154 = v3;
          _os_log_impl(&dword_191892000, v123, OS_LOG_TYPE_INFO, "      ** This is a pass type: %@", buf, 0xCu);
        }
      }
      IMLogString();
      if (_IMWillLog(@"Attachments")) {
        _IMAlwaysLog(0, @"Attachments", @"      ** This is a pass type: %@", v124, v125, v126, v127, v128, (char)v3);
      }
    }
    else
    {
      if (objc_msgSend_isEqualToString_(v3, v121, @"com.apple.watchface", v122))
      {
        if (IMOSLoggingEnabled())
        {
          v131 = OSLogHandleForIMFoundationCategory("Attachments");
          if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v154 = v3;
            _os_log_impl(&dword_191892000, v131, OS_LOG_TYPE_INFO, "      ** This is a watchface type: %@", buf, 0xCu);
          }
        }
        IMLogString();
        if (_IMWillLog(@"Attachments")) {
          _IMAlwaysLog(0, @"Attachments", @"      ** This is a watchface type: %@", v132, v133, v134, v135, v136, (char)v3);
        }
        goto LABEL_71;
      }
      int isEqualToString = objc_msgSend_isEqualToString_(v3, v129, @"com.apple.workout", v130);
      int v138 = IMOSLoggingEnabled();
      if (!isEqualToString)
      {
        if (v138)
        {
          uint64_t v145 = OSLogHandleForIMFoundationCategory("Attachments");
          if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v154 = v3;
            _os_log_impl(&dword_191892000, v145, OS_LOG_TYPE_INFO, "      ** This is a misc type: %@", buf, 0xCu);
          }
        }
        IMLogString();
        if (_IMWillLog(@"Attachments")) {
          _IMAlwaysLog(0, @"Attachments", @"      ** This is a misc type: %@", v146, v147, v148, v149, v150, (char)v3);
        }
        if ((v23 ^ 1 | hasLTEDataConnection | v32) != 1)
        {
          unint64_t v99 = 0x100000;
          goto LABEL_97;
        }
        BOOL v90 = (hasLTEDataConnection ^ 1 | v32) == 0;
        uint64_t v91 = 0x100000;
        goto LABEL_73;
      }
      if (v138)
      {
        id v139 = OSLogHandleForIMFoundationCategory("Attachments");
        if (os_log_type_enabled(v139, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v154 = v3;
          _os_log_impl(&dword_191892000, v139, OS_LOG_TYPE_INFO, "      ** This is a workout type: %@", buf, 0xCu);
        }
      }
      IMLogString();
      if (_IMWillLog(@"Attachments")) {
        _IMAlwaysLog(0, @"Attachments", @"      ** This is a workout type: %@", v140, v141, v142, v143, v144, (char)v3);
      }
    }
    unint64_t v99 = 10485760;
    if (!a2) {
      goto LABEL_97;
    }
  }
  if (v23 ^ 1 | hasLTEDataConnection | v32) {
LABEL_95:
  }
    *a2 = 1;
LABEL_97:
  if (IMOSLoggingEnabled())
  {
    size_t v106 = OSLogHandleForIMFoundationCategory("Attachments");
    if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v154 = (__CFString *)(v99 >> 10);
      _os_log_impl(&dword_191892000, v106, OS_LOG_TYPE_INFO, "  Max File Size: %lld kb", buf, 0xCu);
    }
  }
  IMLogString();
  if (_IMWillLog(@"Attachments")) {
    _IMAlwaysLog(0, @"Attachments", @"  Max File Size: %lld kb", v107, v108, v109, v110, v111, v99 >> 10);
  }

  return v99;
}

BOOL sub_1918D43E4(void *a1)
{
  id v1 = a1;
  if (qword_1E92DAC60 != -1) {
    dispatch_once(&qword_1E92DAC60, &unk_1EE230A38);
  }
  if (!qword_1E92DAC68)
  {
    uint64_t v2 = (void **)IMWeakLinkSymbol();
    if (v2) {
      uint64_t v3 = *v2;
    }
    else {
      uint64_t v3 = 0;
    }
    objc_storeStrong((id *)&qword_1E92DAC68, v3);
  }
  BOOL v4 = off_1E92DAC58(v1) != 0;

  return v4;
}

BOOL sub_1918D4494(void *a1)
{
  id v1 = a1;
  if (qword_1E92DAC78 != -1) {
    dispatch_once(&qword_1E92DAC78, &unk_1EE230A58);
  }
  if (!qword_1E92DAC80)
  {
    uint64_t v2 = (void **)IMWeakLinkSymbol();
    if (v2) {
      uint64_t v3 = *v2;
    }
    else {
      uint64_t v3 = 0;
    }
    objc_storeStrong((id *)&qword_1E92DAC80, v3);
  }
  BOOL v4 = off_1E92DAC70(v1) != 0;

  return v4;
}

BOOL sub_1918D4544(void *a1)
{
  id v1 = a1;
  if (qword_1E92DAC90 != -1) {
    dispatch_once(&qword_1E92DAC90, &unk_1EE230A78);
  }
  if (!qword_1E92DAC98)
  {
    uint64_t v2 = (void **)IMWeakLinkSymbol();
    if (v2) {
      uint64_t v3 = *v2;
    }
    else {
      uint64_t v3 = 0;
    }
    objc_storeStrong((id *)&qword_1E92DAC98, v3);
  }
  BOOL v4 = off_1E92DAC88(v1) != 0;

  return v4;
}

BOOL sub_1918D45F4(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_isEqualToString_(v1, v2, @"public.vlocation", v3))
  {
    BOOL v4 = 1;
  }
  else
  {
    if (qword_1E92DB8F0 != -1) {
      dispatch_once(&qword_1E92DB8F0, &unk_1EE230AF8);
    }
    if (!qword_1E92DB8F8)
    {
      uint64_t v5 = (void **)IMWeakLinkSymbol();
      if (v5) {
        uint64_t v6 = *v5;
      }
      else {
        uint64_t v6 = 0;
      }
      objc_storeStrong((id *)&qword_1E92DB8F8, v6);
    }
    BOOL v4 = off_1E92DB8E8(v1) != 0;
  }

  return v4;
}

void IMiMessageSizeLimitsForTransferType(void *a1, unint64_t *a2, void *a3, void *a4)
{
  char v4 = 0;
  sub_1918D46E8(a1, a2, a3, a4, 1, &v4);
}

void sub_1918D46E8(void *a1, unint64_t *a2, void *a3, void *a4, int a5, unsigned char *a6)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v11 = a1;
  id v12 = a4;
  unint64_t v29 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
  if (sub_1918D4494(v11))
  {
    IMiMessageMaxTransferAudioFileSizeForWifi((uint64_t *)&v30, &v29, v12);
  }
  else if (sub_1918D4544(v11))
  {
    IMiMessageMaxTransferVideoFileSizeForWifi((uint64_t *)&v30, &v29, v12);
  }
  else
  {
    IMiMessageMaxTransferFileSizeForWifi(&v30, &v29, v12);
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory("Attachments");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412802;
      id v32 = v11;
      __int16 v33 = 2048;
      unint64_t v34 = v30 >> 10;
      __int16 v35 = 2048;
      unint64_t v36 = v29 >> 10;
      _os_log_impl(&dword_191892000, v13, OS_LOG_TYPE_INFO, "Server bag File Size Limits for type: %@   big: %lld kb  small: %lld kb", buf, 0x20u);
    }
  }
  IMLogString();
  if (_IMWillLog(@"Attachments")) {
    _IMAlwaysLog(0, @"Attachments", @"Server bag File Size Limits for type: %@   big: %lld kb  small: %lld kb", v14, v15, v16, v17, v18, (char)v11);
  }
  unint64_t v19 = IMiMessageMaxFileSizeForUTI(v11, a6);
  if (a3) {
    *a3 = v29;
  }
  if (a2)
  {
    if (a5 && IMiMessageShouldSendLowResolutionOnly())
    {
      unint64_t v20 = v29;
    }
    else
    {
      unint64_t v20 = v30;
      if (v30 <= v19) {
        unint64_t v20 = v19;
      }
    }
    *a2 = v20;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory("Attachments");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      unint64_t v22 = *a2 >> 10;
      unint64_t v23 = *a3 >> 10;
      *(_DWORD *)long long buf = 138412802;
      id v32 = v11;
      __int16 v33 = 2048;
      unint64_t v34 = v22;
      __int16 v35 = 2048;
      unint64_t v36 = v23;
      _os_log_impl(&dword_191892000, v21, OS_LOG_TYPE_INFO, "Max File Size Limits for type: %@   big: %lld kb  small: %lld kb", buf, 0x20u);
    }
  }
  IMLogString();
  if (_IMWillLog(@"Attachments")) {
    _IMAlwaysLog(0, @"Attachments", @"Max File Size Limits for type: %@   big: %lld kb  small: %lld kb", v24, v25, v26, v27, v28, (char)v11);
  }
}

void IMiMessageSizeLimitsForTransferTypeDisableLargeSizeNetworkRestriction(void *a1, unint64_t *a2, void *a3, void *a4, unsigned char *a5)
{
}

uint64_t IMMMSPartCombinationCanBeSent(void *a1, uint64_t *a2)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v59 = v3;
  if (objc_msgSend_count(v3, v4, v5, v6))
  {
    uint64_t v57 = a2;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id obj = v3;
    uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v61, (uint64_t)v66, 16);
    if (v8)
    {
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      uint64_t v12 = *(void *)v62;
LABEL_4:
      uint64_t v13 = 0;
      int v14 = v11;
      int v58 = v11 + v8;
      while (1)
      {
        if (*(void *)v62 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v61 + 1) + 8 * v13);
        if (sub_1918D43E4(v15))
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v16 = OSLogHandleForIMFoundationCategory("MMSValidation");
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_191892000, v16, OS_LOG_TYPE_INFO, "Located an Image", buf, 2u);
            }
          }
          IMLogString();
          BOOL v17 = _IMWillLog(@"MMSValidation");
          uint64_t v24 = @"Located an Image";
          if (!v17) {
            goto LABEL_35;
          }
        }
        else if (sub_1918D4494(v15))
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v25 = OSLogHandleForIMFoundationCategory("MMSValidation");
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_191892000, v25, OS_LOG_TYPE_INFO, "Located an Audio File", buf, 2u);
            }
          }
          IMLogString();
          BOOL v26 = _IMWillLog(@"MMSValidation");
          ++v10;
          uint64_t v24 = @"Located an Audio File";
          if (!v26) {
            goto LABEL_35;
          }
        }
        else if (sub_1918D4544(v15))
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v27 = OSLogHandleForIMFoundationCategory("MMSValidation");
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_191892000, v27, OS_LOG_TYPE_INFO, "Located an Video File", buf, 2u);
            }
          }
          IMLogString();
          BOOL v28 = _IMWillLog(@"MMSValidation");
          ++v9;
          uint64_t v24 = @"Located an Video File";
          if (!v28) {
            goto LABEL_35;
          }
        }
        else
        {
          BOOL v29 = sub_1918D45F4(v15);
          int v30 = IMOSLoggingEnabled();
          if (!v29)
          {
            if (v30)
            {
              uint64_t v49 = OSLogHandleForIMFoundationCategory("MMSValidation");
              if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl(&dword_191892000, v49, OS_LOG_TYPE_INFO, "Found an invalid attachment for MMS in this message, failing message", buf, 2u);
              }
            }
            IMLogString();
            if (_IMWillLog(@"MMSValidation")) {
              _IMAlwaysLog(0, @"MMSValidation", @"Found an invalid attachment for MMS in this message, failing message", v50, v51, v52, v53, v54, (char)v57);
            }
            uint64_t v47 = v57;
            if (v57)
            {
              uint64_t v48 = 1001;
              goto LABEL_58;
            }
            goto LABEL_67;
          }
          if (v30)
          {
            uint64_t v31 = OSLogHandleForIMFoundationCategory("MMSValidation");
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_191892000, v31, OS_LOG_TYPE_INFO, "Located an vCard File", buf, 2u);
            }
          }
          IMLogString();
          BOOL v32 = _IMWillLog(@"MMSValidation");
          uint64_t v24 = @"Located an vCard File";
          if (!v32) {
            goto LABEL_35;
          }
        }
        _IMAlwaysLog(0, @"MMSValidation", v24, v19, v20, v21, v22, v23, (char)v57);
LABEL_35:
        BOOL v33 = v9 <= 0 && v10 <= 0;
        if (!v33 && v14 + (int)v13 >= 1)
        {
          if (IMOSLoggingEnabled())
          {
            int v41 = OSLogHandleForIMFoundationCategory("MMSValidation");
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_191892000, v41, OS_LOG_TYPE_INFO, "Attempeted to send Mixed Type MMS, Not allowing to send", buf, 2u);
            }
          }
          IMLogString();
          if (_IMWillLog(@"MMSValidation")) {
            _IMAlwaysLog(0, @"MMSValidation", @"Attempeted to send Mixed Type MMS, Not allowing to send", v42, v43, v44, v45, v46, (char)v57);
          }
          uint64_t v47 = v57;
          if (v57)
          {
            uint64_t v48 = 2004;
LABEL_58:
            uint64_t v34 = 0;
            uint64_t *v47 = v48;
            goto LABEL_68;
          }
LABEL_67:
          uint64_t v34 = 0;
          goto LABEL_68;
        }
        if (v8 == ++v13)
        {
          uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v61, (uint64_t)v66, 16);
          int v11 = v58;
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
    uint64_t v34 = 1;
LABEL_68:
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v35 = OSLogHandleForIMFoundationCategory("MMSValidation");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_191892000, v35, OS_LOG_TYPE_INFO, "This message has no types, fine to send", buf, 2u);
      }
    }
    IMLogString();
    if (_IMWillLog(@"MMSValidation")) {
      _IMAlwaysLog(0, @"MMSValidation", @"This message has no types, fine to send", v36, v37, v38, v39, v40, v56);
    }
    uint64_t v34 = 1;
  }

  return v34;
}

uint64_t sub_1918D50E0()
{
  uint64_t result = CFPreferencesSynchronize(@"com.apple.carrier", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  dword_1E92DA31C = -1;
  dword_1E92DA2C8 = -1;
  dword_1E92DABDC = -1;
  dword_1E92DABE0 = -1;
  dword_1E92DA2C4 = -1;
  dword_1E92DA310 = -1;
  return result;
}

uint64_t sub_1918D514C()
{
  if (IMOSLoggingEnabled())
  {
    CFDictionaryRef v0 = OSLogHandleForIMFoundationCategory("Restricted");
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_191892000, v0, OS_LOG_TYPE_INFO, "Restricted Mode changed, reloading", buf, 2u);
    }
  }
  IMLogString();
  if (_IMWillLog(@"Restricted")) {
    _IMAlwaysLog(0, @"Restricted", @"Restricted Mode changed, reloading", v1, v2, v3, v4, v5, v9);
  }
  uint64_t v6 = IMSharedResourcesDirectory();
  CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"%@/Library/Preferences/%@", v6, @"com.apple.MobileSMS");
  if (v7) {
    CFRelease(v7);
  }
  return sub_1918D1F20(1);
}

BOOL sub_1918D5260()
{
  CFPreferencesSynchronize(@"com.apple.carrier", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  dword_1E92DA31C = -1;
  dword_1E92DA2C8 = -1;
  dword_1E92DABDC = -1;
  dword_1E92DABE0 = -1;
  dword_1E92DA2C4 = -1;
  dword_1E92DA310 = -1;
  dword_1E92DA318 = -1;
  BOOL result = IMReadMMSUserOverride();
  qword_1EB273760 = result;
  return result;
}

uint64_t sub_1918D52E4()
{
  uint64_t result = IMWeakLinkClass();
  qword_1E92DB8C8 = result;
  return result;
}

double (*sub_1918D5314())(void)
{
  uint64_t result = (double (*)(void))IMWeakLinkSymbol();
  off_1E92DB8D8 = result;
  return result;
}

uint64_t (*sub_1918D5344())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DAC58 = result;
  return result;
}

uint64_t (*sub_1918D5374())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DAC70 = result;
  return result;
}

uint64_t (*sub_1918D53A4())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DAC88 = result;
  return result;
}

uint64_t (*sub_1918D53D4())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DB8E8 = result;
  return result;
}

uint64_t sub_1918D54B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1918D5FEC(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, void *a6)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  BOOL v17 = objc_msgSend_URLLoading(IMIDSLog, v14, v15, v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 40);
    *(_DWORD *)long long buf = 138412290;
    id v80 = v18;
    _os_log_impl(&dword_191892000, v17, OS_LOG_TYPE_DEFAULT, "Finished loading direct request: %@", buf, 0xCu);
  }

  uint64_t v22 = objc_msgSend_URLLoading(IMIDSLog, v19, v20, v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v26 = objc_msgSend_bundleIdentifierForDataUsage(*(void **)(a1 + 32), v23, v24, v25);
    *(_DWORD *)long long buf = 138412290;
    id v80 = v26;
    _os_log_impl(&dword_191892000, v22, OS_LOG_TYPE_DEFAULT, " Data Usage identifier: %@", buf, 0xCu);
  }
  int v30 = objc_msgSend_URLLoading(IMIDSLog, v27, v28, v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v80 = v10;
    _os_log_impl(&dword_191892000, v30, OS_LOG_TYPE_DEFAULT, "              Response: %@", buf, 0xCu);
  }

  uint64_t v34 = objc_msgSend_URLLoading(IMIDSLog, v31, v32, v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = objc_msgSend_length(v11, v35, v36, v37);
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v80) = v38;
    _os_log_impl(&dword_191892000, v34, OS_LOG_TYPE_DEFAULT, "     ResultData Length: %d", buf, 8u);
  }

  uint64_t v42 = objc_msgSend_URLLoading(IMIDSLog, v39, v40, v41);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v80) = a3;
    _os_log_impl(&dword_191892000, v42, OS_LOG_TYPE_DEFAULT, "            StatusCode: %d", buf, 8u);
  }

  uint64_t v46 = objc_msgSend_URLLoading(IMIDSLog, v43, v44, v45);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v80 = v12;
    _os_log_impl(&dword_191892000, v46, OS_LOG_TYPE_DEFAULT, "                 Error: %@", buf, 0xCu);
  }

  uint64_t v50 = objc_msgSend_URLLoading(IMIDSLog, v47, v48, v49);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v54 = objc_msgSend_boundInterfaceIdentifier(*(void **)(*(void *)(a1 + 32) + 40), v51, v52, v53);
    *(_DWORD *)long long buf = 138412290;
    id v80 = v54;
    _os_log_impl(&dword_191892000, v50, OS_LOG_TYPE_DEFAULT, "       Bound interface: %@", buf, 0xCu);
  }
  int v58 = objc_msgSend_URLLoading(IMIDSLog, v55, v56, v57);
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    long long v62 = objc_msgSend_sharedInstance(NetworkChangeNotifier, v59, v60, v61);
    int v65 = objc_msgSend_linkQualityValueForInterfaceType_(v62, v63, 3, v64);
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v80) = v65;
    _os_log_impl(&dword_191892000, v58, OS_LOG_TYPE_DEFAULT, "     Cell Link Quality: %d", buf, 8u);
  }
  uint64_t v69 = objc_msgSend_URLLoading(IMIDSLog, v66, v67, v68);
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v73 = objc_msgSend_sharedInstance(NetworkChangeNotifier, v70, v71, v72);
    int v76 = objc_msgSend_linkQualityValueForInterfaceType_(v73, v74, 2, v75);
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v80) = v76;
    _os_log_impl(&dword_191892000, v69, OS_LOG_TYPE_DEFAULT, "     WiFi Link Quality: %d", buf, 8u);
  }
  uint64_t v77 = *(void *)(*(void *)(a1 + 32) + 48);
  if (v77) {
    (*(void (**)(uint64_t, id, uint64_t, id, id, id))(v77 + 16))(v77, v10, a3, v11, v12, v13);
  }
}

void *sub_1918D6534()
{
  uint64_t result = (void *)IMWeakLinkSymbol();
  off_1E92DB900 = result;
  return result;
}

uint64_t (*sub_1918D65F8())(void, void)
{
  uint64_t result = (uint64_t (*)(void, void))IMWeakLinkSymbol();
  off_1E92DACA0 = result;
  return result;
}

void sub_1918D6758(int a1, uint64_t a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = OSLogHandleForIDSCategory("NetworkAvailability");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if ((a1 & 0x40000) != 0) {
      int v5 = 87;
    }
    else {
      int v5 = 45;
    }
    v14[0] = 67111426;
    v14[1] = v5;
    if ((a1 & 2) != 0) {
      int v6 = 82;
    }
    else {
      int v6 = 45;
    }
    __int16 v15 = 1024;
    int v16 = v6;
    if (a1) {
      int v7 = 116;
    }
    else {
      int v7 = 45;
    }
    __int16 v17 = 1024;
    int v18 = v7;
    if ((a1 & 4) != 0) {
      int v8 = 99;
    }
    else {
      int v8 = 45;
    }
    __int16 v19 = 1024;
    int v20 = v8;
    if ((a1 & 8) != 0) {
      int v9 = 67;
    }
    else {
      int v9 = 45;
    }
    __int16 v21 = 1024;
    if ((a1 & 0x10) != 0) {
      int v10 = 105;
    }
    else {
      int v10 = 45;
    }
    int v22 = v9;
    __int16 v23 = 1024;
    if ((a1 & 0x20) != 0) {
      int v11 = 68;
    }
    else {
      int v11 = 45;
    }
    int v24 = v10;
    if ((a1 & 0x10000) != 0) {
      int v12 = 108;
    }
    else {
      int v12 = 45;
    }
    __int16 v25 = 1024;
    int v26 = v11;
    if ((a1 & 0x20000) != 0) {
      int v13 = 100;
    }
    else {
      int v13 = 45;
    }
    __int16 v27 = 1024;
    int v28 = v12;
    __int16 v29 = 1024;
    int v30 = v13;
    __int16 v31 = 2080;
    uint64_t v32 = a2;
    _os_log_impl(&dword_191892000, v4, OS_LOG_TYPE_DEFAULT, "Reachability Flag Status: %c%c %c%c%c%c%c%c%c %s\n", (uint8_t *)v14, 0x42u);
  }
}

uint64_t (*sub_1918D6A64())(void, void)
{
  uint64_t result = (uint64_t (*)(void, void))IMWeakLinkSymbol();
  off_1E92DACA8 = result;
  return result;
}

uint64_t sub_1918D8F2C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend__timerHit_(*(void **)(a1 + 32), a2, (uint64_t)a2, a4);
}

void sub_1918D9768(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1918D98F0;
  block[3] = &unk_1E57244B0;
  uint64_t v2 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v16 = v2;
  id v17 = *(id *)(a1 + 48);
  dispatch_block_t v3 = dispatch_block_create((dispatch_block_flags_t)0, block);
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 64) * 1000000000.0));
  dispatch_after(v4, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 16), v3);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1918D9900;
  v11[3] = &unk_1E57246C8;
  int v5 = *(void **)(a1 + 40);
  void v11[4] = *(void *)(a1 + 32);
  id v14 = v3;
  id v12 = v5;
  id v13 = *(id *)(a1 + 48);
  id v6 = v3;
  int v10 = objc_msgSend_copy(v11, v7, v8, v9);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

uint64_t sub_1918D98F0(void *a1)
{
  return MEMORY[0x1F4181798](a1[4], sel__popEnqueuedBlockWithGUID_key_, a1[5], a1[6]);
}

void sub_1918D9900(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
  dispatch_block_cancel(*(dispatch_block_t *)(a1 + 56));
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_block_t v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1918D99C0;
  block[3] = &unk_1E57244B0;
  void block[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v3, block);
}

uint64_t sub_1918D99C0(void *a1)
{
  return MEMORY[0x1F4181798](a1[4], sel__popEnqueuedBlockWithGUID_key_, a1[5], a1[6]);
}

void sub_1918D9B10(uint64_t a1)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _OWORD v7[2] = sub_1918D9BCC;
  v7[3] = &unk_1E57244B0;
  uint64_t v2 = *(void **)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v2;
  id v9 = *(id *)(a1 + 48);
  id v6 = objc_msgSend_copy(v7, v3, v4, v5);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_1918D9BCC(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_block_t v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1918D9C84;
  block[3] = &unk_1E57244B0;
  void block[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v3, block);
}

uint64_t sub_1918D9C84(void *a1)
{
  return MEMORY[0x1F4181798](a1[4], sel__popEnqueuedBlockWithGUID_key_, a1[5], a1[6]);
}

uint64_t im_set_primary_queue(void *a1)
{
  id v1 = a1;
  unsigned __int8 v2 = atomic_load(byte_1EB273B60);
  if (v2) {
    abort();
  }
  qword_1E92DB0B8 = (uint64_t)v1;
  return MEMORY[0x1F41817F8]();
}

uint64_t im_set_primary_base_queue(void *a1)
{
  id v1 = a1;
  unsigned __int8 v2 = atomic_load(byte_1E92DAFD8);
  if (v2) {
    abort();
  }
  qword_1E92DB098 = (uint64_t)v1;
  return MEMORY[0x1F41817F8]();
}

void im_assert_primary_queue()
{
  CFDictionaryRef v0 = im_primary_queue();
  dispatch_assert_queue_V2(v0);
}

uint64_t sub_1918DA290()
{
  qword_1E92DB910 = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1918DA534(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 16))();
}

uint64_t sub_1918DA54C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 16))();
}

const void *__IMCopyCachedStringKey(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (qword_1E92DB0F0 != -1) {
    dispatch_once(&qword_1E92DB0F0, &unk_1EE22FE38);
  }
  CFHashCode v8 = CFHash(v5);
  id v9 = (const void *)(CFHash(v6) + v8);
  int v10 = NSMapGet((NSMapTable *)qword_1E92DB100, v9);
  if (!v10 || (id v14 = CFRetain(v10)) == 0)
  {
    if (objc_msgSend_length(v7, v11, v12, v13))
    {
      id v17 = objc_msgSend_stringByAppendingString_(v5, v15, (uint64_t)v7, v16);
      objc_msgSend_stringByAppendingString_(v17, v18, (uint64_t)v6, v19);
      id v14 = (const void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend_stringByAppendingString_(v5, v15, (uint64_t)v6, v16);
      id v14 = (const void *)objc_claimAutoreleasedReturnValue();
    }
    pthread_mutex_lock(&stru_1E92DA2D0);
    id v20 = (id)qword_1E92DB100;
    atomic_ullong v25 = qword_1E92DB100;
    NSMapInsert((NSMapTable *)qword_1E92DB0F8, v9, v14);
    uint64_t v21 = qword_1E92DB100;
    atomic_compare_exchange_strong(&v25, (unint64_t *)&v21, qword_1E92DB0F8);
    int v22 = (void *)qword_1E92DB0F8;
    qword_1E92DB0F8 = (uint64_t)v20;
    id v23 = v20;

    NSMapInsert((NSMapTable *)qword_1E92DB0F8, v9, v14);
    pthread_mutex_unlock(&stru_1E92DA2D0);
  }

  return v14;
}

uint64_t sub_1918DA900()
{
  id v0 = objc_alloc(MEMORY[0x1E4F28E10]);
  uint64_t v2 = objc_msgSend_initWithKeyOptions_valueOptions_capacity_(v0, v1, 1282, 0, 100);
  dispatch_block_t v3 = (void *)qword_1E92DB100;
  qword_1E92DB100 = v2;

  id v4 = objc_alloc(MEMORY[0x1E4F28E10]);
  qword_1E92DB0F8 = objc_msgSend_initWithKeyOptions_valueOptions_capacity_(v4, v5, 1282, 0, 100);
  return MEMORY[0x1F41817F8]();
}

BOOL IMShouldLogCategory(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  if ((byte_1EB273B01 & 1) == 0 && qword_1EB273B10 != -1) {
    dispatch_once(&qword_1EB273B10, &unk_1EE2300D8);
  }
  if (dword_1EB273730 >= 1)
  {
    if ((byte_1EB273B01 & 1) == 0 && qword_1EB273B10 != -1) {
      dispatch_once(&qword_1EB273B10, &unk_1EE2300D8);
    }
    pthread_mutex_lock(&stru_1EB2736F0);
    id v9 = objc_msgSend_objectForKey_((void *)qword_1EB273B18, v7, (uint64_t)v5, v8);

    if (v6 && v9)
    {
      uint64_t v12 = objc_msgSend_objectForKey_((void *)qword_1E92DB928, v10, (uint64_t)v5, v11);
      char v16 = objc_msgSend_BOOLValue(v12, v13, v14, v15);

      if ((v16 & 1) == 0)
      {
        id v17 = (void *)__IMCopyCachedStringKey(v5, v6, @".");
        id v20 = objc_msgSend_objectForKey_((void *)qword_1EB273B18, v18, (uint64_t)v17, v19);

        if (!v20) {
          goto LABEL_12;
        }
      }
    }
    else if (!v9)
    {
LABEL_12:
      BOOL v21 = 0;
LABEL_16:
      pthread_mutex_unlock(&stru_1EB2736F0);
      goto LABEL_17;
    }
    BOOL v21 = sub_1918DAB00(v5) >= a3;
    goto LABEL_16;
  }
  BOOL v21 = 0;
LABEL_17:

  return v21;
}

uint64_t sub_1918DAB00(void *a1)
{
  id v1 = (void *)__IMCopyCachedStringKey(a1, @"LogLevel", &stru_1EE231AD8);
  id v4 = objc_msgSend_objectForKey_((void *)qword_1E92DB920, v2, (uint64_t)v1, v3);
  uint64_t v8 = v4;
  if (v4) {
    uint64_t v9 = (int)objc_msgSend_intValue(v4, v5, v6, v7);
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

BOOL IMShouldLogEvent(void *a1, uint64_t a2)
{
  id v3 = a1;
  if ((byte_1EB273B01 & 1) == 0 && qword_1EB273B10 != -1) {
    dispatch_once(&qword_1EB273B10, &unk_1EE2300D8);
  }
  if (dword_1EB273730 < 1)
  {
    BOOL v9 = 0;
  }
  else
  {
    if ((byte_1EB273B01 & 1) == 0 && qword_1EB273B10 != -1) {
      dispatch_once(&qword_1EB273B10, &unk_1EE2300D8);
    }
    pthread_mutex_lock(&stru_1EB2736F0);
    uint64_t v6 = objc_msgSend_objectForKey_((void *)qword_1EB273AF8, v4, (uint64_t)v3, v5);

    if (v6)
    {
      BOOL v9 = 1;
    }
    else
    {
      int v10 = objc_msgSend_objectForKey_((void *)qword_1EB273B18, v7, (uint64_t)v3, v8);

      if (v10) {
        BOOL v9 = sub_1918DAB00(v3) >= a2;
      }
      else {
        BOOL v9 = 0;
      }
    }
    pthread_mutex_unlock(&stru_1EB2736F0);
  }

  return v9;
}

BOOL IMShouldLog(void *a1, uint64_t a2)
{
  id v3 = a1;
  if ((byte_1EB273B01 & 1) == 0 && qword_1EB273B10 != -1) {
    dispatch_once(&qword_1EB273B10, &unk_1EE2300D8);
  }
  if (dword_1EB273730 < 1)
  {
    BOOL v7 = 0;
  }
  else
  {
    if ((byte_1EB273B01 & 1) == 0 && qword_1EB273B10 != -1) {
      dispatch_once(&qword_1EB273B10, &unk_1EE2300D8);
    }
    pthread_mutex_lock(&stru_1EB2736F0);
    uint64_t v6 = objc_msgSend_objectForKey_((void *)qword_1EB273B18, v4, (uint64_t)v3, v5);

    if (v6) {
      BOOL v7 = sub_1918DAB00(v3) >= a2;
    }
    else {
      BOOL v7 = 0;
    }
    pthread_mutex_unlock(&stru_1EB2736F0);
  }

  return v7;
}

uint64_t IMLogLevelForType(void *a1)
{
  id v1 = a1;
  if ((byte_1EB273B01 & 1) == 0 && qword_1EB273B10 != -1) {
    dispatch_once(&qword_1EB273B10, &unk_1EE2300D8);
  }
  if (dword_1EB273730 < 1 || byte_1EB273B00 == 0)
  {
    uint64_t v3 = 0;
  }
  else
  {
    if ((byte_1EB273B01 & 1) == 0 && qword_1EB273B10 != -1) {
      dispatch_once(&qword_1EB273B10, &unk_1EE2300D8);
    }
    pthread_mutex_lock(&stru_1EB2736F0);
    uint64_t v3 = sub_1918DAB00(v1);
    pthread_mutex_unlock(&stru_1EB2736F0);
  }

  return v3;
}

uint64_t IMSyncLoggingsPreferences()
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  byte_1EB273B01 = 1;
  pthread_mutex_lock(&stru_1EB2736F0);
  uint64_t v3 = objc_msgSend_sharedInstance(IMLockdownManager, v0, v1, v2);
  int isCarrierInstall = objc_msgSend_isCarrierInstall(v3, v4, v5, v6);

  if (dword_1EB273730 != -1) {
    CFPreferencesAppSynchronize(@"com.apple.logging");
  }
  v9.tv_seCC_SHA256_CTX c = 0xAAAAAAAAAAAAAAAALL;
  v9.tv_nseCC_SHA256_CTX c = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v121.st_blksize_t size = v9;
  *(timespec *)v121.st_qspare = v9;
  v121.st_birthtimespeCC_SHA256_CTX c = v9;
  *(timespec *)&v121.st_size_t size = v9;
  v121.st_mtimespeCC_SHA256_CTX c = v9;
  v121.st_ctimespeCC_SHA256_CTX c = v9;
  *(timespec *)&v121.st_uid = v9;
  v121.st_atimespeCC_SHA256_CTX c = v9;
  *(timespec *)&v121.st_dev = v9;
  dword_1EB273730 = 0;
  p_superclass = &OBJC_METACLASS____IMTimingInstance.superclass;
  if (!byte_1EB273B00 || lstat("/var/mobile/Library/PPTDevice", &v121) && lstat("/var/db/disableAppleInternal", &v121))
  {
    objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E4F1C9E8], v7, @"Registration", v8, @"RegistrationLogging", @"RegistrationLogLevel", @"RegistrationLoggingLevel", @"LocalPreview", @"LocalPreviewLogging", @"Phone", @"PhoneLogging", @"VisualVoicemail", @"VisualVoicemailLogging", @"FaceTime", @"CallLogging", @"MessagesEvent", @"MadridEventLogging", @"Messages", @"MadridLogging",
      @"MessagesLogLevel",
      @"MadridLoggingLevel",
      @"IDS",
      @"IDSLogging",
      @"IDSLogLevel",
      @"IDSLoggingLevel",
      @"Transport",
      @"TransportLogging",
    uint64_t v11 = 0);
    CFArrayRef v12 = CFPreferencesCopyKeyList(@"com.apple.logging", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    CFArrayRef obj = v12;
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v117, (uint64_t)v125, 16);
    if (!v14) {
      goto LABEL_37;
    }
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v118;
    while (1)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v118 != v16) {
          objc_enumerationMutation(obj);
        }
        int v18 = (__CFString *)*(id *)(*((void *)&v117 + 1) + 8 * i);
        BOOL v21 = objc_msgSend_objectForKey_(v11, v19, (uint64_t)v18, v20);
        int v24 = v21;
        atomic_ullong v25 = v18;
        if (v21)
        {
          atomic_ullong v25 = v21;
        }
        if (objc_msgSend_hasSuffix_(v25, v22, @"LogLevel", v23))
        {
          if (byte_1EB273B00)
          {
            if (!qword_1E92DB920)
            {
              CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
              __int16 v29 = (void *)qword_1E92DB920;
              qword_1E92DB920 = (uint64_t)Mutable;
            }
            AppIntegerCFBooleanRef Value = CFPreferencesGetAppIntegerValue(v18, @"com.apple.logging", 0);
            if (AppIntegerValue >= 1)
            {
              __int16 v31 = (__objc2_class *)qword_1E92DB920;
              uint64_t v32 = objc_msgSend_numberWithInteger_(NSNumber, v26, AppIntegerValue, v27);
              goto LABEL_28;
            }
          }
        }
        else if (objc_msgSend_hasSuffix_(v25, v26, @".AllCategories", v27))
        {
          if (byte_1EB273B00)
          {
            if (!qword_1E92DB928)
            {
              CFMutableDictionaryRef v34 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
              __int16 v35 = (void *)qword_1E92DB928;
              qword_1E92DB928 = (uint64_t)v34;
            }
            uint64_t v36 = objc_msgSend_rangeOfString_(v25, v26, @".AllCategories", v27);
            uint64_t v37 = (void *)qword_1E92DB928;
            uint64_t v40 = objc_msgSend_substringToIndex_(v25, v38, v36, v39);
            objc_msgSend_setObject_forKey_(v37, v41, MEMORY[0x1E4F1CC38], (uint64_t)v40);
            goto LABEL_29;
          }
        }
        else
        {
          if (!p_superclass[355])
          {
            CFMutableDictionaryRef v42 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
            uint64_t v43 = p_superclass[355];
            p_superclass[355] = (__objc2_class *)v42;
          }
          int AppBooleanValue = CFPreferencesGetAppBooleanValue(v18, @"com.apple.logging", 0);
          dword_1EB273730 |= AppBooleanValue != 0;
          if (AppBooleanValue)
          {
            __int16 v31 = p_superclass[355];
            uint64_t v32 = objc_msgSend_numberWithBool_(NSNumber, v26, 1, v27);
LABEL_28:
            uint64_t v40 = (void *)v32;
            objc_msgSend_setObject_forKey_(v31, v33, v32, (uint64_t)v25);
LABEL_29:

            p_superclass = (__objc2_class **)(&OBJC_METACLASS____IMTimingInstance + 8);
          }
        }
        if ((objc_msgSend_isEqualToString_(v25, v26, @"Messages", v27) & 1) != 0
          || objc_msgSend_isEqualToString_(v25, v45, @"FaceTime", v46))
        {
          uint64_t v47 = (void *)qword_1E92DB928;
          if (!qword_1E92DB928)
          {
            CFMutableDictionaryRef v48 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
            uint64_t v49 = (void *)qword_1E92DB928;
            qword_1E92DB928 = (uint64_t)v48;

            uint64_t v47 = (void *)qword_1E92DB928;
          }
          objc_msgSend_setObject_forKey_(v47, v45, MEMORY[0x1E4F1CC38], (uint64_t)v25);
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v50, (uint64_t)&v117, (uint64_t)v125, 16);
      if (!v15)
      {
LABEL_37:

        int v51 = 0;
        goto LABEL_39;
      }
    }
  }
  dword_1EB273730 = 0;
  int v51 = 1;
LABEL_39:
  uint64_t v52 = objc_msgSend_objectForKey_(p_superclass[355], v7, @"Messages", v8);
  int v56 = objc_msgSend_intValue(v52, v53, v54, v55);

  if (v56 >= 1)
  {
    uint64_t v59 = p_superclass[355];
    if (!v59)
    {
      CFMutableDictionaryRef v60 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      uint64_t v61 = p_superclass[355];
      p_superclass[355] = (__objc2_class *)v60;

      uint64_t v59 = p_superclass[355];
    }
    uint64_t v62 = MEMORY[0x1E4F1CC38];
    objc_msgSend_setObject_forKey_(v59, v57, MEMORY[0x1E4F1CC38], @"MessagesEvent");
    objc_msgSend_setObject_forKey_(p_superclass[355], v63, v62, @"IDS");
    objc_msgSend_setObject_forKey_(p_superclass[355], v64, v62, @"IDSIDQuery");
    objc_msgSend_setObject_forKey_(p_superclass[355], v65, v62, @"Transport");
    dword_1EB273730 = 1;
  }
  if (byte_1EB273B00) {
    char v66 = v51;
  }
  else {
    char v66 = 1;
  }
  if ((v66 & 1) == 0)
  {
    uint64_t v67 = objc_msgSend_arrayWithObjects_(MEMORY[0x1E4F1C978], v57, @"Registration", v58, @"Transport", @"LocalPreview", @"IDSIDQuery", @"CallFilter", 0);
    uint64_t v70 = objc_msgSend_arrayWithObjects_(MEMORY[0x1E4F1C978], v68, @"Messages", v69, 0);
    if (!p_superclass[355])
    {
      CFMutableDictionaryRef v71 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      uint64_t v72 = p_superclass[355];
      p_superclass[355] = (__objc2_class *)v71;
    }
    if (!qword_1EB273AF8)
    {
      CFMutableDictionaryRef v73 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      uint64_t v74 = (void *)qword_1EB273AF8;
      qword_1EB273AF8 = (uint64_t)v73;
    }
    dword_1EB273730 = 1;
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id v75 = v67;
    uint64_t v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v76, (uint64_t)&v113, (uint64_t)v124, 16);
    if (v77)
    {
      uint64_t v79 = v77;
      uint64_t v80 = *(void *)v114;
      uint64_t v81 = MEMORY[0x1E4F1CC38];
      do
      {
        for (uint64_t j = 0; j != v79; ++j)
        {
          if (*(void *)v114 != v80) {
            objc_enumerationMutation(v75);
          }
          objc_msgSend_setObject_forKey_(p_superclass[355], v78, v81, *(void *)(*((void *)&v113 + 1) + 8 * j));
        }
        uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v75, v78, (uint64_t)&v113, (uint64_t)v124, 16);
      }
      while (v79);
    }

    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    id v83 = v70;
    uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v84, (uint64_t)&v109, (uint64_t)v123, 16);
    if (v85)
    {
      uint64_t v87 = v85;
      uint64_t v88 = *(void *)v110;
      uint64_t v89 = MEMORY[0x1E4F1CC38];
      do
      {
        for (uint64_t k = 0; k != v87; ++k)
        {
          if (*(void *)v110 != v88) {
            objc_enumerationMutation(v83);
          }
          objc_msgSend_setObject_forKey_((void *)qword_1EB273AF8, v86, v89, *(void *)(*((void *)&v109 + 1) + 8 * k));
        }
        uint64_t v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v86, (uint64_t)&v109, (uint64_t)v123, 16);
      }
      while (v87);
    }
  }
  if (((v51 | isCarrierInstall ^ 1) & 1) == 0)
  {
    uint64_t v91 = objc_msgSend_arrayWithObjects_(MEMORY[0x1E4F1C978], v57, @"Registration", v58, @"Transport", 0);
    if (!p_superclass[355])
    {
      CFMutableDictionaryRef v92 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      uint64_t v93 = p_superclass[355];
      p_superclass[355] = (__objc2_class *)v92;
    }
    dword_1EB273730 = 1;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id v94 = v91;
    uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v95, (uint64_t)&v105, (uint64_t)v122, 16);
    if (v96)
    {
      uint64_t v98 = v96;
      uint64_t v99 = *(void *)v106;
      uint64_t v100 = MEMORY[0x1E4F1CC38];
      do
      {
        for (uint64_t m = 0; m != v98; ++m)
        {
          if (*(void *)v106 != v99) {
            objc_enumerationMutation(v94);
          }
          objc_msgSend_setObject_forKey_(p_superclass[355], v97, v100, *(void *)(*((void *)&v105 + 1) + 8 * m));
        }
        uint64_t v98 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v97, (uint64_t)&v105, (uint64_t)v122, 16);
      }
      while (v98);
    }
  }
  if (qword_1EB273B08 != -1) {
    dispatch_once(&qword_1EB273B08, &unk_1EE2314F8);
  }
  return pthread_mutex_unlock(&stru_1EB2736F0);
}

void sub_1918DB7E8()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)j__IMSyncLoggingsPreferences, @"kMarcoSyncLoggingPrefs", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

void _IMOverrideCanLogMessageBodies(uint64_t a1, char a2)
{
  byte_1E92DB930 = a2;
}

BOOL IMShouldLogMessageBodies()
{
  if (byte_1EB273B00) {
    BOOL v0 = byte_1E92DB930 == 0;
  }
  else {
    BOOL v0 = 1;
  }
  return !v0 || IMShouldLog(@"Messages", 1);
}

__CFString *IMLoggingStringForMessageData(void *a1)
{
  id v1 = a1;
  if (byte_1EB273B00) {
    BOOL v2 = byte_1E92DB930 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2 && !IMShouldLog(@"Messages", 1)) {
    uint64_t v3 = @"<< Message Not Loggable >>";
  }
  else {
    uint64_t v3 = (__CFString *)v1;
  }

  return v3;
}

uint64_t IMWarnString_V()
{
  return 0;
}

uint64_t _IMWarnString_V()
{
  return 0;
}

uint64_t IMLogStringWithFileAndLine_V()
{
  return 0;
}

uint64_t _IMLogStringWithFileAndLine_V()
{
  return 1;
}

uint64_t IMLogString_V()
{
  return 0;
}

uint64_t _IMLogString_V()
{
  return 0;
}

uint64_t IMLogString()
{
  return 0;
}

uint64_t IMLogEventString_V()
{
  return 0;
}

uint64_t _IMLogEventString_V()
{
  return 0;
}

uint64_t IMLogEventString()
{
  return 0;
}

uint64_t IMLogCurrentBacktrace_V()
{
  return 0;
}

uint64_t IMLogCurrentBacktrace()
{
  return 0;
}

id IMLoggingStringForArray(void *a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v5 = objc_msgSend_initWithString_(v2, v3, @"("), v4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v1;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v23, (uint64_t)v27, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v24;
    char v14 = 1;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v6);
        }
        uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ((v14 & 1) == 0) {
          objc_msgSend_appendString_(v5, v9, @", ", v11, (void)v23);
        }
        id v17 = objc_msgSend_description(v16, v9, v10, v11, (void)v23);
        objc_msgSend_appendString_(v5, v18, (uint64_t)v17, v19);

        char v14 = 0;
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v23, (uint64_t)v27, 16);
      char v14 = 0;
    }
    while (v12);
  }

  objc_msgSend_appendString_(v5, v20, @""), v21);
  return v5;
}

uint64_t sub_1918DBADC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_sharedInstance(IMLockdownManager, a2, a3, a4);
  byte_1EB273B00 = objc_msgSend_isInternalInstall(v4, v5, v6, v7);

  return IMSyncLoggingsPreferences();
}

void sub_1918DBB2C(void *a1, void *a2, void *a3, void *a4, void *a5, int64_t a6, int64_t a7)
{
  connection = a1;
  uint64_t v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  if (connection)
  {
    xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
    int v18 = v17;
    if (v17)
    {
      xpc_dictionary_set_int64(v17, "__xpc__event_code__", 0);
      if (v15) {
        IMInsertNSStringsToXPCDictionary(v18, "sessionType", v19, v20, v21, v22, v23, v24, (uint64_t)v15);
      }
      if (v16) {
        IMInsertNSStringsToXPCDictionary(v18, "sender", v19, v20, v21, v22, v23, v24, (uint64_t)v16);
      }
      xpc_dictionary_set_int64(v18, "beginSessionFlags", a6);
      xpc_dictionary_set_int64(v18, "endSessionFlags", a7);
      if (v14)
      {
        if (!v13)
        {
          uint64_t v13 = MEMORY[0x1E4F14428];
          id v25 = MEMORY[0x1E4F14428];
        }
        xpc_connection_send_message_with_reply(connection, v18, v13, v14);
      }
      else
      {
        xpc_connection_send_message(connection, v18);
      }
    }
  }
}

void sub_1918DBC94(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  connection = a1;
  timespec v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (connection)
  {
    xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
    id v14 = v13;
    if (v13)
    {
      xpc_dictionary_set_int64(v13, "__xpc__event_code__", 1);
      if (v11) {
        IMInsertNSStringsToXPCDictionary(v14, "sessionType", v15, v16, v17, v18, v19, v20, (uint64_t)v11);
      }
      if (v12) {
        IMInsertNSStringsToXPCDictionary(v14, "sender", v15, v16, v17, v18, v19, v20, (uint64_t)v12);
      }
      if (v10)
      {
        if (!v9)
        {
          timespec v9 = MEMORY[0x1E4F14428];
          id v21 = MEMORY[0x1E4F14428];
        }
        xpc_connection_send_message_with_reply(connection, v14, v9, v10);
      }
      else
      {
        xpc_connection_send_message(connection, v14);
      }
    }
  }
}

void sub_1918DBDC4(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, double a7)
{
  connection = a1;
  xpc_object_t v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (connection)
  {
    xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
    uint64_t v19 = v18;
    if (v18)
    {
      xpc_dictionary_set_int64(v18, "__xpc__event_code__", 2);
      if (v15) {
        IMInsertNSStringsToXPCDictionary(v19, "checkpoint", v20, v21, v22, v23, v24, v25, (uint64_t)v15);
      }
      if (v16) {
        IMInsertNSStringsToXPCDictionary(v19, "session", v20, v21, v22, v23, v24, v25, (uint64_t)v16);
      }
      if (v17) {
        IMInsertNSStringsToXPCDictionary(v19, "sender", v20, v21, v22, v23, v24, v25, (uint64_t)v17);
      }
      xpc_dictionary_set_double(v19, "time", a7);
      if (v14)
      {
        if (!v13)
        {
          xpc_object_t v13 = MEMORY[0x1E4F14428];
          id v26 = MEMORY[0x1E4F14428];
        }
        xpc_connection_send_message_with_reply(connection, v19, v13, v14);
      }
      else
      {
        xpc_connection_send_message(connection, v19);
      }
    }
  }
}

void sub_1918DBF3C(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, double a8)
{
  connection = a1;
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  if (connection)
  {
    xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
    uint64_t v22 = v21;
    if (v21)
    {
      xpc_dictionary_set_int64(v21, "__xpc__event_code__", 3);
      if (v17) {
        IMInsertNSStringsToXPCDictionary(v22, "description", v23, v24, v25, v26, v27, v28, (uint64_t)v17);
      }
      if (v18) {
        IMInsertNSStringsToXPCDictionary(v22, "logString", v23, v24, v25, v26, v27, v28, (uint64_t)v18);
      }
      if (v19) {
        IMInsertNSStringsToXPCDictionary(v22, "sessionType", v23, v24, v25, v26, v27, v28, (uint64_t)v19);
      }
      if (v20) {
        IMInsertNSStringsToXPCDictionary(v22, "sender", v23, v24, v25, v26, v27, v28, (uint64_t)v20);
      }
      xpc_dictionary_set_double(v22, "time", a8);
      if (v16)
      {
        if (!v15)
        {
          id v15 = MEMORY[0x1E4F14428];
          id v29 = MEMORY[0x1E4F14428];
        }
        xpc_connection_send_message_with_reply(connection, v22, v15, v16);
      }
      else
      {
        xpc_connection_send_message(connection, v22);
      }
    }
  }
}

void sub_1918DC0E4(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  connection = a1;
  xpc_object_t v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (connection)
  {
    xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
    id v20 = v19;
    if (v19)
    {
      xpc_dictionary_set_int64(v19, "__xpc__event_code__", 4);
      if (v15) {
        IMInsertNSStringsToXPCDictionary(v20, "category", v21, v22, v23, v24, v25, v26, (uint64_t)v15);
      }
      if (v16) {
        IMInsertNSStringsToXPCDictionary(v20, "callInfo", v21, v22, v23, v24, v25, v26, (uint64_t)v16);
      }
      if (v17) {
        IMInsertNSStringsToXPCDictionary(v20, "session", v21, v22, v23, v24, v25, v26, (uint64_t)v17);
      }
      if (v18) {
        IMInsertNSStringsToXPCDictionary(v20, "sender", v21, v22, v23, v24, v25, v26, (uint64_t)v18);
      }
      if (v14)
      {
        if (!v13)
        {
          xpc_object_t v13 = MEMORY[0x1E4F14428];
          id v27 = MEMORY[0x1E4F14428];
        }
        xpc_connection_send_message_with_reply(connection, v20, v13, v14);
      }
      else
      {
        xpc_connection_send_message(connection, v20);
      }
    }
  }
}

void sub_1918DC26C(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  connection = a1;
  xpc_object_t v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (connection)
  {
    xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
    id v20 = v19;
    if (v19)
    {
      xpc_dictionary_set_int64(v19, "__xpc__event_code__", 5);
      if (v15) {
        IMInsertNSStringsToXPCDictionary(v20, "description", v21, v22, v23, v24, v25, v26, (uint64_t)v15);
      }
      if (v16) {
        IMInsertNSStringsToXPCDictionary(v20, "logString", v21, v22, v23, v24, v25, v26, (uint64_t)v16);
      }
      if (v17) {
        IMInsertNSStringsToXPCDictionary(v20, "session", v21, v22, v23, v24, v25, v26, (uint64_t)v17);
      }
      if (v18) {
        IMInsertNSStringsToXPCDictionary(v20, "sender", v21, v22, v23, v24, v25, v26, (uint64_t)v18);
      }
      if (v14)
      {
        if (!v13)
        {
          xpc_object_t v13 = MEMORY[0x1E4F14428];
          id v27 = MEMORY[0x1E4F14428];
        }
        xpc_connection_send_message_with_reply(connection, v20, v13, v14);
      }
      else
      {
        xpc_connection_send_message(connection, v20);
      }
    }
  }
}

void sub_1918DC3F4(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  connection = a1;
  xpc_object_t v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (connection)
  {
    xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
    id v20 = v19;
    if (v19)
    {
      xpc_dictionary_set_int64(v19, "__xpc__event_code__", 6);
      if (v15) {
        IMInsertNSStringsToXPCDictionary(v20, "description", v21, v22, v23, v24, v25, v26, (uint64_t)v15);
      }
      if (v16) {
        IMInsertCodableObjectsToXPCDictionary(v20, "number", v21, v22, v23, v24, v25, v26, (uint64_t)v16);
      }
      if (v17) {
        IMInsertNSStringsToXPCDictionary(v20, "session", v21, v22, v23, v24, v25, v26, (uint64_t)v17);
      }
      if (v18) {
        IMInsertNSStringsToXPCDictionary(v20, "sender", v21, v22, v23, v24, v25, v26, (uint64_t)v18);
      }
      if (v14)
      {
        if (!v13)
        {
          xpc_object_t v13 = MEMORY[0x1E4F14428];
          id v27 = MEMORY[0x1E4F14428];
        }
        xpc_connection_send_message_with_reply(connection, v20, v13, v14);
      }
      else
      {
        xpc_connection_send_message(connection, v20);
      }
    }
  }
}

void sub_1918DC57C(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  connection = a1;
  timespec v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (connection)
  {
    xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
    id v14 = v13;
    if (v13)
    {
      xpc_dictionary_set_int64(v13, "__xpc__event_code__", 7);
      if (v11) {
        IMInsertNSStringsToXPCDictionary(v14, "session", v15, v16, v17, v18, v19, v20, (uint64_t)v11);
      }
      if (v12) {
        IMInsertNSStringsToXPCDictionary(v14, "sender", v15, v16, v17, v18, v19, v20, (uint64_t)v12);
      }
      if (v10)
      {
        if (!v9)
        {
          timespec v9 = MEMORY[0x1E4F14428];
          id v21 = MEMORY[0x1E4F14428];
        }
        xpc_connection_send_message_with_reply(connection, v14, v9, v10);
      }
      else
      {
        xpc_connection_send_message(connection, v14);
      }
    }
  }
}

void sub_1918DC6AC(void *a1, void *a2, void *a3, int64_t a4, void *a5, void *a6)
{
  connection = a1;
  id v11 = a2;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (connection)
  {
    xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
    uint64_t v16 = v15;
    if (v15)
    {
      xpc_dictionary_set_int64(v15, "__xpc__event_code__", 8);
      if (a4) {
        xpc_dictionary_set_int64(v16, "action", a4);
      }
      if (v13) {
        IMInsertNSStringsToXPCDictionary(v16, "session", v17, v18, v19, v20, v21, v22, (uint64_t)v13);
      }
      if (v14) {
        IMInsertNSStringsToXPCDictionary(v16, "sender", v17, v18, v19, v20, v21, v22, (uint64_t)v14);
      }
      if (v12)
      {
        if (!v11)
        {
          id v11 = MEMORY[0x1E4F14428];
          id v23 = MEMORY[0x1E4F14428];
        }
        xpc_connection_send_message_with_reply(connection, v16, v11, v12);
      }
      else
      {
        xpc_connection_send_message(connection, v16);
      }
    }
  }
}

void sub_1918DC7F8(void *a1, void *a2, void *a3, int64_t a4, void *a5, void *a6, void *a7)
{
  connection = a1;
  id v13 = a2;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (connection)
  {
    xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
    uint64_t v19 = v18;
    if (v18)
    {
      xpc_dictionary_set_int64(v18, "__xpc__event_code__", 9);
      if (a4) {
        xpc_dictionary_set_int64(v19, "action", a4);
      }
      if (v15) {
        IMInsertNSStringsToXPCDictionary(v19, "session", v20, v21, v22, v23, v24, v25, (uint64_t)v15);
      }
      if (v16) {
        IMInsertNSStringsToXPCDictionary(v19, "sender", v20, v21, v22, v23, v24, v25, (uint64_t)v16);
      }
      if (v17) {
        IMInsertDictionariesToXPCDictionary(v19, "userInfo", v20, v21, v22, v23, v24, v25, (uint64_t)v17);
      }
      if (v14)
      {
        if (!v13)
        {
          id v13 = MEMORY[0x1E4F14428];
          id v26 = MEMORY[0x1E4F14428];
        }
        xpc_connection_send_message_with_reply(connection, v19, v13, v14);
      }
      else
      {
        xpc_connection_send_message(connection, v19);
      }
    }
  }
}

void sub_1918DC974(void *a1, void *a2, void *a3, int64_t a4, void *a5, void *a6)
{
  connection = a1;
  id v11 = a2;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (connection)
  {
    xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
    id v16 = v15;
    if (v15)
    {
      xpc_dictionary_set_int64(v15, "__xpc__event_code__", 10);
      if (a4) {
        xpc_dictionary_set_int64(v16, "event", a4);
      }
      if (v13) {
        IMInsertNSStringsToXPCDictionary(v16, "session", v17, v18, v19, v20, v21, v22, (uint64_t)v13);
      }
      if (v14) {
        IMInsertNSStringsToXPCDictionary(v16, "sender", v17, v18, v19, v20, v21, v22, (uint64_t)v14);
      }
      if (v12)
      {
        if (!v11)
        {
          id v11 = MEMORY[0x1E4F14428];
          id v23 = MEMORY[0x1E4F14428];
        }
        xpc_connection_send_message_with_reply(connection, v16, v11, v12);
      }
      else
      {
        xpc_connection_send_message(connection, v16);
      }
    }
  }
}

void sub_1918DCAC0(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  connection = a1;
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (connection)
  {
    xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
    uint64_t v17 = v16;
    if (v16)
    {
      xpc_dictionary_set_int64(v16, "__xpc__event_code__", 13);
      if (v13) {
        IMInsertNSStringsToXPCDictionary(v17, "failureReason", v18, v19, v20, v21, v22, v23, (uint64_t)v13);
      }
      if (v14) {
        IMInsertNSStringsToXPCDictionary(v17, "session", v18, v19, v20, v21, v22, v23, (uint64_t)v14);
      }
      if (v15) {
        IMInsertNSStringsToXPCDictionary(v17, "sender", v18, v19, v20, v21, v22, v23, (uint64_t)v15);
      }
      if (v12)
      {
        if (!v11)
        {
          id v11 = MEMORY[0x1E4F14428];
          id v24 = MEMORY[0x1E4F14428];
        }
        xpc_connection_send_message_with_reply(connection, v17, v11, v12);
      }
      else
      {
        xpc_connection_send_message(connection, v17);
      }
    }
  }
}

void sub_1918DCC18(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  connection = a1;
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (connection)
  {
    xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
    uint64_t v17 = v16;
    if (v16)
    {
      xpc_dictionary_set_int64(v16, "__xpc__event_code__", 11);
      if (v13) {
        IMInsertNSStringsToXPCDictionary(v17, "initiator", v18, v19, v20, v21, v22, v23, (uint64_t)v13);
      }
      if (v14) {
        IMInsertNSStringsToXPCDictionary(v17, "session", v18, v19, v20, v21, v22, v23, (uint64_t)v14);
      }
      if (v15) {
        IMInsertNSStringsToXPCDictionary(v17, "sender", v18, v19, v20, v21, v22, v23, (uint64_t)v15);
      }
      if (v12)
      {
        if (!v11)
        {
          id v11 = MEMORY[0x1E4F14428];
          id v24 = MEMORY[0x1E4F14428];
        }
        xpc_connection_send_message_with_reply(connection, v17, v11, v12);
      }
      else
      {
        xpc_connection_send_message(connection, v17);
      }
    }
  }
}

void sub_1918DCD70(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  connection = a1;
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (connection)
  {
    xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
    uint64_t v17 = v16;
    if (v16)
    {
      xpc_dictionary_set_int64(v16, "__xpc__event_code__", 12);
      if (v13) {
        IMInsertNSStringsToXPCDictionary(v17, "receiver", v18, v19, v20, v21, v22, v23, (uint64_t)v13);
      }
      if (v14) {
        IMInsertNSStringsToXPCDictionary(v17, "session", v18, v19, v20, v21, v22, v23, (uint64_t)v14);
      }
      if (v15) {
        IMInsertNSStringsToXPCDictionary(v17, "sender", v18, v19, v20, v21, v22, v23, (uint64_t)v15);
      }
      if (v12)
      {
        if (!v11)
        {
          id v11 = MEMORY[0x1E4F14428];
          id v24 = MEMORY[0x1E4F14428];
        }
        xpc_connection_send_message_with_reply(connection, v17, v11, v12);
      }
      else
      {
        xpc_connection_send_message(connection, v17);
      }
    }
  }
}

void sub_1918DCEC8(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  connection = a1;
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (connection)
  {
    xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
    uint64_t v20 = v19;
    if (v19)
    {
      xpc_dictionary_set_int64(v19, "__xpc__event_code__", 14);
      if (v15) {
        IMInsertNSStringsToXPCDictionary(v20, "session", v21, v22, v23, v24, v25, v26, (uint64_t)v15);
      }
      if (v16) {
        IMInsertNSStringsToXPCDictionary(v20, "sender", v21, v22, v23, v24, v25, v26, (uint64_t)v16);
      }
      if (v17) {
        IMInsertNSStringsToXPCDictionary(v20, "category", v21, v22, v23, v24, v25, v26, (uint64_t)v17);
      }
      if (v18) {
        IMInsertNSStringsToXPCDictionary(v20, "path", v21, v22, v23, v24, v25, v26, (uint64_t)v18);
      }
      if (v14)
      {
        if (!v13)
        {
          id v13 = MEMORY[0x1E4F14428];
          id v27 = MEMORY[0x1E4F14428];
        }
        xpc_connection_send_message_with_reply(connection, v20, v13, v14);
      }
      else
      {
        xpc_connection_send_message(connection, v20);
      }
    }
  }
}

void sub_1918DD050(void *a1, void *a2, void *a3, void *a4, void *a5, int a6, uint64_t a7, void *a8, void *a9)
{
  connection = a1;
  id v16 = a2;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a8;
  id v21 = a9;
  if (connection)
  {
    xpc_object_t v22 = xpc_dictionary_create(0, 0, 0);
    uint64_t v23 = v22;
    if (v22)
    {
      xpc_dictionary_set_int64(v22, "__xpc__event_code__", 15);
      if (a7) {
        xpc_dictionary_set_uint64(v23, "time", a7);
      }
      if (v18) {
        IMInsertNSStringsToXPCDictionary(v23, "type", v24, v25, v26, v27, v28, v29, (uint64_t)v18);
      }
      if (v19) {
        IMInsertNSStringsToXPCDictionary(v23, "logString", v24, v25, v26, v27, v28, v29, (uint64_t)v19);
      }
      if (a6) {
        xpc_dictionary_set_int64(v23, "level", a6);
      }
      if (v20) {
        IMInsertNSStringsToXPCDictionary(v23, "category", v24, v25, v26, v27, v28, v29, (uint64_t)v20);
      }
      if (v21) {
        IMInsertNSStringsToXPCDictionary(v23, "sender", v24, v25, v26, v27, v28, v29, (uint64_t)v21);
      }
      if (v17)
      {
        if (!v16)
        {
          id v16 = MEMORY[0x1E4F14428];
          id v30 = MEMORY[0x1E4F14428];
        }
        xpc_connection_send_message_with_reply(connection, v23, v16, v17);
      }
      else
      {
        xpc_connection_send_notification();
      }
    }
  }
}

void sub_1918DD218(void *a1, void *a2, void *a3, void *a4, void *a5, int a6, uint64_t a7, void *a8, void *a9)
{
  connection = a1;
  id v16 = a2;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a8;
  id v21 = a9;
  if (connection)
  {
    xpc_object_t v22 = xpc_dictionary_create(0, 0, 0);
    uint64_t v23 = v22;
    if (v22)
    {
      xpc_dictionary_set_int64(v22, "__xpc__event_code__", 16);
      if (a7) {
        xpc_dictionary_set_uint64(v23, "time", a7);
      }
      if (v18) {
        IMInsertNSStringsToXPCDictionary(v23, "type", v24, v25, v26, v27, v28, v29, (uint64_t)v18);
      }
      if (v19) {
        IMInsertNSStringsToXPCDictionary(v23, "eventString", v24, v25, v26, v27, v28, v29, (uint64_t)v19);
      }
      if (a6) {
        xpc_dictionary_set_int64(v23, "level", a6);
      }
      if (v20) {
        IMInsertNSStringsToXPCDictionary(v23, "category", v24, v25, v26, v27, v28, v29, (uint64_t)v20);
      }
      if (v21) {
        IMInsertNSStringsToXPCDictionary(v23, "sender", v24, v25, v26, v27, v28, v29, (uint64_t)v21);
      }
      if (v17)
      {
        if (!v16)
        {
          id v16 = MEMORY[0x1E4F14428];
          id v30 = MEMORY[0x1E4F14428];
        }
        xpc_connection_send_message_with_reply(connection, v23, v16, v17);
      }
      else
      {
        xpc_connection_send_message(connection, v23);
      }
    }
  }
}

uint64_t _IMLoggingBeginSession()
{
  return 0;
}

uint64_t _IMLoggingEndSession()
{
  return 0;
}

uint64_t _IMLoggingAddCallMetric()
{
  return 0;
}

uint64_t _IMLoggingAddCallMetric_Double()
{
  return 0;
}

uint64_t _IMLoggingAddCallMetric_Float()
{
  return 0;
}

uint64_t _IMLoggingAddCallMetric_Int()
{
  return 0;
}

uint64_t _IMLoggingAddCallMetric_Short()
{
  return 0;
}

uint64_t _IMLoggingNoteQuality_V()
{
  return 0;
}

uint64_t _IMLoggingNoteQuality()
{
  return 0;
}

uint64_t _IMLoggingLogCallInfo()
{
  return 0;
}

uint64_t _IMLoggingNoteCheckpoint_V()
{
  return 0;
}

uint64_t _IMLoggingNoteCheckpoint()
{
  return 0;
}

uint64_t _IMLoggingLog_V()
{
  return 0;
}

uint64_t _IMLoggingLog()
{
  return 0;
}

uint64_t _IMLoggingPulse()
{
  return 0;
}

uint64_t _IMLoggingEvent()
{
  return 0;
}

uint64_t _IMLoggingAction()
{
  return 0;
}

uint64_t _IMLoggingActionWithUserInfo()
{
  return 0;
}

uint64_t _IMLoggingSetInitiator()
{
  return 0;
}

uint64_t _IMLoggingSetFailureReason()
{
  return 0;
}

uint64_t _IMLoggingSetRecipient()
{
  return 0;
}

uint64_t _IMLoggingAddLogFile()
{
  return 0;
}

double sub_1918DD538(uint64_t a1)
{
  v7.tv_seCC_SHA256_CTX c = 0;
  *(void *)&v7.tv_useCC_SHA256_CTX c = 0;
  gettimeofday(&v7, 0);
  int v2 = *(_DWORD *)(a1 + 8);
  int v4 = v7.tv_usec - v2;
  BOOL v3 = v7.tv_usec < v2;
  int v5 = v7.tv_usec - v2 + 1000000;
  if (!v3) {
    int v5 = v4;
  }
  return (double)v5 / 1000000.0 + (double)(v7.tv_sec - *(void *)a1 + (v4 >> 31));
}

uint64_t IMPerformPingTest(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a1;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  id v12 = [IMPingTest alloc];
  id v14 = objc_msgSend_initWithAddress_wifi_(v12, v13, (uint64_t)v10, a3);

  double v15 = (double)a2;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1918DD7B4;
  v24[3] = &unk_1E5724748;
  dispatch_semaphore_t v25 = v11;
  id v26 = v14;
  id v27 = v9;
  id v16 = v9;
  id v17 = v14;
  id v18 = v11;
  objc_msgSend_startWithTimeout_queue_completionHandler_(v17, v19, 0, (uint64_t)v24, v15);
  dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend_pingStats(v17, v20, v21, v22);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

  return 1;
}

void sub_1918DD7B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  objc_msgSend_writeResultsToFile_error_(*(void **)(a1 + 40), v10, *(void *)(a1 + 48), 0);
  if (_IMWillLog(@"IMPingTest"))
  {
    _IMAlwaysLog(0, @"IMPingTest", @"completion handler", v11, v12, v13, v14, v15, a9);
  }
}

void sub_1918DDC9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1918DDCB8()
{
  v6.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v0 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v0 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v6.tm_mon = v0;
  *(_OWORD *)&v6.tm_isdst = v0;
  *(_OWORD *)&v6.tm_seCC_SHA256_CTX c = v0;
  v5.tv_seCC_SHA256_CTX c = 0;
  *(void *)&v5.tv_useCC_SHA256_CTX c = 0;
  gettimeofday(&v5, 0);
  localtime_r(&v5.tv_sec, &v6);
  BOOL v3 = objc_msgSend_stringWithFormat_(NSString, v1, @"%02d:%02d:%02d.%06d", v2, v6.tm_hour, v6.tm_min, v6.tm_sec, v5.tv_usec);
  return v3;
}

void sub_1918DDE44(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1918DE044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_1918DE208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_1918DE3EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1918DE4A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1918DE6D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1918DE77C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  objc_msgSend_rtt(a2, v5, v6, v7);
  double v9 = v8;
  objc_msgSend_rtt(v4, v10, v11, v12);
  double v14 = v13;

  if (v9 <= v14) {
    return 1;
  }
  else {
    return -1;
  }
}

void sub_1918DEC18(uint64_t a1, const char *a2)
{
  if (*(unsigned char *)(a1 + 64))
  {
    id v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    int v5 = objc_msgSend__setupAndPerformPing_queue_completionHandler_(*(void **)(a1 + 32), v4, *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 56));
    objc_sync_exit(v3);

    if (!v5) {
      return;
    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v6, IMPingTestErrorDomain, 2, 0);
  }
  else
  {
    if (!*(void *)(a1 + 48)) {
      return;
    }
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], a2, IMPingTestErrorDomain, 1, 0);
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_1918DED0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1918DF31C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1918DF340(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (IMTimeOfDay() - *(double *)(a1 + 56) < *(double *)(a1 + 64))
  {
    if (!*(unsigned char *)(*(void *)(a1 + 32) + 32)) {
      return;
    }
    unsigned int v5 = *(__int16 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    int v6 = *(_DWORD *)(a1 + 96);
    unsigned int v7 = *(unsigned __int16 *)(a1 + 100);
    sockaddr v28 = *(sockaddr *)(a1 + 80);
    uint16x8_t v25 = 0u;
    uint16x8_t v26 = 0u;
    v24.tv_seCC_SHA256_CTX c = 0;
    *(void *)&v24.tv_useCC_SHA256_CTX c = 0;
    gettimeofday(&v24, 0);
    v25.i16[0] = 8;
    v25.i16[3] = bswap32(v5) >> 16;
    v25.i16[2] = bswap32(v7) >> 16;
    timeval v27 = v24;
    if (!gettimeofday(&v27, 0))
    {
      unsigned int v15 = vaddvq_s32(vaddq_s32((int32x4_t)vaddw_u16(vaddl_u16(*(uint16x4_t *)v25.i8, *(uint16x4_t *)v26.i8), (uint16x4_t)v27.tv_sec), (int32x4_t)vaddw_high_u16(vaddl_high_u16(v25, v26), (uint16x8_t)v27)));
      v25.i16[1] = ~(HIWORD(v15) + v15 + ((HIWORD(v15) + (unsigned __int16)v15) >> 16));
      ssize_t v16 = sendto(v6, &v25, 0x30uLL, 0, &v28, 0x10u);
      uint64_t v17 = 0;
      if (v16 == 48) {
        goto LABEL_13;
      }
      if (_IMWillLog(@"IMPingTest"))
      {
        id v18 = __error();
        _IMAlwaysLog(0, @"IMPingTest", @"Error(%d) sending sequence %d", v19, v20, v21, v22, v23, *v18);
      }
    }
    if (*__error())
    {
      uint64_t v9 = *__error();
      objc_msgSend_addEchoPacket_packetTimestamp_error_(*(void **)(a1 + 40), v10, *(__int16 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v24.tv_sec, *(void *)&v24.tv_usec, v9);
LABEL_14:
      objc_msgSend_timeoutOldSequenceNumbers_(*(void **)(a1 + 40), v11, v12, v13, *(double *)(a1 + 72));
      ++*(_WORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      return;
    }
    uint64_t v17 = 1;
LABEL_13:
    objc_msgSend_addEchoPacket_packetTimestamp_error_(*(void **)(a1 + 40), v8, *(__int16 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v24.tv_sec, *(void *)&v24.tv_usec, v17);
    goto LABEL_14;
  }
  double v14 = *(void **)(a1 + 32);
  objc_msgSend_stop(v14, v2, v3, v4);
}

void sub_1918DF6D4(uint64_t a1)
{
  close(*(_DWORD *)(a1 + 48));
  objc_msgSend_pingStats(*(void **)(*(void *)(a1 + 32) + 24), v2, v3, v4);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    BOOL v9 = (int)objc_msgSend_packetsSuccessfullySent(v11, v5, v6, v7) > 0;
    (*(void (**)(uint64_t, id, BOOL, void))(v8 + 16))(v8, v11, v9, 0);
  }
  id v10 = *(id *)(a1 + 32);
  objc_sync_enter(v10);
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  objc_sync_exit(v10);
}

void sub_1918DF780(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 32))
  {
    int v2 = *(_DWORD *)(a1 + 40);
    unsigned int v3 = *(unsigned __int16 *)(a1 + 60);
    id v4 = *(id *)(v1 + 24);
    unsigned int v5 = bswap32(v3) >> 16;
    while (1)
    {
      memset(__b, 170, sizeof(__b));
      *(void *)&v13.sa_len = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&v13.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
      socklen_t v12 = 16;
      ssize_t v6 = recvfrom(v2, __b, 0x800uLL, 0, &v13, &v12);
      int v9 = v6;
      if (v6 < 0)
      {
        if (*__error()) {
          break;
        }
      }
      uint64_t v10 = 4 * (__b[0] & 0xF);
      if (((v9 - v10) & 0xFFFFFFF0) >= 0x30uLL)
      {
        id v11 = &__b[v10];
        if (!*v11 && *((unsigned __int16 *)v11 + 2) == v5) {
          objc_msgSend_addEchoReplyPacket_(v4, v7, bswap32(*((unsigned __int16 *)v11 + 3)) >> 16, v8);
        }
      }
    }
  }
}

uint64_t sub_1918DF974()
{
  qword_1EB273C70 = objc_alloc_init(OSLogHandleManager);
  return MEMORY[0x1F41817F8]();
}

id OSLogHandleForIMFoundationCategory(const void *a1)
{
  return sub_191897C14(a1, qword_1EB273A28, "com.apple.Messages");
}

id OSLogHandleForIMEventCategory(const void *a1)
{
  return sub_191897C14(a1, qword_1EB273900, "com.apple.MessagesEvents");
}

id OSLogHandleForFaceTimeCategory(const void *a1)
{
  return sub_191897C14(a1, qword_1E92DB938, "com.apple.FaceTime");
}

id OSLogHandleForRegistrationCategory(const void *a1)
{
  return sub_191897C14(a1, qword_1EB273868, "com.apple.Registration");
}

id OSLogHandleForPDSCategory(const void *a1)
{
  return sub_191897C14(a1, qword_1EB273868, "com.apple.PDS");
}

void sub_1918E00D8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v12, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v9);
  }
}

void sub_1918E02C0(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  if (objc_msgSend_count(a3, v5, v6, v7)) {
    objc_msgSend_addObject_(*(void **)(a1 + 32), v8, (uint64_t)v10, v9);
  }
}

uint64_t (*sub_1918E04F0())(void, void, void, void)
{
  uint64_t result = (uint64_t (*)(void, void, void, void))IMWeakLinkSymbol();
  off_1E92DB988 = result;
  return result;
}

uint64_t (*sub_1918E0520())(void, void, void, void, void, void, void, double)
{
  uint64_t result = (uint64_t (*)(void, void, void, void, void, void, void, double))IMWeakLinkSymbol();
  off_1E92DB028 = result;
  return result;
}

uint64_t (*sub_1918E0824())(void, void)
{
  uint64_t result = (uint64_t (*)(void, void))IMWeakLinkSymbol();
  off_1E92DB998 = result;
  return result;
}

uint64_t (*sub_1918E092C())(void)
{
  uint64_t result = (uint64_t (*)(void))IMWeakLinkSymbol();
  off_1E92DB038 = result;
  return result;
}

void sub_1918E0AAC(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_191892000, a2, OS_LOG_TYPE_ERROR, "Dispatch registration invoked - missing handler {name: %s}", (uint8_t *)&v3, 0xCu);
}

void sub_1918E0B28(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *a2;
  int v5 = 136315394;
  uint64_t v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_191892000, log, OS_LOG_TYPE_ERROR, "Dispatch registration invoked - fetched state, missing handler {name: %s, state: %u}", (uint8_t *)&v5, 0x12u);
}

void sub_1918E0BB8()
{
  sub_1918AE774();
  sub_1918AE750(&dword_191892000, v0, v1, "Skipping photo sharing results for outgoing message", v2);
}

void sub_1918E0BF0(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 138412546;
  uint64_t v2 = 0;
  __int16 v3 = 2112;
  uint64_t v4 = @"NO";
  _os_log_error_impl(&dword_191892000, log, OS_LOG_TYPE_ERROR, "Failed to get photo sharing responses due to invalid preconditions. string: %@, isOutgoing: %@", (uint8_t *)&v1, 0x16u);
}

void sub_1918E0C80()
{
  sub_1918AE774();
  _os_log_error_impl(&dword_191892000, v0, OS_LOG_TYPE_ERROR, "Failed to get photo sharing responses. Timed out.", v1, 2u);
}

void sub_1918E0CC0()
{
  sub_1918AE774();
  sub_1918AE750(&dword_191892000, v0, v1, "Getting photo sharing results", v2);
}

void sub_1918E0CF8()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  sub_1918AE798();
  _os_log_error_impl(&dword_191892000, v0, OS_LOG_TYPE_ERROR, "Failed to add photo sharing results due to invalid preconditions. attributedString: %@, responses: %@", v1, 0x16u);
}

void sub_1918E0D70()
{
  sub_1918AE774();
  sub_1918AE750(&dword_191892000, v0, v1, "No photo sharing intent found", v2);
}

void sub_1918E0DA8(unsigned char *a1, unsigned char *a2)
{
  sub_1918AE740(a1, a2);
  _os_log_error_impl(&dword_191892000, v2, OS_LOG_TYPE_ERROR, "Mismatched count between photoKeywords and photoKeywordRanges!", v3, 2u);
}

void sub_1918E0DE0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1918AE724(&dword_191892000, a2, a3, " => Out attributed string: %@", a5, a6, a7, a8, 2u);
}

void sub_1918E0E50()
{
  sub_1918AE768();
  sub_1918AE724(&dword_191892000, v0, v1, "    Adding Photo Sharing Results: %@", v2, v3, v4, v5, v6);
}

void sub_1918E0EB8(unsigned char *a1, unsigned char *a2)
{
  sub_1918AE740(a1, a2);
  sub_1918AE750(&dword_191892000, v2, (uint64_t)v2, "Not adding to core recents, message is from me", v3);
}

void sub_1918E0EE8(unsigned char *a1, unsigned char *a2)
{
  sub_1918AE740(a1, a2);
  sub_1918AE750(&dword_191892000, v2, (uint64_t)v2, "Found an address category", v3);
}

void sub_1918E0F18(unsigned char *a1, unsigned char *a2)
{
  sub_1918AE740(a1, a2);
  sub_1918AE750(&dword_191892000, v2, (uint64_t)v2, "Result with money category was not handled", v3);
}

void sub_1918E0F48(unsigned char *a1, unsigned char *a2)
{
  sub_1918AE740(a1, a2);
  sub_1918AE750(&dword_191892000, v2, (uint64_t)v2, "Found a result with money category", v3);
}

void sub_1918E0F78()
{
  sub_1918AE768();
  sub_1918AE724(&dword_191892000, v0, v1, " => Results: %@", v2, v3, v4, v5, v6);
}

void sub_1918E0FE0()
{
  sub_1918AE768();
  sub_1918AE724(&dword_191892000, v0, v1, "    Final DD Results: %@", v2, v3, v4, v5, v6);
}

void sub_1918E1048()
{
  sub_1918AE768();
  sub_1918AE724(&dword_191892000, v0, v1, "    PhoneScannerResults: %@", v2, v3, v4, v5, v6);
}

void sub_1918E10B0()
{
  sub_1918AE768();
  sub_1918AE724(&dword_191892000, v0, v1, "       DDScannerResults: %@", v2, v3, v4, v5, v6);
}

void sub_1918E1118()
{
  sub_1918AE774();
  sub_1918AE750(&dword_191892000, v0, v1, " => Hit!", v2);
}

void sub_1918E1150()
{
  sub_1918AE774();
  sub_1918AE750(&dword_191892000, v0, v1, " => No hit", v2);
}

void sub_1918E1188()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  sub_1918AE780();
  __int16 v2 = 2112;
  uint64_t v3 = 0;
  _os_log_debug_impl(&dword_191892000, v0, OS_LOG_TYPE_DEBUG, "_DDScannerResultClass = %p, ddScannerResult = %p, keyedArchivedData = %@", v1, 0x20u);
}

void sub_1918E120C()
{
  sub_1918AE768();
  sub_1918AE724(&dword_191892000, v0, v1, "Found an address category %@", v2, v3, v4, v5, v6);
}

void sub_1918E1274()
{
  sub_1918AE768();
  sub_1918AE724(&dword_191892000, v0, v1, "Appended link attribute (%@)", v2, v3, v4, v5, v6);
}

void sub_1918E12DC()
{
  sub_1918AE780();
  sub_1918AE7B0(&dword_191892000, v0, v1, "* Found link result category %p, %p", v2, v3);
}

void sub_1918E1344()
{
  sub_1918AE798();
  sub_1918AE7B0(&dword_191892000, v0, v1, "Found one time code:%@(%@)");
}

void sub_1918E13AC()
{
  sub_1918AE768();
  sub_1918AE724(&dword_191892000, v0, v1, "Adding Events to core recent (event %@)", v2, v3, v4, v5, v6);
}

void sub_1918E1414()
{
  sub_1918AE768();
  sub_1918AE724(&dword_191892000, v0, v1, "CoreRecents metadata:%@", v2, v3, v4, v5, v6);
}

void sub_1918E147C()
{
  sub_1918AE768();
  sub_1918AE724(&dword_191892000, v0, v1, "recordContactEvents:recentsDomain:sendingAddress:completion: error %@", v2, v3, v4, v5, v6);
}

void sub_1918E14E4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_191892000, a2, OS_LOG_TYPE_FAULT, "Empty service query with account: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1918E155C(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_191892000, a2, OS_LOG_TYPE_FAULT, "Empty account query with service: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1918E15D4()
{
  sub_1918B5BDC();
  sub_1918B5BD0();
  sub_1918B5BB4(&dword_191892000, v0, v1, "IMSetKeychainPassword: Could not store password (error: %d)", v2, v3, v4, v5, v6);
}

void sub_1918E163C()
{
  sub_1918B5BDC();
  sub_1918B5BD0();
  sub_1918B5BB4(&dword_191892000, v0, v1, "IMRemoveKeychainPassword: Could not remove password (error %d)", v2, v3, v4, v5, v6);
}

void sub_1918E16A4()
{
  sub_1918B5BDC();
  sub_1918B5BD0();
  sub_1918B5BB4(&dword_191892000, v0, v1, "IMSetKeychainAuthToken: Could not store auth token (error %d)", v2, v3, v4, v5, v6);
}

void sub_1918E170C()
{
  sub_1918B5BDC();
  sub_1918B5BD0();
  sub_1918B5BB4(&dword_191892000, v0, v1, "IMRemoveKeychainAuthToken: Could not remove auth token (error %d)", v2, v3, v4, v5, v6);
}

void sub_1918E1774()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  sub_1918B5BD0();
  __int16 v5 = 2112;
  uint64_t v6 = v0;
  __int16 v7 = 2112;
  uint64_t v8 = v1;
  __int16 v9 = 2112;
  uint64_t v10 = v2;
  _os_log_fault_impl(&dword_191892000, v3, OS_LOG_TYPE_FAULT, "IMSetKeychainData: %d -- Could not perform synchronized store for service: %@   account: %@%@", v4, 0x26u);
}

void sub_1918E1818()
{
  sub_1918B5BDC();
  sub_1918B5BD0();
  sub_1918B5BB4(&dword_191892000, v0, v1, "IMSetKeychainPassword: Could not store temporary password (error: %d)", v2, v3, v4, v5, v6);
}

void sub_1918E1880(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_191892000, a2, OS_LOG_TYPE_ERROR, "Fatal Error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1918E18F8()
{
  __assert_rtn("-[IMLocalObject _enqueueInvocationWithPriority:xpcMessage:priority:]", "IMRemoteObjects.m", 1130, "[invocation selector] == @selector(sendMessageWithSendParameters:)");
}

void sub_1918E1924(void *a1, uint64_t a2, void *a3)
{
  objc_begin_catch(a1);
  if (qword_1EB273848 != -1) {
    dispatch_once(&qword_1EB273848, &unk_1EE230558);
  }
  uint64_t v4 = (void *)qword_1EB273840;
  *a3 = qword_1EB273840;
  id v5 = v4;
  objc_end_catch();
}

void sub_1918E1984(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_191892000, a2, OS_LOG_TYPE_ERROR, "IMRemoteObjectXPC Error - Exception caught unarchiving: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1918E19FC(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_191892000, a2, OS_LOG_TYPE_ERROR, "IMRemoteObjectXPC Error - Error caught unarchiving: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1918E1A74(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_191892000, a2, OS_LOG_TYPE_ERROR, "Called into MAEGetActivationStateWithError {value: %@}", (uint8_t *)&v2, 0xCu);
}

void sub_1918E1AEC(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_191892000, a2, OS_LOG_TYPE_ERROR, "Error calling into MAEGetActivationStateWithError {error: %@}", (uint8_t *)&v2, 0xCu);
}

void sub_1918E1B64(void *a1)
{
  objc_end_catch();
}

void sub_1918E1B88(void *a1)
{
  objc_end_catch();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9710](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9738](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9740](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9748](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9780](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFIndex CFArrayBSearchValues(CFArrayRef theArray, CFRange range, const void *value, CFComparatorFunction comparator, void *context)
{
  return MEMORY[0x1F40D7158](theArray, range.location, range.length, value, comparator, context);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7178](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7198](allocator, capacity, theArray);
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

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
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

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7490](locArray, prefArray);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
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

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D20]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x1F40D7EB8](applicationID, userName, hostName);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7EC0](keysToFetch, applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

Boolean CFPropertyListIsValid(CFPropertyListRef plist, CFPropertyListFormat format)
{
  return MEMORY[0x1F40D7F68](plist, format);
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

CFRunLoopMode CFRunLoopCopyCurrentMode(CFRunLoopRef rl)
{
  return (CFRunLoopMode)MEMORY[0x1F40D80A0](rl);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

Boolean CFRunLoopIsWaiting(CFRunLoopRef rl)
{
  return MEMORY[0x1F40D80D0](rl);
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
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

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x1F40D8200](allocator, values, numValues, callBacks);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

void CFStringAppendFormatAndArguments(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x1F40D8478](alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1F40D84C8](theString, stringToFind, compareOptions);
  result.size_t length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1F40D84D8](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1F40D8500](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1F40D8528](theString, idx);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1F40D8568](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1F40D8878](allocator, originalString, charactersToLeaveEscaped);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1F40D89A0](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1F40D8A20](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8A40](allocator, userNotification, callout, order);
}

CFDictionaryRef CFUserNotificationGetResponseDictionary(CFUserNotificationRef userNotification)
{
  return (CFDictionaryRef)MEMORY[0x1F40D8A58](userNotification);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1F40E8678](*(void *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x1F40E8778](notifier);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x1F40E9148](refcon, thePortRef, callback, notifier);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1F40E9240](*(void *)&connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1F412F958]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x1F40D8B10](typePtr, sizep, alignp);
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

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1F40E7298](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

CFDictionaryRef SCDynamicStoreCopyMultiple(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return (CFDictionaryRef)MEMORY[0x1F4101D98](store, keys, patterns);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1F4101DA8](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1F4101DB0](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkGlobalEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1F4101DD8](allocator, domain, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1F4101DE8](allocator, domain, ifname, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1F4101DF0](allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x1F4101E08](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x1F4101E18](store, keys, patterns);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1F4101EE8](allocator, address);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddressPair(CFAllocatorRef allocator, const sockaddr *localAddress, const sockaddr *remoteAddress)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1F4101EF0](allocator, localAddress, remoteAddress);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1F4101EF8](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1F4101F08](target, flags);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x1F4101F20](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x1F4101F28](target, queue);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DD8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1F40F6DE0](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1F40F6DE8](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1F40F6E20](query, attributesToUpdate);
}

uint64_t SecPolicyCreateAppleIDSServiceContext()
{
  return MEMORY[0x1F40F7000]();
}

OSStatus SecTrustEvaluateAsyncWithError(SecTrustRef trust, dispatch_queue_t queue, SecTrustWithErrorCallback result)
{
  return MEMORY[0x1F40F7200](trust, queue, result);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x1F40F7290](trust, policies);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
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

uint64_t _CFDictionaryIsMutable()
{
  return MEMORY[0x1F40D8D50]();
}

uint64_t _CFXPCCreateCFObjectFromXPCMessage()
{
  return MEMORY[0x1F40D9428]();
}

uint64_t _CFXPCCreateXPCMessageWithCFObject()
{
  return MEMORY[0x1F40D9440]();
}

uint64_t _CTServerConnectionCreateWithIdentifier()
{
  return MEMORY[0x1F40DF0E0]();
}

uint64_t _CTServerConnectionGetCellularDataIsEnabled()
{
  return MEMORY[0x1F40DF128]();
}

uint64_t _CTServerConnectionIsPhoneNumberCredentialValid()
{
  return MEMORY[0x1F40DF1A8]();
}

uint64_t _CTServerConnectionIsUserIdentityModuleRequired()
{
  return MEMORY[0x1F40DF1B0]();
}

uint64_t _CTServerConnectionPacketContextAssertionCreate()
{
  return MEMORY[0x1F40DF1C0]();
}

uint64_t _CTServerConnectionSetTargetQueue()
{
  return MEMORY[0x1F40DF218]();
}

uint64_t _NSNewStringByAppendingStrings()
{
  return MEMORY[0x1F40E73A0]();
}

uint64_t _SecItemAddAndNotifyOnSync()
{
  return MEMORY[0x1F40F7330]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

uint64_t _protocol_getMethodTypeEncoding()
{
  return MEMORY[0x1F41814B8]();
}

void abort(void)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void asl_close(asl_object_t obj)
{
}

void asl_free(asl_object_t obj)
{
}

asl_object_t asl_new(uint32_t type)
{
  return (asl_object_t)MEMORY[0x1F40CA410](*(void *)&type);
}

asl_object_t asl_open(const char *ident, const char *facility, uint32_t opts)
{
  return (asl_object_t)MEMORY[0x1F40CA418](ident, facility, *(void *)&opts);
}

int asl_send(asl_object_t obj, asl_object_t msg)
{
  return MEMORY[0x1F40CA420](obj, msg);
}

int asl_set(asl_object_t obj, const char *key, const char *value)
{
  return MEMORY[0x1F40CA428](obj, key, value);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1F40CA4F8](a1, *(void *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1F40CA508](a1, *(void *)&a2);
}

void bzero(void *a1, size_t a2)
{
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1F41814F8](cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181518](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181528](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1F4181548](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1F4181558](cls);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C8](flags, *(void *)&qos_class, *(void *)&relative_priority, block);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
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

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1F40CBD40](when, delta);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1F40CBDA0](a1, a2);
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

hostent *__cdecl gethostbyname(const char *a1)
{
  return (hostent *)MEMORY[0x1F40CC3F8](a1);
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return MEMORY[0x1F40CC408](a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

protoent *__cdecl getprotobyname(const char *a1)
{
  return (protoent *)MEMORY[0x1F40CC4C8](a1);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1F40CC4E8](*(void *)&a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CC568](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x1F40CC650](a1);
}

in_addr_t inet_addr(const char *a1)
{
  return MEMORY[0x1F40CC660](a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1F40CC678](*(void *)&a1, a2, a3, *(void *)&a4);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182CB0](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182CB8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1F4182CC8](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40CC700]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC870](a1, a2);
}

uint64_t lockdown_copy_activationState()
{
  return MEMORY[0x1F4180938]();
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void method_exchangeImplementations(Method m1, Method m2)
{
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1F41815F8](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x1F4181600](m);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
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

int objc_getClassList(Class *buffer, int bufferCount)
{
  return MEMORY[0x1F4181730](buffer, *(void *)&bufferCount);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1F40CD570]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1F40CD610]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1F40CD628]();
}

uint64_t os_variant_has_factory_content()
{
  return MEMORY[0x1F40CD640]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1F40CD658]();
}

int pclose(FILE *a1)
{
  return MEMORY[0x1F40CD740](a1);
}

FILE *__cdecl popen(const char *a1, const char *a2)
{
  return (FILE *)MEMORY[0x1F40CD780](a1, a2);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40CD888](*(void *)&pid, buffer, *(void *)&buffersize);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1F4181AE8](p, isRequiredMethod, isInstanceMethod, outCount);
}

Protocol **__cdecl protocol_copyProtocolList(Protocol *proto, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x1F4181B00](proto, outCount);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  CFIndex v4 = (const char *)MEMORY[0x1F4181B08](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x1F4181B10](p);
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return MEMORY[0x1F40CDA18](a1, a2, a3);
}

int pthread_main_np(void)
{
  return MEMORY[0x1F40CDA68]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return MEMORY[0x1F40CDB68](a1, *(void *)&a2, a3);
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1F40CDBD8]();
}

uint64_t random(void)
{
  return MEMORY[0x1F40CDC18]();
}

ssize_t recvfrom(int a1, void *a2, size_t a3, int a4, sockaddr *a5, socklen_t *a6)
{
  return MEMORY[0x1F40CDCC0](*(void *)&a1, a2, a3, *(void *)&a4, a5, a6);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

BOOL sel_isEqual(SEL lhs, SEL rhs)
{
  return MEMORY[0x1F4181B38](lhs, rhs);
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x1F4181B48](str);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return MEMORY[0x1F40CDF48](*(void *)&a1, a2, a3, *(void *)&a4, a5, *(void *)&a6);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1F40CDFC0](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1F40CE090](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

void srandom(unsigned int a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1F40CE198](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

int32_t u_charDigitValue(UChar32 c)
{
  return MEMORY[0x1F417F6F8](*(void *)&c);
}

void uuid_generate(uuid_t out)
{
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

uint64_t voucher_adopt()
{
  return MEMORY[0x1F40CE708]();
}

uint64_t voucher_copy()
{
  return MEMORY[0x1F40CE710]();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBA8](name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

uint64_t xpc_connection_enable_sim2host_4sim()
{
  return MEMORY[0x1F40CEBD8]();
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return (void *)MEMORY[0x1F40CEBF8](connection);
}

const char *__cdecl xpc_connection_get_name(xpc_connection_t connection)
{
  return (const char *)MEMORY[0x1F40CEC18](connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1F40CEC20](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

uint64_t xpc_connection_send_notification()
{
  return MEMORY[0x1F40CEC70]();
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

int xpc_fd_dup(xpc_object_t xfd)
{
  return MEMORY[0x1F40CF0D0](xfd);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CF248](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}