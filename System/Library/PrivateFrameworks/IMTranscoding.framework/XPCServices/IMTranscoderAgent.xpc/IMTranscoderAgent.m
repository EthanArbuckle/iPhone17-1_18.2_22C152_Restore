uint64_t start()
{
  void *v0;
  id v1;
  int v2;

  xpc_track_activity();
  IMSetEmbeddedTempDirectory();
  v1 = objc_msgSend(+[IMImagePreviewGenerator UTITypes](IMImagePreviewGenerator, "UTITypes"), "mutableCopy");
  objc_msgSend(v1, "addObjectsFromArray:", +[IMAnimatedImagePreviewGenerator UTITypes](IMAnimatedImagePreviewGenerator, "UTITypes"));
  v2 = CGImageSourceSetAllowableTypes();

  if (!v2) {
    xpc_main((xpc_connection_handler_t)sub_100003A68);
  }
  return 1;
}

void sub_100003A68(xpc_connection_t connection)
{
  if (qword_10000C0E8 != -1) {
    dispatch_once(&qword_10000C0E8, &stru_1000082A8);
  }
  xpc_connection_set_target_queue(connection, (dispatch_queue_t)qword_10000C0E0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100003B50;
  handler[3] = &unk_1000082F8;
  handler[4] = connection;
  xpc_connection_set_event_handler(connection, handler);
  xpc_connection_resume(connection);
}

void sub_100003B24(id a1)
{
  qword_10000C0E0 = (uint64_t)dispatch_queue_create("IMTranscoderPeerConnectionQueue", 0);
}

void sub_100003B50(uint64_t a1, uint64_t a2)
{
  long long v7 = 0u;
  long long v8 = 0u;
  xpc_connection_get_audit_token();
  if (IMDAuditTokenTaskHasEntitlement())
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100003D50;
    v6[3] = &unk_1000082D0;
    v6[4] = *(void *)(a1 + 32);
    v6[5] = a2;
    v9[0] = 0;
    v9[1] = 0;
    pthread_main_thread_np();
    pthread_dependency_init_np();
    *(void *)block = _NSConcreteStackBlock;
    *(void *)&block[8] = 3221225472;
    *(void *)&block[16] = sub_100004C84;
    v11 = &unk_100008320;
    v12 = v6;
    v13 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    pthread_dependency_wait_np();
  }
  else
  {
    pid_t pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)block = 138412802;
        *(void *)&block[4] = @"com.apple.private.imcore.imtranscoderservice";
        *(_WORD *)&block[12] = 2112;
        *(void *)&block[14] = IMProcessNameForPid();
        *(_WORD *)&block[22] = 1024;
        LODWORD(v11) = pid;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Denying xpc connection, task does not have entitlement: %@  (%@:%d)", block, 0x1Cu);
      }
    }
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  }
}

void sub_100003D50(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_error)
  {
    if (v2 == &_xpc_error_termination_imminent) {
      CFStringRef v6 = @"Termination Imminent";
    }
    else {
      CFStringRef v6 = @"unknown";
    }
    if (v2 == &_xpc_error_connection_invalid) {
      CFStringRef v7 = @"Connection Invalid";
    }
    else {
      CFStringRef v7 = v6;
    }
    if (IMOSLoggingEnabled())
    {
      long long v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v7;
        v9 = "received error: %@";
        v10 = v8;
        uint32_t v11 = 12;
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&buf, v11);
      }
    }
  }
  else
  {
    xpc_retain(v2);
    xpc_retain(v1);
    if (IMOSLoggingEnabled())
    {
      v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 67109120;
        DWORD1(buf) = xpc_connection_get_pid((xpc_connection_t)v1);
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "received message from peer(%d)", (uint8_t *)&buf, 8u);
      }
    }
    if (qword_10000C0F8 != -1) {
      dispatch_once(&qword_10000C0F8, &stru_100008340);
    }
    if (qword_10000C108 != -1) {
      dispatch_once(&qword_10000C108, &stru_100008360);
    }
    int v4 = IMGetXPCIntFromDictionary();
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 67109120;
        DWORD1(buf) = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Message type received %d", (uint8_t *)&buf, 8u);
      }
    }
    switch(v4)
    {
      case 0:
        queue = qword_10000C0F0;
        v78 = (void *)IMGetXPCStringFromDictionary();
        if ([v78 length]) {
          uint64_t v77 = IMGetXPCDataFromDictionary();
        }
        else {
          uint64_t v77 = 0;
        }
        uint64_t v74 = IMGetXPCArrayFromDictionary();
        char v73 = IMGetXPCBoolFromDictionary();
        char v72 = IMGetXPCBoolFromDictionary();
        uint64_t v71 = IMGetXPCArrayFromDictionary();
        uint64_t v70 = IMGetXPCDictionaryFromDictionary();
        int v69 = IMGetXPCIntFromDictionary();
        int v68 = IMGetXPCIntFromDictionary();
        uint64_t v76 = IMGetXPCIntFromDictionary();
        id v53 = [+[NSUserDefaults standardUserDefaults] objectForKey:@"ForceTargetType"];
        if (v53)
        {
          unsigned int v54 = [v53 intValue];
          if (v54 < 3) {
            uint64_t v76 = v54;
          }
        }
        CFStringRef v55 = (const __CFString *)IMGetXPCStringFromDictionary();
        v56 = (void *)IMGetXPCStringFromDictionary();
        char v57 = IMGetXPCBoolFromDictionary();
        if ((objc_msgSend(objc_msgSend(v56, "pathExtension"), "isEqualToIgnoringCase:", @"wbmp") & 1) != 0
          || objc_msgSend(objc_msgSend(v56, "pathExtension"), "isEqualToIgnoringCase:", @"bmp"))
        {
          CFStringRef v55 = @"________WBMP_________";
        }
        uint64_t v58 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
        uint64_t v59 = IMGetXPCDictionaryFromDictionary();
        uint64_t v60 = sub_100004D84((uint64_t)v2, (uint64_t)"read-extension");
        uint64_t v61 = os_transaction_create();
        aBlock = _NSConcreteStackBlock;
        uint64_t v80 = 3221225472;
        v81 = sub_100004EBC;
        v82 = &unk_1000083B0;
        uint64_t v83 = (uint64_t)v2;
        uint64_t v84 = (uint64_t)v56;
        uint64_t v86 = v61;
        uint64_t v87 = v60;
        uint64_t v85 = (uint64_t)v1;
        v62 = _Block_copy(&aBlock);
        *(void *)&long long v105 = _NSConcreteStackBlock;
        *((void *)&v105 + 1) = 3221225472;
        *(void *)&long long v106 = sub_100005254;
        *((void *)&v106 + 1) = &unk_100008400;
        v107 = v2;
        v108 = v56;
        v109 = v1;
        uint64_t v110 = v61;
        v63 = _Block_copy(&v105);
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v90 = sub_10000544C;
        v91 = &unk_100008428;
        uint64_t v92 = (uint64_t)v56;
        uint64_t v93 = v77;
        char v101 = v73;
        BOOL v102 = v77 != 0;
        *(void *)&long long v94 = v74;
        *((void *)&v94 + 1) = v55;
        char v103 = v57;
        *(void *)v95 = v58;
        *(void *)&v95[8] = v71;
        *(void *)&v95[16] = v70;
        *(void *)&v95[24] = v59;
        int v99 = v68;
        int v100 = v69;
        char v104 = v72;
        *(void *)&v95[32] = v78;
        v96 = v62;
        v97 = v63;
        uint64_t v98 = v76;
        dispatch_async(queue, &buf);

        break;
      case 1:
        v13 = qword_10000C100;
        uint64_t v14 = IMGetXPCCodableFromDictionaryWithStandardAllowlist();
        IMGetXPCDictionaryFromDictionary();
        v107 = 0;
        long long v105 = 0u;
        long long v106 = 0u;
        IMPreviewConstraintsFromDictionary();
        uint64_t v15 = sub_100004D84((uint64_t)v2, (uint64_t)"read-extension");
        aBlock = _NSConcreteStackBlock;
        uint64_t v80 = 3221225472;
        v81 = sub_100005614;
        v82 = &unk_1000084A0;
        uint64_t v83 = (uint64_t)v2;
        uint64_t v84 = v14;
        uint64_t v86 = os_transaction_create();
        uint64_t v87 = v15;
        uint64_t v85 = (uint64_t)v1;
        v16 = _Block_copy(&aBlock);
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v90 = sub_100005814;
        v91 = &unk_1000084C8;
        long long v94 = v105;
        *(_OWORD *)v95 = v106;
        *(void *)&v95[16] = v107;
        uint64_t v92 = v14;
        uint64_t v93 = (uint64_t)v16;
        dispatch_async(v13, &buf);

        break;
      case 2:
        v17 = qword_10000C0F0;
        uint64_t v18 = IMGetXPCStringFromDictionary();
        v19 = (void *)IMGetXPCStringFromDictionary();
        if ([v19 length]) {
          id v20 = [objc_alloc((Class)NSURL) initWithString:IMGetXPCStringFromDictionary()];
        }
        else {
          id v20 = 0;
        }
        *(void *)&long long v105 = objc_opt_class();
        +[NSArray arrayWithObjects:&v105 count:1];
        uint64_t v64 = IMGetXPCKeyedCodableFromDictionaryWithSecureCodingAllowedClasses();
        uint64_t v65 = sub_100004D84((uint64_t)v2, (uint64_t)"read-extension");
        uint64_t v66 = os_transaction_create();
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v90 = sub_100005904;
        v91 = &unk_100008518;
        uint64_t v92 = (uint64_t)v2;
        uint64_t v93 = v18;
        *((void *)&v94 + 1) = v66;
        *(void *)v95 = v65;
        *(void *)&long long v94 = v1;
        v67 = _Block_copy(&buf);
        aBlock = _NSConcreteStackBlock;
        uint64_t v80 = 3221225472;
        v81 = sub_100005B00;
        v82 = &unk_100008540;
        uint64_t v83 = v18;
        uint64_t v84 = (uint64_t)v20;
        uint64_t v85 = (uint64_t)v19;
        uint64_t v86 = v64;
        uint64_t v87 = (uint64_t)v67;
        dispatch_async(v17, &aBlock);

        break;
      case 3:
        v21 = qword_10000C100;
        uint64_t v22 = IMGetXPCStringFromDictionary();
        uint64_t v23 = IMGetXPCStringFromDictionary();
        uint64_t v24 = IMGetXPCStringFromDictionary();
        v25 = +[NSURL URLWithString:v22];
        v26 = +[NSURL URLWithString:v23];
        uint64_t v111 = objc_opt_class();
        +[NSArray arrayWithObjects:&v111 count:1];
        uint64_t v27 = IMGetXPCKeyedCodableFromDictionaryWithSecureCodingAllowedClasses();
        uint64_t v28 = sub_100004D84((uint64_t)v2, (uint64_t)"write-extension");
        uint64_t v29 = sub_100004D84((uint64_t)v2, (uint64_t)"read-extension");
        IMGetXPCDictionaryFromDictionary();
        v107 = 0;
        long long v105 = 0u;
        long long v106 = 0u;
        IMPreviewConstraintsFromDictionary();
        aBlock = _NSConcreteStackBlock;
        uint64_t v80 = 3221225472;
        v81 = sub_100005BE4;
        v82 = &unk_100008590;
        uint64_t v83 = (uint64_t)v2;
        uint64_t v84 = (uint64_t)v25;
        uint64_t v87 = v28;
        uint64_t v88 = v29;
        uint64_t v85 = (uint64_t)v1;
        uint64_t v86 = os_transaction_create();
        v30 = _Block_copy(&aBlock);
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        *(_OWORD *)&v95[8] = v105;
        v90 = sub_100005E38;
        v91 = &unk_1000085B8;
        uint64_t v92 = (uint64_t)v25;
        uint64_t v93 = (uint64_t)v26;
        *(void *)&long long v94 = v27;
        *((void *)&v94 + 1) = v24;
        *(_OWORD *)&v95[24] = v106;
        v96 = v107;
        *(void *)v95 = v30;
        dispatch_sync(v21, &buf);

        break;
      case 5:
        v31 = qword_10000C100;
        uint64_t v32 = IMGetXPCStringFromDictionary();
        uint64_t v33 = IMGetXPCStringFromDictionary();
        v34 = +[NSURL URLWithString:v32];
        *(void *)&long long v105 = objc_opt_class();
        +[NSArray arrayWithObjects:&v105 count:1];
        uint64_t v35 = IMGetXPCKeyedCodableFromDictionaryWithSecureCodingAllowedClasses();
        uint64_t v36 = sub_100004D84((uint64_t)v2, (uint64_t)"read-extension");
        uint64_t v37 = os_transaction_create();
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v90 = sub_10000627C;
        v91 = &unk_100008670;
        uint64_t v92 = (uint64_t)v2;
        uint64_t v93 = (uint64_t)v34;
        *(void *)&long long v94 = v33;
        *((void *)&v94 + 1) = v1;
        *(void *)v95 = v37;
        *(void *)&v95[8] = v36;
        id v38 = [&buf copy];
        aBlock = _NSConcreteStackBlock;
        uint64_t v80 = 3221225472;
        v81 = sub_1000064A0;
        v82 = &unk_100008698;
        uint64_t v83 = (uint64_t)v34;
        uint64_t v84 = v33;
        uint64_t v85 = v35;
        uint64_t v86 = (uint64_t)v38;
        dispatch_sync(v31, &aBlock);

        break;
      case 6:
        v39 = qword_10000C100;
        uint64_t v40 = IMGetXPCStringFromDictionary();
        uint64_t v41 = IMGetXPCStringFromDictionary();
        v42 = +[NSURL URLWithString:v40];
        v43 = +[NSURL URLWithString:v41];
        uint64_t v111 = objc_opt_class();
        +[NSArray arrayWithObjects:&v111 count:1];
        uint64_t v44 = IMGetXPCKeyedCodableFromDictionaryWithSecureCodingAllowedClasses();
        uint64_t v45 = sub_100004D84((uint64_t)v2, (uint64_t)"write-extension");
        uint64_t v46 = sub_100004D84((uint64_t)v2, (uint64_t)"read-extension");
        IMGetXPCDictionaryFromDictionary();
        v107 = 0;
        long long v105 = 0u;
        long long v106 = 0u;
        IMPreviewConstraintsFromDictionary();
        aBlock = _NSConcreteStackBlock;
        uint64_t v80 = 3221225472;
        v81 = sub_100005F34;
        v82 = &unk_100008590;
        uint64_t v83 = (uint64_t)v2;
        uint64_t v84 = (uint64_t)v42;
        uint64_t v87 = v45;
        uint64_t v88 = v46;
        uint64_t v85 = (uint64_t)v1;
        uint64_t v86 = os_transaction_create();
        v47 = _Block_copy(&aBlock);
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v90 = sub_100006188;
        v91 = &unk_1000085E0;
        uint64_t v92 = (uint64_t)v42;
        uint64_t v93 = (uint64_t)v43;
        *(_OWORD *)v95 = v105;
        *(_OWORD *)&v95[16] = v106;
        *(void *)&v95[32] = v107;
        *(void *)&long long v94 = v44;
        *((void *)&v94 + 1) = v47;
        dispatch_sync(v39, &buf);

        break;
      case 7:
        v48 = qword_10000C0F0;
        v49 = +[NSURL URLWithString:IMGetXPCStringFromDictionary()];
        uint64_t v50 = sub_100004D84((uint64_t)v2, (uint64_t)"read-extension");
        uint64_t v51 = os_transaction_create();
        *(void *)&long long buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472;
        v90 = sub_10000658C;
        v91 = &unk_1000086C0;
        uint64_t v92 = (uint64_t)v2;
        uint64_t v93 = (uint64_t)v1;
        *(void *)&long long v94 = v51;
        *((void *)&v94 + 1) = v50;
        v52 = _Block_copy(&buf);
        aBlock = _NSConcreteStackBlock;
        uint64_t v80 = 3221225472;
        v81 = sub_100006640;
        v82 = &unk_1000086E8;
        uint64_t v83 = (uint64_t)v49;
        uint64_t v84 = (uint64_t)v52;
        dispatch_async(v48, &aBlock);

        break;
      default:
        if (IMOSLoggingEnabled())
        {
          v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 67109120;
            DWORD1(buf) = v4;
            v9 = "We got a transcoder message type that is undefined: %d";
            v10 = v12;
            uint32_t v11 = 8;
            goto LABEL_24;
          }
        }
        break;
    }
  }
}

uint64_t sub_100004C84(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(a1 + 40);
  return _pthread_dependency_fulfill_np(v2, 0);
}

void sub_100004CCC(id a1)
{
  v1 = dispatch_queue_create("IMTranscoderBackgroundPriorityQueue", 0);
  qword_10000C0F0 = (uint64_t)v1;
  global_queue = dispatch_get_global_queue(-2, 0);
  dispatch_set_target_queue(v1, global_queue);
}

void sub_100004D28(id a1)
{
  v1 = dispatch_queue_create("IMTranscoderNormalPriorityQueue", 0);
  qword_10000C100 = (uint64_t)v1;
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_set_target_queue(v1, global_queue);
}

uint64_t sub_100004D84(uint64_t a1, uint64_t a2)
{
  v3 = (void *)IMGetXPCStringFromDictionary();
  if (![v3 length])
  {
    if (!IMOSLoggingEnabled()) {
      return -1;
    }
    v5 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      return -1;
    }
    int v7 = 136315138;
    uint64_t v8 = a2;
    CFStringRef v6 = "Did not receive valid sandbox extension for key %s";
    goto LABEL_9;
  }
  [v3 UTF8String];
  uint64_t result = sandbox_extension_consume();
  if (result != -1) {
    return result;
  }
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      uint64_t v8 = a2;
      CFStringRef v6 = "Failed to consume sandbox extension for key %s";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v7, 0xCu);
    }
  }
  return -1;
}

void sub_100004EBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7, uint64_t a8)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004F54;
  block[3] = &unk_100008388;
  block[4] = *(void *)(a1 + 32);
  block[5] = a2;
  char v13 = a6;
  char v14 = a7;
  block[6] = a3;
  block[7] = a5;
  block[8] = a4;
  block[9] = a8;
  long long v10 = *(_OWORD *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100004F54(uint64_t a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "path"), "UTF8String");
  IMInsertStringsToXPCDictionary();
  IMInsertBoolsToXPCDictionary();
  IMInsertCodableObjectsToXPCDictionary();
  IMInsertCodableObjectsToXPCDictionary();
  IMInsertCodableObjectsToXPCDictionary();
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 72);
      uint64_t v4 = *(void *)(a1 + 80);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v7 = v4;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Handled TranscodeAttachment for %@ complete, additionalContext %@", buf, 0x16u);
    }
  }
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 88), reply);
  xpc_release(reply);
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 88));
  sub_100005110(*(void *)(a1 + 104));
  sub_1000051C4(*(void *)(a1 + 96));
}

void sub_100005110(uint64_t a1)
{
  if (a1 >= 1 && sandbox_extension_release() == -1 && IMOSLoggingEnabled())
  {
    v1 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v2 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Failed to release sandbox extension", v2, 2u);
    }
  }
}

void sub_1000051C4(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 100000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000560C;
  block[3] = &unk_100008450;
  block[4] = a1;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100005254(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000052E8;
  v6[3] = &unk_1000083D8;
  v6[4] = *(void *)(a1 + 32);
  v6[5] = a2;
  void v6[6] = a4;
  v6[7] = a3;
  char v9 = a5;
  char v10 = a6;
  long long v7 = *(_OWORD *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

void sub_1000052E8(uint64_t a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  IMInsertCodableObjectsToXPCDictionary();
  IMInsertBoolsToXPCDictionary();
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 64);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Handled TranscodeAttachment for %@ via fallback", buf, 0xCu);
    }
  }
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 72), reply);
  xpc_release(reply);
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 72));
  sub_1000051C4(*(void *)(a1 + 80));
}

id sub_10000544C(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    dispatch_time_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      id v4 = [*(id *)(a1 + 40) length];
      CFStringRef v5 = @"YES";
      if (*(unsigned char *)(a1 + 136)) {
        CFStringRef v6 = @"YES";
      }
      else {
        CFStringRef v6 = @"NO";
      }
      uint64_t v7 = *(void *)(a1 + 48);
      if (!*(unsigned char *)(a1 + 137)) {
        CFStringRef v5 = @"NO";
      }
      *(_DWORD *)long long buf = 138413314;
      uint64_t v16 = v3;
      __int16 v17 = 2048;
      id v18 = v4;
      __int16 v19 = 2112;
      CFStringRef v20 = v6;
      __int16 v21 = 2112;
      CFStringRef v22 = v5;
      __int16 v23 = 2112;
      uint64_t v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Handling TranscodeAttachment for %@ data length %lu shouldGenerateFallback %@ isBalloonWithData %@ attachments %@", buf, 0x34u);
    }
  }
  BOOL v8 = *(unsigned char *)(a1 + 137) == 0;
  char v9 = +[IMTranscodingAgentController sharedInstance];
  char v10 = v9;
  if (!v8) {
    return [(IMTranscodingAgentController *)v9 transcodeFileTransferData:*(void *)(a1 + 40) balloonBundleID:*(void *)(a1 + 96) attachments:*(void *)(a1 + 48) fallBack:*(unsigned __int8 *)(a1 + 136) completionBlock:*(void *)(a1 + 112)];
  }
  uint64_t v12 = +[NSURL fileURLWithPath:*(void *)(a1 + 32)];
  LOBYTE(v14) = *(unsigned char *)(a1 + 139);
  LOBYTE(v13) = *(unsigned char *)(a1 + 136);
  return [(IMTranscodingAgentController *)v10 transcodeFileTransferContents:v12 utiType:*(void *)(a1 + 56) isSticker:*(unsigned __int8 *)(a1 + 138) allowUnfilteredUTIs:*(void *)(a1 + 64) target:*(void *)(a1 + 120) sizes:*(void *)(a1 + 72) commonCapabilities:*(void *)(a1 + 80) maxDimension:*(int *)(a1 + 128) transcoderUserInfo:*(void *)(a1 + 88) fallback:v13 representations:*(int *)(a1 + 132) isLQMEnabled:v14 completionBlock:*(void *)(a1 + 104)];
}

void sub_10000560C(uint64_t a1)
{
}

void sub_100005614(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000056A4;
  v6[3] = &unk_100008478;
  uint64_t v4 = *(void *)(a1 + 32);
  char v10 = a2;
  v6[4] = v4;
  v6[5] = a3;
  void v6[6] = a4;
  long long v7 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

void sub_1000056A4(uint64_t a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  IMInsertBoolsToXPCDictionary();
  IMInsertCodableObjectsToXPCDictionary();
  IMInsertCodableObjectsToXPCDictionary();
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 48);
      uint64_t v4 = *(void *)(a1 + 56);
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138412802;
      uint64_t v8 = v4;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Handled GenerateSafeRender for %@, previewURL: %@ error: %@", buf, 0x20u);
    }
  }
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 64), reply);
  xpc_release(reply);
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 64));
  sub_100005110(*(void *)(a1 + 80));
  sub_1000051C4(*(void *)(a1 + 72));
}

id sub_100005814(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    dispatch_time_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      LODWORD(v9[0]) = 138412290;
      *(void *)((char *)v9 + 4) = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Handling GenerateSafeRender for %@", (uint8_t *)v9, 0xCu);
    }
  }
  uint64_t v4 = +[IMTranscodingAgentController sharedInstance];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  long long v7 = *(_OWORD *)(a1 + 64);
  v9[0] = *(_OWORD *)(a1 + 48);
  v9[1] = v7;
  uint64_t v10 = *(void *)(a1 + 80);
  return [(IMTranscodingAgentController *)v4 generateSafeRender:v5 constraints:v9 completionBlock:v6];
}

void sub_100005904(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005990;
  block[3] = &unk_1000084F0;
  uint64_t v3 = *(void *)(a1 + 32);
  char v9 = a2;
  block[4] = v3;
  void block[5] = a3;
  long long v6 = *(_OWORD *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100005990(uint64_t a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  IMInsertBoolsToXPCDictionary();
  IMInsertCodableObjectsToXPCDictionary();
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      if (*(unsigned char *)(a1 + 80)) {
        CFStringRef v4 = @"YES";
      }
      else {
        CFStringRef v4 = @"NO";
      }
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138412802;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      CFStringRef v10 = v4;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Handled GenerateSnapshot for %@, success: %@ snapshotError: %@", buf, 0x20u);
    }
  }
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 56), reply);
  xpc_release(reply);
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 56));
  sub_100005110(*(void *)(a1 + 72));
  sub_1000051C4(*(void *)(a1 + 64));
}

id sub_100005B00(void *a1)
{
  if (IMOSLoggingEnabled())
  {
    dispatch_time_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = a1[4];
      int v5 = 138412290;
      uint64_t v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Handling GenerateSnapshot for: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  return [+[IMTranscodingAgentController sharedInstance] generateSnapshotForMessageGUID:a1[4] payloadURL:a1[5] balloonBundleID:a1[6] senderContext:a1[7] completionBlock:a1[8]];
}

void sub_100005BE4(uint64_t a1, char a2, uint64_t a3, double a4, double a5)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005C7C;
  v6[3] = &unk_100008568;
  uint64_t v5 = *(void *)(a1 + 32);
  char v12 = a2;
  v6[4] = v5;
  v6[5] = a3;
  double v9 = a4;
  double v10 = a5;
  long long v7 = *(_OWORD *)(a1 + 40);
  long long v11 = *(_OWORD *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 56);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

void sub_100005C7C(uint64_t a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  IMInsertBoolsToXPCDictionary();
  uint64_t v8 = *(void *)(a1 + 40);
  IMInsertCodableObjectsToXPCDictionary();
  *(_OWORD *)long long buf = *(_OWORD *)(a1 + 72);
  +[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", buf, "{CGSize=dd}", v8, 0);
  IMInsertCodableObjectsToXPCDictionary();
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 48);
      if (*(unsigned char *)(a1 + 104)) {
        CFStringRef v5 = @"YES";
      }
      else {
        CFStringRef v5 = @"NO";
      }
      uint64_t v6 = *(void *)(a1 + 72);
      uint64_t v7 = *(void *)(a1 + 80);
      *(_DWORD *)long long buf = 138413058;
      *(void *)&uint8_t buf[4] = v4;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      __int16 v10 = 2048;
      uint64_t v11 = v6;
      __int16 v12 = 2048;
      uint64_t v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Handled GeneratePreview for %@, success: %@ size: (%f, %f)", buf, 0x2Au);
    }
  }
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 56), reply);
  xpc_release(reply);
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 56));
  sub_100005110(*(void *)(a1 + 88));
  sub_100005110(*(void *)(a1 + 96));
  sub_1000051C4(*(void *)(a1 + 64));
}

id sub_100005E38(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    dispatch_time_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      LODWORD(v12[0]) = 138412290;
      *(void *)((char *)v12 + 4) = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Handling GeneratePreview for %@", (uint8_t *)v12, 0xCu);
    }
  }
  uint64_t v4 = +[IMTranscodingAgentController sharedInstance];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  long long v10 = *(_OWORD *)(a1 + 88);
  v12[0] = *(_OWORD *)(a1 + 72);
  v12[1] = v10;
  uint64_t v13 = *(void *)(a1 + 104);
  return [(IMTranscodingAgentController *)v4 generatePreview:v5 previewURL:v6 senderContext:v7 balloonBundleID:v8 constraints:v12 completionBlock:v9];
}

void sub_100005F34(uint64_t a1, char a2, uint64_t a3, double a4, double a5)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005FCC;
  v6[3] = &unk_100008568;
  uint64_t v5 = *(void *)(a1 + 32);
  char v12 = a2;
  v6[4] = v5;
  v6[5] = a3;
  double v9 = a4;
  double v10 = a5;
  long long v7 = *(_OWORD *)(a1 + 40);
  long long v11 = *(_OWORD *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 56);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

void sub_100005FCC(uint64_t a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  IMInsertBoolsToXPCDictionary();
  uint64_t v8 = *(void *)(a1 + 40);
  IMInsertCodableObjectsToXPCDictionary();
  *(_OWORD *)long long buf = *(_OWORD *)(a1 + 72);
  +[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", buf, "{CGSize=dd}", v8, 0);
  IMInsertCodableObjectsToXPCDictionary();
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 48);
      if (*(unsigned char *)(a1 + 104)) {
        CFStringRef v5 = @"YES";
      }
      else {
        CFStringRef v5 = @"NO";
      }
      uint64_t v6 = *(void *)(a1 + 72);
      uint64_t v7 = *(void *)(a1 + 80);
      *(_DWORD *)long long buf = 138413058;
      *(void *)&uint8_t buf[4] = v4;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      __int16 v10 = 2048;
      uint64_t v11 = v6;
      __int16 v12 = 2048;
      uint64_t v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Handled GenerateMetadata for %@, success: %@ size: (%f, %f)", buf, 0x2Au);
    }
  }
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 56), reply);
  xpc_release(reply);
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 56));
  sub_100005110(*(void *)(a1 + 88));
  sub_100005110(*(void *)(a1 + 96));
  sub_1000051C4(*(void *)(a1 + 64));
}

id sub_100006188(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    dispatch_time_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      LODWORD(v11[0]) = 138412290;
      *(void *)((char *)v11 + 4) = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Handling GenerateMetadata for %@", (uint8_t *)v11, 0xCu);
    }
  }
  uint64_t v4 = +[IMTranscodingAgentController sharedInstance];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  long long v9 = *(_OWORD *)(a1 + 80);
  v11[0] = *(_OWORD *)(a1 + 64);
  v11[1] = v9;
  uint64_t v12 = *(void *)(a1 + 96);
  return [(IMTranscodingAgentController *)v4 generatePreviewMetadata:v5 destinationURL:v6 senderContext:v7 constraints:v11 completionBlock:v8];
}

__n128 sub_10000627C(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  _OWORD v9[2] = sub_100006310;
  v9[3] = &unk_100008648;
  uint64_t v5 = *(void *)(a1 + 32);
  char v13 = a2;
  v9[4] = v5;
  v9[5] = a5;
  v9[6] = a3;
  v9[7] = a4;
  long long v6 = *(_OWORD *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 72);
  long long v7 = *(_OWORD *)(a1 + 56);
  long long v10 = v6;
  long long v11 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
  return result;
}

void sub_100006310(uint64_t a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  IMInsertBoolsToXPCDictionary();
  IMInsertCodableObjectsToXPCDictionary();
  uint64_t v6 = *(void *)(a1 + 48);
  IMInsertDatasToXPCDictionary();
  objc_msgSend(*(id *)(a1 + 56), "__imArrayByApplyingBlock:", &stru_100008620, v6, 0);
  IMInsertArraysToXPCDictionary();
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 64);
      uint64_t v5 = *(void *)(a1 + 72);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v8 = v4;
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Handled DecodeiMessageAppPayload for %@ bundleID %@", buf, 0x16u);
    }
  }
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 80), reply);
  xpc_release(reply);
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 80));
  sub_100005110(*(void *)(a1 + 96));
  sub_1000051C4(*(void *)(a1 + 88));
}

id sub_100006498(id a1, NSURL *a2)
{
  return [(NSURL *)a2 absoluteString];
}

id sub_1000064A0(void *a1)
{
  if (IMOSLoggingEnabled())
  {
    dispatch_time_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = a1[4];
      uint64_t v4 = a1[5];
      int v6 = 138412546;
      uint64_t v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Handling DecodeiMessageAppPayload for %@ bundleID %@", (uint8_t *)&v6, 0x16u);
    }
  }
  return [+[IMTranscodingAgentController sharedInstance] decodeiMessageAppPayload:a1[4] senderContext:a1[6] bundleID:a1[5] completionBlock:a1[7]];
}

void sub_10000658C(uint64_t a1, uint64_t a2, void *a3)
{
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  [a3 UTF8String];
  IMInsertStringsToXPCDictionary();
  IMInsertCodableObjectsToXPCDictionary();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), reply);
  xpc_release(reply);
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 40));
  sub_100005110(*(void *)(a1 + 56));
  uint64_t v6 = *(void *)(a1 + 48);
  sub_1000051C4(v6);
}

id sub_100006640(uint64_t a1)
{
  dispatch_time_t v2 = +[IMTranscodingAgentController sharedInstance];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [(IMTranscodingAgentController *)v2 transcribeAudioForAudioTransferURL:v3 withCompletion:v4];
}

uint64_t CGImageSourceSetAllowableTypes()
{
  return _CGImageSourceSetAllowableTypes();
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

uint64_t IMGetXPCDataFromDictionary()
{
  return _IMGetXPCDataFromDictionary();
}

uint64_t IMGetXPCDictionaryFromDictionary()
{
  return _IMGetXPCDictionaryFromDictionary();
}

uint64_t IMGetXPCIntFromDictionary()
{
  return _IMGetXPCIntFromDictionary();
}

uint64_t IMGetXPCKeyedCodableFromDictionaryWithSecureCodingAllowedClasses()
{
  return _IMGetXPCKeyedCodableFromDictionaryWithSecureCodingAllowedClasses();
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

uint64_t IMInsertCodableObjectsToXPCDictionary()
{
  return _IMInsertCodableObjectsToXPCDictionary();
}

uint64_t IMInsertDatasToXPCDictionary()
{
  return _IMInsertDatasToXPCDictionary();
}

uint64_t IMInsertStringsToXPCDictionary()
{
  return _IMInsertStringsToXPCDictionary();
}

uint64_t IMOSLoggingEnabled()
{
  return _IMOSLoggingEnabled();
}

uint64_t IMPreviewConstraintsFromDictionary()
{
  return _IMPreviewConstraintsFromDictionary();
}

uint64_t IMProcessNameForPid()
{
  return _IMProcessNameForPid();
}

uint64_t IMSetEmbeddedTempDirectory()
{
  return _IMSetEmbeddedTempDirectory();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return _OSLogHandleForIMFoundationCategory();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

void objc_end_catch(void)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t pthread_dependency_init_np()
{
  return _pthread_dependency_init_np();
}

uint64_t pthread_dependency_wait_np()
{
  return _pthread_dependency_wait_np();
}

uint64_t pthread_main_thread_np()
{
  return _pthread_main_thread_np();
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
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

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_main(xpc_connection_handler_t handler)
{
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

uint64_t xpc_track_activity()
{
  return _xpc_track_activity();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UTITypes(void *a1, const char *a2, ...)
{
  return [a1 UTITypes];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_valueWithBytes_objCType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithBytes:objCType:");
}