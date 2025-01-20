@interface IMDMSASMSRoutingAgent
+ (id)smsRoutingAgent;
- (BOOL)__attachmentPassesDurationRestrictions:(id)a3;
- (BOOL)__attachmentPassesMMSRestrictions:(id)a3;
- (BOOL)__isSendableType:(id)a3;
- (BOOL)_attachmentCanBeSentViaMMS:(id)a3;
- (BOOL)_messageHasDowngradeMarkers:(id)a3;
- (BOOL)canSendMessage:(id)a3;
- (BOOL)shouldSendMessage:(id)a3;
- (IMDMSASMSRoutingAgent)init;
- (double)_lowerDowngradeIntervalForMessage:(id)a3;
- (double)_upperDowngradeIntervalForMessage:(id)a3;
- (int)_undeliveredMessageWaterMark;
- (int64_t)_bagValueForKey:(id)a3 defaultValue:(int64_t)a4 minimumValue:(int64_t)a5;
- (void)_getCandidateMessages:(id)a3;
- (void)_updateUndeliveredMessageWaterMark:(int)a3;
- (void)getRoutableMessages:(id)a3;
@end

@implementation IMDMSASMSRoutingAgent

+ (id)smsRoutingAgent
{
  if (qword_100014D50 != -1) {
    dispatch_once(&qword_100014D50, &stru_100010750);
  }
  if (qword_100014D58 != -1) {
    dispatch_once(&qword_100014D58, &stru_100010770);
  }
  if (qword_100014D60 != -1) {
    dispatch_once(&qword_100014D60, &stru_100010790);
  }
  return (id)qword_100014D68;
}

- (IMDMSASMSRoutingAgent)init
{
  v3.receiver = self;
  v3.super_class = (Class)IMDMSASMSRoutingAgent;
  return [(IMDMSASMSRoutingAgent *)&v3 init];
}

- (int64_t)_bagValueForKey:(id)a3 defaultValue:(int64_t)a4 minimumValue:(int64_t)a5
{
  id v7 = objc_msgSend(+[FTServerBag sharedInstanceForBagType:](FTServerBag, "sharedInstanceForBagType:", 1), "objectForKey:", a3);
  if (!v7) {
    return a4;
  }
  v8 = v7;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return a4;
  }
  a4 = a5;
  if ((uint64_t)[v8 integerValue] < a5) {
    return a4;
  }
  return (int64_t)[v8 integerValue];
}

- (BOOL)__isSendableType:(id)a3
{
  if (sub_100005B20((const __CFString *)a3)
    || sub_100005A9C((const __CFString *)a3)
    || sub_100005AC8((const __CFString *)a3))
  {
    return 1;
  }
  return sub_100005AF4((const __CFString *)a3);
}

- (BOOL)__attachmentPassesDurationRestrictions:(id)a3
{
  id v3 = a3;
  CFStringRef v4 = (const __CFString *)[a3 UTIType];
  id v5 = [v3 path];
  LOBYTE(v3) = sub_100005AC8(v4);
  BOOL v6 = sub_100005A9C(v4);
  if ((v3 & 1) == 0 && !v6) {
    return 1;
  }
  double v7 = 0.0;
  if (![v5 length]) {
    goto LABEL_8;
  }
  v9 = +[NSURL fileURLWithPath:v5];
  if (!v9)
  {
LABEL_8:
    char v12 = 1;
    double Seconds = 0.0;
    goto LABEL_16;
  }
  id v10 = [objc_alloc((Class)AVURLAsset) initWithURL:v9 options:IMAVURLAssetOptionsDefault()];
  v11 = v10;
  if (v10) {
    [v10 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);

  if (Seconds > 0.0)
  {
    if (sub_100005AC8(v4)) {
      +[IMCTSMSUtilities IMMMSMaximumVideoDurationForPhoneNumber:0 simID:0];
    }
    else {
      +[IMCTSMSUtilities IMMMSMaximumAudioDurationForPhoneNumber:0 simID:0];
    }
    double v7 = v14;
    char v12 = 0;
  }
  else
  {
    char v12 = 1;
  }
LABEL_16:
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      double v20 = Seconds;
      __int16 v21 = 2048;
      double v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Comparing media duration (%f) against maximum: %f", buf, 0x16u);
    }
  }
  if (v7 <= 0.0) {
    char v16 = 1;
  }
  else {
    char v16 = v12;
  }
  BOOL result = Seconds < v7;
  if (v16) {
    return 1;
  }
  return result;
}

- (BOOL)__attachmentPassesMMSRestrictions:(id)a3
{
  if (!+[IMCTSMSUtilities IMMMSRestrictedModeEnabledForPhoneNumber:0 simID:0])return 1; {
  CGFloat width = CGSizeZero.width;
  }
  CGFloat height = CGSizeZero.height;
  id v6 = objc_alloc_init((Class)NSFileManager);
  CFStringRef v7 = (const __CFString *)[a3 path];
  CFStringRef v8 = (const __CFString *)[a3 UTIType];
  id v9 = [a3 mimeType];
  if ([v6 fileExistsAtPath:v7])
  {
    LODWORD(v10) = objc_msgSend(objc_msgSend(objc_msgSend(v6, "attributesOfItemAtPath:error:", v7, 0), "objectForKey:", NSFileSize), "intValue");
    if (sub_100005B20(v8))
    {
      CFURLRef v11 = CFURLCreateWithFileSystemPath(0, v7, kCFURLPOSIXPathStyle, 0);
      if (v11)
      {
        CFURLRef v12 = v11;
        v13 = CGImageSourceCreateWithURL(v11, 0);
        if (v13)
        {
          double v14 = v13;
          size_t Count = CGImageSourceGetCount(v13);
          CFDictionaryRef v16 = CGImageSourceCopyProperties(v14, 0);
          if (v16)
          {
            CFDictionaryRef v17 = v16;
            id v18 = -[__CFDictionary objectForKey:](v16, "objectForKey:");
            id v19 = [(__CFDictionary *)v17 objectForKey:kCGImagePropertyPixelHeight];
            if (v19) {
              BOOL v20 = v18 == 0;
            }
            else {
              BOOL v20 = 1;
            }
            if (v20)
            {
              if (Count)
              {
                CFDictionaryRef v21 = CGImageSourceCopyPropertiesAtIndex(v14, 0, 0);
                if (v21)
                {
                  CFDictionaryRef v22 = v21;
                  id v18 = [(__CFDictionary *)v21 objectForKey:kCGImagePropertyPixelWidth];
                  id v19 = [(__CFDictionary *)v22 objectForKey:kCGImagePropertyPixelHeight];
                  CFRelease(v22);
                }
              }
            }
            [v18 doubleValue];
            CGFloat width = v23;
            [v19 doubleValue];
            CGFloat height = v24;
            CFRelease(v17);
          }
          CFRelease(v14);
        }
        CFRelease(v12);
      }
    }
    uint64_t v10 = (int)v10;
  }
  else
  {
    uint64_t v10 = 0;
  }

  v26.n128_f64[0] = width;
  v27.n128_f64[0] = height;
  return _IMMMSPartCanBeSent(v9, v10, v26, v27);
}

- (BOOL)_attachmentCanBeSentViaMMS:(id)a3
{
  if (-[IMDMSASMSRoutingAgent __isSendableType:](self, "__isSendableType:", [a3 UTIType]))
  {
    if ([(IMDMSASMSRoutingAgent *)self __attachmentPassesMMSRestrictions:a3])
    {
      if ([(IMDMSASMSRoutingAgent *)self __attachmentPassesDurationRestrictions:a3])
      {
        LOBYTE(v5) = 1;
        return v5;
      }
      int v5 = IMOSLoggingEnabled();
      if (v5)
      {
        uint64_t v10 = OSLogHandleForIMFoundationCategory();
        int v5 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
        if (v5)
        {
          LOWORD(v12) = 0;
          CFStringRef v7 = "Attachment does not pass duration restrictions";
          goto LABEL_14;
        }
      }
    }
    else
    {
      int v5 = IMOSLoggingEnabled();
      if (v5)
      {
        uint64_t v10 = OSLogHandleForIMFoundationCategory();
        int v5 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
        if (v5)
        {
          LOWORD(v12) = 0;
          CFStringRef v7 = "Attachment does not pass MMS restrictions";
LABEL_14:
          CFStringRef v8 = v10;
          uint32_t v9 = 2;
          goto LABEL_15;
        }
      }
    }
  }
  else
  {
    int v5 = IMOSLoggingEnabled();
    if (v5)
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      int v5 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
      if (v5)
      {
        int v12 = 138412290;
        id v13 = [a3 UTIType];
        CFStringRef v7 = "UTI type (%@) is not sendable via MMS";
        CFStringRef v8 = v6;
        uint32_t v9 = 12;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v12, v9);
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (double)_upperDowngradeIntervalForMessage:(id)a3
{
  id v5 = [a3 service];
  if ([v5 isEqualToString:IMServiceNameiMessage])
  {
    double v6 = (double)[(IMDMSASMSRoutingAgent *)self _bagValueForKey:@"md-auto-resend-as-sms-timeout-upper" defaultValue:600 minimumValue:30];
    if (IMOSLoggingEnabled())
    {
      CFStringRef v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v11 = 134218242;
        double v12 = v6;
        __int16 v13 = 2112;
        id v14 = [a3 GUID];
        CFStringRef v8 = "Using upper downgrade interval (%f) for message with GUID {%@}";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v11, 0x16u);
      }
    }
  }
  else
  {
    [(IMDMSASMSRoutingAgent *)self _lowerDowngradeIntervalForMessage:a3];
    double v6 = v9 + v9;
    if (IMOSLoggingEnabled())
    {
      CFStringRef v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v11 = 134218242;
        double v12 = v6;
        __int16 v13 = 2112;
        id v14 = [a3 GUID];
        CFStringRef v8 = "Using 2x lower downgrade interval for upper downgrade interval (%f) for message with GUID {%@}";
        goto LABEL_8;
      }
    }
  }
  return v6;
}

- (void)_updateUndeliveredMessageWaterMark:(int)a3
{
  if (IMOSLoggingEnabled())
  {
    CFStringRef v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5[0] = 67109120;
      v5[1] = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Updating undelivered message watermark to %d", (uint8_t *)v5, 8u);
    }
  }
  IMSetDomainIntForKey();
}

- (int)_undeliveredMessageWaterMark
{
  uint64_t v6 = 0;
  CFStringRef v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  int v9 = IMGetDomainIntForKey();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  _DWORD v5[2] = sub_10000A014;
  v5[3] = &unk_1000107B8;
  v5[4] = self;
  v5[5] = &v6;
  if (qword_100014D70 != -1) {
    dispatch_once(&qword_100014D70, v5);
  }
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_getCandidateMessages:(id)a3
{
  unsigned int v3 = [(IMDMSASMSRoutingAgent *)self _undeliveredMessageWaterMark];
  if (IMOSLoggingEnabled())
  {
    CFStringRef v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v29 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Undelivered message watermark is %d", buf, 8u);
    }
  }
  id v5 = (void *)IMDMessageRecordCopyUndeliveredOneToOneiMessages();
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      unsigned int v7 = [v5 count];
      *(_DWORD *)buf = 67109120;
      unsigned int v29 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Found %d potential SMS downgrade messages", buf, 8u);
    }
  }
  if (!v5 || ![v5 count])
  {
    id v20 = 0;
    goto LABEL_35;
  }
  id v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v9) {
    goto LABEL_33;
  }
  uint64_t v10 = *(void *)v24;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v24 != v10) {
        objc_enumerationMutation(v5);
      }
      uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
      CFArrayRef v13 = (const __CFArray *)IMDMessageRecordCopyChats();
      CFArrayRef v14 = v13;
      if (v13)
      {
        if ((int)CFArrayGetCount(v13) < 1)
        {
          CFDictionaryRef v16 = 0;
        }
        else
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v14, 0);
          CFDictionaryRef v16 = ValueAtIndex;
          if (ValueAtIndex) {
            CFRetain(ValueAtIndex);
          }
        }
        CFRelease(v14);
        if (v12) {
          BOOL v17 = v16 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (!v17)
        {
          id v18 = [[IMDMSAMessage alloc] initWithMessage:v12 inChat:v16];
          id v19 = [(IMDMSAMessage *)v18 service];
          if (![(NSString *)v19 isEqualToString:IMServiceNameiMessage]
            || IMSMSFallbackEnabled())
          {
            [v8 addObject:v18];
          }

LABEL_30:
          CFRelease(v16);
          continue;
        }
        if (v16) {
          goto LABEL_30;
        }
      }
    }
    id v9 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }
  while (v9);
LABEL_33:
  id v20 = [v8 copy];

LABEL_35:
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A48C;
  block[3] = &unk_1000107E0;
  block[4] = v20;
  block[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)_messageHasDowngradeMarkers:(id)a3
{
  id v4 = [a3 chatProperties];
  if (![v4 objectForKey:kFZChatPropertyLastDowngradedMessageTime]) {
    return 0;
  }
  id v5 = [v4 objectForKey:kFZChatPropertyManuallyDowngradedMessageCount];
  id v6 = [v4 objectForKey:kFZChatPropertyAutoDowngradedMessageCount];
  if ((uint64_t)[v5 integerValue] <= 0 && (uint64_t)objc_msgSend(v6, "integerValue") < 1) {
    return 0;
  }
  if (!IMOSLoggingEnabled()) {
    return 1;
  }
  unsigned int v7 = OSLogHandleForIMFoundationCategory();
  BOOL v8 = 1;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412802;
    id v11 = [a3 GUID];
    __int16 v12 = 1024;
    unsigned int v13 = [v5 integerValue];
    __int16 v14 = 1024;
    unsigned int v15 = [v6 integerValue];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Message with GUID {%@} has %d manual and %d auto downgrade markers. Shortening downgrade interval.", (uint8_t *)&v10, 0x18u);
  }
  return v8;
}

- (double)_lowerDowngradeIntervalForMessage:(id)a3
{
  id v5 = (void *)IMGetCachedDomainValueForKey();
  if (v5)
  {
    [v5 doubleValue];
    double v7 = v6;
    if (IMOSLoggingEnabled())
    {
      BOOL v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v14 = 134218242;
        double v15 = v7;
        __int16 v16 = 2112;
        id v17 = [a3 GUID];
        id v9 = "Using defaults-overridden downgrade interval (%f) for message with GUID {%@}";
LABEL_5:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v14, 0x16u);
      }
    }
  }
  else
  {
    id v11 = [a3 service];
    if ([v11 isEqualToString:IMServiceNameiMessage])
    {
      if ([(IMDMSASMSRoutingAgent *)self _messageHasDowngradeMarkers:a3])
      {
        double v7 = (double)[(IMDMSASMSRoutingAgent *)self _bagValueForKey:@"md-auto-resend-as-sms-timeout-shortened" defaultValue:25 minimumValue:20];
        if (IMOSLoggingEnabled())
        {
          BOOL v8 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            int v14 = 134218242;
            double v15 = v7;
            __int16 v16 = 2112;
            id v17 = [a3 GUID];
            id v9 = "Using short downgrade interval (%f) for message with GUID {%@}";
            goto LABEL_5;
          }
        }
      }
      else
      {
        double v7 = (double)[(IMDMSASMSRoutingAgent *)self _bagValueForKey:@"md-auto-resend-as-sms-timeout-lower" defaultValue:300 minimumValue:20];
        if (IMOSLoggingEnabled())
        {
          BOOL v8 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            int v14 = 134218242;
            double v15 = v7;
            __int16 v16 = 2112;
            id v17 = [a3 GUID];
            id v9 = "Using long downgrade interval (%f) for message with GUID {%@}";
            goto LABEL_5;
          }
        }
      }
    }
    else
    {
      id v12 = [a3 service];
      if ([v12 isEqualToString:IMServiceNameRCS])
      {
        objc_msgSend(objc_msgSend(+[IMCTRCSUtilitiesManager sharedManager](IMCTRCSUtilitiesManager, "sharedManager"), "revokeIntervalForPhoneNumber:simID:", objc_msgSend(a3, "lastAddressedHandle"), objc_msgSend(a3, "lastAddressedSIMID")), "doubleValue");
        double v7 = v13;
        if (IMOSLoggingEnabled())
        {
          BOOL v8 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            int v14 = 134218242;
            double v15 = v7;
            __int16 v16 = 2112;
            id v17 = [a3 GUID];
            id v9 = "Using RCS downgrade interval (%f) for message with GUID {%@}";
            goto LABEL_5;
          }
        }
      }
      else
      {
        double v7 = 300.0;
        if (IMOSLoggingEnabled())
        {
          BOOL v8 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            int v14 = 138412546;
            double v15 = COERCE_DOUBLE([a3 service]);
            __int16 v16 = 2112;
            id v17 = [a3 GUID];
            id v9 = "Can't find downgrade interval for unknown service %@ for message with GUID {%@}";
            goto LABEL_5;
          }
        }
      }
    }
  }
  return v7;
}

- (BOOL)shouldSendMessage:(id)a3
{
  id v5 = [a3 GUID];
  id v6 = objc_msgSend(objc_msgSend(a3, "participants"), "count");
  if (v6 != (id)1)
  {
    int v9 = (int)v6;
    if (!IMOSLoggingEnabled()) {
      return 0;
    }
    int v10 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    int v15 = 138412546;
    id v16 = v5;
    __int16 v17 = 1024;
    LODWORD(v18) = v9;
    id v11 = "Cannot send message (%@) via SMS because it has an incorrect number of recipients (%d)";
    id v12 = v10;
    uint32_t v13 = 18;
    goto LABEL_12;
  }
  id v7 = objc_msgSend(objc_msgSend(a3, "participants"), "objectAtIndex:", 0);
  if (([v7 _appearsToBePhoneNumber] & 1) == 0)
  {
    if (!IMOSLoggingEnabled()) {
      return 0;
    }
    int v14 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    int v15 = 138412546;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v7;
    id v11 = "Cannot send message (%@) via SMS because it is not to a phone number: %@";
    id v12 = v14;
    uint32_t v13 = 22;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v15, v13);
    return 0;
  }
  return [(IMDMSASMSRoutingAgent *)self canSendMessage:a3];
}

- (BOOL)canSendMessage:(id)a3
{
  if ([a3 iMessageOnly])
  {
    if (!IMOSLoggingEnabled()) {
      return 0;
    }
    id v5 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = [a3 GUID];
    id v6 = "Message (%@) cannot be sent via SMS because it uses an iMessage only feature";
    goto LABEL_23;
  }
  if ([a3 isKeyTransparencyVerifiedMessage])
  {
    if (!IMOSLoggingEnabled()) {
      return 0;
    }
    id v5 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = [a3 GUID];
    id v6 = "Message (%@) cannot be sent via SMS because it is in a verified chat";
    goto LABEL_23;
  }
  if ([a3 isCheckInMessage])
  {
    if (!IMOSLoggingEnabled()) {
      return 0;
    }
    id v5 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = [a3 GUID];
    id v6 = "Check In Message (%@) cannot be sent via SMS as its not supported";
    goto LABEL_23;
  }
  if (IMSMSEnabled())
  {
    unint64_t v7 = (unint64_t)objc_msgSend(objc_msgSend(a3, "attachments"), "count");
    if (!(v7 | (unint64_t)objc_msgSend(objc_msgSend(a3, "subject"), "length"))) {
      return 1;
    }
    if (+[IMCTSMSUtilities IMMMSEnabledForPhoneNumber:0 simID:0])
    {
      if (v7 > (int)+[IMCTSMSUtilities IMMMSMaximumSlideCountForPhoneNumber:0 simID:0])
      {
        if (!IMOSLoggingEnabled()) {
          return 0;
        }
        BOOL v8 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
          return 0;
        }
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = [a3 GUID];
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v7;
        id v6 = "Message (%@) cannot be sent via MMS because it has too many attachments (%d)";
        int v9 = v8;
        uint32_t v10 = 18;
        goto LABEL_24;
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      uint64_t v48 = 0;
      uint64_t v35 = 0;
      v36 = &v35;
      uint64_t v37 = 0x2020000000;
      uint64_t v38 = 0;
      uint64_t v31 = 0;
      v32 = &v31;
      uint64_t v33 = 0x2020000000;
      uint64_t v34 = 0;
      uint64_t v27 = 0;
      v28 = &v27;
      uint64_t v29 = 0x2020000000;
      char v30 = 1;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10000B1F8;
      v26[3] = &unk_100010808;
      v26[4] = self;
      v26[5] = &v27;
      v26[6] = buf;
      v26[7] = &v35;
      v26[8] = &v31;
      objc_msgSend(objc_msgSend(a3, "attachments"), "enumerateKeysAndObjectsUsingBlock:", v26);
      if (!*((unsigned char *)v28 + 24)) {
        goto LABEL_48;
      }
      if (v36[3] <= 0)
      {
        if (v32[3] < 1 || v7 <= 1)
        {
LABEL_40:
          float v20 = (double)(int)+[IMCTSMSUtilities IMMMSMaximumMessageByteCountForPhoneNumber:0 simID:0]* 0.95/ 102400.0;
          if (floorf(v20) <= 1.0)
          {
            signed int v22 = 1;
          }
          else
          {
            float v21 = (double)(int)+[IMCTSMSUtilities IMMMSMaximumMessageByteCountForPhoneNumber:0 simID:0]* 0.95/ 102400.0;
            signed int v22 = vcvtms_s32_f32(v21);
          }
          if (*(void *)(*(void *)&buf[8] + 24) <= v22)
          {
            BOOL v11 = 1;
            goto LABEL_49;
          }
          if (!IMOSLoggingEnabled()
            || (long long v23 = OSLogHandleForIMFoundationCategory(), !os_log_type_enabled(v23, OS_LOG_TYPE_INFO)))
          {
LABEL_48:
            BOOL v11 = 0;
LABEL_49:
            _Block_object_dispose(&v27, 8);
            _Block_object_dispose(&v31, 8);
            _Block_object_dispose(&v35, 8);
            _Block_object_dispose(buf, 8);
            return v11;
          }
          id v24 = [a3 GUID];
          uint64_t v25 = *(void *)(*(void *)&buf[8] + 24);
          *(_DWORD *)v39 = 138412802;
          id v40 = v24;
          __int16 v41 = 1024;
          int v42 = v25;
          __int16 v43 = 1024;
          signed int v44 = v22;
          __int16 v17 = "Cannot send message (%@) via MMS because it has too may images (total:%d  max:%d)";
          id v18 = v23;
          uint32_t v19 = 24;
LABEL_47:
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, v17, v39, v19);
          goto LABEL_48;
        }
      }
      else if (v7 < 2)
      {
        goto LABEL_40;
      }
      if (!IMOSLoggingEnabled()) {
        goto LABEL_48;
      }
      uint32_t v13 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        goto LABEL_48;
      }
      id v14 = [a3 GUID];
      uint64_t v15 = v32[3];
      uint64_t v16 = v36[3];
      *(_DWORD *)v39 = 138413058;
      id v40 = v14;
      __int16 v41 = 1024;
      int v42 = v15;
      __int16 v43 = 1024;
      signed int v44 = v16;
      __int16 v45 = 1024;
      int v46 = v7;
      __int16 v17 = "Cannot send message (%@) via MMS because it has too may rich attachments (video:%d  audio:%d  total:%d)";
      id v18 = v13;
      uint32_t v19 = 30;
      goto LABEL_47;
    }
    if (!IMOSLoggingEnabled()) {
      return 0;
    }
    id v5 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = [a3 GUID];
    id v6 = "Message (%@) cannot be sent via SMS because it needs MMS which is not enabled";
  }
  else
  {
    if (!IMOSLoggingEnabled()) {
      return 0;
    }
    id v5 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = [a3 GUID];
    id v6 = "Message (%@) cannot be sent via SMS because sms is not enabled";
  }
LABEL_23:
  int v9 = v5;
  uint32_t v10 = 12;
LABEL_24:
  _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v6, buf, v10);
  return 0;
}

- (void)getRoutableMessages:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000B3C4;
  v3[3] = &unk_100010830;
  v3[4] = self;
  v3[5] = a3;
  [(IMDMSASMSRoutingAgent *)self _getCandidateMessages:v3];
}

@end