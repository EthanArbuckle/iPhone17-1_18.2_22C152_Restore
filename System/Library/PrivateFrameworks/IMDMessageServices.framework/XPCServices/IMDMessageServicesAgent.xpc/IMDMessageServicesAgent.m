id sub_100004B3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void **v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *, double);
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  int v24;

  v6 = IMGetXPCIntFromDictionary();
  v7 = IMGetXPCStringFromDictionary();
  v8 = IMGetXPCStringFromDictionary();
  v9 = IMGetXPCArrayFromDictionary();
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_100004D08;
  v16 = &unk_1000104F8;
  v17 = a3;
  v18 = a4;
  if (!v6) {
    return [+[IMDMessageServicesAgentController sharedInstance] checkForPendingRoutingWithHandler:&v13];
  }
  v10 = v9;
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v20 = v7;
      v21 = 2112;
      v22 = v8;
      v23 = 1024;
      v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Handling routing request for GUID:%@  chatGUID:%@  error:%d", buf, 0x1Cu);
    }
  }
  return [+[IMDMessageServicesAgentController sharedInstance] chooseRouteForMessage:v7 downgradableServices:v10 withError:v6 inChat:v8 handler:&v13];
}

uint64_t sub_100004D08(uint64_t a1, void *a2, double a3)
{
  if (a2 && [a2 count])
  {
    [IMDMessageServicesRoutingDictionaryKey UTF8String];
    IMInsertDictionariesToXPCDictionary();
  }
  if (a3 > 0.0)
  {
    [IMDMessageServicesCallbackIntervalKey UTF8String];
    IMInsertIntsToXPCDictionary();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

id sub_100004DE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = IMGetXPCStringFromDictionary();
  v7 = +[IMDMessageServicesAgentController sharedInstance];
  if (v6) {
    return [(IMDMessageServicesAgentController *)v7 checkExpireStateForMessage:v6 handler:&v9];
  }
  else {
    return [(IMDMessageServicesAgentController *)v7 checkExpireStateWithHandler:&v9];
  }
}

uint64_t sub_100004E9C(uint64_t a1, void *a2, double a3)
{
  if (a2 && [a2 count])
  {
    [IMDMessageServicesExpireStateDictionaryKey UTF8String];
    IMInsertDictionariesToXPCDictionary();
  }
  if (a3 > 0.0)
  {
    [IMDMessageServicesCallbackIntervalKey UTF8String];
    IMInsertIntsToXPCDictionary();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

id sub_100004F78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = IMGetXPCStringFromDictionary();
  v7 = +[IMDMessageServicesAgentController sharedInstance];
  if (v6) {
    return [(IMDMessageServicesAgentController *)v7 checkWatchdogForMessage:v6 handler:&v9];
  }
  else {
    return [(IMDMessageServicesAgentController *)v7 checkWatchdogWithHandler:&v9];
  }
}

uint64_t sub_100005030(uint64_t a1, void *a2, double a3)
{
  if (a2 && [a2 count])
  {
    [IMDMessageServicesWatchdogDictionaryKey UTF8String];
    IMInsertDictionariesToXPCDictionary();
  }
  if (a3 > 0.0)
  {
    [IMDMessageServicesCallbackIntervalKey UTF8String];
    IMInsertIntsToXPCDictionary();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

id sub_10000510C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = IMGetXPCStringFromDictionary();
  v7 = +[IMDMessageServicesAgentController sharedInstance];
  if (v6) {
    return [(IMDMessageServicesAgentController *)v7 checkScheduledMessageForGUID:v6 handler:&v9];
  }
  else {
    return [(IMDMessageServicesAgentController *)v7 checkScheduledMessageWithHandler:&v9];
  }
}

uint64_t sub_1000051C4(uint64_t a1, void *a2, double a3)
{
  if (a2 && [a2 count])
  {
    [IMDMessageServicesScheduledMessagesDictionaryKey UTF8String];
    IMInsertDictionariesToXPCDictionary();
  }
  if (a3 > 0.0)
  {
    [IMDMessageServicesCallbackIntervalKey UTF8String];
    IMInsertIntsToXPCDictionary();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

void start()
{
}

void sub_1000052C8(_xpc_connection_s *a1)
{
  xpc_connection_set_target_queue(a1, (dispatch_queue_t)&_dispatch_main_q);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100005358;
  handler[3] = &unk_100010520;
  handler[4] = a1;
  xpc_connection_set_event_handler(a1, handler);
  xpc_connection_resume(a1);
}

void sub_100005358(uint64_t a1, void *a2)
{
  v4 = (void **)(a1 + 32);
  xpc_connection_get_audit_token();
  int HasEntitlement = IMDAuditTokenTaskHasEntitlement();
  uint64_t v6 = *v4;
  if (HasEntitlement)
  {
    if (xpc_get_type(a2) != (xpc_type_t)&_xpc_type_error)
    {
      xpc_retain(a2);
      xpc_retain(v6);
      v7 = xpc_copy_description(a2);
      if (IMOSLoggingEnabled())
      {
        v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = xpc_connection_get_pid((xpc_connection_t)v6);
          *(_WORD *)&buf[8] = 2080;
          *(void *)&buf[10] = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "received message from peer(%d): %s", buf, 0x12u);
        }
      }
      free(v7);
      ++dword_100014D18;
      uint64_t v9 = os_transaction_create();
      xpc_object_t reply = xpc_dictionary_create_reply(a2);
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_100005664;
      v16 = &unk_100010588;
      v17 = v6;
      xpc_object_t v18 = reply;
      v19 = a2;
      uint64_t v20 = v9;
      id v11 = objc_msgSend(buf, "copy", 0, 0, 0, 0);
      if (qword_100014D28 != -1) {
        dispatch_once(&qword_100014D28, &stru_1000105A8);
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100005850;
      block[3] = &unk_1000105D0;
      block[4] = a2;
      block[5] = v6;
      block[6] = reply;
      block[7] = v11;
      dispatch_async((dispatch_queue_t)qword_100014D20, block);
    }
  }
  else
  {
    pid_t pid = xpc_connection_get_pid((xpc_connection_t)v6);
    if (IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = @"com.apple.private.imcore.imdmessageservices";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = IMProcessNameForPid();
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v16) = pid;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Denying xpc connection, task does not have entitlement: %@  (%@:%d)", buf, 0x1Cu);
      }
    }
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  }
}

void sub_100005630(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x100005460);
  }
  _Unwind_Resume(a1);
}

void sub_100005664(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000056DC;
  v2[3] = &unk_100010588;
  long long v1 = *(_OWORD *)(a1 + 48);
  long long v3 = *(_OWORD *)(a1 + 32);
  long long v4 = v1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

uint64_t sub_1000056DC(uint64_t a1)
{
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
  xpc_release(*(xpc_object_t *)(a1 + 40));
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 48));

  --dword_100014D18;
  v2.n128_u64[0] = 30.0;
  return _im_dispatch_after(&stru_100010560, v2);
}

void sub_100005754(id a1)
{
  if (dword_100014D18 <= 0)
  {
    if (IMOSLoggingEnabled())
    {
      long long v1 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__n128 v2 = 0;
        _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Idle exiting, we're done here", v2, 2u);
      }
    }
    exit(0);
  }
}

void sub_1000057F4(id a1)
{
  long long v1 = dispatch_queue_create("IMDMessageServicesAgentQueue", 0);
  qword_100014D20 = (uint64_t)v1;
  global_queue = dispatch_get_global_queue(-32768, 0);
  dispatch_set_target_queue(v1, global_queue);
}

id sub_100005850(void *a1)
{
  __n128 v2 = (void *)IMGetXPCStringFromDictionary();
  id v3 = [v2 isEqualToString:@"route"];
  if (v3)
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    return sub_100004B3C((uint64_t)v3, v4, v5, v6);
  }
  else
  {
    id v8 = [v2 isEqualToString:@"expire"];
    if (v8)
    {
      uint64_t v9 = a1[4];
      uint64_t v10 = a1[6];
      uint64_t v11 = a1[7];
      return sub_100004DE4((uint64_t)v8, v9, v10, v11);
    }
    else
    {
      id v12 = [v2 isEqualToString:@"watchdog"];
      if (v12)
      {
        uint64_t v13 = a1[4];
        uint64_t v14 = a1[6];
        uint64_t v15 = a1[7];
        return sub_100004F78((uint64_t)v12, v13, v14, v15);
      }
      else
      {
        id v16 = [v2 isEqualToString:@"scheduled"];
        if (v16)
        {
          uint64_t v17 = a1[4];
          uint64_t v18 = a1[6];
          uint64_t v19 = a1[7];
          return sub_10000510C((uint64_t)v16, v17, v18, v19);
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v20 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              int v21 = 138412290;
              v22 = v2;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Unknown command: %@", (uint8_t *)&v21, 0xCu);
            }
          }
          return (id)(*(uint64_t (**)(void))(a1[7] + 16))();
        }
      }
    }
  }
}

BOOL sub_100005A9C(const __CFString *a1)
{
  return UTTypeConformsTo(a1, kUTTypeAudio) != 0;
}

BOOL sub_100005AC8(const __CFString *a1)
{
  return UTTypeConformsTo(a1, kUTTypeAudiovisualContent) != 0;
}

BOOL sub_100005AF4(const __CFString *a1)
{
  return UTTypeConformsTo(a1, kUTTypeVCard) != 0;
}

BOOL sub_100005B20(const __CFString *a1)
{
  return UTTypeConformsTo(a1, kUTTypeImage) != 0;
}

void sub_100005B90(id a1)
{
  qword_100014D38 = objc_alloc_init(IMDMessageServicesAgentController);
}

id sub_1000061F0(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    __n128 v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      int v7 = 138412802;
      uint64_t v8 = v3;
      __int16 v9 = 2112;
      uint64_t v10 = v4;
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Found message for routing with GUID:%@ inChat:%@ -- %@", (uint8_t *)&v7, 0x20u);
    }
  }
  return [*(id *)(a1 + 56) _chooseRouteForMessage:*(void *)(a1 + 48) downgradableServices:*(void *)(a1 + 64) error:*(unsigned int *)(a1 + 80) handler:*(void *)(a1 + 72)];
}

void sub_1000066BC(uint64_t a1, void *a2, double a3)
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Found routable messages: %@", buf, 0xCu);
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [a2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v19;
    *(void *)&long long v8 = 138412290;
    long long v17 = v8;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(a2);
        }
        __int16 v11 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v10);
        id v12 = objc_msgSend(*(id *)(a1 + 32), "_routingDictionaryForService:extraFlags:updateProperties:", IMServiceNameSMS, 0x80000, 1, v17);
        if (v12)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v17;
              id v24 = v12;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "  Adding route: %@", buf, 0xCu);
            }
          }
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v12, objc_msgSend(v11, "GUID"));
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v7 = [a2 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
  if (a3 > 0.0)
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(unsigned char *)(v14 + 24))
    {
      uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
      double v16 = *(double *)(v15 + 24);
      if (v16 >= a3) {
        double v16 = a3;
      }
      *(double *)(v15 + 24) = v16;
    }
    else
    {
      *(unsigned char *)(v14 + 24) = 1;
      *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a3;
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_100006940(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(uint64_t, void, double))(v2 + 16))(v2, *(void *)(a1 + 32), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  uint64_t v3 = *(void **)(a1 + 32);
}

uint64_t sub_100006C14(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    if (IMOSLoggingEnabled())
    {
      uint64_t v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        int v3 = 138412290;
        uint64_t v4 = 0;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Results of expire state check: %@", (uint8_t *)&v3, 0xCu);
      }
    }
    return (*(uint64_t (**)(double))(*(void *)(v1 + 32) + 16))(0.0);
  }
  return result;
}

uint64_t sub_100006CF8(uint64_t result)
{
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    if (IMOSLoggingEnabled())
    {
      uint64_t v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        uint64_t v3 = *(void *)(v1 + 32);
        int v4 = 138412290;
        uint64_t v5 = v3;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Results of expire state check: %@", (uint8_t *)&v4, 0xCu);
      }
    }
    return (*(uint64_t (**)(double))(*(void *)(v1 + 40) + 16))(*(double *)(v1 + 48));
  }
  return result;
}

uint64_t sub_1000070C8(uint64_t result)
{
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    if (IMOSLoggingEnabled())
    {
      uint64_t v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        uint64_t v3 = *(void *)(v1 + 32);
        int v4 = 138412290;
        uint64_t v5 = v3;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Results of expire state check: %@", (uint8_t *)&v4, 0xCu);
      }
    }
    return (*(uint64_t (**)(double))(*(void *)(v1 + 40) + 16))(*(double *)(v1 + 48));
  }
  return result;
}

uint64_t sub_1000073DC(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    if (IMOSLoggingEnabled())
    {
      uint64_t v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        int v3 = 138412290;
        uint64_t v4 = 0;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Results of schedule message: %@", (uint8_t *)&v3, 0xCu);
      }
    }
    return (*(uint64_t (**)(double))(*(void *)(v1 + 32) + 16))(0.0);
  }
  return result;
}

uint64_t sub_1000074C0(uint64_t result)
{
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    if (IMOSLoggingEnabled())
    {
      uint64_t v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        uint64_t v3 = *(void *)(v1 + 32);
        int v4 = 138412290;
        uint64_t v5 = v3;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Results of schedule message check : %@", (uint8_t *)&v4, 0xCu);
      }
    }
    return (*(uint64_t (**)(double))(*(void *)(v1 + 40) + 16))(*(double *)(v1 + 48));
  }
  return result;
}

void sub_100007630(uint64_t a1, void *a2)
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  int v4 = (char *)[a2 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    uint64_t v7 = IMDMessageServicesScheduledDateKey;
    double v8 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(a2);
        }
        uint64_t v10 = (void *)IMDMessageRecordCopyGUIDForMessage();
        uint64_t Date = IMDMessageRecordGetDate();
        if (v10)
        {
          uint64_t v12 = Date;
          id v13 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", Date), v7, 0);
          [v3 setObject:v13 forKey:v10];
          objc_msgSend(+[NSDate __im_dateWithNanosecondTimeIntervalSinceReferenceDate:](NSDate, "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v12), "timeIntervalSinceNow");
          double v15 = v14;
        }
        else
        {
          double v15 = 0.0;
        }
        if (v8 >= v15 || v8 <= 0.0) {
          double v17 = v15;
        }
        else {
          double v17 = v8;
        }
        if (v15 > 0.0) {
          double v8 = v17;
        }
      }
      uint64_t v5 = (char *)[a2 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }
  else
  {
    double v8 = 0.0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007864;
  block[3] = &unk_1000106B8;
  uint64_t v18 = *(void *)(a1 + 32);
  block[4] = v3;
  block[5] = v18;
  *(double *)&block[6] = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_100007864(uint64_t result)
{
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    if (IMOSLoggingEnabled())
    {
      uint64_t v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        uint64_t v3 = *(void *)(v1 + 32);
        int v4 = 138412290;
        uint64_t v5 = v3;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Results of scheduled messages check: %@", (uint8_t *)&v4, 0xCu);
      }
    }
    return (*(uint64_t (**)(double))(*(void *)(v1 + 40) + 16))(*(double *)(v1 + 48));
  }
  return result;
}

uint64_t sub_100007B8C(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    if (IMOSLoggingEnabled())
    {
      uint64_t v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        int v3 = 138412290;
        uint64_t v4 = 0;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Results of watchdog check: %@", (uint8_t *)&v3, 0xCu);
      }
    }
    return (*(uint64_t (**)(double))(*(void *)(v1 + 32) + 16))(0.0);
  }
  return result;
}

uint64_t sub_100007C70(uint64_t result)
{
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    if (IMOSLoggingEnabled())
    {
      uint64_t v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        uint64_t v3 = *(void *)(v1 + 32);
        int v4 = 138412290;
        uint64_t v5 = v3;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Results of watchdog check: %@", (uint8_t *)&v4, 0xCu);
      }
    }
    return (*(uint64_t (**)(double))(*(void *)(v1 + 40) + 16))(*(double *)(v1 + 48));
  }
  return result;
}

uint64_t sub_100008010(uint64_t result)
{
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    if (IMOSLoggingEnabled())
    {
      uint64_t v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        uint64_t v3 = *(void *)(v1 + 32);
        int v4 = 138412290;
        uint64_t v5 = v3;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Results of watchdog check: %@", (uint8_t *)&v4, 0xCu);
      }
    }
    return (*(uint64_t (**)(double))(*(void *)(v1 + 40) + 16))(*(double *)(v1 + 48));
  }
  return result;
}

uint64_t sub_1000080F8(uint64_t result, uint64_t *a2, unsigned char *a3, double *a4, void *a5, void *a6)
{
  if (!result) {
    return result;
  }
  v32 = 0;
  uint64_t v33 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v28 = 0;
  id v29 = 0;
  IMDMessageRecordBulkCopy();
  unsigned __int8 v11 = objc_msgSend(v29, "unsignedLongLongValue", &v30, 0, 0, &v29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                           0,
                           0,
                           &v28,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0);
  unsigned int v12 = [v29 unsignedLongLongValue];
  uint64_t v13 = v28;
  if ((v12 & 0x1000000) == 0)
  {
    double v14 = 0.0;
    if (IMOSLoggingEnabled())
    {
      double v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        CFStringRef v16 = @"YES";
        if ((v11 & 4) == 0) {
          CFStringRef v16 = @"NO";
        }
        *(_DWORD *)buf = 134219522;
        uint64_t v35 = v33;
        __int16 v36 = 2112;
        v37 = v32;
        __int16 v38 = 2112;
        CFStringRef v39 = @"NO";
        __int16 v40 = 2112;
        CFStringRef v41 = v16;
        __int16 v42 = 2048;
        uint64_t v43 = v28;
        __int16 v44 = 2048;
        uint64_t v45 = v31;
        __int16 v46 = 2048;
        uint64_t v47 = v30;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Ignoring non-expirable message with rowID: %lld, guid: %@, is_expirable: %@, from_me: %@, expire_state: %lld, date: %lld, date_played: %lld", buf, 0x48u);
      }
    }
    BOOL v17 = 0;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (v28 <= 2)
  {
    if (v31) {
      +[NSDate __im_dateWithNanosecondTimeIntervalSinceReferenceDate:(double)v31];
    }
    if (v30) {
      +[NSDate __im_dateWithNanosecondTimeIntervalSinceReferenceDate:(double)v30];
    }
    IMMessageItemExpireStateExpiredDuration();
    double v22 = v21;
    IMMessageItemExpireStateExpiringDuration();
    double v24 = v23;
    IMMessageItemTimeIntervalSinceStartedExpiringForTimes();
    double v26 = v24 - v25;
    uint64_t v27 = 2;
    if (v25 > v24) {
      double v26 = v22 - v25;
    }
    else {
      uint64_t v27 = v13;
    }
    BOOL v17 = v25 > v22;
    if (v25 <= v22) {
      uint64_t v13 = v27;
    }
    else {
      uint64_t v13 = 2;
    }
    if (v25 > v22) {
      double v26 = 0.0;
    }
    double v14 = fmax(v26, 0.0);
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  BOOL v17 = 0;
  double v14 = 0.0;
  if (a2) {
LABEL_14:
  }
    *a2 = v13;
LABEL_15:
  if (a3) {
    *a3 = v17;
  }
  if (a4) {
    *a4 = v14;
  }
  if (a5) {
    *a5 = v33;
  }
  uint64_t v18 = v32;
  if (a6) {
    *a6 = v32;
  }
  id v19 = v18;
  id v20 = v29;
  return v28 != v13 || v17;
}

uint64_t sub_1000083F4()
{
  return IMSetDomainIntForKey();
}

uint64_t sub_10000840C()
{
  uint64_t v3 = 0;
  int v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v6 = 0;
  uint64_t v6 = IMGetDomainIntForKey();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000084E4;
  block[3] = &unk_100010708;
  block[4] = &v3;
  if (qword_100014D40 != -1) {
    dispatch_once(&qword_100014D40, block);
  }
  uint64_t v0 = v4[3];
  _Block_object_dispose(&v3, 8);
  return v0;
}

uint64_t sub_1000084E4(uint64_t a1)
{
  uint64_t result = IMDMessageRecordGetMessagesSequenceNumber();
  if (result >= 1)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(void *)(v3 + 24) > result)
    {
      *(void *)(v3 + 24) = 0;
      return IMSetDomainIntForKey();
    }
  }
  return result;
}

id sub_100008A58(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id result = [a3 isSticker];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t sub_100008D74(uint64_t a1, unsigned char *a2, double *a3, void *a4, void *a5)
{
  if (!a1) {
    return 0;
  }
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  uint64_t v33 = 0;
  id v34 = 0;
  uint64_t v31 = 0;
  id v32 = 0;
  uint64_t v30 = 0;
  IMDMessageRecordBulkCopy();
  unsigned __int16 v9 = (unsigned __int16)objc_msgSend(v32, "unsignedLongLongValue", 0, 0, 0, &v32, &v34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           &v30,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           0,
                           &v31,
                           0);
  id v10 = [v32 unsignedLongLongValue];
  if (v33)
  {
    unint64_t v11 = (unint64_t)v10;
    id v12 = +[NSDate __im_dateWithNanosecondTimeIntervalSinceReferenceDate:(double)v33];
    if (v31 == 2)
    {
      if (v30)
      {
        uint64_t v13 = +[NSDictionary dictionaryWithMessageSummaryInfoData:](NSDictionary, "dictionaryWithMessageSummaryInfoData:");
        id v14 = [(NSDictionary *)v13 objectForKey:IMMessageSummaryInfoScheduledMessageLastModifiedTime];
      }
      else
      {
        id v14 = 0;
      }
      if (v14) {
        id v12 = v14;
      }
    }
    id v16 = v34;
    if ([v34 isEqualToString:IMServiceNameiMessageLite])
    {
      double v17 = 3600.0;
    }
    else
    {
      unsigned int v18 = [v16 isEqualToString:IMServiceNameSatelliteSMS];
      double v17 = 600.0;
      if (v18) {
        double v17 = 3600.0;
      }
    }
    sub_1000093B4((uint64_t)v16, v17);
    uint64_t v19 = IMGetCachedDomainIntForKeyWithDefaultValue();
    if ((v11 & 0x200000000) != 0) {
      double v20 = sub_1000093B4(@"Stewie", 3600.0);
    }
    else {
      double v20 = (double)v19;
    }
    [+[NSDate date] timeIntervalSinceReferenceDate];
    double v22 = v21;
    [v12 timeIntervalSinceReferenceDate];
    double v24 = v22 - v23;
    if (v24 <= v20)
    {
      uint64_t v15 = 0;
      double v25 = v20 - v24;
      if (!a2) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }
    if ((v9 & 0x8000) == 0)
    {
      uint64_t v15 = 1;
      goto LABEL_26;
    }
    if (IMOSLoggingEnabled())
    {
      double v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v38 = v35;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Watchdog wants to fail message with guid %@ but message is sent", buf, 0xCu);
      }
    }
  }
  uint64_t v15 = 0;
LABEL_26:
  double v25 = 0.0;
  if (a2) {
LABEL_27:
  }
    *a2 = v15;
LABEL_28:
  if (a3) {
    *a3 = fmax(v25, 0.0);
  }
  if (a4) {
    *a4 = v36;
  }
  uint64_t v27 = v35;
  if (a5) {
    *a5 = v35;
  }
  id v28 = v27;

  return v15;
}

uint64_t sub_1000090DC(int a1)
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v4[0] = 67109120;
      v4[1] = a1;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Updating watchdog message watermark to %d", (uint8_t *)v4, 8u);
    }
  }
  return IMSetDomainIntForKey();
}

uint64_t sub_1000091B8()
{
  uint64_t v3 = 0;
  int v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v6 = 0;
  uint64_t v6 = IMGetDomainIntForKey();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009290;
  block[3] = &unk_100010708;
  block[4] = &v3;
  if (qword_100014D48 != -1) {
    dispatch_once(&qword_100014D48, block);
  }
  uint64_t v0 = v4[3];
  _Block_object_dispose(&v3, 8);
  return v0;
}

uint64_t sub_100009290(uint64_t a1)
{
  uint64_t result = IMDMessageRecordGetMessagesSequenceNumber();
  if (result >= 1)
  {
    int v3 = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) > result)
    {
      if (IMOSLoggingEnabled())
      {
        int v4 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
          v6[0] = 67109376;
          v6[1] = v5;
          __int16 v7 = 1024;
          int v8 = v3;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Watchdog watermark (%d) was greater than sequence number (%d) - resetting", (uint8_t *)v6, 0xEu);
        }
      }
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      return sub_1000090DC(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
    }
  }
  return result;
}

double sub_1000093B4(uint64_t a1, double a2)
{
  id v4 = objc_msgSend(+[FTServerBag sharedInstanceForBagType:](FTServerBag, "sharedInstanceForBagType:", 1), "objectForKey:", @"md-watchdog-duration");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return a2;
  }
  id v5 = [v4 objectForKeyedSubscript:a1];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return a2;
  }
  [v5 doubleValue];
  if (v6 == 0.0) {
    return a2;
  }
  [v5 doubleValue];
  return result;
}

void sub_100009548(id a1)
{
  qword_100014D68 = objc_alloc_init(IMDMSASMSRoutingAgent);
}

void sub_100009C84(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x100009C54);
  }
  _Unwind_Resume(a1);
}

void sub_100009E1C(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x100009DE8);
  }
  _Unwind_Resume(a1);
}

void sub_100009FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000A014(uint64_t a1)
{
  id result = (id)IMDMessageRecordGetMessagesSequenceNumber();
  int v3 = (int)result;
  if ((int)result >= 1 && *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) > (int)result)
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v5 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        v6[0] = 67109376;
        v6[1] = v5;
        __int16 v7 = 1024;
        int v8 = v3;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Watermark (%d) was greater than sequence number (%d) - resetting", (uint8_t *)v6, 0xEu);
      }
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    return [*(id *)(a1 + 32) _updateUndeliveredMessageWaterMark:*(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  }
  return result;
}

uint64_t sub_10000A48C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10000A968(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x10000A6F0);
  }
  _Unwind_Resume(a1);
}

void sub_10000B148(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x10000B104);
  }
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(exc_buf);
}

void sub_10000B1DC(void *exc_buf, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x10000ADF0);
  }
  JUMPOUT(0x10000B1BCLL);
}

BOOL sub_10000B1F8(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "_attachmentCanBeSentViaMMS:") & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = [a3 GUID];
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Attachment (%@) cannot be sent via MMS", (uint8_t *)&v11, 0xCu);
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  CFStringRef v8 = (const __CFString *)[a3 UTIType];
  BOOL result = sub_100005B20(v8);
  if (result)
  {
    uint64_t v10 = *(void *)(a1 + 48);
  }
  else
  {
    BOOL result = sub_100005A9C(v8);
    if (result)
    {
      uint64_t v10 = *(void *)(a1 + 56);
    }
    else
    {
      BOOL result = sub_100005AC8(v8);
      if (!result) {
        goto LABEL_13;
      }
      uint64_t v10 = *(void *)(a1 + 64);
    }
  }
  ++*(void *)(*(void *)(v10 + 8) + 24);
LABEL_13:
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

void sub_10000B3C4(uint64_t a1, void *a2)
{
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v50 = a2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Got candidate messages: %@", buf, 0xCu);
    }
  }
  id v43 = objc_alloc_init((Class)NSMutableArray);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v5 = [a2 countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (!v5)
  {
    double v9 = 0.0;
    uint64_t v7 = 0x7FFFFFFFLL;
    if (a2) {
      goto LABEL_54;
    }
LABEL_59:
    if (IMOSLoggingEnabled())
    {
      __int16 v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Updating watermark because we received no candidate messages", buf, 2u);
      }
    }
    uint64_t v7 = IMDMessageRecordCountMessages();
    goto LABEL_63;
  }
  char v44 = 0;
  uint64_t v7 = 0x7FFFFFFFLL;
  uint64_t v8 = *(void *)v46;
  double v9 = 0.0;
  *(void *)&long long v6 = 138412546;
  long long v42 = v6;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v46 != v8) {
        objc_enumerationMutation(a2);
      }
      int v11 = *(void **)(*((void *)&v45 + 1) + 8 * i);
      if ((objc_msgSend(objc_msgSend(objc_msgSend(v11, "participants", v42), "__imFirstObject"), "_appearsToBePhoneNumber") & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          id v14 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            id v15 = [v11 GUID];
            *(_DWORD *)buf = 138412290;
            id v50 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Message (%@) is not to a phone number, not downgrading", buf, 0xCu);
          }
        }
        [v11 senderLogin];
        goto LABEL_19;
      }
      id v12 = [v11 senderLogin];
      if ([v12 length]
        && ([v12 hasPrefix:@"p:"] & 1) == 0
        && ([v12 hasPrefix:@"P:"] & 1) == 0)
      {
        if (!IMOSLoggingEnabled()) {
          goto LABEL_19;
        }
        v37 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v37, OS_LOG_TYPE_INFO)) {
          goto LABEL_19;
        }
        id v38 = [v11 GUID];
        *(_DWORD *)buf = v42;
        id v50 = v38;
        __int16 v51 = 2112;
        double v52 = *(double *)&v12;
        id v32 = v37;
        uint64_t v33 = "Message (%@) is not from a phone number (sender:'%@'), not downgrading to SMS";
        uint32_t v34 = 22;
        goto LABEL_47;
      }
      if ([*(id *)(a1 + 32) canSendMessage:v11])
      {
        int v13 = 1;
        goto LABEL_20;
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          id v31 = [v11 GUID];
          *(_DWORD *)buf = 138412290;
          id v50 = v31;
          id v32 = v30;
          uint64_t v33 = "Message (%@) cannot be sent via SMS/MMS, not downgrading";
          uint32_t v34 = 12;
LABEL_47:
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, v33, buf, v34);
        }
      }
LABEL_19:
      int v13 = 0;
LABEL_20:
      [*(id *)(a1 + 32) _upperDowngradeIntervalForMessage:v11];
      double v17 = v16;
      [v11 timeSinceSent];
      double v19 = v18;
      if (v17 > 0.0 && v18 < v17)
      {
        if (v13)
        {
          [*(id *)(a1 + 32) _lowerDowngradeIntervalForMessage:v11];
          double v26 = v25;
          double v27 = v25 - v19;
          if (v25 - v19 <= 0.0)
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v35 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                id v36 = [v11 GUID];
                *(_DWORD *)buf = 138412802;
                id v50 = v36;
                __int16 v51 = 2048;
                double v52 = v26;
                __int16 v53 = 2048;
                double v54 = v19;
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Message with GUID: (%@) is ready to be sent immediately (downgradeInterval:%7.3f  timeSinceSent:%7.3f)", buf, 0x20u);
              }
            }
            [v43 addObject:v11];
          }
          else
          {
            if ((v44 & (v9 < v27)) == 0) {
              double v9 = v25 - v19;
            }
            if (IMOSLoggingEnabled())
            {
              id v28 = OSLogHandleForIMFoundationCategory();
              char v44 = 1;
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                id v29 = [v11 GUID];
                *(_DWORD *)buf = v42;
                id v50 = v29;
                __int16 v51 = 2048;
                double v52 = v27;
                char v44 = 1;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Scheduling message with GUID: (%@) to fire in %7.3f seconds", buf, 0x16u);
              }
            }
            else
            {
              char v44 = 1;
            }
          }
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          double v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            id v22 = [v11 GUID];
            *(_DWORD *)buf = 138412802;
            id v50 = v22;
            __int16 v51 = 2048;
            double v52 = v19;
            __int16 v53 = 2048;
            double v54 = v17;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Message (%@) was sent %f seconds ago, skipping since it's over %f seconds old", buf, 0x20u);
          }
        }
        id v23 = [v11 rowID];
        uint64_t v24 = (int)v7;
        if ((uint64_t)v23 <= (int)v7) {
          uint64_t v24 = (uint64_t)[v11 rowID];
        }
        uint64_t v7 = v24;
      }
    }
    id v5 = [a2 countByEnumeratingWithState:&v45 objects:v55 count:16];
  }
  while (v5);
  if (!a2) {
    goto LABEL_59;
  }
LABEL_54:
  if (![a2 count]) {
    goto LABEL_59;
  }
  if (v7 != 0x7FFFFFFF)
  {
    if (IMOSLoggingEnabled())
    {
      CFStringRef v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Updating watermark to lowestIgnoredMessageDueToAge", buf, 2u);
      }
    }
LABEL_63:
    [*(id *)(a1 + 32) _updateUndeliveredMessageWaterMark:v7];
  }
  uint64_t v41 = *(void *)(a1 + 40);
  if (v41) {
    (*(void (**)(uint64_t, id, double))(v41 + 16))(v41, v43, v9);
  }
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

CFDictionaryRef CGImageSourceCopyProperties(CGImageSourceRef isrc, CFDictionaryRef options)
{
  return _CGImageSourceCopyProperties(isrc, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCopyPropertiesAtIndex(isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithURL(url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return _CGImageSourceGetCount(isrc);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

uint64_t IMAVURLAssetOptionsDefault()
{
  return _IMAVURLAssetOptionsDefault();
}

uint64_t IMBalloonExtensionIDWithSuffix()
{
  return _IMBalloonExtensionIDWithSuffix();
}

uint64_t IMDAuditTokenTaskHasEntitlement()
{
  return _IMDAuditTokenTaskHasEntitlement();
}

uint64_t IMDChatRecordCopyChatForGUID()
{
  return _IMDChatRecordCopyChatForGUID();
}

uint64_t IMDChatRecordCopyHandles()
{
  return _IMDChatRecordCopyHandles();
}

uint64_t IMDHandleRecordCopyID()
{
  return _IMDHandleRecordCopyID();
}

uint64_t IMDMessageRecordBulkCopy()
{
  return _IMDMessageRecordBulkCopy();
}

uint64_t IMDMessageRecordCopyAttachments()
{
  return _IMDMessageRecordCopyAttachments();
}

uint64_t IMDMessageRecordCopyChats()
{
  return _IMDMessageRecordCopyChats();
}

uint64_t IMDMessageRecordCopyExpiringOrExpiredMessages()
{
  return _IMDMessageRecordCopyExpiringOrExpiredMessages();
}

uint64_t IMDMessageRecordCopyGUIDForMessage()
{
  return _IMDMessageRecordCopyGUIDForMessage();
}

uint64_t IMDMessageRecordCopyMessageForGUID()
{
  return _IMDMessageRecordCopyMessageForGUID();
}

uint64_t IMDMessageRecordCopyUndeliveredOneToOneiMessages()
{
  return _IMDMessageRecordCopyUndeliveredOneToOneiMessages();
}

uint64_t IMDMessageRecordCopyUnsentUnfailedMessages()
{
  return _IMDMessageRecordCopyUnsentUnfailedMessages();
}

uint64_t IMDMessageRecordCountMessages()
{
  return _IMDMessageRecordCountMessages();
}

uint64_t IMDMessageRecordGetDate()
{
  return _IMDMessageRecordGetDate();
}

uint64_t IMDMessageRecordGetMessagesSequenceNumber()
{
  return _IMDMessageRecordGetMessagesSequenceNumber();
}

uint64_t IMGetCachedDomainIntForKeyWithDefaultValue()
{
  return _IMGetCachedDomainIntForKeyWithDefaultValue();
}

uint64_t IMGetCachedDomainValueForKey()
{
  return _IMGetCachedDomainValueForKey();
}

uint64_t IMGetDomainIntForKey()
{
  return _IMGetDomainIntForKey();
}

uint64_t IMGetXPCArrayFromDictionary()
{
  return _IMGetXPCArrayFromDictionary();
}

uint64_t IMGetXPCIntFromDictionary()
{
  return _IMGetXPCIntFromDictionary();
}

uint64_t IMGetXPCStringFromDictionary()
{
  return _IMGetXPCStringFromDictionary();
}

uint64_t IMInsertDictionariesToXPCDictionary()
{
  return _IMInsertDictionariesToXPCDictionary();
}

uint64_t IMInsertIntsToXPCDictionary()
{
  return _IMInsertIntsToXPCDictionary();
}

uint64_t IMMessageItemExpireStateExpiredDuration()
{
  return _IMMessageItemExpireStateExpiredDuration();
}

uint64_t IMMessageItemExpireStateExpiringDuration()
{
  return _IMMessageItemExpireStateExpiringDuration();
}

uint64_t IMMessageItemTimeIntervalSinceStartedExpiringForTimes()
{
  return _IMMessageItemTimeIntervalSinceStartedExpiringForTimes();
}

uint64_t IMOSLoggingEnabled()
{
  return _IMOSLoggingEnabled();
}

uint64_t IMProcessNameForPid()
{
  return _IMProcessNameForPid();
}

uint64_t IMSMSEnabled()
{
  return _IMSMSEnabled();
}

uint64_t IMSMSFallbackEnabled()
{
  return _IMSMSFallbackEnabled();
}

uint64_t IMSetDomainIntForKey()
{
  return _IMSetDomainIntForKey();
}

uint64_t IMSetEmbeddedTempDirectory()
{
  return _IMSetEmbeddedTempDirectory();
}

uint64_t JWDecodeDictionary()
{
  return _JWDecodeDictionary();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return _OSLogHandleForIMFoundationCategory();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return _UTTypeConformsTo(inUTI, inConformsToUTI);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _IMDAttachmentRecordBulkCopy()
{
  return __IMDAttachmentRecordBulkCopy();
}

uint64_t _IMDChatRecordBulkCopy()
{
  return __IMDChatRecordBulkCopy();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
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

void objc_enumerationMutation(id obj)
{
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
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

id objc_msgSend_GUID(void *a1, const char *a2, ...)
{
  return [a1 GUID];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UTIType(void *a1, const char *a2, ...)
{
  return [a1 UTIType];
}

id objc_msgSend__appearsToBePhoneNumber(void *a1, const char *a2, ...)
{
  return [a1 _appearsToBePhoneNumber];
}

id objc_msgSend__undeliveredMessageWaterMark(void *a1, const char *a2, ...)
{
  return [a1 _undeliveredMessageWaterMark];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_chatProperties(void *a1, const char *a2, ...)
{
  return [a1 chatProperties];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_iMessageOnly(void *a1, const char *a2, ...)
{
  return [a1 iMessageOnly];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isCheckInMessage(void *a1, const char *a2, ...)
{
  return [a1 isCheckInMessage];
}

id objc_msgSend_isKeyTransparencyVerifiedMessage(void *a1, const char *a2, ...)
{
  return [a1 isKeyTransparencyVerifiedMessage];
}

id objc_msgSend_isRCSEnabled(void *a1, const char *a2, ...)
{
  return [a1 isRCSEnabled];
}

id objc_msgSend_isSticker(void *a1, const char *a2, ...)
{
  return [a1 isSticker];
}

id objc_msgSend_lastAddressedHandle(void *a1, const char *a2, ...)
{
  return [a1 lastAddressedHandle];
}

id objc_msgSend_lastAddressedSIMID(void *a1, const char *a2, ...)
{
  return [a1 lastAddressedSIMID];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mimeType(void *a1, const char *a2, ...)
{
  return [a1 mimeType];
}

id objc_msgSend_participants(void *a1, const char *a2, ...)
{
  return [a1 participants];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_rowID(void *a1, const char *a2, ...)
{
  return [a1 rowID];
}

id objc_msgSend_senderLogin(void *a1, const char *a2, ...)
{
  return [a1 senderLogin];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_smsRoutingAgent(void *a1, const char *a2, ...)
{
  return [a1 smsRoutingAgent];
}

id objc_msgSend_subject(void *a1, const char *a2, ...)
{
  return [a1 subject];
}

id objc_msgSend_synchronousDatabase(void *a1, const char *a2, ...)
{
  return [a1 synchronousDatabase];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeSinceSent(void *a1, const char *a2, ...)
{
  return [a1 timeSinceSent];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}