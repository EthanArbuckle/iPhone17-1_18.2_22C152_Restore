@interface IMDMessageServicesAgentController
+ (id)sharedInstance;
- (_IMDChatRecordStruct)copyBestChatWithGuid:(id)a3 message:(_IMDMessageRecordStruct *)a4;
- (id)_routingDictionaryForService:(id)a3 extraFlags:(unint64_t)a4 updateProperties:(BOOL)a5;
- (void)_chooseRouteForMessage:(id)a3 downgradableServices:(id)a4 error:(unsigned int)a5 handler:(id)a6;
- (void)checkExpireStateForMessage:(id)a3 handler:(id)a4;
- (void)checkExpireStateWithHandler:(id)a3;
- (void)checkForPendingRoutingWithHandler:(id)a3;
- (void)checkScheduledMessageForGUID:(id)a3 handler:(id)a4;
- (void)checkScheduledMessageWithHandler:(id)a3;
- (void)checkWatchdogForMessage:(id)a3 handler:(id)a4;
- (void)checkWatchdogWithHandler:(id)a3;
- (void)chooseRouteForMessage:(id)a3 downgradableServices:(id)a4 withError:(unsigned int)a5 inChat:(id)a6 handler:(id)a7;
@end

@implementation IMDMessageServicesAgentController

+ (id)sharedInstance
{
  if (qword_100014D30 != -1) {
    dispatch_once(&qword_100014D30, &stru_1000105F0);
  }
  return (id)qword_100014D38;
}

- (id)_routingDictionaryForService:(id)a3 extraFlags:(unint64_t)a4 updateProperties:(BOOL)a5
{
  BOOL v5 = a5;
  id result = [a3 length];
  if (result)
  {
    uint64_t v9 = IMDMessageServicesServiceKey;
    v10 = +[NSNumber numberWithUnsignedLongLong:a4];
    uint64_t v11 = IMDMessageServicesFlagsKey;
    v12 = +[NSNumber numberWithBool:v5];
    return +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", a3, v9, v10, v11, v12, IMDMessageServicesUpdateDowngradePropertiesKey, 0);
  }
  return result;
}

- (_IMDChatRecordStruct)copyBestChatWithGuid:(id)a3 message:(_IMDMessageRecordStruct *)a4
{
  if ([a3 length])
  {
    v6 = (_IMDChatRecordStruct *)IMDChatRecordCopyChatForGUID();
    if (!a4) {
      return v6;
    }
  }
  else
  {
    v6 = 0;
    if (!a4) {
      return v6;
    }
  }
  if (!v6)
  {
    if (IMOSLoggingEnabled())
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = a3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Could not find message with chatGUID:%@", (uint8_t *)&v12, 0xCu);
      }
    }
    CFArrayRef v8 = (const __CFArray *)IMDMessageRecordCopyChats();
    CFArrayRef v9 = v8;
    if (v8)
    {
      if ((int)CFArrayGetCount(v8) < 1)
      {
        v6 = 0;
      }
      else
      {
        ValueAtIndex = (_IMDChatRecordStruct *)CFArrayGetValueAtIndex(v9, 0);
        v6 = ValueAtIndex;
        if (ValueAtIndex) {
          CFRetain(ValueAtIndex);
        }
      }
      CFRelease(v9);
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

- (void)_chooseRouteForMessage:(id)a3 downgradableServices:(id)a4 error:(unsigned int)a5 handler:(id)a6
{
  id v7 = a3;
  if (a3)
  {
    if ([a3 service] && objc_msgSend(a4, "containsObject:", objc_msgSend(v7, "service")))
    {
      if (IMSMSFallbackEnabled())
      {
        if (objc_msgSend(+[IMDMSASMSRoutingAgent smsRoutingAgent](IMDMSASMSRoutingAgent, "smsRoutingAgent"), "shouldSendMessage:", v7))
        {
          id v11 = [v7 GUID];
          id v7 = (id)IMServiceNameSMS;
          unint64_t v12 = (unint64_t)(a5 != 22) << 19;
          BOOL v13 = a5 - 12 < 0xFFFFFFFA;
          goto LABEL_13;
        }
      }
      else if (IMOSLoggingEnabled())
      {
        v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          int v17 = 138412290;
          id v18 = [v7 GUID];
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Message (%@) cannot be sent via SMS because sms fallback is not enabled", (uint8_t *)&v17, 0xCu);
        }
      }
    }
    BOOL v13 = 0;
    unint64_t v12 = 0;
    id v7 = 0;
  }
  else
  {
    BOOL v13 = 0;
    unint64_t v12 = 0;
  }
  id v11 = 0;
LABEL_13:
  v15 = [(IMDMessageServicesAgentController *)self _routingDictionaryForService:v7 extraFlags:v12 updateProperties:v13];
  if (!v15) {
    goto LABEL_16;
  }
  if ([v11 length])
  {
    v15 = +[NSDictionary dictionaryWithObject:v15 forKey:v11];
LABEL_16:
    if (!a6) {
      return;
    }
    goto LABEL_17;
  }
  v15 = 0;
  if (!a6) {
    return;
  }
LABEL_17:
  if (IMOSLoggingEnabled())
  {
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412546;
      id v18 = v7;
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Chose route:%@ for message:%@", (uint8_t *)&v17, 0x16u);
    }
  }
  (*((void (**)(id, NSDictionary *, double))a6 + 2))(a6, v15, 0.0);
}

- (void)chooseRouteForMessage:(id)a3 downgradableServices:(id)a4 withError:(unsigned int)a5 inChat:(id)a6 handler:(id)a7
{
  BOOL v13 = (const void *)IMDMessageRecordCopyMessageForGUID();
  v14 = [(IMDMessageServicesAgentController *)self copyBestChatWithGuid:a6 message:v13];
  if (!v14)
  {
    if (IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v20 = a3;
        __int16 v21 = 2112;
        id v22 = a6;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Could not find a chat for message with GUID:%@   chatGUID:%@", buf, 0x16u);
      }
    }
  }
  v16 = [[IMDMSAMessage alloc] initWithMessage:v13 inChat:v14];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000061F0;
  block[3] = &unk_100010618;
  block[4] = a3;
  block[5] = a6;
  block[6] = v16;
  block[7] = self;
  unsigned int v18 = a5;
  block[8] = a4;
  block[9] = a7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  if (v14) {
    CFRelease(v14);
  }
  if (v13) {
    CFRelease(v13);
  }
}

- (void)checkForPendingRoutingWithHandler:(id)a3
{
  int v5 = IMSMSEnabled();
  int v6 = IMSMSFallbackEnabled();
  unsigned int v7 = [+[IMSharedMessageSendingUtilities sharedInstance] isRCSEnabled];
  if (IMOSLoggingEnabled())
  {
    CFArrayRef v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      CFStringRef v9 = @"NO";
      if (v5) {
        CFStringRef v10 = @"YES";
      }
      else {
        CFStringRef v10 = @"NO";
      }
      if (v6) {
        CFStringRef v11 = @"YES";
      }
      else {
        CFStringRef v11 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      if (v7) {
        CFStringRef v9 = @"YES";
      }
      *(_WORD *)&buf[22] = 2112;
      CFStringRef v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Checking pending route  (SMS Enabled: %@    Fallback Enabled: %@   RCSEnabled: %@)", buf, 0x20u);
    }
  }
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v27) = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  BOOL v13 = dispatch_group_create();
  dispatch_group_enter(v13);
  if ((v5 & v6 | v7) == 1)
  {
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Checking for fallback messages...", v22, 2u);
      }
    }
    id v15 = +[IMDMSASMSRoutingAgent smsRoutingAgent];
    dispatch_group_enter(v13);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000066BC;
    v20[3] = &unk_100010640;
    v20[4] = self;
    v20[5] = v12;
    v20[7] = buf;
    v20[8] = v21;
    v20[6] = v13;
    [v15 getRoutableMessages:v20];
  }
  else if (IMOSLoggingEnabled())
  {
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      CFStringRef v17 = @"NO";
      if (v5) {
        CFStringRef v18 = @"YES";
      }
      else {
        CFStringRef v18 = @"NO";
      }
      if (v6) {
        CFStringRef v17 = @"YES";
      }
      *(_DWORD *)id v22 = 138412546;
      CFStringRef v23 = v18;
      __int16 v24 = 2112;
      CFStringRef v25 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Not getting pending routes (isSMSEnabled:%@  isSMSFallBackEnabled:%@)", v22, 0x16u);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006940;
  block[3] = &unk_100010668;
  block[6] = a3;
  block[7] = v21;
  block[4] = v12;
  block[5] = v13;
  dispatch_group_notify(v13, (dispatch_queue_t)&_dispatch_main_q, block);
  dispatch_group_leave(v13);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(buf, 8);
}

- (void)checkExpireStateForMessage:(id)a3 handler:(id)a4
{
  id v5 = [a4 copy];
  if (IMOSLoggingEnabled())
  {
    int v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Check expire state for message: %@", buf, 0xCu);
    }
  }
  if (a3)
  {
    uint64_t v7 = IMDMessageRecordCopyMessageForGUID();
    CFArrayRef v8 = (const void *)v7;
    *(void *)buf = 0;
    unsigned __int8 v16 = 0;
    uint64_t v15 = 0;
    if (v7 && sub_1000080F4(v7, buf, &v16, &v15, 0, 0))
    {
      id v9 = objc_alloc((Class)NSDictionary);
      CFStringRef v10 = +[NSNumber numberWithLongLong:*(void *)buf];
      CFStringRef v11 = +[NSNumber numberWithBool:v16];
      id v12 = objc_msgSend(v9, "initWithObjectsAndKeys:", v10, IMDMessageServicesExpireStateKey, v11, IMDMessageServicesExpireStateShouldDeleteKey, 0);
      BOOL v13 = +[NSDictionary dictionaryWithObject:v12 forKey:a3];
    }
    else
    {
      BOOL v13 = 0;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006CF8;
    block[3] = &unk_1000106B8;
    block[4] = v13;
    block[5] = v5;
    block[6] = v15;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    if (v8) {
      CFRelease(v8);
    }
  }
  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100006C14;
    v17[3] = &unk_100010690;
    v17[4] = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v17);
  }
}

- (void)checkExpireStateWithHandler:(id)a3
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Check expire state for messages", buf, 2u);
    }
  }
  sub_10000840C();
  v4 = (void *)IMDMessageRecordCopyExpiringOrExpiredMessages();
  id v22 = objc_alloc_init((Class)NSMutableDictionary);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v30;
    uint64_t v8 = IMDMessageServicesExpireStateKey;
    uint64_t v9 = IMDMessageServicesExpireStateShouldDeleteKey;
    double v10 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        *(void *)buf = 0;
        unsigned __int8 v27 = 0;
        uint64_t v25 = 0;
        double v26 = 0.0;
        uint64_t v24 = 0;
        int v13 = sub_1000080F4(v12, buf, &v27, &v26, &v25, &v24);
        if (v24) {
          int v14 = v13;
        }
        else {
          int v14 = 0;
        }
        if (v14 == 1)
        {
          id v15 = objc_alloc((Class)NSDictionary);
          unsigned __int8 v16 = +[NSNumber numberWithLongLong:*(void *)buf];
          id v17 = objc_msgSend(v15, "initWithObjectsAndKeys:", v16, v8, +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v27), v9, 0);
          [v22 setObject:v17 forKey:v24];
        }
        if (v27)
        {
          if (v6 >= v25) {
            uint64_t v18 = v25;
          }
          else {
            uint64_t v18 = v6;
          }
          if (v6 <= 0) {
            uint64_t v6 = v25;
          }
          else {
            uint64_t v6 = v18;
          }
        }
        if (v10 >= v26 || v10 <= 0.0) {
          double v20 = v26;
        }
        else {
          double v20 = v10;
        }
        if (v26 > 0.0) {
          double v10 = v20;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v5);
    if (v6 >= 1) {
      sub_1000083F4();
    }
  }
  else
  {
    double v10 = 0.0;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000070C8;
  block[3] = &unk_1000106B8;
  block[4] = v22;
  block[5] = a3;
  *(double *)&block[6] = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)checkScheduledMessageForGUID:(id)a3 handler:(id)a4
{
  id v5 = [a4 copy];
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Check scheduled message for guid: %@", buf, 0xCu);
    }
  }
  if (a3)
  {
    uint64_t v7 = (const void *)IMDMessageRecordCopyMessageForGUID();
    uint64_t Date = IMDMessageRecordGetDate();
    id v9 = objc_alloc((Class)NSDictionary);
    double v10 = +[NSNumber numberWithLongLong:Date];
    id v11 = objc_msgSend(v9, "initWithObjectsAndKeys:", v10, IMDMessageServicesScheduledDateKey, 0);
    uint64_t v12 = +[NSDictionary dictionaryWithObject:v11 forKey:a3];

    objc_msgSend(+[NSDate __im_dateWithNanosecondTimeIntervalSinceReferenceDate:](NSDate, "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)Date), "timeIntervalSinceNow");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000074C0;
    block[3] = &unk_1000106B8;
    block[4] = v12;
    block[5] = v5;
    block[6] = v13;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    if (v7) {
      CFRelease(v7);
    }
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000073DC;
    v15[3] = &unk_100010690;
    v15[4] = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);
  }
}

- (void)checkScheduledMessageWithHandler:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100007630;
  v3[3] = &unk_1000106E0;
  v3[4] = a3;
  objc_msgSend(+[IMDDatabase synchronousDatabase](IMDDatabase, "synchronousDatabase"), "fetchScheduledMessageRecordsForChatRecordWithGUID:limit:completionHandler:", 0, 100, v3);
}

- (void)checkWatchdogForMessage:(id)a3 handler:(id)a4
{
  id v5 = [a4 copy];
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Check watchdog for message: %@", buf, 0xCu);
    }
  }
  if (a3)
  {
    uint64_t v7 = IMDMessageRecordCopyMessageForGUID();
    uint64_t v8 = (const void *)v7;
    unsigned __int8 v14 = 0;
    *(void *)buf = 0;
    if (v7 && sub_100008D74(v7, &v14, (double *)buf, 0, 0))
    {
      id v9 = objc_alloc((Class)NSDictionary);
      double v10 = +[NSNumber numberWithBool:v14];
      id v11 = objc_msgSend(v9, "initWithObjectsAndKeys:", v10, IMDMessageServicesWatchdogShouldFailSendKey, 0);
      uint64_t v12 = +[NSDictionary dictionaryWithObject:v11 forKey:a3];
    }
    else
    {
      uint64_t v12 = 0;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007C70;
    block[3] = &unk_1000106B8;
    block[4] = v12;
    block[5] = v5;
    block[6] = *(void *)buf;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    if (v8) {
      CFRelease(v8);
    }
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100007B8C;
    v15[3] = &unk_100010690;
    v15[4] = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);
  }
}

- (void)checkWatchdogWithHandler:(id)a3
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Check watchdog for messages", buf, 2u);
    }
  }
  sub_1000091B8();
  v4 = (void *)IMDMessageRecordCopyUnsentUnfailedMessages();
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v27;
    uint64_t v9 = IMDMessageServicesWatchdogShouldFailSendKey;
    double v10 = 0.0;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        unsigned __int8 v25 = 0;
        uint64_t v23 = 0;
        *(double *)buf = 0.0;
        uint64_t v22 = 0;
        int v13 = sub_100008D74(v12, &v25, (double *)buf, &v23, &v22);
        if (v22) {
          int v14 = v13;
        }
        else {
          int v14 = 0;
        }
        if (v14 == 1)
        {
          id v15 = objc_alloc((Class)NSDictionary);
          id v16 = objc_msgSend(v15, "initWithObjectsAndKeys:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v25), v9, 0);
          [v5 setObject:v16 forKey:v22];
        }
        if (v25)
        {
          if (v7 >= v23) {
            uint64_t v17 = v23;
          }
          else {
            uint64_t v17 = v7;
          }
          if (v7 <= 0) {
            uint64_t v7 = v23;
          }
          else {
            uint64_t v7 = v17;
          }
        }
        if (v10 >= *(double *)buf || v10 <= 0.0) {
          double v19 = *(double *)buf;
        }
        else {
          double v19 = v10;
        }
        if (*(double *)buf > 0.0) {
          double v10 = v19;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
    if (v7 >= 1) {
      sub_1000090DC(v7);
    }
  }
  else
  {
    double v10 = 0.0;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008010;
  block[3] = &unk_1000106B8;
  block[4] = v5;
  block[5] = a3;
  *(double *)&block[6] = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

@end