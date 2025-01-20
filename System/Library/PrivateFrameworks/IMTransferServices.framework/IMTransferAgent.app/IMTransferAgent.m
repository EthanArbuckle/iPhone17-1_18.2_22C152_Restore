uint64_t sub_100003C40(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = a1;
  xpc_get_type(v1);
  if (IMGetXPCBoolFromDictionary())
  {
    v2 = 1;
  }
  else if (IMGetXPCBoolFromDictionary())
  {
    v2 = 5;
  }
  else if (IMGetXPCBoolFromDictionary())
  {
    v2 = 2;
  }
  else if (IMGetXPCBoolFromDictionary())
  {
    v2 = 3;
  }
  else if (IMGetXPCBoolFromDictionary())
  {
    v2 = 4;
  }
  else if (IMGetXPCBoolFromDictionary())
  {
    v2 = 6;
  }
  else
  {
    v3 = IMGetXPCStringFromDictionary();
    if (v3)
    {
      v4 = IMGetXPCStringFromDictionary();
      if (v4) {
        v2 = 7;
      }
      else {
        v2 = 8;
      }
    }
    else
    {
      v2 = 0;
    }
  }
  return v2;
}

void start()
{
  v0 = dispatch_workloop_create("com.apple.IMTransferAgentWorkQueue");
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_create_with_target_V2("com.apple.IMTransferAgentSerialQueue", v1, v0);

  im_set_primary_base_queue();
  im_set_primary_queue();
  id v2 = +[IMTransferAgentIDSInterface sharedInstance];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "IMTransferAgent woke up", buf, 2u);
    }
  }
  v4 = im_primary_queue();
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v4, &stru_1000082F0);

  v5 = im_primary_queue();
  mach_service = xpc_connection_create_mach_service("com.apple.imtransferservices.IMTransferAgent", v5, 1uLL);

  xpc_connection_set_event_handler(mach_service, &stru_100008310);
  xpc_connection_activate(mach_service);
  *(void *)&long long v7 = 138412290;
  long long v10 = v7;
  while (1)
  {
    v9 = +[NSRunLoop currentRunLoop];
    [v9 run];
  }
}

void sub_100003FD0(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Received IDS Launch notification", v4, 2u);
    }
  }
}

void sub_10000406C(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = qos_class_self();
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Handling connection message at qos (%u)", buf, 8u);
    }
  }
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_connection)
  {
    *(_OWORD *)buf = 0u;
    long long v16 = 0u;
    xpc_connection_get_audit_token();
    if (IMDAuditTokenTaskHasEntitlement())
    {
      v5 = im_primary_queue();
      xpc_connection_set_target_queue(v2, v5);

      xpc_connection_set_event_handler(v2, &stru_100008330);
      xpc_connection_activate(v2);
    }
    else
    {
      pid_t pid = xpc_connection_get_pid(v2);
      if (IMOSLoggingEnabled())
      {
        long long v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v8 = IMProcessNameForPid();
          int v9 = 138412802;
          CFStringRef v10 = @"com.apple.private.imcore.imtransferservice";
          __int16 v11 = 2112;
          v12 = v8;
          __int16 v13 = 1024;
          pid_t v14 = pid;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Denying xpc connection, task does not have entitlement: %@  (%@:%d)", (uint8_t *)&v9, 0x1Cu);
        }
      }
      xpc_connection_cancel(v2);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Connection handler did not handle event: %@", buf, 0xCu);
    }
  }
}

void sub_10000430C(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_error)
  {
    if (IMOSLoggingEnabled())
    {
      pid_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v2;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Received error, tearing down connection (%@)", buf, 0xCu);
      }
    }
  }
  else
  {
    v3 = +[IMTransferAgentIDSInterface sharedInstance];
    [v3 incrementTransferCount];

    v79 = xpc_dictionary_get_remote_connection(v2);
    v4 = v2;
    switch(sub_100003C40(v4))
    {
      case 0:
        if (IMOSLoggingEnabled())
        {
          v5 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = qos_class_self();
            _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Handling download message at qos (%u)", buf, 8u);
          }
        }
        v73 = IMGetXPCDataFromDictionary();
        v70 = IMGetXPCDataFromDictionary();
        v68 = IMGetXPCStringFromDictionary();
        v67 = IMGetXPCStringFromDictionary();
        v6 = IMGetXPCStringFromDictionary();
        v66 = IMGetXPCStringFromDictionary();
        long long v7 = IMGetXPCStringFromDictionary();
        uint64_t uint64 = xpc_dictionary_get_uint64(v4, "file-size");
        v8 = IMGetXPCStringFromDictionary();
        IMGetXPCStringFromDictionary();
        id v9 = objc_claimAutoreleasedReturnValue();
        id v10 = [v9 UTF8String];

        if (v10)
        {
          uint64_t v11 = sandbox_extension_consume();
          if (v11 == -1)
          {
            if (IMOSLoggingEnabled())
            {
              v12 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                int v13 = *__error();
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = v13;
                *(_WORD *)&buf[8] = 2112;
                *(void *)&buf[10] = v6;
                _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Unable to access path with extension, error: %d resource: %@", buf, 0x12u);
              }
            }
            uint64_t v11 = -1;
          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            v62 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v6;
              _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "No extension for path %@", buf, 0xCu);
            }
          }
          uint64_t v11 = 0;
        }
        v63 = +[IMTransferAgentController sharedInstance];
        v80 = _NSConcreteStackBlock;
        uint64_t v81 = 3221225472;
        v82 = sub_100005718;
        v83 = &unk_100008398;
        id v84 = v79;
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = sub_100005888;
        v86 = &unk_1000083C0;
        uint64_t v90 = v11;
        v87 = v4;
        id v88 = v84;
        v89 = &stru_100008370;
        [v63 receiveFileTransfer:v66 topic:v8 path:v6 requestURLString:v67 ownerID:v68 signature:v73 fileSize:uint64 decryptionKey:v70 sourceAppID:v7 progressBlock:&v80 completionBlock:buf];

        goto LABEL_87;
      case 1:
        if (IMOSLoggingEnabled())
        {
          v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = qos_class_self();
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Handling upload message at qos (%u)", buf, 8u);
          }
        }
        unsigned int v69 = IMGetXPCBoolFromDictionary();
        v73 = IMGetXPCStringFromDictionary();
        v71 = IMGetXPCStringFromDictionary();
        long long v16 = IMGetXPCStringFromDictionary();
        v17 = IMGetXPCStringFromDictionary();
        v18 = IMGetXPCDictionaryFromDictionary();
        IMGetXPCStringFromDictionary();
        id v19 = objc_claimAutoreleasedReturnValue();
        id v20 = [v19 UTF8String];

        if (v20)
        {
          uint64_t v21 = sandbox_extension_consume();
          if (v21 == -1)
          {
            if (IMOSLoggingEnabled())
            {
              v22 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                int v23 = *__error();
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = v23;
                *(_WORD *)&buf[8] = 2112;
                *(void *)&buf[10] = v73;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Unable to access path with extension, error: %d resource: %@", buf, 0x12u);
              }
            }
            uint64_t v21 = -1;
          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            v59 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v73;
              _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "No extension for path %@", buf, 0xCu);
            }
          }
          uint64_t v21 = 0;
        }
        if (IMOSLoggingEnabled())
        {
          v60 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "Requesting to upload file.", buf, 2u);
          }
        }
        v61 = +[IMTransferAgentController sharedInstance];
        v80 = _NSConcreteStackBlock;
        uint64_t v81 = 3221225472;
        v82 = sub_100005A80;
        v83 = &unk_100008398;
        id v84 = v79;
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = sub_100005BF0;
        v86 = &unk_1000083E8;
        uint64_t v90 = v21;
        v87 = v4;
        id v88 = v84;
        v89 = &stru_100008370;
        [v61 sendFilePath:v73 encrypt:v69 topic:v16 transferID:v71 sourceAppID:v17 userInfo:v18 progressBlock:&v80 completionBlock:buf];

        goto LABEL_87;
      case 2:
        if (IMOSLoggingEnabled())
        {
          v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = qos_class_self();
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Handling nickname download message at qos (%u)", buf, 8u);
          }
        }
        if (IMOSLoggingEnabled())
        {
          v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Transfer agent received nickname get message", buf, 2u);
          }
        }
        v74 = IMGetXPCStringFromDictionary();
        v72 = IMGetXPCDataFromDictionary();
        v26 = IMGetXPCDataFromDictionary();
        v27 = IMGetXPCDataFromDictionary();
        v28 = IMGetXPCDataFromDictionary();
        uint64_t v29 = IMGetXPCBoolFromDictionary();
        char v30 = IMGetXPCBoolFromDictionary();
        v31 = +[IMTransferAgentNicknameController sharedInstance];
        v32 = im_primary_queue();
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = sub_100005E64;
        v86 = &unk_100008410;
        v87 = v4;
        id v88 = v79;
        v89 = &stru_100008370;
        LOBYTE(v64) = v30;
        [v31 getNicknameWithRecordID:v74 decryptionKey:v72 wallpaperDataTag:v26 wallpaperLowResDataTag:v27 wallpaperMetadataTag:v28 knownSender:v29 shouldDecodeImageFields:v64 queue:v32 completionBlock:buf];

        break;
      case 3:
        if (IMOSLoggingEnabled())
        {
          v33 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = qos_class_self();
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Handling nickname upload message at qos (%u)", buf, 8u);
          }
        }
        if (IMOSLoggingEnabled())
        {
          v34 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Transfer agent received nickname upload message", buf, 2u);
          }
        }
        v75 = IMGetXPCStringFromDictionary();
        v35 = IMGetXPCDataFromDictionary();
        v36 = +[IMTransferAgentNicknameController sharedInstance];
        v37 = im_primary_queue();
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = sub_100005FC0;
        v86 = &unk_100008438;
        v87 = v4;
        id v88 = v79;
        v89 = &stru_100008370;
        [v36 setPersonalNicknameData:v35 oldRecordID:v75 queue:v37 completionBlock:buf];

        break;
      case 4:
        if (IMOSLoggingEnabled())
        {
          v38 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = qos_class_self();
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Handling nickname delete message at qos (%u)", buf, 8u);
          }
        }
        if (IMOSLoggingEnabled())
        {
          v39 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Transfer agent received nickname delete message", buf, 2u);
          }
        }
        v40 = +[IMTransferAgentNicknameController sharedInstance];
        v41 = im_primary_queue();
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = sub_1000061FC;
        v86 = &unk_100008460;
        v87 = v4;
        id v88 = v79;
        v89 = &stru_100008370;
        [v40 deleteAllPersonalNicknamesOnQueue:v41 withCompletion:buf];

        break;
      case 5:
        if (IMOSLoggingEnabled())
        {
          v42 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = qos_class_self();
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Transfer agent received prewarm message at qos (%u)", buf, 8u);
          }
        }
        v43 = +[IMTransferAgentController sharedInstance];
        [v43 warm];

        v76 = +[IMTransferAgentIDSInterface sharedInstance];
        [v76 decrementTransferCount];

        break;
      case 6:
        if (IMOSLoggingEnabled())
        {
          v44 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = qos_class_self();
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Handling cancel upload message at qos (%u)", buf, 8u);
          }
        }
        v77 = IMGetXPCStringFromDictionary();
        v45 = +[IMTransferAgentController sharedInstance];
        [v45 cancelSendTransferID:v77];

        v46 = +[IMTransferAgentIDSInterface sharedInstance];
        [v46 decrementTransferCount];

        break;
      case 7:
        v78 = IMGetXPCStringFromDictionary();
        v47 = IMGetXPCStringFromDictionary();
        v48 = +[NSURL URLWithString:v47];

        v49 = IMGetXPCStringFromDictionary();
        v50 = +[NSURL URLWithString:v49];

        v51 = +[IMRCSTransferController sharedInstance];
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = sub_1000064EC;
        v86 = &unk_1000084B0;
        v87 = v4;
        id v88 = v79;
        v89 = &stru_100008370;
        [v51 receiveTransferOnSimID:v78 transferURL:v48 destURL:v50 completion:buf];

        break;
      case 8:
        v73 = IMGetXPCStringFromDictionary();
        v52 = IMGetXPCStringFromDictionary();
        v53 = +[NSURL URLWithString:v52];

        v54 = IMGetXPCStringFromDictionary();
        if (v54)
        {
          v55 = +[NSURL URLWithString:v54];
        }
        else
        {
          v55 = 0;
        }
        uint64_t v56 = IMGetXPCBoolFromDictionary();
        v57 = IMGetXPCDictionaryFromDictionary();
        v58 = +[IMRCSTransferController sharedInstance];
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = sub_100006348;
        v86 = &unk_1000084B0;
        v87 = v4;
        id v88 = v79;
        v89 = &stru_100008370;
        [v58 sendTransferOnSimID:v73 fileURL:v53 thumbURL:v55 isAudioMessage:v56 userInfo:v57 completion:buf];

LABEL_87:
        break;
      default:
        break;
    }
  }
}

void sub_100005544(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x1000047C8);
  }
  _Unwind_Resume(a1);
}

void sub_1000056D0(id a1)
{
  id v1 = +[IMTransferAgentIDSInterface sharedInstance];
  [v1 decrementTransferCount];
}

void sub_100005718(uint64_t a1, int64_t a2, int64_t a3, int64_t a4)
{
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 134218240;
      int64_t v11 = a2;
      __int16 v12 = 2048;
      int64_t v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Download progress update (%llu of %llu)", (uint8_t *)&v10, 0x16u);
    }
  }
  if (v8)
  {
    xpc_dictionary_set_int64(v8, "__message_type__", 1);
    xpc_dictionary_set_int64(v8, "transferredBytes", a2);
    xpc_dictionary_set_int64(v8, "totalBytes", a3);
    xpc_dictionary_set_int64(v8, "transferSpeed", a4);
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v8);
  }
}

void sub_100005888(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (IMOSLoggingEnabled())
  {
    pid_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      qos_class_t v22 = qos_class_self();
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Handling download completion at qos (%u)", buf, 8u);
    }
  }
  if (*(void *)(a1 + 56) != -1) {
    sandbox_extension_release();
  }
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  if (reply)
  {
    [v10 UTF8String];
    [v11 UTF8String];
    [v13 UTF8String];
    IMInsertStringsToXPCDictionary();
    IMInsertBoolsToXPCDictionary();
    IMInsertCodableObjectsToXPCDictionary();
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), reply);
  }
  (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v15, v16, v17, v18, v19);
}

void sub_100005A80(uint64_t a1, int64_t a2, int64_t a3, int64_t a4)
{
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 134218240;
      int64_t v11 = a2;
      __int16 v12 = 2048;
      int64_t v13 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Update progress update (%llu of %llu)", (uint8_t *)&v10, 0x16u);
    }
  }
  if (v8)
  {
    xpc_dictionary_set_int64(v8, "__message_type__", 1);
    xpc_dictionary_set_int64(v8, "transferredBytes", a2);
    xpc_dictionary_set_int64(v8, "totalBytes", a3);
    xpc_dictionary_set_int64(v8, "transferSpeed", a4);
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v8);
  }
}

void sub_100005BF0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10)
{
  id v28 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  if (IMOSLoggingEnabled())
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      qos_class_t v30 = qos_class_self();
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Handling upload completion at qos (%u)", buf, 8u);
    }
  }
  if (*(void *)(a1 + 56) != -1) {
    sandbox_extension_release();
  }
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  if (reply)
  {
    [v16 UTF8String];
    [v18 UTF8String];
    [v20 UTF8String];
    IMInsertStringsToXPCDictionary();
    IMInsertDatasToXPCDictionary();
    if (v15) {
      IMInsertDatasToXPCDictionary();
    }
    IMInsertBoolsToXPCDictionary();
    IMInsertIntsToXPCDictionary();
    IMInsertCodableObjectsToXPCDictionary();
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), reply);
  }
  (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v22, v23, v24, v25, v26);
}

void sub_100005E64(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    long long v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      qos_class_t v11 = qos_class_self();
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Handling nickname download completion at qos (%u)", buf, 8u);
    }
  }
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  if (reply)
  {
    if (v5 || v6) {
      IMInsertKeyedCodableObjectsToXPCDictionary();
    }
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), reply);
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v8);
}

void sub_100005FC0(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (IMOSLoggingEnabled())
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      qos_class_t v26 = qos_class_self();
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Handling nickname upload completion at qos (%u)", buf, 8u);
    }
  }
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  if (reply)
  {
    IMInsertBoolsToXPCDictionary();
    IMInsertNSStringsToXPCDictionary();
    IMInsertDatasToXPCDictionary();
    IMInsertDatasToXPCDictionary();
    IMInsertDatasToXPCDictionary();
    IMInsertDatasToXPCDictionary();
    IMInsertKeyedCodableObjectsToXPCDictionary();
    if (v21) {
      IMInsertCodableObjectsToXPCDictionary();
    }
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), reply);
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v23);
}

void sub_1000061FC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      qos_class_t v9 = qos_class_self();
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Handling nickname delete completion at qos (%u)", buf, 8u);
    }
  }
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  if (reply)
  {
    IMInsertBoolsToXPCDictionary();
    if (v4) {
      IMInsertCodableObjectsToXPCDictionary();
    }
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), reply);
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v6);
}

void sub_100006348(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Received result from RCS upload %@", buf, 0xCu);
    }
  }
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  if (reply)
  {
    IMInsertDictionariesToXPCDictionary();
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), reply);
  }
  uint64_t v6 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000064DC;
  block[3] = &unk_100008488;
  id v8 = *(id *)(a1 + 48);
  dispatch_sync(v6, block);
}

uint64_t sub_1000064DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000064EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Received result from RCS Download %@", buf, 0xCu);
    }
  }
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  if (reply)
  {
    IMInsertDictionariesToXPCDictionary();
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), reply);
  }
  uint64_t v6 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006680;
  block[3] = &unk_100008488;
  id v8 = *(id *)(a1 + 48);
  dispatch_sync(v6, block);
}

uint64_t sub_100006680(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t IMDAuditTokenTaskHasEntitlement()
{
  return _IMDAuditTokenTaskHasEntitlement();
}

uint64_t IMGetXPCBoolFromDictionary()
{
  return _IMGetXPCBoolFromDictionary();
}

uint64_t IMGetXPCDataFromDictionary()
{
  return _IMGetXPCDataFromDictionary();
}

uint64_t IMGetXPCDictionaryFromDictionary()
{
  return _IMGetXPCDictionaryFromDictionary();
}

uint64_t IMGetXPCStringFromDictionary()
{
  return _IMGetXPCStringFromDictionary();
}

uint64_t IMInsertBoolsToXPCDictionary()
{
  return _IMInsertBoolsToXPCDictionary();
}

uint64_t IMInsertCodableObjectsToXPCDictionary()
{
  return _IMInsertCodableObjectsToXPCDictionary();
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

uint64_t IMInsertNSStringsToXPCDictionary()
{
  return _IMInsertNSStringsToXPCDictionary();
}

uint64_t IMInsertStringsToXPCDictionary()
{
  return _IMInsertStringsToXPCDictionary();
}

uint64_t IMLogExceptionBacktrace()
{
  return _IMLogExceptionBacktrace();
}

uint64_t IMOSLoggingEnabled()
{
  return _IMOSLoggingEnabled();
}

uint64_t IMProcessNameForPid()
{
  return _IMProcessNameForPid();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return _OSLogHandleForIMFoundationCategory();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return _dispatch_workloop_create(label);
}

uint64_t im_primary_queue()
{
  return _im_primary_queue();
}

uint64_t im_set_primary_base_queue()
{
  return _im_set_primary_base_queue();
}

uint64_t im_set_primary_queue()
{
  return _im_set_primary_queue();
}

{
}

{
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

qos_class_t qos_class_self(void)
{
  return _qos_class_self();
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_decrementTransferCount(void *a1, const char *a2, ...)
{
  return [a1 decrementTransferCount];
}

id objc_msgSend_incrementTransferCount(void *a1, const char *a2, ...)
{
  return [a1 incrementTransferCount];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_warm(void *a1, const char *a2, ...)
{
  return [a1 warm];
}