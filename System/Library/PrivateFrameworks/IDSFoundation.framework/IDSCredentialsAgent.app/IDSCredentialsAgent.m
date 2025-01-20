void sub_100003260(id a1)
{
  uint64_t vars8;

  qword_1000157E8 = objc_alloc_init(IDSCredentialsDaemonIDSInterface);
  _objc_release_x1();
}

uint64_t sub_10000359C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100003790(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100003A6C(uint64_t a1)
{
  v2 = +[IMRGLog NRPairing];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    sub_10000A538(v2);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100003E28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000041A4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100005440(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = [a2 objectForKey:v5];
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
  }
  else
  {
    if (v6)
    {
      v8 = +[IMRGLog registration];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        sub_10000A5BC((uint64_t)v5, a1, v8);
      }
    }
    id v7 = 0;
  }

  return v7;
}

void sub_100005A64(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), IDSRemoteCredentialKeyAccountMap, v3);
  }
  v4 = +[IMRGLog registration];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FetchRA - Sending my device AccountInfo For services requested: %@", (uint8_t *)&v6, 0xCu);
  }

  if (([*(id *)(a1 + 40) _storeIDSMessageForLaterDeliveryIfNecessary:*(void *)(a1 + 32) completionBlock:0 isPairing:0] & 1) == 0)objc_msgSend(*(id *)(a1 + 40), "_sendIDSMessage:", *(void *)(a1 + 32)); {
}
  }

void sub_100005EA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    value = [v3 objectForKey:IDSDevicePropertyIdentifier];
    v15 = [v4 objectForKey:IDSDevicePropertyEncryptionKey];
    uint64_t v5 = [v4 objectForKey:IDSDevicePropertyEncryptionClassAKey];
    int v6 = [v4 objectForKey:IDSDevicePropertyEncryptionClassCKey];
    uint64_t v7 = [v4 objectForKey:IDSDevicePropertyPrivateDeviceData];
    v8 = [v4 objectForKey:IDSDevicePropertyName];
    v9 = [v4 objectForKey:IDSDevicePropertyHardwareVersion];
    uint64_t v10 = objc_opt_class();
    v11 = (const void *)IDSRemoteCredentialKeyUniqueID;
    v12 = sub_100005440(v10, *(void **)(a1 + 32), IDSRemoteCredentialKeyUniqueID);
    v13 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    CFDictionarySetValue(v13, IDSRemoteCredentialKeyCommand, &off_1000112F0);
    if (v12) {
      CFDictionarySetValue(v13, v11, v12);
    }
    if (value) {
      CFDictionarySetValue(v13, IDSRemoteCredentialKeyIdentifier, value);
    }
    if (v15) {
      CFDictionarySetValue(v13, IDSRemoteCredentialKeyEncryptionKey, v15);
    }
    if (v5) {
      CFDictionarySetValue(v13, IDSRemoteCredentialKeyEncryptionClassAKey, v5);
    }
    if (v6) {
      CFDictionarySetValue(v13, IDSRemoteCredentialKeyEncryptionClassCKey, v6);
    }
    CFDictionarySetValue(v13, IDSRemoteCredentialKeySuccess, &__kCFBooleanTrue);
    if (v7) {
      CFDictionarySetValue(v13, IDSRemoteCredentialKeyPrivateDeviceData, v7);
    }
    if (v8) {
      CFDictionarySetValue(v13, IDSRemoteCredentialKeyDeviceName, v8);
    }
    if (v9) {
      CFDictionarySetValue(v13, IDSRemoteCredentialKeyHardwareVersion, v9);
    }
    v14 = +[IMRGLog NRPairing];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Sending my device info: %@", buf, 0xCu);
    }

    if (([*(id *)(a1 + 40) _storeIDSMessageForLaterDeliveryIfNecessary:v13 completionBlock:0 isPairing:1] & 1) == 0)objc_msgSend(*(id *)(a1 + 40), "_sendIDSPairingMessage:", v13); {
  }
    }
}

id -[IDSCredentialsDaemonIDSInterface _blockForMessageIdentifier:](IDSCredentialsDaemonIDSInterface *self, SEL a2, id a3)
{
  id v3 = [(IMOrderedMutableDictionary *)self->_uniqueIDToInfo orderedObjectForKey:a3];
  v4 = [v3 objectForKey:@"block"];

  return v4;
}

void sub_100007EE0(id a1)
{
  qword_1000157F8 = objc_alloc_init(IDSCredentialsDaemon);
  _objc_release_x1();
}

void sub_10000846C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Application state changed: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v12 = v3;
    _IDSLogV();
  }
  int v6 = objc_msgSend(v3, "objectForKey:", BKSApplicationStateProcessIDKey, v12);
  uint64_t v7 = [v3 objectForKey:BKSApplicationStateKey];
  v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9 && [v7 intValue] == 2)
  {
    uint64_t v10 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = [v6 intValue];
      *(_DWORD *)buf = 67109120;
      LODWORD(v15) = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, " => Pid %d suspended!", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v13 = [v6 intValue];
      _IDSLogV();
    }
    objc_msgSend(WeakRetained, "_pidSuspended:", objc_msgSend(v6, "intValue", v13));
  }
}

void sub_100008CD0(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) allKeys];
  id v3 = [v2 count];

  if (!v3)
  {
    v4 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Idle exiting, we're done here", v5, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
    [*(id *)(a1 + 32) _terminate];
  }
}

uint64_t start()
{
  if (qword_100015800 != -1) {
    dispatch_once(&qword_100015800, &stru_100010728);
  }
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100010708);
  v1 = +[IDSCredentialsDaemon sharedInstance];

  if (v1)
  {
    v2 = +[NSRunLoop currentRunLoop];
    [v2 run];
  }
  return 0;
}

void sub_100009088(id a1)
{
  v1 = dispatch_get_global_queue(0, 0);
  for (uint64_t i = 0; i != 6; ++i)
  {
    int v3 = dword_10000BFE8[i];
    v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, v3, 0, v1);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000091B0;
    handler[3] = &unk_100010748;
    int v8 = v3;
    dispatch_source_set_event_handler(v4, handler);
    uint64_t v5 = (void *)qword_100015820[i];
    qword_100015820[i] = v4;
    int v6 = v4;

    dispatch_resume(v6);
    signal(v3, (void (__cdecl *)(int))1);
  }
}

void sub_1000091B0(uint64_t a1)
{
}

void sub_1000091B8(int a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000922C;
  block[3] = &unk_100010748;
  int v2 = a1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000922C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32);
  if (v1 <= 14)
  {
    if (v1 != 1 && v1 != 3)
    {
      if (v1 == 13)
      {
        signal(2, (void (__cdecl *)(int))sub_1000091B8);
        return;
      }
LABEL_22:
      _IMWarn();
      return;
    }
    goto LABEL_13;
  }
  switch(v1)
  {
    case 31:
      _IMLog();
      uint64_t v5 = _IMSyncLoggingSettings();
      _MarcoSyncLoggingsPreferences(v5);
      break;
    case 30:
      id v6 = +[IDSCredentialsDaemon sharedInstance];
      [v6 logState];

      break;
    case 15:
LABEL_13:
      _IMLog();
      int v3 = +[NSNotificationCenter defaultCenter];
      objc_msgSend(v3, "__mainThreadPostNotificationName:object:", @"IMAVDaemonShutdownNotification", 0);

      _IMLog();
      v4 = +[IDSCredentialsDaemon sharedInstance];
      [v4 shutdown];

      _IMLog();
      return;
    default:
      goto LABEL_22;
  }
}

void sub_100009410(id a1)
{
  qword_100015810 = objc_alloc_init(IDSCredentialsDaemonMIGInterface);
  _objc_release_x1();
}

uint64_t sub_1000096E8(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 16))
  {
    _IMWarn();
    exit(-1);
  }
  return result;
}

void sub_100009728(id a1, OS_xpc_object *a2, OS_xpc_object *a3)
{
  v4 = a2;
  uint64_t v5 = a3;
  id v6 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Incoming peer auth grant request", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  uint64_t v7 = v4;
  int v8 = v5;
  xpc_type_t type = xpc_get_type(v8);
  if (type != (xpc_type_t)&_xpc_type_error)
  {
    uint64_t v10 = v7;
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v11;
    *(_OWORD *)&buf[16] = v11;
    xpc_connection_get_audit_token();
    uint64_t v12 = kIDSRemoteCredentialsEntitlement;
    if (IMDAuditTokenTaskHasEntitlement())
    {

      if (type != (xpc_type_t)&_xpc_type_dictionary) {
        sub_10000A77C();
      }
      id v13 = v8;
      v14 = xpc_copy_description(v13);
      id v15 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        pid_t pid = xpc_connection_get_pid(v10);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = pid;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "received message from peer(%d): %s", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        xpc_connection_get_pid(v10);
        _IDSLogV();
      }
      free(v14);
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_100009F88;
      *(void *)&buf[24] = &unk_1000107D0;
      v17 = v13;
      v37 = v17;
      v38 = v10;
      *(void *)v32 = _NSConcreteStackBlock;
      *(void *)&v32[8] = 3221225472;
      *(void *)&v32[16] = sub_10000A27C;
      v33 = &unk_1000107F8;
      v34 = v17;
      id v35 = [buf copy];
      v18 = v17;
      id v19 = v35;
      im_dispatch_after_primary_queue();
    }
    else
    {
      pid_t v22 = xpc_connection_get_pid(v10);
      v23 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = IMProcessNameForPid();
        *(_DWORD *)v32 = 138412802;
        *(void *)&v32[4] = v12;
        *(_WORD *)&v32[12] = 2112;
        *(void *)&v32[14] = v24;
        *(_WORD *)&v32[22] = 1024;
        LODWORD(v33) = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Denying xpc connection, task does not have entitlement: %@  (%@:%d)", v32, 0x1Cu);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v25 = IMProcessNameForPid();
        _IDSWarnV();

        v26 = IMProcessNameForPid();
        _IDSLogV();

        v31 = IMProcessNameForPid();
        _IDSLogTransport();
      }
      xpc_connection_cancel(v10);
    }
    goto LABEL_28;
  }
  if (v8 == (OS_xpc_object *)&_xpc_error_connection_invalid)
  {
    v27 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      pid_t v28 = xpc_connection_get_pid(v7);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "peer(%d) received XPC_ERROR_CONNECTION_INVALID", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      goto LABEL_38;
    }
  }
  else if (v8 == (OS_xpc_object *)&_xpc_error_connection_interrupted)
  {
    v29 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      pid_t v30 = xpc_connection_get_pid(v7);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "peer(%d) received XPC_ERROR_CONNECTION_INTERRUPTED", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      goto LABEL_38;
    }
  }
  else if (v8 == (OS_xpc_object *)&_xpc_error_termination_imminent)
  {
    v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      pid_t v21 = xpc_connection_get_pid(v7);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "peer(%d) received XPC_ERROR_TERMINATION_IMMINENT", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLog())
      {
LABEL_38:
        xpc_connection_get_pid(v7);
        _IDSLogV();
      }
    }
  }
LABEL_28:
}

void sub_100009E04(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x100009AC0);
  }
  _Unwind_Resume(a1);
}

id sub_100009F1C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__setupServer");
}

void sub_100009F88(uint64_t a1, int a2, void *a3, int a4)
{
  id v14 = a3;
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  if (a4)
  {
    switch(a2)
    {
      case 10:
        uint64_t v9 = objc_opt_class();
        uint64_t v10 = sub_10000A1C0(v9, v14, IDSRemoteCredentialKeyiMessageAccountInfo);
        IMInsertArraysToXPCDictionary();
        goto LABEL_7;
      case 12:
      case 16:
        int v8 = [v14 objectForKey:IDSRemoteCredentialKeySuccess];
        [v8 BOOLValue];

        IMInsertBoolsToXPCDictionary();
        break;
      case 14:
        uint64_t v10 = [v14 _dictionaryForKey:IDSRemoteCredentialKeyIdStatusUpdates];
        long long v11 = [v14 objectForKey:IDSRemoteCredentialKeySuccess];
        [v11 BOOLValue];

        uint64_t v12 = [v14 _stringForKey:IDSRemoteCredentialKeyFromURI];
        IMInsertBoolsToXPCDictionary();
        IMInsertDictionariesToXPCDictionary();
        IMInsertNSStringsToXPCDictionary();

        goto LABEL_7;
      case 18:
        uint64_t v13 = objc_opt_class();
        uint64_t v10 = sub_10000A1C0(v13, v14, IDSRemoteCredentialKeyAccountMap);
        IMInsertDictionariesToXPCDictionary();
LABEL_7:

        break;
      default:
        break;
    }
  }
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), reply);
}

id sub_10000A1C0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 objectForKey:v5];
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
  }
  else
  {
    if (v6)
    {
      int v8 = +[IMRGLog registration];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        sub_10000A7A8((uint64_t)v5, a1, v8);
      }
    }
    id v7 = 0;
  }

  return v7;
}

void sub_10000A27C(uint64_t a1)
{
  id v2 = +[IDSCredentialsDaemonIDSInterface sharedInstance];
  [v2 forwardIPCRequestToIDS:*(void *)(a1 + 32) withCompletionBlock:*(void *)(a1 + 40)];
}

void sub_10000A4B4(os_log_t log)
{
  int v1 = 136315138;
  id v2 = "-[IDSCredentialsDaemonIDSInterface _sendIDSLocalDeviceInfoRequestToIDS:withCompletionBlock:]";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s Could not send remote credentials request", (uint8_t *)&v1, 0xCu);
}

void sub_10000A538(os_log_t log)
{
  int v1 = 136315138;
  id v2 = "-[IDSCredentialsDaemonIDSInterface _sendIDSLocalDeviceInfoRequestToIDS:withCompletionBlock:]_block_invoke";
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s Could not send remote credentials request", (uint8_t *)&v1, 0xCu);
}

void sub_10000A5BC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "About to send device info request to IDS", (uint8_t *)&v3, 0x16u);
}

void sub_10000A644()
{
  int v0 = 138412546;
  CFStringRef v1 = @"description";
  __int16 v2 = 2080;
  int v3 = "props";
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", (uint8_t *)&v0, 0x16u);
}

void sub_10000A6E0()
{
  int v0 = 138412546;
  CFStringRef v1 = @"block";
  __int16 v2 = 2080;
  int v3 = "props";
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", (uint8_t *)&v0, 0x16u);
}

void sub_10000A77C()
{
  __assert_rtn("auth_peer_event_handler", "IDSCredentialsDaemonMIGInterface.m", 59, "type == XPC_TYPE_DICTIONARY");
}

void sub_10000A7A8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Denying xpc connection, task does not have entitlement: %@  (%@:%d)", (uint8_t *)&v3, 0x16u);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

uint64_t IDSCopyIDForDevice()
{
  return _IDSCopyIDForDevice();
}

uint64_t IDSGetUUIDData()
{
  return _IDSGetUUIDData();
}

uint64_t IDSIncomingAccountSyncMessage()
{
  return _IDSIncomingAccountSyncMessage();
}

uint64_t IMDAuditTokenTaskHasEntitlement()
{
  return _IMDAuditTokenTaskHasEntitlement();
}

uint64_t IMGetXPCArrayFromDictionary()
{
  return _IMGetXPCArrayFromDictionary();
}

uint64_t IMGetXPCBoolFromDictionary()
{
  return _IMGetXPCBoolFromDictionary();
}

uint64_t IMGetXPCCodableFromDictionaryWithStandardAllowlist()
{
  return _IMGetXPCCodableFromDictionaryWithStandardAllowlist();
}

uint64_t IMGetXPCIntFromDictionary()
{
  return _IMGetXPCIntFromDictionary();
}

uint64_t IMGetXPCStringFromDictionary()
{
  return _IMGetXPCStringFromDictionary();
}

uint64_t IMInsertArraysToXPCDictionary()
{
  return _IMInsertArraysToXPCDictionary();
}

uint64_t IMInsertBoolsToXPCDictionary()
{
  return _IMInsertBoolsToXPCDictionary();
}

uint64_t IMInsertDictionariesToXPCDictionary()
{
  return _IMInsertDictionariesToXPCDictionary();
}

uint64_t IMInsertNSStringsToXPCDictionary()
{
  return _IMInsertNSStringsToXPCDictionary();
}

uint64_t IMLogBacktrace()
{
  return _IMLogBacktrace();
}

uint64_t IMLogSimulateCrashForException()
{
  return _IMLogSimulateCrashForException();
}

uint64_t IMProcessNameForPid()
{
  return _IMProcessNameForPid();
}

uint64_t IMSyncronizeAppPreferences()
{
  return _IMSyncronizeAppPreferences();
}

uint64_t IMXPCCreateServerConnection()
{
  return _IMXPCCreateServerConnection();
}

uint64_t JWDecodeDictionary()
{
  return _JWDecodeDictionary();
}

uint64_t JWEncodeDictionary()
{
  return _JWEncodeDictionary();
}

uint64_t OSLogHandleForIDSCategory()
{
  return _OSLogHandleForIDSCategory();
}

uint64_t _IDSLogTransport()
{
  return __IDSLogTransport();
}

uint64_t _IDSLogV()
{
  return __IDSLogV();
}

uint64_t _IDSShouldLog()
{
  return __IDSShouldLog();
}

uint64_t _IDSWarnV()
{
  return __IDSWarnV();
}

uint64_t _IMLog()
{
  return __IMLog();
}

uint64_t _IMSyncLoggingSettings()
{
  return __IMSyncLoggingSettings();
}

uint64_t _IMWarn()
{
  return __IMWarn();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

uint64_t im_dispatch_after_primary_queue()
{
  return _im_dispatch_after_primary_queue();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

uint64_t os_log_shim_legacy_logging_enabled()
{
  return _os_log_shim_legacy_logging_enabled();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_NRPairing(void *a1, const char *a2, ...)
{
  return [a1 NRPairing];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__CUTCopyGzippedData(void *a1, const char *a2, ...)
{
  return [a1 _CUTCopyGzippedData];
}

id objc_msgSend__CUTOptionallyDecompressData(void *a1, const char *a2, ...)
{
  return [a1 _CUTOptionallyDecompressData];
}

id objc_msgSend__terminate(void *a1, const char *a2, ...)
{
  return [a1 _terminate];
}

id objc_msgSend_acceptIncomingGrantRequests(void *a1, const char *a2, ...)
{
  return [a1 acceptIncomingGrantRequests];
}

id objc_msgSend_accountInfo(void *a1, const char *a2, ...)
{
  return [a1 accountInfo];
}

id objc_msgSend_accountSync(void *a1, const char *a2, ...)
{
  return [a1 accountSync];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return [a1 accounts];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_denyIncomingGrantRequests(void *a1, const char *a2, ...)
{
  return [a1 denyIncomingGrantRequests];
}

id objc_msgSend_enabledAccounts(void *a1, const char *a2, ...)
{
  return [a1 enabledAccounts];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_logState(void *a1, const char *a2, ...)
{
  return [a1 logState];
}

id objc_msgSend_orderedObjects(void *a1, const char *a2, ...)
{
  return [a1 orderedObjects];
}

id objc_msgSend_registration(void *a1, const char *a2, ...)
{
  return [a1 registration];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return [a1 shutdown];
}

id objc_msgSend_stringGUID(void *a1, const char *a2, ...)
{
  return [a1 stringGUID];
}

id objc_msgSend_systemIsShuttingDown(void *a1, const char *a2, ...)
{
  return [a1 systemIsShuttingDown];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return [a1 uniqueID];
}

id objc_msgSend_uniqueIDOverride(void *a1, const char *a2, ...)
{
  return [a1 uniqueIDOverride];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_watchPairing(void *a1, const char *a2, ...)
{
  return [a1 watchPairing];
}