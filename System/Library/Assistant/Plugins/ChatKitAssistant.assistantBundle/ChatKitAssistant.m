void sub_50E0(uint64_t a1, void *a2)
{
  id v3;
  long long v4;
  void *i;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  CFStringRef v10;
  CFStringRef v11;
  void *v12;
  unsigned int v13;
  unsigned int v14;
  CFStringRef v15;
  CFStringRef v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  unsigned int v27;
  unsigned int v28;
  void *v29;
  void *v30;
  unsigned int v31;
  unsigned int v32;
  void *v33;
  void *v34;
  BOOL v35;
  int v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  long long v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  id v55;
  long long v56;
  long long v57;
  long long v58;
  long long v59;
  uint8_t buf[4];
  id v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  CFStringRef v69;
  __int16 v70;
  CFStringRef v71;
  __int16 v72;
  CFStringRef v73;
  __int16 v74;
  CFStringRef v75;
  unsigned char v76[128];

  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v3 = a2;
  v55 = [v3 countByEnumeratingWithState:&v56 objects:v76 count:16];
  v50 = v3;
  if (v55)
  {
    v54 = *(void *)v57;
    *(void *)&v4 = 138412290;
    v49 = v4;
    do
    {
      for (i = 0; i != v55; i = (char *)i + 1)
      {
        if (*(void *)v57 != v54) {
          objc_enumerationMutation(v3);
        }
        v6 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        if (IMOSLoggingEnabled())
        {
          v7 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            v51 = [v6 guid];
            v52 = [v6 date];
            v53 = [*(id *)(a1 + 32) start];
            v8 = [*(id *)(a1 + 32) end];
            v9 = [*(id *)(a1 + 32) outgoing];
            if ([v9 BOOLValue]) {
              v10 = @"YES";
            }
            else {
              v10 = @"NO";
            }
            if (objc_msgSend(v6, "isOutgoing", v49)) {
              v11 = @"YES";
            }
            else {
              v11 = @"NO";
            }
            v12 = [*(id *)(a1 + 32) unread];
            v13 = [v12 BOOLValue];
            v14 = [v6 isRead];
            *(_DWORD *)buf = 138414082;
            v15 = @"NO";
            if (v13) {
              v16 = @"YES";
            }
            else {
              v16 = @"NO";
            }
            v61 = v51;
            if (!v14) {
              v15 = @"YES";
            }
            v62 = 2112;
            v63 = v52;
            v64 = 2112;
            v65 = v53;
            v66 = 2112;
            v67 = v8;
            v68 = 2112;
            v69 = v10;
            v70 = 2112;
            v71 = v11;
            v72 = 2112;
            v73 = v16;
            v74 = 2112;
            v75 = v15;
            _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "AssistantSearch - Looking at message with guid %@ [date %@, self.start %@, self.end %@] [self.outgoing %@, ougoing %@], [self.unread %@, unread %@]", buf, 0x52u);

            v3 = v50;
          }
        }
        v17 = objc_msgSend(*(id *)(a1 + 32), "start", v49);
        if (!v17) {
          goto LABEL_51;
        }
        v18 = [*(id *)(a1 + 32) start];
        v19 = [v6 date];
        v20 = [v18 compare:v19] == (char *)&dword_0 + 1;

        if (!v20)
        {
LABEL_51:
          v21 = [*(id *)(a1 + 32) end];
          if (!v21) {
            goto LABEL_52;
          }
          v22 = [*(id *)(a1 + 32) end];
          v23 = [v6 date];
          v24 = [v22 compare:v23] == (id)-1;

          if (!v24)
          {
LABEL_52:
            v25 = [*(id *)(a1 + 32) outgoing];
            if (!v25
              || ([*(id *)(a1 + 32) outgoing],
                  v26 = objc_claimAutoreleasedReturnValue(),
                  v27 = [v26 BOOLValue],
                  v28 = [v6 isOutgoing],
                  v26,
                  v25,
                  ((v27 ^ v28) & 1) == 0))
            {
              v29 = [*(id *)(a1 + 32) unread];
              if (!v29
                || ([*(id *)(a1 + 32) unread],
                    v30 = objc_claimAutoreleasedReturnValue(),
                    v31 = [v30 BOOLValue],
                    v32 = [v6 isRead],
                    v30,
                    v29,
                    v31 ^ v32))
              {
                v33 = [*(id *)(a1 + 32) _smsForIMSPIMessage:v6];
                v34 = [v6 referencedMessage];
                v35 = v34 == 0;

                v36 = IMOSLoggingEnabled();
                if (v35)
                {
                  if (v36)
                  {
                    v43 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                    {
                      v44 = [v6 guid];
                      *(_DWORD *)buf = v49;
                      v61 = v44;
                      _os_log_impl(&dword_0, v43, OS_LOG_TYPE_INFO, "AssistantSearch - Found message with guid %@", buf, 0xCu);
                    }
                  }
                }
                else
                {
                  if (v36)
                  {
                    v37 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
                    {
                      v38 = [v6 referencedMessage];
                      v39 = [v38 guid];
                      *(_DWORD *)buf = v49;
                      v61 = v39;
                      _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "AssistantSearch - Found referenced message with guid %@", buf, 0xCu);
                    }
                  }
                  v40 = *(void **)(a1 + 32);
                  v41 = [v6 referencedMessage];
                  v42 = [v40 _smsForIMSPIMessage:v41];

                  [v33 setReferencedMessage:v42];
                }
                v45 = [*(id *)(a1 + 32) _appInfoForMessage:v6];
                if (v45) {
                  [v33 setAppInfo:v45];
                }
                [*(id *)(a1 + 40) addObject:v33];
              }
            }
          }
        }
      }
      v55 = [v3 countByEnumeratingWithState:&v56 objects:v76 count:16];
    }
    while (v55);
  }

  if (IMOSLoggingEnabled())
  {
    v46 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      v47 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 count]);
      v48 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 40) count]);
      *(_DWORD *)buf = 138412546;
      v61 = v47;
      v62 = 2112;
      v63 = v48;
      _os_log_impl(&dword_0, v46, OS_LOG_TYPE_INFO, "AssistantSearch - SPIQuery found %@ messages but filtered that to %@ in filterBlock", buf, 0x16u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_69C8(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x68ECLL);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_7D34(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_7D44(uint64_t a1)
{
}

uint64_t sub_7D4C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = IMDMessageRecordCopyMostRecentUseageOfAddresses();

  return _objc_release_x1();
}

uint64_t sub_8764(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = IMDMessageRecordCopyMostRecentUseageOfAddresses();

  return _objc_release_x1();
}

void sub_9FA8(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  v2 = [*(id *)(a1 + 32) identifier];
  v3 = [v2 identifier];
  v51 = CKAssistantGetDraftForIdentifier();

  v50 = [*v1 _validateSMS:v51];
  if (!v50)
  {
    id v9 = objc_alloc((Class)NSMutableArray);
    v10 = [v51 msgRecipients];
    id v8 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = [v51 msgRecipients];
        *(_DWORD *)buf = 138412290;
        id v59 = v12;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Trying to get addresses from messagesRecipients: %@", buf, 0xCu);
      }
    }
    id v53 = objc_alloc_init((Class)NSMutableArray);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v13 = [v51 msgRecipients];
    id v14 = [v13 countByEnumeratingWithState:&v54 objects:v64 count:16];
    if (v14)
    {
      v52 = 0;
      uint64_t v15 = *(void *)v55;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v55 != v15) {
            objc_enumerationMutation(v13);
          }
          v17 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          v18 = [v17 data];
          if ((IMStringIsPhoneNumber() & 1) != 0 || IMStringIsEmail())
          {
            IMStripFormattingFromAddress();
            id v19 = (id)objc_claimAutoreleasedReturnValue();
            if (v19) {
              [v8 addObject:v19];
            }
          }
          else
          {
            id v19 = objc_alloc_init((Class)CKAssistantPerson);
            v20 = [v17 object];
            v21 = [v20 internalGUID];
            [v19 setInternalGUID:v21];

            [v19 setLabel:v18];
            if (IMOSLoggingEnabled())
            {
              v22 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412802;
                id v59 = v18;
                __int16 v60 = 2112;
                id v61 = v17;
                __int16 v62 = 2112;
                id v63 = v19;
                _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "Data %@ for recipient %@ does not appear to be address, creating CKPerson person ourselves %@", buf, 0x20u);
              }
            }
            [v53 addObject:v19];
            if (IMStringIsBusinessID())
            {
              if (IMOSLoggingEnabled())
              {
                v23 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  id v59 = v18;
                  _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Found business recipient: %@", buf, 0xCu);
                }
              }
              id v24 = v18;

              v52 = v24;
            }
          }
        }
        id v14 = [v13 countByEnumeratingWithState:&v54 objects:v64 count:16];
      }
      while (v14);
    }
    else
    {
      v52 = 0;
    }

    if (IMOSLoggingEnabled())
    {
      v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v59 = v8;
        __int16 v60 = 2112;
        id v61 = v53;
        _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Found %@ valid addresses for message recipients and %@ people to fetch address from", buf, 0x16u);
      }
    }
    v26 = +[CKAssistantSearchUtilities getAddressesFromPeople:v53];
    [v8 addObjectsFromArray:v26];

    if ([v8 count] || !objc_msgSend(v52, "length"))
    {
      if (![v8 count])
      {
        v27 = [v51 groupNameId];
        BOOL v28 = [v27 length] == 0;

        if (v28)
        {
          if (IMOSLoggingEnabled())
          {
            v29 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              v30 = [v51 groupNameId];
              *(_DWORD *)buf = 138412546;
              id v59 = v8;
              __int16 v60 = 2112;
              id v61 = v30;
              _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Siri got no handles: %@ and no group name %@, returning unable to convert recipients to IMHandles error", buf, 0x16u);
            }
          }
          v31 = [*(id *)(a1 + 32) errorWithDescription:@"Unable to convert recipients to IMHandles."];
          id v32 = objc_alloc((Class)SACommandFailed);
          v33 = [v31 description];
          id v34 = [v32 initWithReason:v33];

          uint64_t v35 = *(void *)(a1 + 48);
          id v36 = [v34 dictionary];
          (*(void (**)(uint64_t, id))(v35 + 16))(v35, v36);
          goto LABEL_65;
        }
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v37 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v59 = v52;
          _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "Sending message to business: %@", buf, 0xCu);
        }
      }
      [v8 addObject:v52];
    }
    v31 = [*(id *)(a1 + 40) peerInfoForCurrentCommand];
    id v34 = [v31 idsIdentifier];
    if (IMOSLoggingEnabled())
    {
      v38 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v59 = v34;
        __int16 v60 = 2112;
        id v61 = v31;
        _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "Siri passed in sending idsIdentifier %@ from peerInfo %@", buf, 0x16u);
      }
    }
    id v36 = objc_alloc_init((Class)SADomainObjectCommitCompleted);
    v39 = [v51 identifier];
    [v36 setIdentifier:v39];

    v40 = +[NSDate date];
    [v51 setDateSent:v40];

    CKAssistantUpdateStoreDraftWithSMS();
    if (IMOSLoggingEnabled())
    {
      v41 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        v42 = [v36 dictionary];
        *(_DWORD *)buf = 138412290;
        id v59 = v42;
        _os_log_impl(&dword_0, v41, OS_LOG_TYPE_INFO, "Updated draft with message to send and calling completion with result dict %@", buf, 0xCu);
      }
    }
    uint64_t v43 = *(void *)(a1 + 48);
    v44 = [v36 dictionary];
    (*(void (**)(uint64_t, void *))(v43 + 16))(v43, v44);

    if (IMOSLoggingEnabled())
    {
      v45 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v45, OS_LOG_TYPE_INFO, "Connecting to Dameon if needed", buf, 2u);
      }
    }
    [*(id *)(a1 + 32) _connectToDaemonIfNeeded];
    v46 = *(void **)(a1 + 32);
    v47 = [v51 message];
    v48 = [v51 groupNameId];
    [v46 sendSMS:v47 toAddresses:v8 groupNameID:v48 idsIdentifier:v34];

LABEL_65:
    goto LABEL_66;
  }
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = +[NSDate date];
      [v5 timeIntervalSinceReferenceDate];
      *(_DWORD *)buf = 138412546;
      id v59 = v50;
      __int16 v60 = 2048;
      id v61 = v6;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Siri failed to validate sms with error %@ at time %f, returning early", buf, 0x16u);
    }
  }
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = [v50 dictionary];
  (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
LABEL_66:
}

void sub_AA14(id a1)
{
  if (qword_15728 != -1) {
    dispatch_once(&qword_15728, &stru_10588);
  }
  id v1 = +[IMDaemonController sharedInstance];
  [v1 addListenerID:@"SiriSMS" capabilities:CKSiriListenerCapabilities()];
}

void sub_AA98(id a1)
{
  id v1 = +[FTCServiceAvailabilityCenter sharedInstance];
  [v1 addListenerID:@"kSMSCreateListener" forService:1];
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CKAssistantClearDrafts()
{
  return _CKAssistantClearDrafts();
}

uint64_t CKAssistantGetDraftForIdentifier()
{
  return _CKAssistantGetDraftForIdentifier();
}

uint64_t CKAssistantUpdateStoreDraftWithSMS()
{
  return _CKAssistantUpdateStoreDraftWithSMS();
}

uint64_t CKMakeHandlesFromRecipientsWithFallbackService()
{
  return _CKMakeHandlesFromRecipientsWithFallbackService();
}

uint64_t CKSiriListenerCapabilities()
{
  return _CKSiriListenerCapabilities();
}

uint64_t IMDChatRecordCopyAllNamedChats()
{
  return _IMDChatRecordCopyAllNamedChats();
}

uint64_t IMDMessageRecordCopyMostRecentUseageOfAddresses()
{
  return _IMDMessageRecordCopyMostRecentUseageOfAddresses();
}

uint64_t IMDPersistencePerformBlock()
{
  return _IMDPersistencePerformBlock();
}

uint64_t IMOSLoggingEnabled()
{
  return _IMOSLoggingEnabled();
}

uint64_t IMSPIQueryMessagesWithChatIdentifiers()
{
  return _IMSPIQueryMessagesWithChatIdentifiers();
}

uint64_t IMSPIQueryMessagesWithIDs()
{
  return _IMSPIQueryMessagesWithIDs();
}

uint64_t IMSPIQueryUnreadMessages()
{
  return _IMSPIQueryUnreadMessages();
}

uint64_t IMSharedDowntimeController()
{
  return _IMSharedDowntimeController();
}

uint64_t IMStringIsBusinessID()
{
  return _IMStringIsBusinessID();
}

uint64_t IMStringIsEmail()
{
  return _IMStringIsEmail();
}

uint64_t IMStringIsPhoneNumber()
{
  return _IMStringIsPhoneNumber();
}

uint64_t IMStripFormattingFromAddress()
{
  return _IMStripFormattingFromAddress();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return _OSLogHandleForIMFoundationCategory();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_ID(void *a1, const char *a2, ...)
{
  return [a1 ID];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__cancelSMS(void *a1, const char *a2, ...)
{
  return [a1 _cancelSMS];
}

id objc_msgSend__connectToDaemonIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _connectToDaemonIfNeeded];
}

id objc_msgSend__createSMSObject(void *a1, const char *a2, ...)
{
  return [a1 _createSMSObject];
}

id objc_msgSend__oldSearch(void *a1, const char *a2, ...)
{
  return [a1 _oldSearch];
}

id objc_msgSend__perform(void *a1, const char *a2, ...)
{
  return [a1 _perform];
}

id objc_msgSend__search(void *a1, const char *a2, ...)
{
  return [a1 _search];
}

id objc_msgSend__updateSMS(void *a1, const char *a2, ...)
{
  return [a1 _updateSMS];
}

id objc_msgSend__validate(void *a1, const char *a2, ...)
{
  return [a1 _validate];
}

id objc_msgSend__validateCancel(void *a1, const char *a2, ...)
{
  return [a1 _validateCancel];
}

id objc_msgSend__validateRetrieve(void *a1, const char *a2, ...)
{
  return [a1 _validateRetrieve];
}

id objc_msgSend__validateUpdate(void *a1, const char *a2, ...)
{
  return [a1 _validateUpdate];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountUUID(void *a1, const char *a2, ...)
{
  return [a1 accountUUID];
}

id objc_msgSend_addFields(void *a1, const char *a2, ...)
{
  return [a1 addFields];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_birthday(void *a1, const char *a2, ...)
{
  return [a1 birthday];
}

id objc_msgSend_blockUntilConnected(void *a1, const char *a2, ...)
{
  return [a1 blockUntilConnected];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return [a1 bundleId];
}

id objc_msgSend_chatGuids(void *a1, const char *a2, ...)
{
  return [a1 chatGuids];
}

id objc_msgSend_clientShouldResolvePhonesAndEmails(void *a1, const char *a2, ...)
{
  return [a1 clientShouldResolvePhonesAndEmails];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_displayAppName(void *a1, const char *a2, ...)
{
  return [a1 displayAppName];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_domainObjects(void *a1, const char *a2, ...)
{
  return [a1 domainObjects];
}

id objc_msgSend_effect(void *a1, const char *a2, ...)
{
  return [a1 effect];
}

id objc_msgSend_emailAddress(void *a1, const char *a2, ...)
{
  return [a1 emailAddress];
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return [a1 emailAddresses];
}

id objc_msgSend_emails(void *a1, const char *a2, ...)
{
  return [a1 emails];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return [a1 end];
}

id objc_msgSend_finalAnchor(void *a1, const char *a2, ...)
{
  return [a1 finalAnchor];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fullName(void *a1, const char *a2, ...)
{
  return [a1 fullName];
}

id objc_msgSend_groupNameId(void *a1, const char *a2, ...)
{
  return [a1 groupNameId];
}

id objc_msgSend_guid(void *a1, const char *a2, ...)
{
  return [a1 guid];
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return [a1 handle];
}

id objc_msgSend_hasGroupName(void *a1, const char *a2, ...)
{
  return [a1 hasGroupName];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_iMessageService(void *a1, const char *a2, ...)
{
  return [a1 iMessageService];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identifiers(void *a1, const char *a2, ...)
{
  return [a1 identifiers];
}

id objc_msgSend_idsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 idsIdentifier];
}

id objc_msgSend_internalGUID(void *a1, const char *a2, ...)
{
  return [a1 internalGUID];
}

id objc_msgSend_isAudioMessage(void *a1, const char *a2, ...)
{
  return [a1 isAudioMessage];
}

id objc_msgSend_isContactLimitsFeatureEnabled(void *a1, const char *a2, ...)
{
  return [a1 isContactLimitsFeatureEnabled];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isOutgoing(void *a1, const char *a2, ...)
{
  return [a1 isOutgoing];
}

id objc_msgSend_isRead(void *a1, const char *a2, ...)
{
  return [a1 isRead];
}

id objc_msgSend_join(void *a1, const char *a2, ...)
{
  return [a1 join];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_lastAddressedHandleID(void *a1, const char *a2, ...)
{
  return [a1 lastAddressedHandleID];
}

id objc_msgSend_lastAddressedSIMID(void *a1, const char *a2, ...)
{
  return [a1 lastAddressedSIMID];
}

id objc_msgSend_lastReadDate(void *a1, const char *a2, ...)
{
  return [a1 lastReadDate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_messageID(void *a1, const char *a2, ...)
{
  return [a1 messageID];
}

id objc_msgSend_messageType(void *a1, const char *a2, ...)
{
  return [a1 messageType];
}

id objc_msgSend_middleName(void *a1, const char *a2, ...)
{
  return [a1 middleName];
}

id objc_msgSend_msgRecipients(void *a1, const char *a2, ...)
{
  return [a1 msgRecipients];
}

id objc_msgSend_namePrefix(void *a1, const char *a2, ...)
{
  return [a1 namePrefix];
}

id objc_msgSend_nameSuffix(void *a1, const char *a2, ...)
{
  return [a1 nameSuffix];
}

id objc_msgSend_number(void *a1, const char *a2, ...)
{
  return [a1 number];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_outgoing(void *a1, const char *a2, ...)
{
  return [a1 outgoing];
}

id objc_msgSend_peerInfoForCurrentCommand(void *a1, const char *a2, ...)
{
  return [a1 peerInfoForCurrentCommand];
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return [a1 phoneNumbers];
}

id objc_msgSend_phones(void *a1, const char *a2, ...)
{
  return [a1 phones];
}

id objc_msgSend_postAnchors(void *a1, const char *a2, ...)
{
  return [a1 postAnchors];
}

id objc_msgSend_recipients(void *a1, const char *a2, ...)
{
  return [a1 recipients];
}

id objc_msgSend_referencedMessage(void *a1, const char *a2, ...)
{
  return [a1 referencedMessage];
}

id objc_msgSend_refreshServiceForSending(void *a1, const char *a2, ...)
{
  return [a1 refreshServiceForSending];
}

id objc_msgSend_removeFields(void *a1, const char *a2, ...)
{
  return [a1 removeFields];
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return [a1 sender];
}

id objc_msgSend_senders(void *a1, const char *a2, ...)
{
  return [a1 senders];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_setFields(void *a1, const char *a2, ...)
{
  return [a1 setFields];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedRegistry(void *a1, const char *a2, ...)
{
  return [a1 sharedRegistry];
}

id objc_msgSend_smsGroup(void *a1, const char *a2, ...)
{
  return [a1 smsGroup];
}

id objc_msgSend_smsGroupName(void *a1, const char *a2, ...)
{
  return [a1 smsGroupName];
}

id objc_msgSend_smsService(void *a1, const char *a2, ...)
{
  return [a1 smsService];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringGUID(void *a1, const char *a2, ...)
{
  return [a1 stringGUID];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_subject(void *a1, const char *a2, ...)
{
  return [a1 subject];
}

id objc_msgSend_syncDidEnd(void *a1, const char *a2, ...)
{
  return [a1 syncDidEnd];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_unread(void *a1, const char *a2, ...)
{
  return [a1 unread];
}

id objc_msgSend_urlFromString(void *a1, const char *a2, ...)
{
  return [a1 urlFromString];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}