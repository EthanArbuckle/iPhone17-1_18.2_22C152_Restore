void sub_100004484(id a1)
{
  uint64_t vars8;

  qword_100015968 = objc_alloc_init(IDSRemoteURLConnectionDaemon);
  _objc_release_x1();
}

void sub_100004A10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Application state changed: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v11 = v3;
      _IDSLogV();
    }
    v6 = objc_msgSend(v3, "objectForKey:", BKSApplicationStateProcessIDKey, v11);
    v7 = [v3 objectForKey:BKSApplicationStateKey];
    v8 = v7;
    if (v6 && v7 && [v7 intValue] == 2)
    {
      v9 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v10 = [v6 intValue];
        *(_DWORD *)buf = 67109120;
        LODWORD(v14) = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, " => Pid %d suspended!", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v12 = [v6 intValue];
        _IDSLogV();
      }
      objc_msgSend(WeakRetained, "_pidSuspended:", objc_msgSend(v6, "intValue", v12));
    }
  }
}

void sub_100005368(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) allKeys];
  id v3 = [v2 count];

  if (!v3)
  {
    v4 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
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

void sub_100005654(id a1)
{
  byte_100015970 = MGIsDeviceOneOfType();
}

void sub_100005ACC(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 8) + 16))();
  id v2 = +[IDSRemoteURLConnectionDaemon sharedInstance];
  [v2 removeURLLoaderForUniqueID:*(void *)(*(void *)(a1 + 32) + 48)];
}

void sub_100005E04(id a1)
{
  qword_100015988 = objc_alloc_init(IDSRemoteURLConnectionDaemonMIGInterface);
  _objc_release_x1();
}

uint64_t sub_1000060DC(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 16))
  {
    _IMWarn();
    exit(-1);
  }
  return result;
}

void sub_10000611C(id a1, OS_xpc_object *a2, OS_xpc_object *a3)
{
  v4 = a2;
  v5 = a3;
  v6 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Incoming peer auth grant request", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  v7 = v4;
  v8 = v5;
  xpc_type_t type = xpc_get_type(v8);
  if (type != (xpc_type_t)&_xpc_type_error)
  {
    *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&buf[16] = v10;
    *(_OWORD *)buf = v10;
    xpc_connection_get_audit_token();
    uint64_t v11 = kIDSRemoteURLConnectionEntitlement;
    if ((IMDAuditTokenTaskHasEntitlement() & 1) != 0
      || (*(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL,
          *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL,
          *(_OWORD *)&buf[16] = v12,
          *(_OWORD *)buf = v12,
          xpc_connection_get_audit_token(),
          (IMDAuditTokenTaskHasEntitlement() & 1) != 0))
    {
      if (type != (xpc_type_t)&_xpc_type_dictionary) {
        sub_10000ADC4();
      }
      v13 = v8;
      id v14 = xpc_copy_description(v13);
      v15 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        pid_t pid = xpc_connection_get_pid(v7);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = pid;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "received message from peer(%d): %s", buf, 0x12u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        xpc_connection_get_pid(v7);
        _IDSLogV();
      }
      free(v14);
      objc_opt_class();
      v17 = IMGetXPCKeyedCodableFromDictionaryWithSecureCoding();
      int v63 = IMGetXPCBoolFromDictionary();
      int v62 = IMGetXPCBoolFromDictionary();
      int v61 = IMGetXPCBoolFromDictionary();
      int v60 = IMGetXPCIntFromDictionary();
      int v18 = IMGetXPCBoolFromDictionary();
      uint64_t v19 = IMGetXPCIntFromDictionary();
      uint64_t v20 = IMGetXPCIntFromDictionary();
      char v59 = IMGetXPCBoolFromDictionary();
      v21 = IMGetXPCStringFromDictionary();
      v22 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v17;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Decoded URL request: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      v23 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v24 = @"NO";
        if (v63) {
          CFStringRef v24 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, " Try force cell: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      v25 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v26 = @"NO";
        if (v62) {
          CFStringRef v26 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, " requireIDSHost: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      v27 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v21;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, " data usage identifier: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      v28 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v29 = @"NO";
        if (v61) {
          CFStringRef v29 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, " shouldUsePipelining: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      v30 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v60;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, " concurrentConnections: %d", buf, 8u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      v31 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v32 = @"NO";
        if (v18) {
          CFStringRef v32 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, " disableKeepAlive: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      v33 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = +[NSNumber numberWithInt:v19];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, " keepAliveWifi: %@", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v56 = +[NSNumber numberWithInt:v19];
        _IDSLogV();
      }
      v35 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = +[NSNumber numberWithInt:v20];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, " keepAliveCell: %@", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        v57 = +[NSNumber numberWithInt:v20];
        _IDSLogV();
      }
      ++dword_100015998;
      v70[0] = 0;
      v70[1] = v70;
      v70[2] = 0x3032000000;
      v70[3] = sub_1000073BC;
      v70[4] = sub_1000073CC;
      id v71 = (id)0xAAAAAAAAAAAAAAAALL;
      id v71 = (id)os_transaction_create();
      v37 = +[IMMobileNetworkManager sharedInstance];
      [v37 addFastDormancyDisableToken:@"IDSRemoteURLLoaderAgent"];

      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      v64[2] = sub_1000073D4;
      v64[3] = &unk_100010728;
      id v38 = v17;
      id v65 = v38;
      id v39 = v21;
      id v66 = v39;
      v40 = v13;
      v67 = v40;
      v68 = v7;
      v69 = v70;
      id v41 = [v64 copy];
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_100007C58;
      *(void *)&buf[24] = &unk_100010750;
      id v42 = v38;
      id v73 = v42;
      id v43 = v41;
      id v75 = v43;
      char v79 = v61;
      char v80 = v18;
      int v76 = v60;
      int v77 = v19;
      int v78 = v20;
      char v81 = v63;
      id v44 = v39;
      id v74 = v44;
      char v82 = v59;
      char v83 = v62;
      im_dispatch_after_primary_queue();

      _Block_object_dispose(v70, 8);
    }
    else
    {
      pid_t v47 = xpc_connection_get_pid(v7);
      v48 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v49 = IMProcessNameForPid();
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = @"com.apple.private.imcore.imremoteurlconnection";
        *(_WORD *)&buf[22] = 2112;
        *(void *)&buf[24] = v49;
        LOWORD(v73) = 1024;
        *(_DWORD *)((char *)&v73 + 2) = v47;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Denying xpc connection, task does not have entitlement: %@ or %@ (%@:%d)", buf, 0x26u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        v50 = IMProcessNameForPid();
        _IDSWarnV();

        v51 = IMProcessNameForPid();
        _IDSLogV();

        v58 = IMProcessNameForPid();
        _IDSLogTransport();
      }
      xpc_connection_cancel(v7);
    }
    goto LABEL_92;
  }
  if (v8 == (OS_xpc_object *)&_xpc_error_connection_invalid)
  {
    v52 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      pid_t v53 = xpc_connection_get_pid(v7);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v53;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "peer(%d) received XPC_ERROR_CONNECTION_INVALID", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      goto LABEL_91;
    }
  }
  else if (v8 == (OS_xpc_object *)&_xpc_error_connection_interrupted)
  {
    v54 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      pid_t v55 = xpc_connection_get_pid(v7);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v55;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "peer(%d) received XPC_ERROR_CONNECTION_INTERRUPTED", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      goto LABEL_91;
    }
  }
  else if (v8 == (OS_xpc_object *)&_xpc_error_termination_imminent)
  {
    v45 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      pid_t v46 = xpc_connection_get_pid(v7);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v46;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "peer(%d) received XPC_ERROR_TERMINATION_IMMINENT", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLog())
      {
LABEL_91:
        xpc_connection_get_pid(v7);
        _IDSLogV();
      }
    }
  }
LABEL_92:
}

void sub_1000070EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    objc_end_catch();
    JUMPOUT(0x100006DA0);
  }
  _Unwind_Resume(exception_object);
}

id sub_100007350(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__setupServer");
}

uint64_t sub_1000073BC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000073CC(uint64_t a1)
{
}

void sub_1000073D4(uint64_t a1, void *a2, int a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    id v38 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Finished loading request: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  v17 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    id v38 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, " Data Usage identifier: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  uint64_t v19 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v11;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "              Response: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  uint64_t v20 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v21 = [v12 length];
    *(_DWORD *)buf = 67109120;
    LODWORD(v38) = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "     ResultData Length: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    [v12 length];
    _IDSLogV();
  }
  v22 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v38) = a3;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "            StatusCode: %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  v23 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v13;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "                 Error: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  CFStringRef v24 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = +[NetworkChangeNotifier sharedInstance];
    unsigned int v26 = [v25 linkQualityValueForInterfaceType:3];
    *(_DWORD *)buf = 67109120;
    LODWORD(v38) = v26;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "     Cell Link Quality: %d", buf, 8u);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v27 = +[NetworkChangeNotifier sharedInstance];
    [v27 linkQualityValueForInterfaceType:3];
    _IDSLogV();
  }
  v28 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v29 = +[NetworkChangeNotifier sharedInstance];
    unsigned int v30 = [v29 linkQualityValueForInterfaceType:2];
    *(_DWORD *)buf = 67109120;
    LODWORD(v38) = v30;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "     WiFi Link Quality: %d", buf, 8u);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    v31 = +[NetworkChangeNotifier sharedInstance];
    [v31 linkQualityValueForInterfaceType:2];
    _IDSLogV();
  }
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 48));
  IMInsertDatasToXPCDictionary();
  IMInsertKeyedCodableObjectsToXPCDictionary();
  IMInsertKeyedCodableObjectsToXPCDictionary();
  IMInsertIntsToXPCDictionary();
  IMInsertDictionariesToXPCDictionary();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 56), reply);
  uint64_t v33 = *(void *)(*(void *)(a1 + 64) + 8);
  v34 = *(void **)(v33 + 40);
  *(void *)(v33 + 40) = 0;

  if (dword_100015998-- <= 1)
  {
    v36 = +[IMMobileNetworkManager sharedInstance];
    [v36 removeFastDormancyDisableToken:@"IDSRemoteURLLoaderAgent"];
  }
  im_dispatch_after_primary_queue();
}

void sub_100007ACC(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x100007670);
  }
  _Unwind_Resume(a1);
}

void sub_100007B7C(id a1)
{
  if (dword_100015998 <= 0)
  {
    v1 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v2 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Idle exiting, we're done here", v2, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
    exit(0);
  }
}

void sub_100007C58(uint64_t a1)
{
  id v3 = [[IDSRemoteAgentURLLoader alloc] initWithURLRequest:*(void *)(a1 + 32) completionBlock:*(void *)(a1 + 48)];
  [(IDSRemoteAgentURLLoader *)v3 setShouldUsePipelining:*(unsigned __int8 *)(a1 + 68)];
  [(IDSRemoteAgentURLLoader *)v3 setConcurrentConnections:*(unsigned int *)(a1 + 56)];
  [(IDSRemoteAgentURLLoader *)v3 setDisableKeepAlive:*(unsigned __int8 *)(a1 + 69)];
  [(IDSRemoteAgentURLLoader *)v3 setKeepAliveWifi:*(unsigned int *)(a1 + 60)];
  [(IDSRemoteAgentURLLoader *)v3 setKeepAliveCell:*(unsigned int *)(a1 + 64)];
  [(IDSRemoteAgentURLLoader *)v3 setForceCellularIfPossible:*(unsigned __int8 *)(a1 + 70)];
  [(IDSRemoteAgentURLLoader *)v3 setBundleIdentifierForDataUsage:*(void *)(a1 + 40)];
  [(IDSRemoteAgentURLLoader *)v3 setShouldReturnTimingData:*(unsigned __int8 *)(a1 + 71)];
  [(IDSRemoteAgentURLLoader *)v3 setRequireIDSHost:*(unsigned __int8 *)(a1 + 72)];
  [(IDSRemoteAgentURLLoader *)v3 load];
  id v2 = +[IDSRemoteURLConnectionDaemon sharedInstance];
  [v2 addURLLoader:v3];
}

void sub_100007D94(id a1)
{
  qword_1000159A8 = objc_alloc_init(IDSRemoteURLConnectionDaemonIDSInterface);
  _objc_release_x1();
}

void sub_1000088F8(uint64_t a1, void *a2, __CFString *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v55 = a4;
  id v12 = a5;
  id v54 = a6;
  if ([*(id *)(*(void *)(a1 + 32) + 24) containsObject:*(void *)(a1 + 40)])
  {
    [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
    v52 = a3;
    id v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v14 = *(const __CFString **)(a1 + 40);
      v15 = *(__CFString **)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138412546;
      CFStringRef v57 = v14;
      __int16 v58 = 2112;
      char v59 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Removed uniqueID %@ from _pendingResponseUniqueIDs. New map: %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v48 = *(__CFString **)(a1 + 40);
      uint64_t v50 = *(void *)(*(void *)(a1 + 32) + 24);
      _IDSLogV();
    }
    v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v17 = *(const __CFString **)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      CFStringRef v57 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Finished loading request: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v48 = *(__CFString **)(a1 + 48);
      _IDSLogV();
    }
    int v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v19 = *(const __CFString **)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      CFStringRef v57 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, " Data Usage identifier: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v48 = *(__CFString **)(a1 + 56);
      _IDSLogV();
    }
    uint64_t v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v57 = v11;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "              Response: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v48 = v11;
      _IDSLogV();
    }
    unsigned int v21 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v22 = [v55 length];
      *(_DWORD *)buf = 67109120;
      LODWORD(v57) = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "     ResultData Length: %d", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v48 = (__CFString *)[v55 length];
      _IDSLogV();
    }
    v23 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v57) = a3;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "            StatusCode: %d", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v48 = a3;
      _IDSLogV();
    }
    CFStringRef v24 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v57 = v12;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "                 Error: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v48 = v12;
      _IDSLogV();
    }
    pid_t v53 = [(__CFString *)v11 allHeaderFields];
    v25 = JWEncodeKeyedCodableObject();
    if (!v25)
    {
      v25 = +[NSData data];
    }
    unsigned int v26 = [(__CFString *)v11 URL];
    v27 = JWEncodeKeyedCodableObject();
    if (!v27)
    {
      v27 = +[NSData data];
    }
    v28 = (id)kCFHTTPVersion1_1;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFStringRef v29 = (const __CFString *)[(__CFString *)v11 _CFURLResponse];
      if (v29)
      {
        HTTPResponse = (__CFHTTPMessage *)CFURLResponseGetHTTPResponse();
        if (HTTPResponse)
        {
          CFStringRef v31 = CFHTTPMessageCopyVersion(HTTPResponse);

          v28 = (__CFString *)v31;
        }
        else
        {
          v36 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v57 = v29;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Could not get HTTP version for response %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            CFStringRef v49 = v29;
            _IDSLogV();
          }
        }
      }
      else
      {
        v35 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v57 = v11;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Could not get CFURLResponse from response %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          CFStringRef v49 = v11;
          _IDSLogV();
        }
      }
    }
    else
    {
      v34 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v57 = @"IDSRemoteURLConnectionDaemonIDSInterface";
        __int16 v58 = 2112;
        char v59 = v11;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%@ - Response is not an HTTP response %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        CFStringRef v49 = @"IDSRemoteURLConnectionDaemonIDSInterface";
        v51 = v11;
        _IDSLogTransport();
      }
    }
    v37 = JWEncodeKeyedCodableObject();
    if (!v37)
    {
      v37 = +[NSData data];
    }
    id v38 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    CFDictionarySetValue(v38, IDSRemoteURLConnectionKeyCommand, &off_100011378);
    id v39 = *(id *)(a1 + 40);
    if (v39) {
      CFDictionarySetValue(v38, IDSRemoteURLConnectionKeyUniqueID, v39);
    }

    id v40 = v25;
    if (v40) {
      CFDictionarySetValue(v38, IDSRemoteURLConnectionKeyHeaders, v40);
    }

    id v41 = v27;
    if (v41) {
      CFDictionarySetValue(v38, IDSRemoteURLConnectionKeyURL, v41);
    }

    id v42 = v28;
    if (v42) {
      CFDictionarySetValue(v38, IDSRemoteURLConnectionKeyHTTPVersion, v42);
    }

    id v43 = +[NSNumber numberWithInteger:v52];
    if (v43) {
      CFDictionarySetValue(v38, IDSRemoteURLConnectionKeyResponseStatusCode, v43);
    }

    id v44 = v55;
    if (v44) {
      CFDictionarySetValue(v38, IDSRemoteURLConnectionKeyResultData, v44);
    }

    id v45 = v37;
    if (v45) {
      CFDictionarySetValue(v38, IDSRemoteURLConnectionKeyResponseError, v45);
    }

    pid_t v46 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v57 = (const __CFString *)v38;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Sending an IDS message back to the watch. loadResponse: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      CFStringRef v49 = (const __CFString *)v38;
      _IDSLogV();
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "sendIDSMessage:forLoaderWithUniqueID:", v38, 0, v49, v51) & 1) == 0)
    {
      pid_t v47 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Failed sending load request response", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  else
  {
    CFStringRef v32 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v33 = *(const __CFString **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      CFStringRef v57 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Response is for deactivated watch and was dropped. _pendingResponseUniqueIDs does not contain %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

void sub_10000957C(uint64_t a1)
{
  id v3 = [[IDSRemoteAgentURLLoader alloc] initWithURLRequest:*(void *)(a1 + 32) completionBlock:*(void *)(a1 + 48)];
  [(IDSRemoteAgentURLLoader *)v3 setForceCellularIfPossible:*(unsigned __int8 *)(a1 + 68)];
  [(IDSRemoteAgentURLLoader *)v3 setBundleIdentifierForDataUsage:*(void *)(a1 + 40)];
  [(IDSRemoteAgentURLLoader *)v3 setRequireIDSHost:*(unsigned __int8 *)(a1 + 69)];
  [(IDSRemoteAgentURLLoader *)v3 setShouldUsePipelining:*(unsigned __int8 *)(a1 + 70)];
  [(IDSRemoteAgentURLLoader *)v3 setConcurrentConnections:*(unsigned int *)(a1 + 56)];
  [(IDSRemoteAgentURLLoader *)v3 setDisableKeepAlive:*(unsigned __int8 *)(a1 + 71)];
  [(IDSRemoteAgentURLLoader *)v3 setKeepAliveWifi:*(unsigned int *)(a1 + 60)];
  [(IDSRemoteAgentURLLoader *)v3 setKeepAliveCell:*(unsigned int *)(a1 + 64)];
  [(IDSRemoteAgentURLLoader *)v3 load];
  id v2 = +[IDSRemoteURLConnectionDaemon sharedInstance];
  [v2 addURLLoader:v3];
}

void sub_10000A3FC(uint64_t a1)
{
  id v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Message timeout block fired; checking if we still have a URLLoader for the request",
      buf,
      2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  id v3 = +[IDSRemoteURLConnectionDaemon sharedInstance];
  v4 = [v3 urlLoaderForUniqueID:*(void *)(a1 + 32)];

  if (v4)
  {
    v5 = [v4 block];
    id v6 = [v5 copy];

    if (v6)
    {
      v7 = +[NSError errorWithDomain:IDSRemoteURLConnectionErrorDomain code:2 userInfo:0];
      (*((void (**)(id, void, void, void, void *, void))v6 + 2))(v6, 0, 0, 0, v7, 0);
    }
    v8 = +[IDSRemoteURLConnectionDaemon sharedInstance];
    [v8 removeURLLoaderForUniqueID:*(void *)(a1 + 32)];
  }
  else
  {
    v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No URLLoader for uniqueID %@ message ID %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

void sub_10000A90C(int a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A980;
  block[3] = &unk_100010808;
  int v2 = a1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000A980(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32);
  if (v1 <= 14)
  {
    if (v1 != 1 && v1 != 3)
    {
      if (v1 == 13)
      {
        signal(2, (void (__cdecl *)(int))sub_10000A90C);
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
      id v6 = +[IDSRemoteURLConnectionDaemon sharedInstance];
      [v6 logState];

      break;
    case 15:
LABEL_13:
      _IMLog();
      id v3 = +[NSNotificationCenter defaultCenter];
      objc_msgSend(v3, "__mainThreadPostNotificationName:object:", @"IMAVDaemonShutdownNotification", 0);

      _IMLog();
      v4 = +[IDSRemoteURLConnectionDaemon sharedInstance];
      [v4 shutdown];

      _IMLog();
      return;
    default:
      goto LABEL_22;
  }
}

void sub_10000AB10()
{
  if (qword_1000159B0 != -1) {
    dispatch_once(&qword_1000159B0, &stru_100010828);
  }
}

void sub_10000AB38(id a1)
{
  int v1 = dispatch_get_global_queue(0, 0);
  for (uint64_t i = 0; i != 6; ++i)
  {
    int v3 = dword_10000C428[i];
    v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, v3, 0, v1);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000AC60;
    handler[3] = &unk_100010808;
    int v8 = v3;
    dispatch_source_set_event_handler(v4, handler);
    uint64_t v5 = (void *)qword_1000159B8[i];
    qword_1000159B8[i] = v4;
    id v6 = v4;

    dispatch_resume(v6);
    signal(v3, (void (__cdecl *)(int))1);
  }
}

void sub_10000AC60(uint64_t a1)
{
}

uint64_t start()
{
  if (qword_1000159B0 != -1) {
    dispatch_once(&qword_1000159B0, &stru_100010828);
  }
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100010868);
  int v2 = +[IDSRemoteURLConnectionDaemon sharedInstance];
  if (v2)
  {
    v4 = +[NSRunLoop currentRunLoop];
    [v4 run];
  }

  return 0;
}

void sub_10000ADA0(void *a1)
{
  objc_end_catch();
}

void sub_10000ADC4()
{
  __assert_rtn("auth_peer_event_handler", "IDSRemoteURLConnectionDaemonMIGInterface.m", 74, "type == XPC_TYPE_DICTIONARY");
}

void sub_10000ADF0(void *a1)
{
  objc_end_catch();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFStringRef CFHTTPMessageCopyVersion(CFHTTPMessageRef message)
{
  return _CFHTTPMessageCopyVersion(message);
}

uint64_t CFURLResponseGetHTTPResponse()
{
  return _CFURLResponseGetHTTPResponse();
}

uint64_t IMDAuditTokenTaskHasEntitlement()
{
  return _IMDAuditTokenTaskHasEntitlement();
}

uint64_t IMGetXPCBoolFromDictionary()
{
  return _IMGetXPCBoolFromDictionary();
}

uint64_t IMGetXPCIntFromDictionary()
{
  return _IMGetXPCIntFromDictionary();
}

uint64_t IMGetXPCKeyedCodableFromDictionaryWithSecureCoding()
{
  return _IMGetXPCKeyedCodableFromDictionaryWithSecureCoding();
}

uint64_t IMGetXPCStringFromDictionary()
{
  return _IMGetXPCStringFromDictionary();
}

uint64_t IMInsertDatasToXPCDictionary()
{
  return _IMInsertDatasToXPCDictionary();
}

uint64_t IMInsertDictionariesToXPCDictionary()
{
  return _IMInsertDictionariesToXPCDictionary();
}

uint64_t IMInsertIntsToXPCDictionary()
{
  return _IMInsertIntsToXPCDictionary();
}

uint64_t IMInsertKeyedCodableObjectsToXPCDictionary()
{
  return _IMInsertKeyedCodableObjectsToXPCDictionary();
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

uint64_t JWDecodeKeyedCodableObjectWithSecureCoding()
{
  return _JWDecodeKeyedCodableObjectWithSecureCoding();
}

uint64_t JWEncodeDictionary()
{
  return _JWEncodeDictionary();
}

uint64_t JWEncodeKeyedCodableObject()
{
  return _JWEncodeKeyedCodableObject();
}

uint64_t MGIsDeviceOneOfType()
{
  return _MGIsDeviceOneOfType();
}

uint64_t OSLogHandleForIDSCategory()
{
  return _OSLogHandleForIDSCategory();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
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

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__CFURLResponse(void *a1, const char *a2, ...)
{
  return [a1 _CFURLResponse];
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

id objc_msgSend__terminateAfterDelayIfIdle(void *a1, const char *a2, ...)
{
  return [a1 _terminateAfterDelayIfIdle];
}

id objc_msgSend_acceptIncomingGrantRequests(void *a1, const char *a2, ...)
{
  return [a1 acceptIncomingGrantRequests];
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return [a1 allHeaderFields];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return [a1 block];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifierForDataUsage(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifierForDataUsage];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_concurrentConnections(void *a1, const char *a2, ...)
{
  return [a1 concurrentConnections];
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

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_denyIncomingGrantRequests(void *a1, const char *a2, ...)
{
  return [a1 denyIncomingGrantRequests];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_disableKeepAlive(void *a1, const char *a2, ...)
{
  return [a1 disableKeepAlive];
}

id objc_msgSend_forceCellularIfPossible(void *a1, const char *a2, ...)
{
  return [a1 forceCellularIfPossible];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return [a1 isDefaultPairedDevice];
}

id objc_msgSend_isNearby(void *a1, const char *a2, ...)
{
  return [a1 isNearby];
}

id objc_msgSend_keepAliveCell(void *a1, const char *a2, ...)
{
  return [a1 keepAliveCell];
}

id objc_msgSend_keepAliveWifi(void *a1, const char *a2, ...)
{
  return [a1 keepAliveWifi];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return [a1 load];
}

id objc_msgSend_logState(void *a1, const char *a2, ...)
{
  return [a1 logState];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_requireIDSHost(void *a1, const char *a2, ...)
{
  return [a1 requireIDSHost];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldReturnTimingData(void *a1, const char *a2, ...)
{
  return [a1 shouldReturnTimingData];
}

id objc_msgSend_shouldUsePipelining(void *a1, const char *a2, ...)
{
  return [a1 shouldUsePipelining];
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

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_urlLoaderForUniqueID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "urlLoaderForUniqueID:");
}