void sub_4388(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x437CLL);
  }
  _Unwind_Resume(a1);
}

void sub_5F3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) lastAddressedHandleForJunkReportMessageItem:*(void *)(a1 + 40)];
  v5 = [*(id *)(a1 + 32) lastAddressedSIMIDForJunkReportMessageItem:*(void *)(a1 + 40)];
  v6 = [*(id *)(a1 + 40) subject];
  if ([v6 length])
  {
  }
  else
  {
    v7 = [*(id *)(a1 + 40) fileTransferGUIDs];
    id v8 = [v7 count];

    if (!v8) {
      goto LABEL_10;
    }
  }
  v9 = [*(id *)(a1 + 32) relayController];
  unsigned __int8 v10 = [v9 _checkMMSEnablementForPhoneNumber:v4 simID:v5];

  if (v10)
  {
    int v11 = 0;
    uint64_t v12 = 1;
    goto LABEL_11;
  }
  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v33 = @"YES";
      __int16 v34 = 2112;
      CFStringRef v35 = @"NO";
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Overriding shouldBroadcastMessage to be %@ and shouldSendMMS %@ based on _checkMMSEnablement", buf, 0x16u);
    }
  }
LABEL_10:
  uint64_t v12 = 0;
  int v11 = 1;
LABEL_11:
  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      CFStringRef v15 = @"NO";
      if (v12) {
        CFStringRef v15 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v33 = v15;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "            Should Send MMS: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      CFStringRef v17 = @"NO";
      if (v11) {
        CFStringRef v17 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v33 = v17;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "   Should Broadcast Message: %@", buf, 0xCu);
    }
  }
  v18 = [*(id *)(a1 + 32) attachmentController];
  v19 = *(void **)(a1 + 40);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_6300;
  v24[3] = &unk_8CF68;
  uint64_t v20 = *(void *)(a1 + 32);
  id v25 = v3;
  uint64_t v26 = v20;
  char v30 = v11;
  char v31 = v12;
  id v27 = v19;
  id v28 = v4;
  id v29 = v5;
  id v21 = v5;
  id v22 = v4;
  id v23 = v3;
  [v18 processAttachmentsForMessage:v19 generateTextParts:v12 lastAddressedHandle:v22 lastAddressedSIMID:v21 completionBlock:v24];
}

void sub_6300(uint64_t a1, void *a2, int a3, void *a4)
{
  id v54 = a2;
  id v53 = a4;
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = MarcoLoggingStringForMessageData();
      *(_DWORD *)buf = 138412290;
      *(void *)v72 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "processAttachmentsForMessage Parts: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      *(void *)v72 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Participants: %@", buf, 0xCu);
    }
  }
  id v11 = [*(id *)(a1 + 40) newTelephonyMessagesForHandles:*(void *)(a1 + 32) shouldBroadcastMessage:*(unsigned __int8 *)(a1 + 72)];
  if (!*(unsigned char *)(a1 + 73)) {
    [*(id *)(a1 + 40) addMessagePlainTextToTelephonyMessages:v11 messageItem:*(void *)(a1 + 48) processedMessageItem:v54];
  }
  [*(id *)(a1 + 40) setSubjectForTelephonyMessages:v11 messageItem:*(void *)(a1 + 48)];
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      CFStringRef v13 = @"NO";
      if (a3) {
        CFStringRef v13 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v72 = v13;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "    Parts all process: %@", buf, 0xCu);
    }
  }
  char v55 = a3 ^ 1;
  if (((a3 ^ 1) & 1) == 0) {
    [*(id *)(a1 + 40) processPartsOfTelephonyMessages:v11 parts:v53 messageItem:*(void *)(a1 + 48) isGroupChat:0 phoneNumber:*(void *)(a1 + 56) simID:*(void *)(a1 + 64)];
  }
  [*(id *)(a1 + 40) buildTelephonyPhoneNumbersForTelephonyMessages:v11 shouldBroadcastMessage:*(unsigned __int8 *)(a1 + 72) handles:*(void *)(a1 + 32)];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obj = v11;
  id v14 = [obj countByEnumeratingWithState:&v66 objects:v79 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v67;
    char v16 = 1;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v67 != v15) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        [v18 setServiceCenter:0];
        v19 = *(void **)(a1 + 40);
        if (v16) {
          [*(id *)(a1 + 48) guid];
        }
        else {
        uint64_t v20 = +[NSString stringGUID];
        }
        objc_msgSend(v18, "setMessageId:", objc_msgSend(v19, "_generateMessageIDForMessageGUID:", v20));

        if (*(unsigned char *)(a1 + 73) && IMOSLoggingEnabled())
        {
          id v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "   => Setting Junk Report Message type to MMS", buf, 2u);
          }
        }
        [*(id *)(a1 + 40) setMessageTypeForTelephonyMessage:v18 shouldSendMMS:*(unsigned __int8 *)(a1 + 73)];
        id v22 = +[IMCTSubscriptionUtilities sharedInstance];
        id v23 = [v22 ctSubscriptionInfo];

        v24 = objc_msgSend(v23, "__im_subscriptionContextForForSimID:phoneNumber:", *(void *)(a1 + 64), *(void *)(a1 + 56));
        if (v24)
        {
          [v18 setContext:v24];
          if (IMOSLoggingEnabled())
          {
            id v25 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              uint64_t v26 = [v54 guid];
              *(_DWORD *)buf = 138412546;
              *(void *)v72 = v26;
              *(_WORD *)&v72[8] = 2112;
              *(void *)v73 = v24;
              _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Setting the context for junk report message guid = %@, context %@", buf, 0x16u);
            }
          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            id v27 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "Could not find a subscription context to send junk report with based on contact preferred subscription in context so failing message", buf, 2u);
            }
          }
          char v55 = 1;
        }

        char v16 = 0;
      }
      id v14 = [obj countByEnumeratingWithState:&v66 objects:v79 count:16];
      char v16 = 0;
    }
    while (v14);
  }

  int v28 = IMOSLoggingEnabled();
  if (v55)
  {
    if (v28)
    {
      id v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v72 = obj;
        _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "   *** Parts failed, failing junk report message(s): %@", buf, 0xCu);
      }
    }
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v30 = obj;
    id v31 = [v30 countByEnumeratingWithState:&v58 objects:v70 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v59;
      do
      {
        for (j = 0; j != v31; j = (char *)j + 1)
        {
          if (*(void *)v59 != v32) {
            objc_enumerationMutation(v30);
          }
          uint64_t v34 = *(void *)(*((void *)&v58 + 1) + 8 * (void)j);
          if (IMOSLoggingEnabled())
          {
            CFStringRef v35 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v72 = v34;
              _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "part error sending message %@", buf, 0xCu);
            }
          }
          if (IMOSLoggingEnabled())
          {
            v36 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v72 = v34;
              _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, "   => failed CT Message: %@  (some parts failed)", buf, 0xCu);
            }
          }
        }
        id v31 = [v30 countByEnumeratingWithState:&v58 objects:v70 count:16];
      }
      while (v31);
    }

    v37 = +[IMMetricsCollector sharedInstance];
    [v37 trackEvent:IMMetricsCollectorEventCarrierReportJunkCompletionStatus withDictionary:&off_90ED8];
  }
  else
  {
    if (v28)
    {
      v38 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v72 = obj;
        _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "   No parts failed, sending junk report message(s): %@", buf, 0xCu);
      }
    }
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v39 = obj;
    int v40 = 0;
    id v41 = [v39 countByEnumeratingWithState:&v62 objects:v78 count:16];
    if (v41)
    {
      int v56 = 0;
      uint64_t v42 = *(void *)v63;
      do
      {
        for (k = 0; k != v41; k = (char *)k + 1)
        {
          if (*(void *)v63 != v42) {
            objc_enumerationMutation(v39);
          }
          uint64_t v44 = *(void *)(*((void *)&v62 + 1) + 8 * (void)k);
          v45 = +[CTMessageCenter sharedMessageCenter];
          id v46 = [v45 send:v44];

          if (v46)
          {
            if (IMOSLoggingEnabled())
            {
              v49 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
              {
                unsigned int v50 = [v39 count];
                *(_DWORD *)buf = 67110146;
                *(_DWORD *)v72 = v56 + k + 1;
                *(_WORD *)&v72[4] = 1024;
                *(_DWORD *)&v72[6] = v50;
                *(_WORD *)v73 = 2112;
                *(void *)&v73[2] = v44;
                __int16 v74 = 1024;
                int v75 = (int)v46;
                __int16 v76 = 1024;
                int v77 = HIDWORD(v46);
                _os_log_impl(&dword_0, v49, OS_LOG_TYPE_INFO, "**** Failed sending message CT Junk Report Message (%d / %d): (%@) error: %d,%d\n", buf, 0x24u);
              }
            }
          }
          else
          {
            ++v40;
            if (IMOSLoggingEnabled())
            {
              v47 = OSLogHandleForIMEventCategory();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
              {
                unsigned int v48 = [v39 count];
                *(_DWORD *)buf = 67109634;
                *(_DWORD *)v72 = v56 + k + 1;
                *(_WORD *)&v72[4] = 1024;
                *(_DWORD *)&v72[6] = v48;
                *(_WORD *)v73 = 2112;
                *(void *)&v73[2] = v44;
                _os_log_impl(&dword_0, v47, OS_LOG_TYPE_INFO, "   => sent CT Junk Report Message (%d / %d): %@", buf, 0x18u);
              }
            }
          }
        }
        id v41 = [v39 countByEnumeratingWithState:&v62 objects:v78 count:16];
        v56 += (int)k;
      }
      while (v41);
    }

    BOOL v51 = v40 == [v39 count];
    v52 = +[IMMetricsCollector sharedInstance];
    v37 = v52;
    if (v51) {
      [v52 trackEvent:IMMetricsCollectorEventCarrierReportJunkCompletionStatus withDictionary:&off_90E88];
    }
    else {
      [v52 trackEvent:IMMetricsCollectorEventCarrierReportJunkCompletionStatus withDictionary:&off_90EB0];
    }
  }
}

id sub_854C(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, " ** FailSendingSMSMessages is enabled, failing send message", buf, 2u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, " ** FailSendingSMSMessages is enabled, failing send message", v5, 2u);
    }
  }
  [*(id *)(a1 + 32) setErrorCode:5];
  return [*(id *)(a1 + 40) didSendMessage:*(void *)(a1 + 32) forChat:*(void *)(a1 + 48) style:*(unsigned __int8 *)(a1 + 56)];
}

id _ClampDate(void *a1)
{
  id v1 = a1;
  v2 = +[NSDate date];
  id v3 = v2;
  if (!v1)
  {
    id v6 = 0;
    id v1 = v2;
    goto LABEL_20;
  }
  v4 = (char *)[v2 compare:v1];
  if (v4 != (char *)-1)
  {
    if (v4 == (unsigned char *)&dword_0 + 1)
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_19:
        id v6 = v1;
        goto LABEL_20;
      }
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412546;
        id v11 = v1;
        __int16 v12 = 2112;
        CFStringRef v13 = v3;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, " * Date descending vs current (%@ vs %@)", (uint8_t *)&v10, 0x16u);
      }
    }
    else
    {
      if (v4 || !IMOSLoggingEnabled()) {
        goto LABEL_19;
      }
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412546;
        id v11 = v1;
        __int16 v12 = 2112;
        CFStringRef v13 = v3;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, " * Date is the same as current (%@ vs %@)", (uint8_t *)&v10, 0x16u);
      }
    }

    goto LABEL_19;
  }
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412546;
      id v11 = v1;
      __int16 v12 = 2112;
      CFStringRef v13 = v3;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, " * Clamping date %@ to current date (%@)", (uint8_t *)&v10, 0x16u);
    }
  }
  id v6 = v3;

  id v1 = v6;
LABEL_20:
  id v8 = v1;

  return v8;
}

void sub_A910(uint64_t a1, int a2)
{
  if (a2)
  {
    id v7 = [*(id *)(a1 + 32) relayController];
    uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 40);
    v5 = [*(id *)(a1 + 32) service];
    id v6 = [v5 internalName];
    [v7 relayDictionaryToPeers:v4 requiresUpload:v3 serviceName:v6 requiredCapabilities:0];
  }
}

void sub_AC10(uint64_t a1, char a2, void *a3, char a4)
{
  id v7 = a3;
  char v8 = a2 ^ 1;
  if (*(unsigned char *)(a1 + 40)) {
    char v8 = 1;
  }
  if ((v8 & 1) == 0 && (a4 & 1) == 0)
  {
    v9 = [*(id *)(a1 + 32) relayController];
    [v9 _executeSMSRelayBlockForMessageWithGUID:v7];
LABEL_6:

    goto LABEL_7;
  }
  char v11 = v8 | a4 ^ 1;
  int v12 = IMOSLoggingEnabled();
  if (v11)
  {
    if (v12)
    {
      v9 = OSLogHandleForIMEventCategory();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_6;
      }
      __int16 v15 = 0;
      CFStringRef v13 = "Not relaying to peers as we are message is being replayed.";
      id v14 = (uint8_t *)&v15;
LABEL_17:
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, v13, v14, 2u);
      goto LABEL_6;
    }
  }
  else if (v12)
  {
    v9 = OSLogHandleForIMEventCategory();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_6;
    }
    *(_WORD *)buf = 0;
    CFStringRef v13 = "Not relaying to peers since we're checking for spam";
    id v14 = buf;
    goto LABEL_17;
  }
LABEL_7:
  if ((a4 & 1) == 0)
  {
    int v10 = [*(id *)(a1 + 32) relayController];
    [v10 _clearSMSRelayMapForMessageWithGUID:v7];
  }
}

void sub_AFC4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  v5 = a2;
  [v2 _receivedSMSDictionary:v3 requiresUpload:v4 isBeingReplayed:1];
  v5[2]();
}

uint64_t sub_B0D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_B3BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[IMDMessageStore sharedInstance];
  v5 = [v4 chatForMessage:v3];

  if (!v5)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_20;
    }
    int v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v14 = [v3 guid];
      int v18 = 138412290;
      v19 = v14;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Chat not found for message relay guid: %@", (uint8_t *)&v18, 0xCu);
    }
    goto LABEL_7;
  }
  if ([v5 style] == 45)
  {
    id v6 = +[IMDRelayServiceController sharedInstance];
    id v7 = [*(id *)(a1 + 32) internalName];
    char v8 = +[NSSet setWithObject:IDSRegistrationPropertySupportsSenderKey];
    unsigned __int8 v9 = [v6 relayMessageToPeers:v3 forChat:v5 serviceName:v7 reflectOnly:1 requiredCapabilities:v8];

    if (v9)
    {
      [v3 setNeedsRelay:0];
      int v10 = +[IMDMessageStore sharedInstance];
      id v11 = [v10 storeMessage:v3 forceReplace:0 modifyError:1 modifyFlags:1 flagMask:0x40000000000];

      if (IMOSLoggingEnabled())
      {
        int v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          CFStringRef v13 = [v3 guid];
          int v18 = 138412290;
          v19 = v13;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Message marked as relayed, guid: %@", (uint8_t *)&v18, 0xCu);
        }
LABEL_7:
      }
    }
    else
    {
      CFStringRef v17 = IMLogHandleForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_5EB24(v3, v17);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
  else
  {
    __int16 v15 = IMLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_5EC20(v3, v15);
    }

    char v16 = IMLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_5EBB4();
    }
  }
LABEL_20:
}

void sub_B6B8(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0xB678);
  }
  _Unwind_Resume(a1);
}

id sub_B830(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      if (*(unsigned char *)(a1 + 68)) {
        CFStringRef v3 = @"SMS";
      }
      else {
        CFStringRef v3 = @"MMS";
      }
      uint64_t v4 = *(void *)(a1 + 32);
      if (*(unsigned char *)(a1 + 69)) {
        CFStringRef v5 = @"YES";
      }
      else {
        CFStringRef v5 = @"NO";
      }
      id v6 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 64)];
      id v7 = +[NSNumber numberWithInteger:*(void *)(a1 + 48)];
      char v8 = +[NSNumber numberWithInteger:*(void *)(a1 + 56)];
      int v12 = 138413570;
      CFStringRef v13 = v3;
      __int16 v14 = 2112;
      uint64_t v15 = v4;
      __int16 v16 = 2112;
      CFStringRef v17 = v5;
      __int16 v18 = 2112;
      v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%@ Message sent notification %@: success %@ messageID %@ err1 %@ err2 %@", (uint8_t *)&v12, 0x3Eu);
    }
  }
  unsigned __int8 v9 = *(void **)(a1 + 40);
  uint64_t v10 = *(unsigned int *)(a1 + 64);
  if (*(unsigned char *)(a1 + 69)) {
    return [v9 _processMessageSentID:v10];
  }
  else {
    return [v9 _processMessageSendFailureID:v10];
  }
}

uint64_t sub_B9E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_BB24(uint64_t a1)
{
  v2 = _os_activity_create(&dword_0, "com.apple.messages.SMSReceivedMessage", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  if (IMOSLoggingEnabled())
  {
    CFStringRef v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Message received in block ", buf, 2u);
    }
  }
  id v4 = *(id *)(a1 + 32);
  CFStringRef v5 = +[CTMessageCenter sharedMessageCenter];
  id v6 = [v5 incomingMessageWithId:*(unsigned int *)(a1 + 48)];

  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "  => Message: %@", buf, 0xCu);
    }
  }
  if (v6)
  {
    id v10 = v6;
    id v11 = *(id *)(a1 + 40);
    id v12 = v4;
    im_dispatch_after();
  }
  else if (IMOSLoggingEnabled())
  {
    char v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 67109120;
      LODWORD(v15) = v9;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Empty message supplied for message id: %d", buf, 8u);
    }
  }
  os_activity_scope_leave(&state);
}

void sub_BE18(uint64_t a1)
{
  v2 = +[IMMetricsCollector sharedInstance];
  [v2 trackEvent:IMMetricsCollectorEventSMSReceived];

  unsigned __int8 v18 = 0;
  [*(id *)(a1 + 32) setContext:*(void *)(a1 + 40)];
  CFStringRef v3 = [*(id *)(a1 + 48) _convertCTMessageToDictionary:*(void *)(a1 + 32) requiresUpload:&v18];
  id v4 = [v3 objectForKey:IMDCTMessageDictionaryGUIDKey];
  CFStringRef v5 = [v3 objectForKey:IMDCTMessageDictionaryTypeKey];
  if ([v4 length])
  {
    id v6 = +[NSString stringWithFormat:@"%@-%@.smsdata", v5, v4];
    +[IMInternalPayloadUtilities writeMessagePayloadToDisk:v3 fileName:v6];
  }
  [*(id *)(a1 + 48) _receivedSMSDictionary:v3 requiresUpload:v18 isBeingReplayed:0];
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Session received SMS", buf, 2u);
    }
  }
  uint64_t v9 = +[IMUnlockMonitor sharedInstance];
  if ([v9 isUnderFirstDataProtectionLock])
  {
  }
  else
  {
    id v10 = +[IMDReplayController sharedInstance];
    unsigned int v11 = [v10 isRecordingReplayDB];

    if (!v11) {
      goto LABEL_20;
    }
  }
  id v12 = [*(id *)(a1 + 48) _getStorageDictionaryUsingMsgDict:v3 requiresUpload:v18];
  if (IMOSLoggingEnabled())
  {
    CFStringRef v13 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v3;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Received SMS before first unlock. Will store dictionary %@ to replay.", buf, 0xCu);
    }
  }
  __int16 v14 = +[IMDReplayController sharedInstance];
  id v17 = 0;
  [v14 storeMessage:v12 type:1 error:&v17];
  id v15 = v17;

  if (v15 && IMOSLoggingEnabled())
  {
    __int16 v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v15;
      __int16 v21 = 2112;
      __int16 v22 = v12;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "MessageReplay: Had error %@ trying to store msg %@ to replay", buf, 0x16u);
    }
  }
LABEL_20:
}

uint64_t sub_C184(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_C548(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_C570(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_D1D4(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0xD178);
  }
  _Unwind_Resume(a1);
}

id sub_E15C(void *a1)
{
  if (qword_9C0B0 != -1) {
    dispatch_once(&qword_9C0B0, &stru_8D1C0);
  }
  id v2 = [a1 lowercaseString];
  id result = [v2 length];
  if (result)
  {
    id result = [(id)qword_9C0B8 objectForKey:v2];
    if (!result) {
      return v2;
    }
  }
  return result;
}

void sub_E1D0(id a1)
{
  qword_9C0B8 = (uint64_t)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", @"text/x-vcalendar", @"text/x-vcalendar", @"text/vcalendar", @"text/x-vcalendar", @"text/x-calendar", @"text/x-vcalendar", @"text/calendar", @"text/x-vcard", @"text/x-vlocation", @"text/x-vcard", @"text/x-location", @"text/x-vcard", @"text/x-vcard", @"text/x-vcard", @"text/vcard", @"text/plain", @"text/plain",
                           @"image/jpeg",
                           @"image/jpg",
                           @"image/x-bmp",
                           @"image/bmp",
                           @"image/x-bmp",
                           @"image/x-bmp",
                           @"audio/x-aac",
                           @"audio/x-aac",
                           @"audio/x-aac",
                           @"audio/aac",
                           @"video/3gpp",
                           @"video/3gp",
                           @"video/3gpp",
                           @"video/3gpp",
                           0);
}

id sub_E2D4(void *a1)
{
  id v21 = objc_alloc_init((Class)NSMutableString);
  if (qword_9C098 != -1) {
    dispatch_once(&qword_9C098, &stru_8D1E0);
  }
  [v21 appendString:qword_9C0A8];
  if (IMOSLoggingEnabled())
  {
    id v1 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = MarcoLoggingStringForMessageData();
      _os_log_impl(&dword_0, v1, OS_LOG_TYPE_INFO, "Generating SMIL for pieces: %@", buf, 0xCu);
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v2 = [a1 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v2)
  {
    char v3 = 0;
    unsigned __int8 v4 = 0;
    char v5 = 1;
    uint64_t v20 = *(void *)v23;
    while (1)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v23 != v20) {
          objc_enumerationMutation(a1);
        }
        id v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v8 = sub_E15C([v7 objectForKey:@"Type"]);
        id v9 = objc_msgSend(objc_msgSend(v7, "objectForKey:", @"Path"), "lastPathComponent");
        id v10 = [v7 objectForKey:@"Tag"];
        unsigned __int8 v11 = [v10 isEqualToString:@"text"];
        v5 |= v4;
        if ((v11 & 1) == 0)
        {
          if ([v8 isEqualToString:@"vcard"]) {
            continue;
          }
          if ([v10 isEqualToString:@"img"])
          {
            unsigned int v13 = 0;
            goto LABEL_19;
          }
          unsigned __int8 v14 = [v10 isEqualToString:@"video"];
          unsigned int v13 = objc_msgSend(objc_msgSend(v7, "objectForKey:", @"Duration"), "intValue");
          if (v14) {
LABEL_19:
          }
            id v15 = +[NSString stringWithFormat:@"<%@ src=\"%@\" region=\"%@\"/>\n", v10, v9, @"Image"];
          else {
            id v15 = +[NSString stringWithFormat:@"<%@ src=\"%@\"/>\n", v10, v9];
          }
          id v12 = v15;
          if (v3) {
LABEL_22:
          }
            [v21 appendString:@"</par>\n"];
LABEL_23:
          if (v13) {
            uint64_t v16 = v13;
          }
          else {
            uint64_t v16 = 10;
          }
          [v21 appendString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<par dur=\"%ds\">\n", v16)];
          char v3 = 1;
          goto LABEL_27;
        }
        id v12 = +[NSString stringWithFormat:@"<%@ src=\"%@\" region=\"%@\"/>\n", v10, v9, @"Text"];
        if (v5)
        {
          unsigned int v13 = 0;
          if (v3) {
            goto LABEL_22;
          }
          goto LABEL_23;
        }
LABEL_27:
        [v21 appendString:v12];
        char v5 = 0;
        unsigned __int8 v4 = v11;
      }
      id v2 = [a1 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (!v2)
      {
        if (v3) {
          [v21 appendString:@"</par>\n"];
        }
        break;
      }
    }
  }
  if (qword_9C090 != -1) {
    dispatch_once(&qword_9C090, &stru_8D200);
  }
  [v21 appendString:qword_9C0A0];
  if (IMOSLoggingEnabled())
  {
    id v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = (uint64_t)v21;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "proposed smil: %@", buf, 0xCu);
    }
  }
  return v21;
}

void sub_E6F8(id a1)
{
  qword_9C0A8 = @"<smil>\n<head>\n<layout>\n <root-layout/>\n<region id=\"Text\" top=\"70%\" left=\"0%\" height=\"30%\" width=\"100%\" fit=\"scroll\"/>\n<region id=\"Image\" top=\"0%\" left=\"0%\" height=\"70%\" width=\"100%\" fit=\"meet\"/>\n</layout>\n</head>\n<body>\n";
}

void sub_E720(id a1)
{
  qword_9C0A0 = @"</body>\n</smil>\n";
}

__CFString *sub_EA00(void *a1)
{
  id v1 = a1;
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      uint64_t v16 = v1;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "MessageAttachmentSendableUTIs called with resourcePath %@", (uint8_t *)&v15, 0xCu);
    }
  }
  char v3 = [(__CFString *)v1 stringByAppendingPathComponent:@"MessageSendableUTIs"];
  unsigned __int8 v4 = [v3 stringByAppendingPathExtension:@"plist"];

  if (IMOSLoggingEnabled())
  {
    char v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      uint64_t v16 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "looking at path: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  id v6 = +[NSFileManager defaultManager];
  unsigned int v7 = [v6 fileExistsAtPath:v4];

  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      CFStringRef v9 = @"does not exist >__<";
      if (v7) {
        CFStringRef v9 = @"exists!";
      }
      int v15 = 138412546;
      uint64_t v16 = v4;
      __int16 v17 = 2112;
      CFStringRef v18 = v9;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v15, 0x16u);
    }
  }
  if (!v7) {
    goto LABEL_26;
  }
  id v10 = +[NSDictionary dictionaryWithContentsOfFile:v4];
  if (IMOSLoggingEnabled())
  {
    unsigned __int8 v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412546;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      CFStringRef v18 = v4;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "MessageAttachmentSendableUTIs got dict %@ from %@", (uint8_t *)&v15, 0x16u);
    }
  }
  if (v10)
  {
    id v12 = [(__CFString *)v10 objectForKey:@"MessageSendableUTIs"];
    if (IMOSLoggingEnabled())
    {
      unsigned int v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        uint64_t v16 = v12;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Got sendable UTI list: %@", (uint8_t *)&v15, 0xCu);
      }
    }
  }
  else
  {
LABEL_26:
    id v12 = 0;
  }

  return v12;
}

void sub_FC9C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) smsSession];
  char v3 = [*(id *)(a1 + 32) message];
  unsigned __int8 v4 = [*(id *)(a1 + 32) chat];
  char v5 = [v4 chatIdentifier];
  objc_msgSend(v2, "didSendMessage:forChat:style:", v3, v5, objc_msgSend(*(id *)(a1 + 32), "chatStyle"));

  BOOL v6 = [*(id *)(a1 + 32) chatStyle] != 45;
  unsigned int v7 = [*(id *)(a1 + 32) message];
  id v8 = [v7 handle];
  uint64_t IsEmail = IMStringIsEmail();

  id v10 = +[NSDate date];
  [v10 timeIntervalSinceDate:*(void *)(a1 + 40)];
  double v12 = v11;

  unsigned int v13 = [*(id *)(a1 + 32) message];
  unsigned __int8 v14 = [v13 fileTransferGUIDs];
  BOOL v15 = [v14 count] != 0;

  uint64_t v16 = +[NSNumber numberWithDouble:v12];
  v24[0] = IMMetricsCollectorFzErrorKey;
  __int16 v17 = +[NSNumber numberWithLong:0];
  v25[0] = v17;
  v24[1] = IMMetricsCollectorIsGroupMessageKey;
  CFStringRef v18 = +[NSNumber numberWithBool:v6];
  v25[1] = v18;
  v24[2] = IMMetricsCollectorIsToPhoneNumberKey;
  v19 = +[NSNumber numberWithBool:IsEmail ^ 1];
  v25[2] = v19;
  v24[3] = IMMetricsCollectorIsToEmailKey;
  uint64_t v20 = +[NSNumber numberWithInt:IsEmail];
  v25[3] = v20;
  void v24[4] = IMMetricsCollectorHasAttachmentsKey;
  id v21 = +[NSNumber numberWithBool:v15];
  v25[4] = v21;
  v25[5] = v16;
  v24[5] = IMMetricsCollectorSendDurationKey;
  v24[6] = IMMetricsCollectorConnectionTypeKey;
  v25[6] = &off_90D08;
  long long v22 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:7];

  long long v23 = +[IMMetricsCollector sharedInstance];
  [v23 trackEvent:IMMetricsCollectorEventSMSSentMessageSingleComponent withDictionary:v22];
}

void sub_FF7C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v5 = HIDWORD(a3);
  BOOL v6 = [*(id *)(a1 + 32) message];
  [v6 setErrorCode:a2];

  unsigned int v7 = [*(id *)(a1 + 32) smsSession];
  id v8 = [*(id *)(a1 + 32) message];
  CFStringRef v9 = [*(id *)(a1 + 32) chatIdentifier];
  objc_msgSend(v7, "didSendMessage:forChat:style:", v8, v9, objc_msgSend(*(id *)(a1 + 32), "chatStyle"));

  BOOL v10 = [*(id *)(a1 + 32) chatStyle] != 45;
  double v11 = [*(id *)(a1 + 32) message];
  double v12 = [v11 handle];
  uint64_t IsEmail = IMStringIsEmail();

  unsigned __int8 v14 = +[NSDate date];
  [v14 timeIntervalSinceDate:*(void *)(a1 + 40)];
  double v16 = v15;

  __int16 v17 = [*(id *)(a1 + 32) message];
  CFStringRef v18 = [v17 fileTransferGUIDs];
  BOOL v19 = [v18 count] != 0;

  uint64_t v20 = +[NSNumber numberWithDouble:v16];
  v29[0] = IMMetricsCollectorFzErrorKey;
  id v21 = +[NSNumber numberWithInt:a2];
  v30[0] = v21;
  v29[1] = IMMetricsCollectorCtErrorKey;
  long long v22 = +[NSNumber numberWithInt:v5];
  v30[1] = v22;
  v29[2] = IMMetricsCollectorIsGroupMessageKey;
  long long v23 = +[NSNumber numberWithBool:v10];
  v30[2] = v23;
  v29[3] = IMMetricsCollectorIsToPhoneNumberKey;
  long long v24 = +[NSNumber numberWithBool:IsEmail ^ 1];
  v30[3] = v24;
  v29[4] = IMMetricsCollectorIsToEmailKey;
  long long v25 = +[NSNumber numberWithInt:IsEmail];
  v30[4] = v25;
  v29[5] = IMMetricsCollectorHasAttachmentsKey;
  uint64_t v26 = +[NSNumber numberWithBool:v19];
  v30[5] = v26;
  v30[6] = v20;
  v29[6] = IMMetricsCollectorSendDurationKey;
  v29[7] = IMMetricsCollectorConnectionTypeKey;
  v30[7] = &off_90D08;
  id v27 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:8];

  uint64_t v28 = +[IMMetricsCollector sharedInstance];
  [v28 trackEvent:IMMetricsCollectorEventSMSSentMessageSingleComponent withDictionary:v27];
}

void sub_10F00(_Unwind_Exception *exc_buf, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x10358);
  }
  _Unwind_Resume(exc_buf);
}

void sub_10F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

Class sub_113A4(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_99C38)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_114D0;
    v3[4] = &unk_8D2B0;
    v3[5] = v3;
    long long v4 = off_8D298;
    uint64_t v5 = 0;
    qword_99C38 = _sl_dlopen();
  }
  if (!qword_99C38) {
    sub_5ECB0(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("DMFEmergencyModeMonitor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_5ED30();
  }
  qword_99C30 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_114D0()
{
  uint64_t result = _sl_dlopen();
  qword_99C38 = result;
  return result;
}

void sub_12054(id a1)
{
  qword_99C40 = (uint64_t)objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"uti-type", @"decryption-key", @"mmcs-url", @"mmcs-signature-hex", @"mmcs-owner", @"file-size", 0);
}

void sub_120C4(uint64_t a1, uint64_t a2)
{
  if ([(id)qword_99C40 containsObject:a2])
  {
    char v3 = (void *)IMCreateEscapedAttributeValueFromString();
    uint64_t v4 = IMCreateEscapedAttributeValueFromString();
    id v5 = (id)v4;
    if (v3 && v4) {
      [*(id *)(*(void *)(a1 + 32) + 8) appendFormat:@" %@=\"%@\"", v3, v4];
    }
  }
}

void sub_1267C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = IMOSLoggingEnabled();
  if (!v5)
  {
    if (v7)
    {
      id v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = *(void *)(a1 + 32);
        CFStringRef v23 = @"NO";
        *(_DWORD *)buf = 138412802;
        if (!v6) {
          CFStringRef v23 = @"YES";
        }
        uint64_t v31 = v22;
        __int16 v32 = 2112;
        CFStringRef v33 = v23;
        __int16 v34 = 2112;
        id v35 = v6;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "BlastDoor finished processing SMS/MMS message with GUID (%@). Success = (%@), error = (%@).", buf, 0x20u);
      }
    }
    unsigned __int8 v14 = [*(id *)(a1 + 48) objectForKey:LegacySMSCTMessageDictionaryTypeKey];
    uint64_t v20 = [*(id *)(a1 + 48) objectForKey:LegacySMSCTMessageDictionarySenderKey];
    long long v24 = +[NSString stringWithFormat:@"%@-%@.smsdata", v14, *(void *)(a1 + 32)];
    long long v25 = +[IMInternalPayloadUtilities writeMessagePayloadToTemporaryDirectory:*(void *)(a1 + 48) fileName:v24];
    +[IMBlastdoor sendBlastDoorError:v6 guid:*(void *)(a1 + 32) messageTypeString:v14 senderURI:v20 senderToken:0 messageContext:0 payloadAttachmentURL:v25];
    uint64_t v26 = *(void *)(a1 + 64);
    if (v26) {
      (*(void (**)(uint64_t, void, void, void))(v26 + 16))(v26, 0, 0, 0);
    }

    goto LABEL_19;
  }
  if (v7)
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      CFStringRef v9 = @"NO";
      uint64_t v10 = *(void *)(a1 + 32);
      if (!v6) {
        CFStringRef v9 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v31 = v10;
      __int16 v32 = 2112;
      CFStringRef v33 = v9;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "BlastDoor finished processing SMS/MMS message with GUID (%@). Success = (%@).", buf, 0x16u);
    }
  }
  IMWeakLinkClass();
  if (objc_opt_isKindOfClass())
  {
    double v11 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = v5;
    unsigned __int8 v14 = [v11 _messageDictionaryToRelayWithIncomingMessageDictionary:v12 smsMessage:v13];
    double v15 = *(void **)(a1 + 40);
    double v16 = [v13 GUID];
    [v15 _prepareSMSRelayBlockForMessageDictionary:v14 messageGUID:v16];

    __int16 v17 = *(void **)(a1 + 40);
    uint64_t v18 = *(void *)(a1 + 56);
    uint64_t v19 = *(unsigned __int8 *)(a1 + 72);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_12A38;
    v27[3] = &unk_8D320;
    id v28 = *(id *)(a1 + 32);
    id v29 = *(id *)(a1 + 64);
    [v17 _releasePendingMessagesAndProcessReceivedSMSMessage:v13 storageContext:v18 receivedViaRelay:v19 completionBlock:v27];

    uint64_t v20 = v28;
LABEL_19:
  }
}

void sub_12A38(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      CFStringRef v10 = @"NO";
      int v12 = 138412802;
      if (a2) {
        CFStringRef v10 = @"YES";
      }
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v7;
      __int16 v16 = 2112;
      CFStringRef v17 = v10;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "_processReceivedSMSMessage for original GUID (%@) parsed GUID (%@) returned (%@).", (uint8_t *)&v12, 0x20u);
    }
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v11 + 16))(v11, a2, v7, a4);
  }
}

id sub_12CD8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _processReceivedSMSMessage:*(void *)(a1 + 40) storageContext:*(void *)(a1 + 48) receivedViaRelay:*(unsigned __int8 *)(a1 + 64) completionBlock:*(void *)(a1 + 56)];
}

uint64_t sub_180E4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_180F4(uint64_t a1)
{
}

void sub_180FC(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 40);
  CFStringRef v10 = *(void **)(a1 + 32);
  uint64_t v11 = [*(id *)(a1 + 48) accountID];
  [v10 assignTransfer:v9 toAccount:v11 otherPerson:*(void *)(a1 + 56)];

  int v12 = *(void **)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  __int16 v14 = [v7 path];
  [v12 acceptTransfer:v13 path:v14];

  id v15 = +[IMDFileTransferCenter sharedInstance];
  uint64_t v16 = [v15 transferForGUID:*(void *)(a1 + 40)];
  uint64_t v17 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;

  [*(id *)(a1 + 64) addObject:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  if (a2)
  {
    uint64_t v19 = +[NSFileManager defaultManager];
    uint64_t v20 = [v7 path];
    unsigned int v21 = [v19 fileExistsAtPath:v20];

    if (v21)
    {
      uint64_t v22 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      if (v22)
      {
        [v22 _setLocalURL:v7];
        if (IMOSLoggingEnabled())
        {
          CFStringRef v23 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            int v34 = 138412290;
            id v35 = v7;
            _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Set transfer local url to: %@", (uint8_t *)&v34, 0xCu);
          }
        }
        if (IMOSLoggingEnabled())
        {
          long long v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            long long v25 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
            int v34 = 138412290;
            id v35 = v25;
            _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "  => Start finalizing file transfer: %@", (uint8_t *)&v34, 0xCu);
          }
        }
        [*(id *)(a1 + 32) startFinalizingTransfer:*(void *)(a1 + 40)];
        goto LABEL_33;
      }
      [*(id *)(a1 + 32) failTransfer:*(void *)(a1 + 40) error:0];
      if (!IMOSLoggingEnabled()) {
        goto LABEL_33;
      }
      id v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        CFStringRef v33 = *(void **)(a1 + 40);
        int v34 = 138412290;
        id v35 = v33;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "No file transfer generated for guid: %@", (uint8_t *)&v34, 0xCu);
      }
    }
    else
    {
      [*(id *)(a1 + 32) failTransfer:*(void *)(a1 + 40) error:0];
      if (!IMOSLoggingEnabled()) {
        goto LABEL_33;
      }
      id v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        __int16 v32 = *(void **)(a1 + 40);
        int v34 = 138412290;
        id v35 = v32;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Could not locate file for transfer: %@", (uint8_t *)&v34, 0xCu);
      }
    }
LABEL_32:

    goto LABEL_33;
  }
  uint64_t v26 = [v8 domain];
  if (![v26 isEqualToString:IMFileTransferErrorDomain])
  {

    goto LABEL_21;
  }
  id v27 = (int *)[v8 code];

  if (v27 != &dword_1C)
  {
LABEL_21:
    [*(id *)(a1 + 32) failTransfer:*(void *)(a1 + 40) error:v8];
    if (!IMOSLoggingEnabled()) {
      goto LABEL_33;
    }
    id v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      uint64_t v31 = *(void **)(a1 + 40);
      int v34 = 138412290;
      id v35 = v31;
      _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Could not locate file for transfer: %@", (uint8_t *)&v34, 0xCu);
    }
    goto LABEL_32;
  }
  if (IMOSLoggingEnabled())
  {
    id v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      id v29 = *(void **)(a1 + 40);
      int v34 = 138412290;
      id v35 = v29;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "Transfer rejected: %@", (uint8_t *)&v34, 0xCu);
    }
  }
  [*(id *)(a1 + 32) rejectTransfer:*(void *)(a1 + 40)];
LABEL_33:
}

void sub_185D4(void *a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "MMS safe render generation complete.", buf, 2u);
    }
  }
  if (v8 && IMOSLoggingEnabled())
  {
    CFStringRef v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = a1[4];
      *(_DWORD *)buf = 138412546;
      uint64_t v23 = v11;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Error decontaminating MMS transfer: %@ error: %@", buf, 0x16u);
    }
  }
  if (a2 && ([(id)a1[5] isEqual:v7] & 1) != 0)
  {
    if (IMOSLoggingEnabled())
    {
      int v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = a1[5];
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v13;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Generating safe render succeeded, but still using the original path since we cannot transcode the entire asset: %@", buf, 0xCu);
      }
    }
    id v14 = 0;
  }
  else
  {
    id v15 = +[NSFileManager defaultManager];
    uint64_t v16 = a1[5];
    id v21 = 0;
    unsigned __int8 v17 = [v15 removeItemAtURL:v16 error:&v21];
    id v14 = v21;

    if ((v17 & 1) == 0 && IMOSLoggingEnabled())
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = a1[5];
        *(_DWORD *)buf = 138412546;
        uint64_t v23 = v19;
        __int16 v24 = 2112;
        id v25 = v14;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Error removing MMS transfer: %@ error: %@", buf, 0x16u);
      }
    }
    uint64_t v20 = +[NSError errorWithDomain:IMFileTransferErrorDomain code:28 userInfo:0];

    id v8 = (id)v20;
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void sub_188FC(uint64_t a1, int a2, int *a3, id a4, void *a5)
{
  id v85 = a5;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = *(__CFString **)(a1 + 32);
      CFStringRef v9 = @"NO";
      *(_DWORD *)buf = 138413314;
      if (a2) {
        CFStringRef v9 = @"YES";
      }
      v110 = v8;
      __int16 v111 = 2112;
      CFStringRef v112 = v9;
      __int16 v113 = 2048;
      v114 = a3;
      __int16 v115 = 2048;
      id v116 = a4;
      __int16 v117 = 2112;
      id v118 = v85;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "processDictCompletionBlock called for chatid %@ needsToRegister %@ category %ld, subCategory %ld, extensionName %@", buf, 0x34u);
    }
  }
  CFStringRef v10 = (__CFString *)*(id *)(a1 + 32);
  uint64_t v11 = (__CFString *)*(id *)(a1 + 40);
  int v12 = (int *)*(id *)(a1 + 48);
  id v78 = *(id *)(a1 + 56);
  id v80 = *(id *)(a1 + 64);
  v88 = a3;
  if ([*(id *)(a1 + 72) _isMessageCategorized:a3])
  {
    if (a3 == (int *)((char *)&dword_0 + 3))
    {
      uint64_t v13 = @"smsfp";
    }
    else
    {
      if (a3 != &dword_4)
      {
        uint64_t v13 = @"filtered";
        goto LABEL_28;
      }
      uint64_t v13 = @"smsft";
    }
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id v15 = +[IMSMSFilterHelper fetchSMSFilterExtensionParams];
    id v16 = [v15 countByEnumeratingWithState:&v97 objects:v108 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v98;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v98 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = *(void **)(*((void *)&v97 + 1) + 8 * i);
          if ([v19 action] == v88 && objc_msgSend(v19, "subAction") == a4)
          {
            uint64_t v13 = [v19 label];
            goto LABEL_26;
          }
        }
        id v16 = [v15 countByEnumeratingWithState:&v97 objects:v108 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
LABEL_26:

LABEL_28:
    BOOL v20 = *(unsigned char *)(a1 + 140) == 0;
    v86 = [*(id *)(a1 + 72) _createNewChatIdentifierFromChatIdentifier:*(void *)(a1 + 32) andCategoryLabel:v13];

    if (v20)
    {
      v82 = v86;

      if (IMOSLoggingEnabled())
      {
        id v39 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v110 = v82;
          _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "Generated new filtered chat identifier: %@", buf, 0xCu);
        }
      }
      [*(id *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) setSender:v82];
      id v30 = +[IMDChatRegistry sharedInstance];
      v36 = [*(id *)(a1 + 72) account];
      v38 = [v30 existingChatForID:v82 account:v36];
      id v14 = v80;
      __int16 v76 = v12;
    }
    else
    {
      id v21 = *(void **)(a1 + 72);
      uint64_t v22 = [*(id *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) sender];
      v82 = [v21 _createNewChatIdentifierFromChatIdentifier:v22 andCategoryLabel:v13];

      __int16 v76 = [*(id *)(a1 + 72) _createNewChatIdentifierFromChatIdentifier:*(void *)(a1 + 48) andCategoryLabel:v13];

      if (IMOSLoggingEnabled())
      {
        uint64_t v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v110 = v86;
          __int16 v111 = 2112;
          CFStringRef v112 = v82;
          __int16 v113 = 2112;
          v114 = v76;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Generated new chatIdentifier for group: %@ filteredSender: %@ filteredSenderUnformatted: %@", buf, 0x20u);
        }
      }
      id v24 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      id v25 = *(id *)(a1 + 56);
      id v26 = [v25 countByEnumeratingWithState:&v93 objects:v107 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v94;
        do
        {
          for (j = 0; j != v26; j = (char *)j + 1)
          {
            if (*(void *)v94 != v27) {
              objc_enumerationMutation(v25);
            }
            id v29 = [*(id *)(a1 + 72) _createNewChatIdentifierFromChatIdentifier:*(void *)(*((void *)&v93 + 1) + 8 * (void)j) andCategoryLabel:v13];
            [v24 addObject:v29];
          }
          id v26 = [v25 countByEnumeratingWithState:&v93 objects:v107 count:16];
        }
        while (v26);
      }

      id v30 = v24;
      id v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id v31 = *(id *)(a1 + 64);
      id v32 = [v31 countByEnumeratingWithState:&v89 objects:v106 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v90;
        do
        {
          for (k = 0; k != v32; k = (char *)k + 1)
          {
            if (*(void *)v90 != v33) {
              objc_enumerationMutation(v31);
            }
            id v35 = [*(id *)(a1 + 72) _createNewChatIdentifierFromChatIdentifier:*(void *)(*((void *)&v89 + 1) + 8 * (void)k) andCategoryLabel:v13];
            [v14 addObject:v35];
          }
          id v32 = [v31 countByEnumeratingWithState:&v89 objects:v106 count:16];
        }
        while (v32);
      }

      [*(id *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) setSender:v82];
      v36 = +[IMDChatRegistry sharedInstance];
      v37 = [*(id *)(a1 + 72) account];
      v38 = [v36 existingChatForIDs:v30 account:v37 style:43];

      id v78 = v30;
    }

    if (v38) {
      char v40 = a2;
    }
    else {
      char v40 = 1;
    }

    if ((v40 & 1) == 0)
    {
      int v77 = 0;
      goto LABEL_65;
    }
    goto LABEL_57;
  }
  if (!a2)
  {
    __int16 v76 = v12;
    int v77 = 0;
    v86 = v10;
    v82 = v11;
    id v14 = v80;
    goto LABEL_65;
  }
  v86 = v10;
  v82 = v11;
  __int16 v76 = v12;
  id v14 = v80;
LABEL_57:
  id v41 = *(void **)(a1 + 72);
  if (*(unsigned char *)(a1 + 140))
  {
    int v77 = [*(id *)(a1 + 72) createHandleInfoForParticipants:v78 unformattedIDs:v14 countryCodes:*(void *)(a1 + 80) isGroupChat:1];
  }
  else
  {
    v105 = v82;
    uint64_t v42 = +[NSArray arrayWithObjects:&v105 count:1];
    v104 = v76;
    v43 = +[NSArray arrayWithObjects:&v104 count:1];
    uint64_t v103 = *(void *)(a1 + 88);
    uint64_t v44 = +[NSArray arrayWithObjects:&v103 count:1];
    int v77 = [v41 createHandleInfoForParticipants:v42 unformattedIDs:v43 countryCodes:v44 isGroupChat:0];
  }
  if (!objc_msgSend(*(id *)(a1 + 96), "has_sendEnabled")
    || ([*(id *)(a1 + 96) sendEnabled] & 1) != 0
    || *(unsigned char *)(a1 + 140))
  {
    [*(id *)(a1 + 72) didJoinChat:v86 style:*(unsigned __int8 *)(a1 + 141) displayName:0 groupID:0 originalGroupID:0 handleInfo:v77 category:v88 spamExtensionName:v85];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v75 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v75, OS_LOG_TYPE_INFO, "Replying is disabled, joining chat with Read Only state", buf, 2u);
      }
    }
    [*(id *)(a1 + 72) didJoinReadOnlyChat:v86 style:*(unsigned __int8 *)(a1 + 141) displayName:0 groupID:0 handleInfo:v77 category:v88 spamExtensionName:v85];
  }
LABEL_65:
  v81 = [*(id *)(a1 + 96) originatedDeviceNumber];
  v45 = +[IMDChatRegistry sharedInstance];
  id v46 = [*(id *)(a1 + 72) account];
  v84 = [v45 existingChatWithIdentifier:v86 account:v46];

  [*(id *)(a1 + 72) _updateCategoryForChat:v84 andMessage:*(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) category:v88 subCategory:a4 shouldRegister:*(unsigned __int8 *)(a1 + 142) spamExtensionName:v85];
  v47 = +[IMFeatureFlags sharedFeatureFlags];
  LODWORD(v46) = [v47 stewieEnabled];

  if (v46)
  {
    if (([v84 isEmergencyChat] & 1) == 0)
    {
      unsigned int v48 = +[IDSCTAdapter sharedInstance];
      v49 = [*(id *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) sender];
      unsigned int v50 = [v48 isPhoneNumberEmergencyNumber:v49];

      if (v50)
      {
        if (IMOSLoggingEnabled())
        {
          BOOL v51 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v51, OS_LOG_TYPE_INFO, "Receiving: Chat has been marked as an emergency chat", buf, 2u);
          }
        }
        [v84 updateIsEmergencyChat:1];
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 72), "_updateLastAddressedIDsIfNeededForChatWithIdentifier:style:lastAddressedHandle:lastAddressedSIMID:iMessageCapability:", v86, *(unsigned __int8 *)(a1 + 141), v81, *(void *)(a1 + 104), objc_msgSend(*(id *)(a1 + 96), "iMessageCapability"));
  if (*(int *)(a1 + 136) >= 1)
  {
    if (IMOSLoggingEnabled())
    {
      v52 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        int v53 = *(_DWORD *)(a1 + 136);
        *(_DWORD *)buf = 67109120;
        LODWORD(v110) = v53;
        _os_log_impl(&dword_0, v52, OS_LOG_TYPE_INFO, " => This is a replace message for ID: %d", buf, 8u);
      }
    }
    [*(id *)(a1 + 72) didReceiveReplaceMessageID:*(unsigned int *)(a1 + 136) forChat:v86 style:*(unsigned __int8 *)(a1 + 141)];
  }
  if (*(void *)(a1 + 48)) {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 128) + 8) + 40), "setOriginalUnformattedID:");
  }
  id v54 = [*(id *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) sender];
  uint64_t IsEmail = IMStringIsEmail();

  int v56 = [*(id *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) fileTransferGUIDs];
  BOOL v79 = [v56 count] != 0;

  v101[0] = IMMetricsCollectorFzErrorKey;
  v57 = +[NSNumber numberWithLong:0];
  v102[0] = v57;
  v101[1] = IMMetricsCollectorIsGroupMessageKey;
  long long v58 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 140)];
  v102[1] = v58;
  v101[2] = IMMetricsCollectorIsFromPhoneNumberKey;
  long long v59 = +[NSNumber numberWithBool:IsEmail ^ 1];
  v102[2] = v59;
  v101[3] = IMMetricsCollectorIsFromEmailKey;
  long long v60 = +[NSNumber numberWithInt:IsEmail];
  v102[3] = v60;
  v101[4] = IMMetricsCollectorHasAttachmentsKey;
  long long v61 = +[NSNumber numberWithBool:v79];
  v102[4] = v61;
  long long v62 = +[NSDictionary dictionaryWithObjects:v102 forKeys:v101 count:5];

  long long v63 = +[IMMetricsCollector sharedInstance];
  [v63 trackEvent:IMMetricsCollectorEventSMSReceivedMessageSingleComponent withDictionary:v62];

  long long v64 = *(void **)(a1 + 72);
  long long v65 = [*(id *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) subject];
  [v64 _carrierReportJunkMetricsForSMSWithSubject:v65 isGroupchat:*(unsigned __int8 *)(a1 + 140) hasAttachments:v79];

  long long v66 = +[IMMessageNotificationTimeManager sharedInstance];
  [v66 sendNotificationMessageIfNeededForIncomingMessageFromChatIdentifier:v86];

  if (*(void *)(a1 + 112))
  {
    long long v67 = [*(id *)(a1 + 72) tapbackInterpreter];
    uint64_t v68 = [v67 interpretMessageItem:*(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) inChat:*(void *)(a1 + 112)];
    uint64_t v69 = *(void *)(*(void *)(a1 + 128) + 8);
    v70 = *(void **)(v69 + 40);
    *(void *)(v69 + 40) = v68;
  }
  [*(id *)(a1 + 72) didReceiveMessage:*(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) forChat:v86 style:*(unsigned __int8 *)(a1 + 141) fromIDSID:0];
  v71 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v72 = [v71 isSMSFilterSyncEnabled];

  if (v72)
  {
    v73 = *(void **)(a1 + 72);
    uint64_t v74 = *(void *)(a1 + 120);
    if (*(unsigned char *)(a1 + 143)) {
      [v73 _clearSMSRelayMapForMessageWithGUID:v74];
    }
    else {
      [v73 _executeSMSRelayBlockForMessageWithGUID:v74 category:v88 subCategory:a4];
    }
  }
}

void sub_19A94(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  int v8 = IMOSLoggingEnabled();
  if (v6)
  {
    if (v8)
    {
      CFStringRef v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        CFStringRef v10 = @"NO";
        if (!v7) {
          CFStringRef v10 = @"YES";
        }
        int v13 = 138412290;
        CFStringRef v14 = v10;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "BlastDoor finished processing SMSFIlteringSettingsMessage. Success = (%@).", (uint8_t *)&v13, 0xCu);
      }
    }
    IMWeakLinkClass();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(a1 + 32) _processReceivedSMSFilteringSettingsMessage:v6 deviceID:*(void *)(a1 + 40)];
    }
  }
  else if (v8)
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      CFStringRef v12 = @"NO";
      if (!v7) {
        CFStringRef v12 = @"YES";
      }
      int v13 = 138412546;
      CFStringRef v14 = v12;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "BlastDoor finished processing SMSFIlteringSettingsMessage. Success = (%@), error = (%@).", (uint8_t *)&v13, 0x16u);
    }
  }
}

void sub_19E78(id a1)
{
  qword_9C0C8 = objc_alloc_init(LegacySMSRelayTranscodeController);

  _objc_release_x1();
}

void sub_1A36C(id a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  char v3 = _Block_copy(&stru_8D490);
  objc_msgSend(v2, "setObject:forKey:", v3, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 140));

  uint64_t v4 = _Block_copy(&stru_8D4B0);
  objc_msgSend(v2, "setObject:forKey:", v4, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 141));

  id v5 = _Block_copy(&stru_8D4D0);
  objc_msgSend(v2, "setObject:forKey:", v5, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 143));

  id v6 = _Block_copy(&stru_8D4F0);
  objc_msgSend(v2, "setObject:forKey:", v6, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 144));

  id v7 = _Block_copy(&stru_8D510);
  objc_msgSend(v2, "setObject:forKey:", v7, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 146));

  int v8 = _Block_copy(&stru_8D530);
  objc_msgSend(v2, "setObject:forKey:", v8, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 147));

  CFStringRef v9 = _Block_copy(&stru_8D550);
  objc_msgSend(v2, "setObject:forKey:", v9, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 149));

  CFStringRef v10 = _Block_copy(&stru_8D570);
  objc_msgSend(v2, "setObject:forKey:", v10, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 142));

  uint64_t v11 = _Block_copy(&stru_8D590);
  objc_msgSend(v2, "setObject:forKey:", v11, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 148));

  CFStringRef v12 = _Block_copy(&stru_8D5B0);
  objc_msgSend(v2, "setObject:forKey:", v12, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 181));

  int v13 = _Block_copy(&stru_8D5D0);
  objc_msgSend(v2, "setObject:forKey:", v13, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 182));

  CFStringRef v14 = _Block_copy(&stru_8D5F0);
  objc_msgSend(v2, "setObject:forKey:", v14, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 145));

  if (objc_msgSend(+[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags"), "isSMSFilterSyncEnabled"))
  {
    __int16 v15 = _Block_copy(&stru_8D610);
    objc_msgSend(v2, "setObject:forKey:", v15, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 139));
  }
  qword_9C080 = (uint64_t)v2;
}

void sub_1A64C(id a1, LegacySMSRelayPushHandler *a2, NSDictionary *a3, NSDictionary *a4, id a5, BOOL a6)
{
  id v7 = _os_activity_create(&dword_0, "com.apple.messages.SMSReceivedRelayMessage", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);

  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Using Block Incoming Message", buf, 2u);
    }
  }
  id v9 = [(LegacySMSRelayPushHandler *)a2 copyHandlersForEnumerating];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v10)
  {
    uint64_t v32 = *(void *)v34;
    id obj = v9;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v34 != v32) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v12 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v13 = objc_opt_class();
          CFStringRef v14 = off_996D8;
          id v15 = [(NSDictionary *)a4 objectForKey:off_996D8];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v15)
          {
            id v16 = +[IMRGLog registration];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v39 = v14;
              __int16 v40 = 2112;
              uint64_t v41 = v13;
              _os_log_fault_impl(&dword_0, v16, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v15 = 0;
          }
          uint64_t v17 = objc_opt_class();
          uint64_t v18 = off_996E0;
          id v19 = [(NSDictionary *)a4 objectForKey:off_996E0];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v19)
          {
            BOOL v20 = +[IMRGLog registration];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v39 = v18;
              __int16 v40 = 2112;
              uint64_t v41 = v17;
              _os_log_fault_impl(&dword_0, v20, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v19 = 0;
          }
          [(NSDictionary *)a4 objectForKey:@"t"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v21 = +[NSData _IDSDataFromBase64String:[(NSDictionary *)a4 objectForKey:@"t"]];
            goto LABEL_24;
          }
          [(NSDictionary *)a4 objectForKey:@"t"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v21 = [(NSDictionary *)a4 objectForKey:@"t"];
LABEL_24:
            id v22 = v21;
          }
          else
          {
            id v22 = 0;
          }
          uint64_t v23 = objc_opt_class();
          id v24 = [(NSDictionary *)a4 objectForKey:@"e"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v24)
          {
            id v25 = +[IMRGLog registration];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v39 = @"e";
              __int16 v40 = 2112;
              uint64_t v41 = v23;
              _os_log_fault_impl(&dword_0, v25, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v24 = 0;
          }
          uint64_t v26 = objc_opt_class();
          id v27 = [(NSDictionary *)a4 objectForKey:@"H"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v27)
          {
            id v28 = +[IMRGLog registration];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v39 = @"H";
              __int16 v40 = 2112;
              uint64_t v41 = v26;
              _os_log_fault_impl(&dword_0, v28, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v27 = 0;
          }
          [v12 handler:a2 incomingPlainTextMessage:a3 toIdentifier:v15 fromIdentifier:v19 fromToken:v22 timeStamp:v24 storageContext:v27];
        }
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v10 != v11);
      id v9 = obj;
      id v10 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v10);
  }

  os_activity_scope_leave(&state);
}

void sub_1AC0C()
{
}

void sub_1AC54()
{
}

void sub_1AD00(id a1, LegacySMSRelayPushHandler *a2, NSDictionary *a3, NSDictionary *a4, id a5, BOOL a6)
{
  id v7 = _os_activity_create(&dword_0, "com.apple.messages.SMSReceivedRelayDownloadRequest", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);

  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Using Block Incoming Downlaod Message", buf, 2u);
    }
  }
  id v9 = [(LegacySMSRelayPushHandler *)a2 copyHandlersForEnumerating];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v10)
  {
    uint64_t v32 = *(void *)v34;
    id obj = v9;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v34 != v32) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v12 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v13 = objc_opt_class();
          CFStringRef v14 = off_996D8;
          id v15 = [(NSDictionary *)a4 objectForKey:off_996D8];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v15)
          {
            id v16 = +[IMRGLog registration];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v39 = v14;
              __int16 v40 = 2112;
              uint64_t v41 = v13;
              _os_log_fault_impl(&dword_0, v16, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v15 = 0;
          }
          uint64_t v17 = objc_opt_class();
          uint64_t v18 = off_996E0;
          id v19 = [(NSDictionary *)a4 objectForKey:off_996E0];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v19)
          {
            BOOL v20 = +[IMRGLog registration];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v39 = v18;
              __int16 v40 = 2112;
              uint64_t v41 = v17;
              _os_log_fault_impl(&dword_0, v20, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v19 = 0;
          }
          [(NSDictionary *)a4 objectForKey:@"t"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v21 = +[NSData _IDSDataFromBase64String:[(NSDictionary *)a4 objectForKey:@"t"]];
            goto LABEL_24;
          }
          [(NSDictionary *)a4 objectForKey:@"t"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v21 = [(NSDictionary *)a4 objectForKey:@"t"];
LABEL_24:
            id v22 = v21;
          }
          else
          {
            id v22 = 0;
          }
          uint64_t v23 = objc_opt_class();
          id v24 = [(NSDictionary *)a4 objectForKey:@"e"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v24)
          {
            id v25 = +[IMRGLog registration];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v39 = @"e";
              __int16 v40 = 2112;
              uint64_t v41 = v23;
              _os_log_fault_impl(&dword_0, v25, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v24 = 0;
          }
          uint64_t v26 = objc_opt_class();
          id v27 = [(NSDictionary *)a4 objectForKey:@"H"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v27)
          {
            id v28 = +[IMRGLog registration];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v39 = @"H";
              __int16 v40 = 2112;
              uint64_t v41 = v26;
              _os_log_fault_impl(&dword_0, v28, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v27 = 0;
          }
          [v12 handler:a2 incomingDownloadMessage:a3 toIdentifier:v15 fromIdentifier:v19 fromToken:v22 timeStamp:v24 storageContext:v27];
        }
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v10 != v11);
      id v9 = obj;
      id v10 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v10);
  }

  os_activity_scope_leave(&state);
}

void sub_1B2C0()
{
}

void sub_1B308()
{
}

void sub_1B3B4(id a1, LegacySMSRelayPushHandler *a2, NSDictionary *a3, NSDictionary *a4, id a5, BOOL a6)
{
  id v7 = _os_activity_create(&dword_0, "com.apple.messages.SMSReceivedRelaySendRequest", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);

  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Using Block Outgoing Message", buf, 2u);
    }
  }
  id v9 = [(LegacySMSRelayPushHandler *)a2 copyHandlersForEnumerating];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v35 = [v9 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v37;
    id obj = v9;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v37 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v12 = objc_opt_class();
          uint64_t v13 = off_996D8;
          id v14 = [(NSDictionary *)a4 objectForKey:off_996D8];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v14)
          {
            id v15 = +[IMRGLog registration];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v42 = v13;
              __int16 v43 = 2112;
              uint64_t v44 = v12;
              _os_log_fault_impl(&dword_0, v15, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v14 = 0;
          }
          uint64_t v16 = objc_opt_class();
          uint64_t v17 = off_996E0;
          id v18 = [(NSDictionary *)a4 objectForKey:off_996E0];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v18)
          {
            id v19 = +[IMRGLog registration];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v42 = v17;
              __int16 v43 = 2112;
              uint64_t v44 = v16;
              _os_log_fault_impl(&dword_0, v19, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v18 = 0;
          }
          [(NSDictionary *)a4 objectForKey:@"t"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v20 = +[NSData _IDSDataFromBase64String:[(NSDictionary *)a4 objectForKey:@"t"]];
            goto LABEL_24;
          }
          [(NSDictionary *)a4 objectForKey:@"t"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v20 = [(NSDictionary *)a4 objectForKey:@"t"];
LABEL_24:
            id v21 = v20;
          }
          else
          {
            id v21 = 0;
          }
          [(NSDictionary *)a4 objectForKey:@"U"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            +[NSData _IDSDataFromBase64String:[(NSDictionary *)a4 objectForKey:@"U"]];
          }
          else
          {
            [(NSDictionary *)a4 objectForKey:@"U"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [(NSDictionary *)a4 objectForKey:@"U"];
            }
          }
          uint64_t v22 = JWUUIDPushObjectToString();
          uint64_t v23 = objc_opt_class();
          id v24 = [(NSDictionary *)a4 objectForKey:@"e"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v24)
          {
            id v25 = +[IMRGLog registration];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v42 = @"e";
              __int16 v43 = 2112;
              uint64_t v44 = v23;
              _os_log_fault_impl(&dword_0, v25, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v24 = 0;
          }
          uint64_t v26 = objc_opt_class();
          id v27 = [(NSDictionary *)a4 objectForKey:@"H"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v27)
          {
            id v28 = +[IMRGLog registration];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v42 = @"H";
              __int16 v43 = 2112;
              uint64_t v44 = v26;
              _os_log_fault_impl(&dword_0, v28, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v27 = 0;
          }
          LOBYTE(v29) = a6;
          [v11 handler:a2 outgoingPlainTextMessage:a3 toIdentifier:v14 fromIdentifier:v18 fromToken:v21 messageGUID:v22 timeStamp:v24 isBeingReplayed:v29 storageContext:v27];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v35 != v10);
      id v9 = obj;
      id v35 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v35);
  }

  os_activity_scope_leave(&state);
}

void sub_1BA38()
{
}

void sub_1BA80()
{
}

void sub_1BB2C(id a1, LegacySMSRelayPushHandler *a2, NSDictionary *a3, NSDictionary *a4, id a5, BOOL a6)
{
  id v7 = _os_activity_create(&dword_0, "com.apple.messages.SMSReceivedRelaySendDownloadRequest", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);

  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Using Block Outgoing Download Message", buf, 2u);
    }
  }
  id v9 = [(LegacySMSRelayPushHandler *)a2 copyHandlersForEnumerating];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v35 = [v9 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v37;
    id obj = v9;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v37 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v12 = objc_opt_class();
          uint64_t v13 = off_996D8;
          id v14 = [(NSDictionary *)a4 objectForKey:off_996D8];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v14)
          {
            id v15 = +[IMRGLog registration];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v42 = v13;
              __int16 v43 = 2112;
              uint64_t v44 = v12;
              _os_log_fault_impl(&dword_0, v15, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v14 = 0;
          }
          uint64_t v16 = objc_opt_class();
          uint64_t v17 = off_996E0;
          id v18 = [(NSDictionary *)a4 objectForKey:off_996E0];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v18)
          {
            id v19 = +[IMRGLog registration];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v42 = v17;
              __int16 v43 = 2112;
              uint64_t v44 = v16;
              _os_log_fault_impl(&dword_0, v19, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v18 = 0;
          }
          [(NSDictionary *)a4 objectForKey:@"t"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v20 = +[NSData _IDSDataFromBase64String:[(NSDictionary *)a4 objectForKey:@"t"]];
            goto LABEL_24;
          }
          [(NSDictionary *)a4 objectForKey:@"t"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v20 = [(NSDictionary *)a4 objectForKey:@"t"];
LABEL_24:
            id v21 = v20;
          }
          else
          {
            id v21 = 0;
          }
          [(NSDictionary *)a4 objectForKey:@"U"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            +[NSData _IDSDataFromBase64String:[(NSDictionary *)a4 objectForKey:@"U"]];
          }
          else
          {
            [(NSDictionary *)a4 objectForKey:@"U"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [(NSDictionary *)a4 objectForKey:@"U"];
            }
          }
          uint64_t v22 = JWUUIDPushObjectToString();
          uint64_t v23 = objc_opt_class();
          id v24 = [(NSDictionary *)a4 objectForKey:@"e"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v24)
          {
            id v25 = +[IMRGLog registration];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v42 = @"e";
              __int16 v43 = 2112;
              uint64_t v44 = v23;
              _os_log_fault_impl(&dword_0, v25, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v24 = 0;
          }
          uint64_t v26 = objc_opt_class();
          id v27 = [(NSDictionary *)a4 objectForKey:@"H"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v27)
          {
            id v28 = +[IMRGLog registration];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v42 = @"H";
              __int16 v43 = 2112;
              uint64_t v44 = v26;
              _os_log_fault_impl(&dword_0, v28, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v27 = 0;
          }
          LOBYTE(v29) = a6;
          [v11 handler:a2 outgoingDownloadMessage:a3 toIdentifier:v14 fromIdentifier:v18 fromToken:v21 messageGUID:v22 timeStamp:v24 isBeingReplayed:v29 storageContext:v27];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v35 != v10);
      id v9 = obj;
      id v35 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v35);
  }

  os_activity_scope_leave(&state);
}

void sub_1C1B0()
{
}

void sub_1C1F8()
{
}

void sub_1C2A4(id a1, LegacySMSRelayPushHandler *a2, NSDictionary *a3, NSDictionary *a4, id a5, BOOL a6)
{
  id v7 = _os_activity_create(&dword_0, "com.apple.messages.SMSReceivedRelaySentReceipt", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);

  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Using Block Message Sent Message", buf, 2u);
    }
  }
  id v9 = [(LegacySMSRelayPushHandler *)a2 copyHandlersForEnumerating];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v10)
  {
    uint64_t v32 = *(void *)v34;
    *(void *)&long long v11 = 138412802;
    long long v29 = v11;
    id obj = v9;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v34 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector())
        {
          [(NSDictionary *)a4 objectForKey:@"U", v29];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            +[NSData _IDSDataFromBase64String:[(NSDictionary *)a4 objectForKey:@"U"]];
          }
          else
          {
            [(NSDictionary *)a4 objectForKey:@"U"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [(NSDictionary *)a4 objectForKey:@"U"];
            }
          }
          uint64_t v14 = JWUUIDPushObjectToString();
          uint64_t v15 = objc_opt_class();
          uint64_t v16 = off_996D8;
          id v17 = [(NSDictionary *)a4 objectForKey:off_996D8];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v17)
          {
            id v18 = +[IMRGLog registration];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v39 = v16;
              __int16 v40 = 2112;
              uint64_t v41 = v15;
              _os_log_fault_impl(&dword_0, v18, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v17 = 0;
          }
          uint64_t v19 = objc_opt_class();
          id v20 = off_996E0;
          id v21 = [(NSDictionary *)a4 objectForKey:off_996E0];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v21)
          {
            uint64_t v22 = +[IMRGLog registration];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v39 = v20;
              __int16 v40 = 2112;
              uint64_t v41 = v19;
              _os_log_fault_impl(&dword_0, v22, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v21 = 0;
          }
          uint64_t v23 = objc_opt_class();
          id v24 = [(NSDictionary *)a4 objectForKey:@"e"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v24)
          {
            id v25 = +[IMRGLog registration];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v39 = @"e";
              __int16 v40 = 2112;
              uint64_t v41 = v23;
              _os_log_fault_impl(&dword_0, v25, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v24 = 0;
          }
          uint64_t v26 = objc_opt_class();
          id v27 = [(NSDictionary *)a4 objectForKey:@"H"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v27)
          {
            id v28 = +[IMRGLog registration];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v39 = @"H";
              __int16 v40 = 2112;
              uint64_t v41 = v26;
              _os_log_fault_impl(&dword_0, v28, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v27 = 0;
          }
          [v13 handler:a2 messageIDSent:v14 toIdentifier:v17 fromIdentifier:v21 timeStamp:v24 storageContext:v27];
        }
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v9 = obj;
      id v10 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v10);
  }

  os_activity_scope_leave(&state);
}

void sub_1C868()
{
}

void sub_1C8B0()
{
}

void sub_1C95C(id a1, LegacySMSRelayPushHandler *a2, NSDictionary *a3, NSDictionary *a4, id a5, BOOL a6)
{
  id v7 = _os_activity_create(&dword_0, "com.apple.messages.SMSReceivedRelayReadReceipt", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);

  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Using Block Read Reciept Message", buf, 2u);
    }
  }
  id v9 = [(LegacySMSRelayPushHandler *)a2 copyHandlersForEnumerating];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v10)
  {
    uint64_t v32 = *(void *)v34;
    *(void *)&long long v11 = 138412802;
    long long v29 = v11;
    id obj = v9;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v34 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector())
        {
          [(NSDictionary *)a4 objectForKey:@"U", v29];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            +[NSData _IDSDataFromBase64String:[(NSDictionary *)a4 objectForKey:@"U"]];
          }
          else
          {
            [(NSDictionary *)a4 objectForKey:@"U"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [(NSDictionary *)a4 objectForKey:@"U"];
            }
          }
          uint64_t v14 = JWUUIDPushObjectToString();
          uint64_t v15 = objc_opt_class();
          id v16 = [(NSDictionary *)a4 objectForKey:@"e"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v16)
          {
            id v17 = +[IMRGLog registration];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v39 = @"e";
              __int16 v40 = 2112;
              uint64_t v41 = v15;
              _os_log_fault_impl(&dword_0, v17, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v16 = 0;
          }
          uint64_t v18 = objc_opt_class();
          uint64_t v19 = off_996D8;
          id v20 = [(NSDictionary *)a4 objectForKey:off_996D8];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v20)
          {
            id v21 = +[IMRGLog registration];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v39 = v19;
              __int16 v40 = 2112;
              uint64_t v41 = v18;
              _os_log_fault_impl(&dword_0, v21, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v20 = 0;
          }
          uint64_t v22 = objc_opt_class();
          uint64_t v23 = off_996E0;
          id v24 = [(NSDictionary *)a4 objectForKey:off_996E0];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v24)
          {
            id v25 = +[IMRGLog registration];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v39 = v23;
              __int16 v40 = 2112;
              uint64_t v41 = v22;
              _os_log_fault_impl(&dword_0, v25, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v24 = 0;
          }
          uint64_t v26 = objc_opt_class();
          id v27 = [(NSDictionary *)a4 objectForKey:@"H"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v27)
          {
            id v28 = +[IMRGLog registration];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v39 = @"H";
              __int16 v40 = 2112;
              uint64_t v41 = v26;
              _os_log_fault_impl(&dword_0, v28, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v27 = 0;
          }
          [v13 handler:a2 messageIDRead:v14 timeStamp:v16 toIdentifier:v20 fromIdentifier:v24 storageContext:v27];
        }
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v9 = obj;
      id v10 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v10);
  }

  os_activity_scope_leave(&state);
}

void sub_1CF20()
{
}

void sub_1CF68()
{
}

void sub_1D014(id a1, LegacySMSRelayPushHandler *a2, NSDictionary *a3, NSDictionary *a4, id a5, BOOL a6)
{
  id v7 = _os_activity_create(&dword_0, "com.apple.messages.SMSReceivedRelayFailure", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);

  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Using Block Message Failures Message", buf, 2u);
    }
  }
  id v9 = [(LegacySMSRelayPushHandler *)a2 copyHandlersForEnumerating];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v10)
  {
    uint64_t v32 = *(void *)v34;
    *(void *)&long long v11 = 138412802;
    long long v29 = v11;
    id obj = v9;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v34 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector())
        {
          [(NSDictionary *)a4 objectForKey:@"U", v29];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            +[NSData _IDSDataFromBase64String:[(NSDictionary *)a4 objectForKey:@"U"]];
          }
          else
          {
            [(NSDictionary *)a4 objectForKey:@"U"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [(NSDictionary *)a4 objectForKey:@"U"];
            }
          }
          uint64_t v14 = JWUUIDPushObjectToString();
          uint64_t v15 = objc_opt_class();
          id v16 = off_996D8;
          id v17 = [(NSDictionary *)a4 objectForKey:off_996D8];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v17)
          {
            uint64_t v18 = +[IMRGLog registration];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v39 = v16;
              __int16 v40 = 2112;
              uint64_t v41 = v15;
              _os_log_fault_impl(&dword_0, v18, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v17 = 0;
          }
          uint64_t v19 = objc_opt_class();
          id v20 = off_996E0;
          id v21 = [(NSDictionary *)a4 objectForKey:off_996E0];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v21)
          {
            uint64_t v22 = +[IMRGLog registration];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v39 = v20;
              __int16 v40 = 2112;
              uint64_t v41 = v19;
              _os_log_fault_impl(&dword_0, v22, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v21 = 0;
          }
          uint64_t v23 = objc_opt_class();
          id v24 = [(NSDictionary *)a4 objectForKey:@"e"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v24)
          {
            id v25 = +[IMRGLog registration];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v39 = @"e";
              __int16 v40 = 2112;
              uint64_t v41 = v23;
              _os_log_fault_impl(&dword_0, v25, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v24 = 0;
          }
          uint64_t v26 = objc_opt_class();
          id v27 = [(NSDictionary *)a4 objectForKey:@"H"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v27)
          {
            id v28 = +[IMRGLog registration];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v39 = @"H";
              __int16 v40 = 2112;
              uint64_t v41 = v26;
              _os_log_fault_impl(&dword_0, v28, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v27 = 0;
          }
          [v13 handler:a2 messageIDSendFailure:v14 toIdentifier:v17 fromIdentifier:v21 timeStamp:v24 storageContext:v27];
        }
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v9 = obj;
      id v10 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v10);
  }

  os_activity_scope_leave(&state);
}

void sub_1D5D8()
{
}

void sub_1D620()
{
}

void sub_1D6CC(id a1, LegacySMSRelayPushHandler *a2, NSDictionary *a3, NSDictionary *a4, id a5, BOOL a6)
{
  id v7 = _os_activity_create(&dword_0, "com.apple.messages.SMSReceivedRelayPinCode", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);

  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Using Block Incomming Display Pin Code ", buf, 2u);
    }
  }
  id v9 = [(LegacySMSRelayPushHandler *)a2 copyHandlersForEnumerating];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v35 = [v9 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v37;
    *(void *)&long long v10 = 138412802;
    long long v30 = v10;
    id obj = v9;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v37 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v13 = objc_opt_class();
          uint64_t v14 = off_996D8;
          id v15 = [(NSDictionary *)a4 objectForKey:off_996D8];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v15)
          {
            id v16 = +[IMRGLog registration];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v42 = v14;
              __int16 v43 = 2112;
              uint64_t v44 = v13;
              _os_log_fault_impl(&dword_0, v16, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v15 = 0;
          }
          uint64_t v17 = objc_opt_class();
          uint64_t v18 = off_996E0;
          id v19 = [(NSDictionary *)a4 objectForKey:off_996E0];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v19)
          {
            id v20 = +[IMRGLog registration];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v42 = v18;
              __int16 v43 = 2112;
              uint64_t v44 = v17;
              _os_log_fault_impl(&dword_0, v20, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v19 = 0;
          }
          [(NSDictionary *)a4 objectForKey:@"t"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v21 = +[NSData _IDSDataFromBase64String:[(NSDictionary *)a4 objectForKey:@"t"]];
            goto LABEL_24;
          }
          [(NSDictionary *)a4 objectForKey:@"t"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v21 = [(NSDictionary *)a4 objectForKey:@"t"];
LABEL_24:
            id v22 = v21;
          }
          else
          {
            id v22 = 0;
          }
          [(NSDictionary *)a4 objectForKey:@"U"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            +[NSData _IDSDataFromBase64String:[(NSDictionary *)a4 objectForKey:@"U"]];
          }
          else
          {
            [(NSDictionary *)a4 objectForKey:@"U"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [(NSDictionary *)a4 objectForKey:@"U"];
            }
          }
          uint64_t v23 = JWUUIDPushObjectToString();
          uint64_t v24 = objc_opt_class();
          id v25 = [(NSDictionary *)a4 objectForKey:@"e"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v25)
          {
            uint64_t v26 = +[IMRGLog registration];
            if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v42 = @"e";
              __int16 v43 = 2112;
              uint64_t v44 = v24;
              _os_log_fault_impl(&dword_0, v26, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v25 = 0;
          }
          uint64_t v27 = objc_opt_class();
          id v28 = [(NSDictionary *)a4 objectForKey:@"H"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v28)
          {
            long long v29 = +[IMRGLog registration];
            if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v42 = @"H";
              __int16 v43 = 2112;
              uint64_t v44 = v27;
              _os_log_fault_impl(&dword_0, v29, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v28 = 0;
          }
          objc_msgSend(v12, "handler:incomingDisplayPinCode:toIdentifier:fromIdentifier:fromToken:messageGUID:timeStamp:storageContext:", a2, a3, v15, v19, v22, v23, v25, v28, v30);
        }
        long long v11 = (char *)v11 + 1;
      }
      while (v35 != v11);
      id v9 = obj;
      id v35 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v35);
  }

  os_activity_scope_leave(&state);
}

void sub_1DD38()
{
}

void sub_1DD80()
{
}

void sub_1DE2C(id a1, LegacySMSRelayPushHandler *a2, NSDictionary *a3, NSDictionary *a4, id a5, BOOL a6)
{
  id v7 = _os_activity_create(&dword_0, "com.apple.messages.SMSReceivedRelayEnrollRequest", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);

  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Using Block Incomming Enroll Me Request", buf, 2u);
    }
  }
  id v9 = [(LegacySMSRelayPushHandler *)a2 copyHandlersForEnumerating];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v35 = [v9 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v37;
    *(void *)&long long v10 = 138412802;
    long long v30 = v10;
    id obj = v9;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v37 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v13 = objc_opt_class();
          uint64_t v14 = off_996D8;
          id v15 = [(NSDictionary *)a4 objectForKey:off_996D8];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v15)
          {
            id v16 = +[IMRGLog registration];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v42 = v14;
              __int16 v43 = 2112;
              uint64_t v44 = v13;
              _os_log_fault_impl(&dword_0, v16, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v15 = 0;
          }
          uint64_t v17 = objc_opt_class();
          uint64_t v18 = off_996E0;
          id v19 = [(NSDictionary *)a4 objectForKey:off_996E0];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v19)
          {
            id v20 = +[IMRGLog registration];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v42 = v18;
              __int16 v43 = 2112;
              uint64_t v44 = v17;
              _os_log_fault_impl(&dword_0, v20, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v19 = 0;
          }
          [(NSDictionary *)a4 objectForKey:@"t"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v21 = +[NSData _IDSDataFromBase64String:[(NSDictionary *)a4 objectForKey:@"t"]];
            goto LABEL_24;
          }
          [(NSDictionary *)a4 objectForKey:@"t"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v21 = [(NSDictionary *)a4 objectForKey:@"t"];
LABEL_24:
            id v22 = v21;
          }
          else
          {
            id v22 = 0;
          }
          [(NSDictionary *)a4 objectForKey:@"U"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            +[NSData _IDSDataFromBase64String:[(NSDictionary *)a4 objectForKey:@"U"]];
          }
          else
          {
            [(NSDictionary *)a4 objectForKey:@"U"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [(NSDictionary *)a4 objectForKey:@"U"];
            }
          }
          uint64_t v23 = JWUUIDPushObjectToString();
          uint64_t v24 = objc_opt_class();
          id v25 = [(NSDictionary *)a4 objectForKey:@"e"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v25)
          {
            uint64_t v26 = +[IMRGLog registration];
            if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v42 = @"e";
              __int16 v43 = 2112;
              uint64_t v44 = v24;
              _os_log_fault_impl(&dword_0, v26, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v25 = 0;
          }
          uint64_t v27 = objc_opt_class();
          id v28 = [(NSDictionary *)a4 objectForKey:@"H"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v28)
          {
            long long v29 = +[IMRGLog registration];
            if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v42 = @"H";
              __int16 v43 = 2112;
              uint64_t v44 = v27;
              _os_log_fault_impl(&dword_0, v29, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v28 = 0;
          }
          objc_msgSend(v12, "handler:incomingEnrollMeRequest:toIdentifier:fromIdentifier:fromToken:messageGUID:timeStamp:storageContext:", a2, a3, v15, v19, v22, v23, v25, v28, v30);
        }
        long long v11 = (char *)v11 + 1;
      }
      while (v35 != v11);
      id v9 = obj;
      id v35 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v35);
  }

  os_activity_scope_leave(&state);
}

void sub_1E498()
{
}

void sub_1E4E0()
{
}

void sub_1E58C(id a1, LegacySMSRelayPushHandler *a2, NSDictionary *a3, NSDictionary *a4, id a5, BOOL a6)
{
  id v7 = _os_activity_create(&dword_0, "com.apple.messages.SMSReceivedRelayDeleteRequest", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);

  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v43 = (const __CFString *)a4;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "_handleDeleteCommand: %@", buf, 0xCu);
    }
  }
  id v9 = [(LegacySMSRelayPushHandler *)a2 copyHandlersForEnumerating];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v35 = [v9 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v38;
    id obj = v9;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v38 != v34) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v12 = objc_opt_class();
          id v36 = [(NSDictionary *)a4 objectForKey:@"tP"];
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v36)
            {
              uint64_t v13 = +[IMRGLog registration];
              if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                CFStringRef v43 = @"tP";
                __int16 v44 = 2112;
                uint64_t v45 = v12;
                _os_log_fault_impl(&dword_0, v13, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
              }
            }
            id v36 = 0;
          }
          uint64_t v14 = objc_opt_class();
          id v15 = [(NSDictionary *)a4 objectForKey:@"sP"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v15)
          {
            id v16 = +[IMRGLog registration];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v43 = @"sP";
              __int16 v44 = 2112;
              uint64_t v45 = v14;
              _os_log_fault_impl(&dword_0, v16, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v15 = 0;
          }
          [(NSDictionary *)a4 objectForKey:@"t"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v17 = +[NSData _IDSDataFromBase64String:[(NSDictionary *)a4 objectForKey:@"t"]];
            goto LABEL_24;
          }
          [(NSDictionary *)a4 objectForKey:@"t"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v17 = [(NSDictionary *)a4 objectForKey:@"t"];
LABEL_24:
            id v18 = v17;
          }
          else
          {
            id v18 = 0;
          }
          uint64_t v19 = objc_opt_class();
          id v20 = [(NSDictionary *)a4 objectForKey:@"e"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v20)
          {
            id v21 = +[IMRGLog registration];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v43 = @"e";
              __int16 v44 = 2112;
              uint64_t v45 = v19;
              _os_log_fault_impl(&dword_0, v21, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v20 = 0;
          }
          uint64_t v22 = objc_opt_class();
          id v23 = [(NSDictionary *)a4 objectForKey:@"D"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v23)
          {
            uint64_t v24 = +[IMRGLog registration];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v43 = @"D";
              __int16 v44 = 2112;
              uint64_t v45 = v22;
              _os_log_fault_impl(&dword_0, v24, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v23 = 0;
          }
          uint64_t v25 = objc_opt_class();
          id v26 = [(NSDictionary *)a4 objectForKey:@"Dc"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v26)
          {
            uint64_t v27 = +[IMRGLog registration];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v43 = @"Dc";
              __int16 v44 = 2112;
              uint64_t v45 = v25;
              _os_log_fault_impl(&dword_0, v27, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v26 = 0;
          }
          uint64_t v28 = objc_opt_class();
          id v29 = [(NSDictionary *)a4 objectForKey:@"H"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v29)
          {
            long long v30 = +[IMRGLog registration];
            if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v43 = @"H";
              __int16 v44 = 2112;
              uint64_t v45 = v28;
              _os_log_fault_impl(&dword_0, v30, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v29 = 0;
          }
          [v11 handler:a2 deleteCommand:a3 toIdentifier:v36 fromIdentifier:v15 fromToken:v18 timeStamp:v20 needsDeliveryReceipt:v23 deliveryContext:v26 storageContext:v29];
        }
        long long v10 = (char *)v10 + 1;
      }
      while (v35 != v10);
      id v9 = obj;
      id v35 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v35);
  }

  os_activity_scope_leave(&state);
}

void sub_1ECA8()
{
}

void sub_1ECF0()
{
}

void sub_1ED9C(id a1, LegacySMSRelayPushHandler *a2, NSDictionary *a3, NSDictionary *a4, id a5, BOOL a6)
{
  id v7 = _os_activity_create(&dword_0, "com.apple.messages.SMSReceivedRelayDeleteRequest", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);

  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v43 = (const __CFString *)a4;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "_handleRecoverCommand: %@", buf, 0xCu);
    }
  }
  id v9 = [(LegacySMSRelayPushHandler *)a2 copyHandlersForEnumerating];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v35 = [v9 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v38;
    id obj = v9;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v38 != v34) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v12 = objc_opt_class();
          id v36 = [(NSDictionary *)a4 objectForKey:@"tP"];
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v36)
            {
              uint64_t v13 = +[IMRGLog registration];
              if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                CFStringRef v43 = @"tP";
                __int16 v44 = 2112;
                uint64_t v45 = v12;
                _os_log_fault_impl(&dword_0, v13, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
              }
            }
            id v36 = 0;
          }
          uint64_t v14 = objc_opt_class();
          id v15 = [(NSDictionary *)a4 objectForKey:@"sP"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v15)
          {
            id v16 = +[IMRGLog registration];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v43 = @"sP";
              __int16 v44 = 2112;
              uint64_t v45 = v14;
              _os_log_fault_impl(&dword_0, v16, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v15 = 0;
          }
          [(NSDictionary *)a4 objectForKey:@"t"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v17 = +[NSData _IDSDataFromBase64String:[(NSDictionary *)a4 objectForKey:@"t"]];
            goto LABEL_24;
          }
          [(NSDictionary *)a4 objectForKey:@"t"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v17 = [(NSDictionary *)a4 objectForKey:@"t"];
LABEL_24:
            id v18 = v17;
          }
          else
          {
            id v18 = 0;
          }
          uint64_t v19 = objc_opt_class();
          id v20 = [(NSDictionary *)a4 objectForKey:@"e"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v20)
          {
            id v21 = +[IMRGLog registration];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v43 = @"e";
              __int16 v44 = 2112;
              uint64_t v45 = v19;
              _os_log_fault_impl(&dword_0, v21, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v20 = 0;
          }
          uint64_t v22 = objc_opt_class();
          id v23 = [(NSDictionary *)a4 objectForKey:@"D"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v23)
          {
            uint64_t v24 = +[IMRGLog registration];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v43 = @"D";
              __int16 v44 = 2112;
              uint64_t v45 = v22;
              _os_log_fault_impl(&dword_0, v24, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v23 = 0;
          }
          uint64_t v25 = objc_opt_class();
          id v26 = [(NSDictionary *)a4 objectForKey:@"Dc"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v26)
          {
            uint64_t v27 = +[IMRGLog registration];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v43 = @"Dc";
              __int16 v44 = 2112;
              uint64_t v45 = v25;
              _os_log_fault_impl(&dword_0, v27, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v26 = 0;
          }
          uint64_t v28 = objc_opt_class();
          id v29 = [(NSDictionary *)a4 objectForKey:@"H"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v29)
          {
            long long v30 = +[IMRGLog registration];
            if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v43 = @"H";
              __int16 v44 = 2112;
              uint64_t v45 = v28;
              _os_log_fault_impl(&dword_0, v30, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v29 = 0;
          }
          [v11 handler:a2 recoverCommand:a3 toIdentifier:v36 fromIdentifier:v15 fromToken:v18 timeStamp:v20 needsDeliveryReceipt:v23 deliveryContext:v26 storageContext:v29];
        }
        long long v10 = (char *)v10 + 1;
      }
      while (v35 != v10);
      id v9 = obj;
      id v35 = [obj countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v35);
  }

  os_activity_scope_leave(&state);
}

void sub_1F4B8()
{
}

void sub_1F500()
{
}

void sub_1F5AC(id a1, LegacySMSRelayPushHandler *a2, NSDictionary *a3, NSDictionary *a4, id a5, BOOL a6)
{
  id v7 = _os_activity_create(&dword_0, "com.apple.messages.SMSReceivedRelayPinCodeApproval", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);

  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Using Block Incomming pin Code Approval Response", buf, 2u);
    }
  }
  id v9 = [(LegacySMSRelayPushHandler *)a2 copyHandlersForEnumerating];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v35 = [v9 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v37;
    *(void *)&long long v10 = 138412802;
    long long v30 = v10;
    id obj = v9;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v37 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v13 = objc_opt_class();
          uint64_t v14 = off_996D8;
          id v15 = [(NSDictionary *)a4 objectForKey:off_996D8];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v15)
          {
            id v16 = +[IMRGLog registration];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v42 = v14;
              __int16 v43 = 2112;
              uint64_t v44 = v13;
              _os_log_fault_impl(&dword_0, v16, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v15 = 0;
          }
          uint64_t v17 = objc_opt_class();
          id v18 = off_996E0;
          id v19 = [(NSDictionary *)a4 objectForKey:off_996E0];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v19)
          {
            id v20 = +[IMRGLog registration];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v42 = v18;
              __int16 v43 = 2112;
              uint64_t v44 = v17;
              _os_log_fault_impl(&dword_0, v20, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v19 = 0;
          }
          [(NSDictionary *)a4 objectForKey:@"t"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v21 = +[NSData _IDSDataFromBase64String:[(NSDictionary *)a4 objectForKey:@"t"]];
            goto LABEL_24;
          }
          [(NSDictionary *)a4 objectForKey:@"t"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v21 = [(NSDictionary *)a4 objectForKey:@"t"];
LABEL_24:
            id v22 = v21;
          }
          else
          {
            id v22 = 0;
          }
          [(NSDictionary *)a4 objectForKey:@"U"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            +[NSData _IDSDataFromBase64String:[(NSDictionary *)a4 objectForKey:@"U"]];
          }
          else
          {
            [(NSDictionary *)a4 objectForKey:@"U"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [(NSDictionary *)a4 objectForKey:@"U"];
            }
          }
          uint64_t v23 = JWUUIDPushObjectToString();
          uint64_t v24 = objc_opt_class();
          id v25 = [(NSDictionary *)a4 objectForKey:@"e"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v25)
          {
            id v26 = +[IMRGLog registration];
            if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v42 = @"e";
              __int16 v43 = 2112;
              uint64_t v44 = v24;
              _os_log_fault_impl(&dword_0, v26, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v25 = 0;
          }
          uint64_t v27 = objc_opt_class();
          id v28 = [(NSDictionary *)a4 objectForKey:@"H"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v28)
          {
            id v29 = +[IMRGLog registration];
            if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v42 = @"H";
              __int16 v43 = 2112;
              uint64_t v44 = v27;
              _os_log_fault_impl(&dword_0, v29, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v28 = 0;
          }
          objc_msgSend(v12, "handler:incomingResponseForApproval:toIdentifier:fromIdentifier:fromToken:messageGUID:timeStamp:storageContext:", a2, a3, v15, v19, v22, v23, v25, v28, v30);
        }
        long long v11 = (char *)v11 + 1;
      }
      while (v35 != v11);
      id v9 = obj;
      id v35 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v35);
  }

  os_activity_scope_leave(&state);
}

void sub_1FC18()
{
}

void sub_1FC60()
{
}

void sub_1FD0C(id a1, LegacySMSRelayPushHandler *a2, NSDictionary *a3, NSDictionary *a4, id a5, BOOL a6)
{
  int v8 = _os_activity_create(&dword_0, "com.apple.messages.SMSReceivedRelaySMSFilteringSettings", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);

  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Using Block SMS Filtering Settings", (uint8_t *)&buf, 2u);
    }
  }
  id v10 = [(LegacySMSRelayPushHandler *)a2 copyHandlersForEnumerating];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          [(NSDictionary *)a4 objectForKey:@"t"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = +[NSData _IDSDataFromBase64String:[(NSDictionary *)a4 objectForKey:@"t"]];
            goto LABEL_14;
          }
          [(NSDictionary *)a4 objectForKey:@"t"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = [(NSDictionary *)a4 objectForKey:@"t"];
LABEL_14:
            id v16 = v15;
          }
          else
          {
            id v16 = 0;
          }
          [v14 handler:a2 incomingSMSFilteringSettingsMessage:a3 fromToken:v16];
          continue;
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v11);
  }

  os_activity_scope_leave(&state);
}

void sub_2002C()
{
}

void sub_20078()
{
}

void sub_20164(id a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  char v3 = _Block_copy(&stru_8D650);
  [v2 setObject:v3 forKey:off_996F8];

  uint64_t v4 = _Block_copy(&stru_8D670);
  [v2 setObject:v4 forKey:off_99700];

  id v5 = _Block_copy(&stru_8D690);
  [v2 setObject:v5 forKey:off_99708];

  id v6 = _Block_copy(&stru_8D6B0);
  [v2 setObject:v6 forKey:off_99710];

  id v7 = _Block_copy(&stru_8D6D0);
  [v2 setObject:v7 forKey:off_99718];

  int v8 = _Block_copy(&stru_8D6F0);
  [v2 setObject:v8 forKey:off_99720];

  id v9 = _Block_copy(&stru_8D710);
  [v2 setObject:v9 forKey:off_99728];

  id v10 = _Block_copy(&stru_8D730);
  [v2 setObject:v10 forKey:off_99730];

  id v11 = _Block_copy(&stru_8D750);
  [v2 setObject:v11 forKey:off_99738];

  qword_99C50 = (uint64_t)v2;
}

void sub_20324(id a1, LegacySMSRelayPushHandler *a2, NSDictionary *a3, NSDictionary *a4, id a5, BOOL a6)
{
  id v8 = [(LegacySMSRelayPushHandler *)a2 copyHandlersForEnumerating];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v13 = objc_opt_class();
          id v14 = [(NSDictionary *)a4 objectForKey:@"H"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v14)
          {
            id v15 = +[IMRGLog registration];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)int buf = 138412546;
              CFStringRef v22 = @"H";
              __int16 v23 = 2112;
              uint64_t v24 = v13;
              _os_log_fault_impl(&dword_0, v15, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v14 = 0;
          }
          [v12 handler:a2 localIncommingMessage:a3 storageContext:v14];
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v9);
  }
}

void sub_205D4()
{
}

void sub_2068C(id a1, LegacySMSRelayPushHandler *a2, NSDictionary *a3, NSDictionary *a4, id a5, BOOL a6)
{
  BOOL v16 = a6;
  id v8 = [(LegacySMSRelayPushHandler *)a2 copyHandlersForEnumerating];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v13 = objc_opt_class();
          id v14 = [(NSDictionary *)a4 objectForKey:@"H"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v14)
          {
            id v15 = +[IMRGLog registration];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)int buf = 138412546;
              CFStringRef v23 = @"H";
              __int16 v24 = 2112;
              uint64_t v25 = v13;
              _os_log_fault_impl(&dword_0, v15, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v14 = 0;
          }
          [v12 handler:a2 localOutgoingMessage:a3 isBeingReplayed:v16 storageContext:v14];
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v9);
  }
}

void sub_20954()
{
}

void sub_20A08(id a1, LegacySMSRelayPushHandler *a2, NSDictionary *a3, NSDictionary *a4, id a5, BOOL a6)
{
  BOOL v19 = a6;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Using outDownloadMessageBlock", buf, 2u);
    }
  }
  id v9 = [(LegacySMSRelayPushHandler *)a2 copyHandlersForEnumerating];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v10)
  {
    uint64_t v12 = *(void *)v22;
    *(void *)&long long v11 = 138412802;
    long long v18 = v11;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v13);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v15 = objc_opt_class();
          id v16 = [(NSDictionary *)a4 objectForKey:@"H", v18];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v16)
          {
            long long v17 = +[IMRGLog registration];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)int buf = 138412546;
              CFStringRef v26 = @"H";
              __int16 v27 = 2112;
              uint64_t v28 = v15;
              _os_log_fault_impl(&dword_0, v17, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v16 = 0;
          }
          [v14 handler:a2 localOutgoingDownloadMessage:a3 isBeingReplayed:v19 storageContext:v16];
        }
        uint64_t v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      id v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v10);
  }
}

void sub_20D08()
{
}

void sub_20DEC(id a1, LegacySMSRelayPushHandler *a2, NSDictionary *a3, NSDictionary *a4, id a5, BOOL a6)
{
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Using localIncomingDownloadMessageBlock", buf, 2u);
    }
  }
  id v9 = [(LegacySMSRelayPushHandler *)a2 copyHandlersForEnumerating];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v10)
  {
    uint64_t v12 = *(void *)v21;
    *(void *)&long long v11 = 138412802;
    long long v18 = v11;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v13);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v15 = objc_opt_class();
          id v16 = [(NSDictionary *)a4 objectForKey:@"H", v18];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v16)
          {
            long long v17 = +[IMRGLog registration];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)int buf = 138412546;
              CFStringRef v25 = @"H";
              __int16 v26 = 2112;
              uint64_t v27 = v15;
              _os_log_fault_impl(&dword_0, v17, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v16 = 0;
          }
          [v14 handler:a2 localIncomingDownloadMessage:a3 storageContext:v16];
        }
        uint64_t v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      id v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v10);
  }
}

void sub_210E4()
{
}

void sub_211C8(id a1, LegacySMSRelayPushHandler *a2, NSDictionary *a3, NSDictionary *a4, id a5, BOOL a6)
{
  id v7 = [(LegacySMSRelayPushHandler *)a2 copyHandlersForEnumerating];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v8)
  {
    uint64_t v10 = *(void *)v21;
    *(void *)&long long v9 = 138412802;
    long long v17 = v9;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector())
        {
          id v13 = [(NSDictionary *)a3 _stringForKey:@"message-guid", v17];
          uint64_t v14 = objc_opt_class();
          id v15 = [(NSDictionary *)a4 objectForKey:@"H"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v15)
          {
            id v16 = +[IMRGLog registration];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)int buf = 138412546;
              CFStringRef v25 = @"H";
              __int16 v26 = 2112;
              uint64_t v27 = v14;
              _os_log_fault_impl(&dword_0, v16, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v15 = 0;
          }
          [v12 handler:a2 localMessageSent:v13 storageContext:v15];
        }
        long long v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      id v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v8);
  }
}

void sub_21488()
{
}

void sub_21540(id a1, LegacySMSRelayPushHandler *a2, NSDictionary *a3, NSDictionary *a4, id a5, BOOL a6)
{
  id v7 = [(LegacySMSRelayPushHandler *)a2 copyHandlersForEnumerating];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v8)
  {
    uint64_t v10 = *(void *)v21;
    *(void *)&long long v9 = 138412802;
    long long v17 = v9;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector())
        {
          id v13 = [(NSDictionary *)a3 _stringForKey:@"message-guid", v17];
          uint64_t v14 = objc_opt_class();
          id v15 = [(NSDictionary *)a4 objectForKey:@"H"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v15)
          {
            id v16 = +[IMRGLog registration];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)int buf = 138412546;
              CFStringRef v25 = @"H";
              __int16 v26 = 2112;
              uint64_t v27 = v14;
              _os_log_fault_impl(&dword_0, v16, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v15 = 0;
          }
          [v12 handler:a2 localMessageRead:v13 storageContext:v15];
        }
        long long v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      id v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v8);
  }
}

void sub_21800()
{
}

void sub_218B8(id a1, LegacySMSRelayPushHandler *a2, NSDictionary *a3, NSDictionary *a4, id a5, BOOL a6)
{
  id v7 = [(LegacySMSRelayPushHandler *)a2 copyHandlersForEnumerating];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v8)
  {
    uint64_t v10 = *(void *)v21;
    *(void *)&long long v9 = 138412802;
    long long v17 = v9;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector())
        {
          id v13 = [(NSDictionary *)a3 _stringForKey:@"message-guid", v17];
          uint64_t v14 = objc_opt_class();
          id v15 = [(NSDictionary *)a4 objectForKey:@"H"];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v15)
          {
            id v16 = +[IMRGLog registration];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)int buf = 138412546;
              CFStringRef v25 = @"H";
              __int16 v26 = 2112;
              uint64_t v27 = v14;
              _os_log_fault_impl(&dword_0, v16, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v15 = 0;
          }
          [v12 handler:a2 localMessageError:v13 storageContext:v15];
        }
        long long v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      id v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v8);
  }
}

void sub_21B78()
{
}

void sub_21C30(id a1, LegacySMSRelayPushHandler *a2, NSDictionary *a3, NSDictionary *a4, id a5, BOOL a6)
{
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Using block local remote file request", buf, 2u);
    }
  }
  id v9 = [(LegacySMSRelayPushHandler *)a2 copyHandlersForEnumerating];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v10)
  {
    uint64_t v12 = *(void *)v21;
    *(void *)&long long v11 = 138412802;
    long long v18 = v11;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v13);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v15 = objc_opt_class();
          id v16 = [(NSDictionary *)a4 objectForKey:@"H", v18];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v16)
          {
            long long v17 = +[IMRGLog registration];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)int buf = 138412546;
              CFStringRef v25 = @"H";
              __int16 v26 = 2112;
              uint64_t v27 = v15;
              _os_log_fault_impl(&dword_0, v17, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v16 = 0;
          }
          [v14 handler:a2 localFileRequest:a3 storageContext:v16];
        }
        id v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      id v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v10);
  }
}

void sub_21F28()
{
}

void sub_2200C(id a1, LegacySMSRelayPushHandler *a2, NSDictionary *a3, NSDictionary *a4, id a5, BOOL a6)
{
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Using block local remote file response", buf, 2u);
    }
  }
  id v9 = [(LegacySMSRelayPushHandler *)a2 copyHandlersForEnumerating];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v10)
  {
    uint64_t v12 = *(void *)v21;
    *(void *)&long long v11 = 138412802;
    long long v18 = v11;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v13);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v15 = objc_opt_class();
          id v16 = [(NSDictionary *)a4 objectForKey:@"H", v18];
          if ((objc_opt_isKindOfClass() & 1) == 0 && v16)
          {
            long long v17 = +[IMRGLog registration];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)int buf = 138412546;
              CFStringRef v25 = @"H";
              __int16 v26 = 2112;
              uint64_t v27 = v15;
              _os_log_fault_impl(&dword_0, v17, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", buf, 0x16u);
            }
            id v16 = 0;
          }
          [v14 handler:a2 localFileResponse:a3 storageContext:v16];
        }
        id v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      id v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v10);
  }
}

void sub_22304()
{
}

BOOL sub_23B60(void *a1)
{
  id v1 = a1;
  id v2 = [v1 _stripFZIDPrefix];
  uint64_t v3 = IMPhoneNumberRefCopyForPhoneNumber();
  if (v3)
  {
    uint64_t v4 = (const void *)v3;
    id v5 = (const void *)CMFItemCreateWithPhoneNumber();
    int IsItemBlocked = CMFBlockListIsItemBlocked();
    CFRelease(v4);
    if (v5)
    {
      CFRelease(v5);
      if (IsItemBlocked)
      {
LABEL_4:
        BOOL v7 = 1;
        goto LABEL_8;
      }
    }
    else if (IsItemBlocked)
    {
      goto LABEL_4;
    }
  }
  id v8 = (const void *)CMFItemCreateWithEmailAddress();
  BOOL v7 = CMFBlockListIsItemBlocked() != 0;
  if (v8) {
    CFRelease(v8);
  }
LABEL_8:
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      CFStringRef v10 = @"NO";
      if (v7) {
        CFStringRef v10 = @"YES";
      }
      int v12 = 138412546;
      id v13 = v1;
      __int16 v14 = 2112;
      CFStringRef v15 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "filtering message for handle: %@ = %@", (uint8_t *)&v12, 0x16u);
    }
  }
  return v7;
}

void sub_24170(uint64_t a1, void *a2)
{
  id v4 = a2;
  pthread_mutex_lock(&stru_99A18);
  uid_t v5 = geteuid();
  if (!v5) {
    uid_t v5 = getuid();
  }
  if (qword_99C70)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)qword_99C70, (const void *)v5);
    if (Value) {
      goto LABEL_13;
    }
  }
  else
  {
    qword_99C70 = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, &kCFTypeDictionaryValueCallBacks);
  }
  pw_dir = getenv("IPHONE_SHARED_RESOURCES_DIRECTORY");
  if (pw_dir || (id v8 = getpwuid(v5)) != 0 && (pw_dir = v8->pw_dir) != 0)
  {
    Value = CFStringCreateWithFileSystemRepresentation(0, pw_dir);
    if (Value)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)qword_99C70, (const void *)v5, Value);
      CFRelease(Value);
    }
  }
  else
  {
    Value = 0;
  }
LABEL_13:
  pthread_mutex_unlock(&stru_99A18);
  CFStringRef v9 = CFStringCreateWithFormat(0, 0, @"%@/Library/Preferences/%@", Value, @"com.apple.MobileSMS");
  CFRelease(v9);
  if (IMOSLoggingEnabled())
  {
    CFStringRef v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Refresh: User setting for MMS changed", buf, 2u);
    }
  }
  [v4 updateMMSCapability];
}

void sub_24318(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a5;
  if (IMOSLoggingEnabled())
  {
    CFStringRef v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "handleThirdPartyFilterUnregistered", buf, 2u);
    }
  }
  id v13 = v8;
  __int16 v14 = v9;
  id v11 = v9;
  id v12 = v8;
  im_dispatch_after();
}

void sub_24454(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a5;
  if (IMOSLoggingEnabled())
  {
    CFStringRef v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "handleThirdPartyFilterUnregistered", buf, 2u);
    }
  }
  id v13 = v8;
  __int16 v14 = v9;
  id v11 = v9;
  id v12 = v8;
  im_dispatch_after();
}

void sub_24590(uint64_t a1, void *a2)
{
  id v4 = a2;
  uid_t v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "handleChangeOfFilterParamsStatus", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  BOOL v7 = v4;
  id v6 = v4;
  im_dispatch_after();
}

void sub_246E4(uint64_t a1, void *a2, uint64_t a3)
{
  uid_t v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 138412290;
    uint64_t v9 = a3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "SMSCTPhoneNumberChangedNotification: %@", buf, 0xCu);
  }

  id v7 = a2;
  id v6 = v7;
  im_dispatch_after();
}

void sub_26434(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x26428);
  }
  _Unwind_Resume(a1);
}

void sub_26578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

id sub_2659C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_26638;
  v8[3] = &unk_8D778;
  long long v9 = *(_OWORD *)(a1 + 32);
  id result = [a2 enumerateKeysAndObjectsUsingBlock:v8];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a5 = 1;
  }
  return result;
}

void sub_26638(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  if ([v7 isEqualToString:IMMessagePartAttributeName])
  {
    if (++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) < 2uLL) {
      goto LABEL_12;
    }
    if (IMOSLoggingEnabled())
    {
      long long v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Message body has more than one message part", (uint8_t *)&v10, 2u);
      }
LABEL_10:
    }
  }
  else if (IMOSLoggingEnabled())
  {
    long long v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Message body has attribute %@", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_10;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
LABEL_12:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
}

void sub_2A588(uint64_t a1, void *a2, int a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, uint64_t a10)
{
  id v31 = a2;
  id v33 = a4;
  id v32 = a5;
  id value = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  if (IMOSLoggingEnabled())
  {
    long long v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      CFStringRef v21 = @"NO";
      if (a3) {
        CFStringRef v21 = @"YES";
      }
      *(_DWORD *)int buf = 138412546;
      CFStringRef v36 = v21;
      __int16 v37 = 2112;
      id v38 = v33;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "MMS dictionary uploaded complected with success: %@ and error %@", buf, 0x16u);
    }
  }
  if (a3)
  {
    if (value) {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), off_99918, value);
    }
    if (v17) {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), off_99920, v17);
    }
    if (v18) {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), off_99910, v18);
    }
    if (v19) {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), off_99928, v19);
    }
    long long v22 = +[NSNumber numberWithInteger:a10];
    if (v22) {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), off_99930, v22);
    }

    long long v23 = JWEncodeDictionary();
    if ([v23 length])
    {
      long long v24 = +[NSNumber numberWithInteger:141];
      CFStringRef v25 = [*(id *)(a1 + 40) objectForKey:LegacySMSCTMessageDictionaryGUIDKey];
      __int16 v26 = IDSGetUUIDData();
      uint64_t v27 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
      uint64_t v28 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, v24, IDSSendMessageOptionCommandKey, v26, IDSSendMessageOptionUUIDKey, v23, IDSSendMessageOptionDataToEncryptKey, v27, IDSSendMessageOptionTimeoutKey, 0, v31, v32);

      id v29 = *(void **)(a1 + 48);
      long long v30 = [v29 _myCTPhoneNumber];
      [v29 sendDataToPeers:v28 forcedCallerID:v30 shouldFilterRecepients:1 requestProxySend:0 dontSendTo:0];
    }
  }
}

void sub_2AFA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 != 4 || a3)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
  else
  {
    id v4 = +[IMDCKUtilities sharedInstance];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_2B088;
    v7[3] = &unk_8D7F0;
    uid_t v5 = *(void **)(a1 + 40);
    v7[4] = *(void *)(a1 + 32);
    id v8 = v5;
    [v4 fetchiCloudAccountPersonID:v7];
  }
}

void sub_2B088(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 || ![*(id *)(a1 + 32) _areiMessageAndiCloudAccountTheSame:v5])
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v9 = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "iCloud and iMessage account is the same, and icloud is HSA2 trusted, auto enabling devices for sms relay", v9, 2u);
      }
    }
    id v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v8();
}

void sub_2B26C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5 && IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412290;
      id v17 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "_shouldAutoEnableDevicesforSMSRelay received error %@", buf, 0xCu);
    }
  }
  if (a2)
  {
    [*(id *)(a1 + 32) _checkAndSetRelayService];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v7 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "devices", 0);
    id v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v12;
      do
      {
        int v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(a1 + 32) _enableSMSRelayForDevice:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10)];
          int v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

void sub_2F030(id *a1)
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = a1[4];
      *(_DWORD *)int buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Releasing replicated message %@", buf, 0xCu);
    }
  }
  id v4 = +[IMPendingReplicatedMessageCache sharedCache];
  id v5 = a1[4];
  id v6 = [a1[5] service];
  id v7 = [v6 internalName];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_2F1E4;
  v8[3] = &unk_8D868;
  id v9 = a1[4];
  id v10 = a1[6];
  [v4 releasePendingMessageWithGUID:v5 serviceName:v7 chat:0 completion:v8];
}

uint64_t sub_2F1E4(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v3;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Processing %@ after replicated message release", (uint8_t *)&v5, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_2F3B0(uint64_t a1, void *a2)
{
  id v32 = a2;
  [*(id *)(a1 + 32) _approveSelfForSMSRelay];
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = *(void **)(a1 + 40);
      *(_DWORD *)int buf = 138412290;
      uint64_t v44 = v4;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "SMS Service Session received Incoming Plain Text Message From Push Handler: %@", buf, 0xCu);
    }
  }
  uint64_t v33 = a1;
  if (([*(id *)(a1 + 32) watchConnectedOverBT] & 1) != 0
    || (+[IDSCTAdapter sharedInstance],
        int v5 = objc_claimAutoreleasedReturnValue(),
        [*(id *)(a1 + 40) objectForKey:LegacySMSCTMessageDictionarySenderKey],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v5 isPhoneNumberEmergencyNumber:v6],
        v6,
        v5,
        !v7))
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = [*(id *)(a1 + 40) objectForKey:off_997F0];
        *(_DWORD *)int buf = 138412290;
        uint64_t v44 = v10;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Recipients: %@", buf, 0xCu);
      }
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v11 = [*(id *)(a1 + 40) objectForKey:off_997F0];
    id v12 = [v11 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v39;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v39 != v13) {
            objc_enumerationMutation(v11);
          }
          CFStringRef v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if (IMOSLoggingEnabled())
          {
            id v16 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)int buf = 138412290;
              uint64_t v44 = v15;
              _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "  Recipient: %@", buf, 0xCu);
            }
          }
          id v17 = +[IDSCTAdapter sharedInstance];
          unsigned int v18 = [v17 isPhoneNumberEmergencyNumber:v15];

          if (v18)
          {
            if (IMOSLoggingEnabled())
            {
              id v29 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)int buf = 0;
                _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "One of the recipients was an emergency number, this message should never have been relayed, not processing message", buf, 2u);
              }
            }
            v32[2]();

            goto LABEL_40;
          }
        }
        id v12 = [v11 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    id v19 = +[IMFeatureFlags sharedFeatureFlags];
    unsigned int v20 = [v19 isSMSFilterSyncEnabled];

    CFStringRef v21 = *(void **)(v33 + 32);
    if (v20)
    {
      long long v22 = [*(id *)(v33 + 32) idsDeviceFromPushToken:*(void *)(v33 + 48)];
      if (IMOSLoggingEnabled())
      {
        long long v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          long long v24 = [v22 name];
          *(_DWORD *)int buf = 138412290;
          uint64_t v44 = v24;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, " Incoming plain text message from %@", buf, 0xCu);
        }
      }
      id v25 = [*(id *)(v33 + 40) mutableCopy];
      __int16 v26 = [v22 uniqueIDOverride];
      [v25 setObject:v26 forKeyedSubscript:off_997D8];

      uint64_t v27 = *(void **)(v33 + 32);
      uint64_t v28 = *(void *)(v33 + 56);
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_2FA0C;
      v36[3] = &unk_8D8B8;
      __int16 v37 = v32;
      [v27 _processReceivedDictionary:v25 storageContext:v28 receivedViaRelay:1 withCompletionBlock:v36];
    }
    else
    {
      uint64_t v30 = *(void *)(v33 + 40);
      uint64_t v31 = *(void *)(v33 + 56);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_2FA1C;
      v34[3] = &unk_8D8B8;
      id v35 = v32;
      [v21 _processReceivedDictionary:v30 storageContext:v31 receivedViaRelay:1 withCompletionBlock:v34];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int buf = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "This relay message has come from an emergency number, Not processing message", buf, 2u);
      }
    }
    v32[2]();
  }
LABEL_40:
}

uint64_t sub_2FA0C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_2FA1C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2FB14(id *a1, void *a2)
{
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "SMS Service Session Received Incoming download Message From Push Handler", buf, 2u);
    }
  }
  [a1[4] _approveSelfForSMSRelay];
  int v5 = +[NSFileManager defaultManager];
  uint64_t v6 = objc_msgSend(v5, "im_randomTemporaryFileURLWithFileName:", off_99990);
  id v17 = [v6 path];

  id v16 = +[IMTransferServicesController sharedInstance];
  unsigned int v7 = +[NSString stringGUID];
  uint64_t v15 = IDSServiceNameSMSRelay;
  id v8 = [a1[5] objectForKey:off_99910];
  id v9 = [a1[5] objectForKey:off_99918];
  id v10 = [a1[5] objectForKey:off_99920];
  long long v11 = [a1[5] objectForKey:off_99928];
  id v12 = [a1[5] objectForKey:off_99930];
  id v13 = [v12 integerValue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_2FDA4;
  v18[3] = &unk_8D908;
  v18[4] = a1[4];
  id v21 = v3;
  id v19 = a1[6];
  id v20 = a1[7];
  id v14 = v3;
  [v16 receiveFileTransfer:v7 topic:v15 path:v17 requestURLString:v8 ownerID:v9 signature:v10 decryptionKey:v11 fileSize:v13 progressBlock:0 completionBlock:v18];
}

void sub_2FDA4(uint64_t a1, void *a2, void *a3, int a4, void *a5, void *a6)
{
  id v42 = a2;
  id v11 = a3;
  id v44 = a5;
  id v43 = a6;
  if (a4)
  {
    id v41 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:v11];
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        id v55 = v11;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Sucessfully Retrieved binary NSDictionary Attachment for incoming message at path %@", buf, 0xCu);
      }
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "watchConnectedOverBT", a1) & 1) != 0
      || (+[IDSCTAdapter sharedInstance],
          id v13 = objc_claimAutoreleasedReturnValue(),
          [v41 objectForKey:LegacySMSCTMessageDictionarySenderKey],
          id v14 = objc_claimAutoreleasedReturnValue(),
          unsigned int v15 = [v13 isPhoneNumberEmergencyNumber:v14],
          v14,
          v13,
          !v15))
    {
      if (IMOSLoggingEnabled())
      {
        unsigned int v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v19 = [v41 objectForKey:off_997F0];
          *(_DWORD *)int buf = 138412290;
          id v55 = v19;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Recipients: %@", buf, 0xCu);
        }
      }
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v20 = [v41 objectForKey:off_997F0];
      id v21 = [v20 countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v50;
        while (2)
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v50 != v22) {
              objc_enumerationMutation(v20);
            }
            long long v24 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            if (IMOSLoggingEnabled())
            {
              id v25 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)int buf = 138412290;
                id v55 = v24;
                _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "  Recipient: %@", buf, 0xCu);
              }
            }
            __int16 v26 = +[IDSCTAdapter sharedInstance];
            unsigned int v27 = [v26 isPhoneNumberEmergencyNumber:v24];

            if (v27)
            {
              if (IMOSLoggingEnabled())
              {
                long long v38 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)int buf = 0;
                  _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "One of the recipients was an emergency number, this message should never have been relayed, not processing message", buf, 2u);
                }
              }
              (*(void (**)(void))(*(void *)(v40 + 56) + 16))();

              goto LABEL_45;
            }
          }
          id v21 = [v20 countByEnumeratingWithState:&v49 objects:v53 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }

      uint64_t v28 = +[IMFeatureFlags sharedFeatureFlags];
      unsigned int v29 = [v28 isSMSFilterSyncEnabled];

      uint64_t v30 = *(void **)(v40 + 32);
      if (v29)
      {
        uint64_t v31 = [*(id *)(v40 + 32) idsDeviceFromPushToken:*(void *)(v40 + 40)];
        if (IMOSLoggingEnabled())
        {
          id v32 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            uint64_t v33 = [v31 name];
            *(_DWORD *)int buf = 138412290;
            id v55 = v33;
            _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, " Incoming download message from %@", buf, 0xCu);
          }
        }
        id v34 = [v41 mutableCopy];
        id v35 = [v31 uniqueIDOverride];
        [v34 setObject:v35 forKeyedSubscript:off_997D8];

        CFStringRef v36 = *(void **)(v40 + 32);
        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_304E0;
        v47[3] = &unk_8D8B8;
        uint64_t v37 = *(void *)(v40 + 48);
        id v48 = *(id *)(v40 + 56);
        [v36 _processReceivedDictionary:v34 storageContext:v37 receivedViaRelay:1 withCompletionBlock:v47];
      }
      else
      {
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_304F0;
        v45[3] = &unk_8D8B8;
        uint64_t v39 = *(void *)(v40 + 48);
        id v46 = *(id *)(v40 + 56);
        [v30 _processReceivedDictionary:v41 storageContext:v39 receivedViaRelay:1 withCompletionBlock:v45];
        uint64_t v31 = v46;
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int buf = 0;
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "This relay message has come from an emergency number, Not processing message", buf, 2u);
        }
      }
      (*(void (**)(void))(*(void *)(v40 + 56) + 16))();
LABEL_45:
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        id v55 = v44;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Unable to download incoming message: %@", buf, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t sub_304E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_304F0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_306C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = *(const char **)(a1 + 32);
      CFStringRef v6 = *(const __CFString **)(a1 + 40);
      *(_DWORD *)int buf = 138412546;
      uint64_t v45 = v5;
      __int16 v46 = 2112;
      CFStringRef v47 = v6;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "SMS Service Session Received Outgoing Plain Text Message From Push Handler From %@ To %@", buf, 0x16u);
    }
  }
  [*(id *)(a1 + 48) _approveSelfForSMSRelay];
  unsigned int v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472;
  uint64_t v31 = sub_30D50;
  id v32 = &unk_8D9C0;
  char v42 = *(unsigned char *)(a1 + 96);
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 48);
  id v33 = v7;
  uint64_t v34 = v8;
  id v35 = *(id *)(a1 + 64);
  char v43 = *(unsigned char *)(a1 + 97);
  id v36 = *(id *)(a1 + 72);
  id v37 = *(id *)(a1 + 80);
  id v38 = *(id *)(a1 + 88);
  id v39 = *(id *)(a1 + 32);
  id v9 = v3;
  id v41 = v9;
  id v40 = *(id *)(a1 + 40);
  id v10 = objc_retainBlock(&v29);
  id v11 = objc_msgSend(*(id *)(a1 + 48), "idsDeviceFromPushToken:", *(void *)(a1 + 64), v29, v30, v31, v32);
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = [v11 name];
      *(_DWORD *)int buf = 138412290;
      uint64_t v45 = v13;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, " Outgoing message request from %@", buf, 0xCu);
    }
  }
  id v14 = [*(id *)(a1 + 56) objectForKey:off_998C8];

  if (!v11 || v14)
  {
    if (!v11)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          long long v23 = *(const char **)(a1 + 32);
          *(_DWORD *)int buf = 138412290;
          uint64_t v45 = v23;
          _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, " This message was likely from a local device, looking for fromID: %@", buf, 0xCu);
        }
      }
      id v11 = [*(id *)(a1 + 48) idsDeviceForFromID:*(void *)(a1 + 32)];
    }
  }
  else if ([*(id *)(a1 + 48) _localDeviceSupportsSMS])
  {
    if (IMOSLoggingEnabled())
    {
      unsigned int v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int buf = 0;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, " This message was destined for me to send out, I am the gatekeeper", buf, 2u);
      }
    }
    if (([*(id *)(a1 + 48) isSMSRelayEnabled] & 1) != 0
      || ([v11 isDefaultPairedDevice] & 1) != 0)
    {
      id v16 = *(void **)(a1 + 48);
      id v17 = [v11 uniqueID];
      unsigned int v18 = [*(id *)(a1 + 48) _allowedDevicesforSMSRelay];
      LODWORD(v16) = [v16 isIDInList:v17 ArrayToCheck:v18];

      int v19 = IMOSLoggingEnabled();
      if (v16)
      {
        if (v19)
        {
          id v20 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            id v21 = [v11 name];
            *(_DWORD *)int buf = 138412290;
            uint64_t v45 = v21;
            _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, " Device %@ is on the allowed list, Telling the block to continue", buf, 0xCu);
          }
        }
        goto LABEL_40;
      }
      if (v19)
      {
        unsigned int v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          uint64_t v28 = [v11 name];
          *(_DWORD *)int buf = 138412290;
          uint64_t v45 = v28;
          _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, " Device %@ is on the blockList, sending back a failure", buf, 0xCu);
        }
      }
    }
    ((void (*)(void ***, void))v10[2])(v10, 0);

    goto LABEL_41;
  }
  if (IMOSLoggingEnabled())
  {
    long long v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v25 = "Not Nil";
      if (!v11) {
        id v25 = "Nil";
      }
      CFStringRef v26 = @"YES";
      if (!*(unsigned char *)(a1 + 96)) {
        CFStringRef v26 = @"NO";
      }
      *(_DWORD *)int buf = 136315394;
      uint64_t v45 = v25;
      __int16 v46 = 2112;
      CFStringRef v47 = v26;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, " This message was not for us to gatekeep, we should reflect it only if it came from one of our devices (senderDevice %s) isInProxyMode %@", buf, 0x16u);
    }
  }
  if (!v11 && !*(unsigned char *)(a1 + 96))
  {
    ((void (*)(void ***, void))v10[2])(v10, 0);
    goto LABEL_41;
  }
LABEL_40:
  [*(id *)(a1 + 48) _deferredReplicatedMessageReleaseWithAllowedMessage:*(void *)(a1 + 56) outgoingProxyBlock:v10];

LABEL_41:
}

void sub_30CB0(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x30C74);
  }
  _Unwind_Resume(a1);
}

void sub_30D50(uint64_t a1, int a2)
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      CFStringRef v4 = @"NO";
      if (a2) {
        CFStringRef v5 = @"YES";
      }
      else {
        CFStringRef v5 = @"NO";
      }
      if (*(unsigned char *)(a1 + 104)) {
        CFStringRef v4 = @"YES";
      }
      *(_DWORD *)int buf = 138412546;
      uint64_t v161 = (uint64_t)v5;
      __int16 v162 = 2112;
      CFStringRef v163 = v4;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Is Message from device on the allowed proxy list? %@ isInProxyMode %@", buf, 0x16u);
    }
  }
  int v6 = IMOSLoggingEnabled();
  if (!a2)
  {
    uint64_t v12 = a1;
    if (v6)
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int buf = 0;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "This device is not on the allowed list, it should not have been trying to send an SMS, sending a message back to it to tell it to not send SMS in the future", buf, 2u);
      }

      uint64_t v12 = a1;
    }
    v127 = [*(id *)(v12 + 40) idsDeviceFromPushToken:*(void *)(v12 + 48)];
    v128 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", *(void *)(a1 + 56), off_998B8, &__kCFBooleanTrue, off_997C0, 0);
    [*(id *)(v12 + 40) sendUnApproveToDevice:v127 extraKeys:v128];
    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
    goto LABEL_161;
  }
  uint64_t v7 = a1;
  if (v6)
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Message Type is a plain text outgoing message", buf, 2u);
    }

    uint64_t v7 = a1;
  }
  v125 = [*(id *)(v7 + 32) objectForKey:off_998C8];

  if (!v125)
  {
    id v9 = [*(id *)(a1 + 40) idsDeviceFromPushToken:*(void *)(a1 + 48)];
    if (*(unsigned char *)(a1 + 105))
    {
      if (IMOSLoggingEnabled())
      {
        id v10 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          uint64_t v11 = *(void *)(a1 + 56);
          *(_DWORD *)int buf = 138412290;
          uint64_t v161 = v11;
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Message %@ was being replayed not forwarding to peers", buf, 0xCu);
        }
      }
    }
    else
    {
      [*(id *)(a1 + 40) _forwardMessageToPeers:*(void *)(a1 + 32) messageType:143 guid:*(void *)(a1 + 56) originalSender:v9];
    }
  }
  v127 = [*(id *)(a1 + 32) objectForKey:off_99950];
  v128 = [*(id *)(a1 + 40) _convertIMMessageItemDictionaryToIMMessageItem:v127];
  id v14 = sub_323EC(*(void **)(a1 + 64));
  [v128 setTime:v14];

  unsigned int v15 = *(void **)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 72);
  id v17 = [v128 guid];
  [v15 _markFromStorageIfNeeded:v16 messageGUID:v17];

  unsigned int v18 = [*(id *)(a1 + 32) objectForKey:off_997F0];
  int v19 = objc_msgSend(v18, "__imArrayByApplyingBlock:", &stru_8D948);

  unsigned int v20 = [*(id *)(a1 + 40) _isDefaultPairedDeviceRelayingLocally:*(void *)(a1 + 80)];
  BOOL v21 = (v20 & 1) != 0 || *(unsigned char *)(a1 + 104) != 0;
  long long v157 = 0u;
  long long v158 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  id obj = v19;
  id v22 = [obj countByEnumeratingWithState:&v155 objects:v168 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v156;
    CFStringRef v24 = @"NO";
    if (v21) {
      CFStringRef v25 = @"YES";
    }
    else {
      CFStringRef v25 = @"NO";
    }
    if (v20) {
      CFStringRef v24 = @"YES";
    }
    CFStringRef v131 = v24;
    CFStringRef v133 = v25;
    while (2)
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v156 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v155 + 1) + 8 * i);
        uint64_t v28 = +[IDSCTAdapter sharedInstance];
        unsigned int v29 = [v28 isPhoneNumberEmergencyNumber:v27];

        int v30 = IMOSLoggingEnabled();
        if (((v21 | v29 ^ 1) & 1) == 0)
        {
          if (v30)
          {
            long long v51 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)int buf = 0;
              _os_log_impl(&dword_0, v51, OS_LOG_TYPE_INFO, "One of the recipients of this outgoing message is an emergency number, Not processing message", buf, 2u);
            }
          }
          (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
          long long v52 = obj;
          goto LABEL_160;
        }
        if (v30)
        {
          uint64_t v31 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            int v32 = *(unsigned __int8 *)(a1 + 104);
            if (v29) {
              CFStringRef v33 = @"YES";
            }
            else {
              CFStringRef v33 = @"NO";
            }
            *(_DWORD *)int buf = 138413058;
            if (v32) {
              CFStringRef v34 = @"YES";
            }
            else {
              CFStringRef v34 = @"NO";
            }
            uint64_t v161 = (uint64_t)v33;
            __int16 v162 = 2112;
            CFStringRef v163 = v133;
            __int16 v164 = 2112;
            CFStringRef v165 = v131;
            __int16 v166 = 2112;
            CFStringRef v167 = v34;
            _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "Will send SMS, recipient is Emergency %@, shouldRelayEmergencyTextFromPairedDevice: %@, isDefaultPairedDeviceRelayingLocally: %@, isInProxyMode %@ ", buf, 0x2Au);
          }
        }
      }
      id v22 = [obj countByEnumeratingWithState:&v155 objects:v168 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }

  id v35 = [*(id *)(a1 + 32) objectForKeyedSubscript:off_998D0];
  unsigned int v122 = [v35 BOOLValue];

  id v36 = +[IMDMessageStore sharedInstance];
  id v37 = [v128 guid];
  v126 = [v36 messageWithGUID:v37];

  unsigned int v38 = [v126 errorCode];
  if (!v126)
  {
LABEL_82:
    id v134 = objc_alloc_init((Class)NSMutableArray);
    unsigned __int8 v154 = 0;
    v57 = [*(id *)(a1 + 32) objectForKey:off_998E0];
    int v123 = sub_327F4(v57);

    unsigned __int8 v154 = v123;
    if (v123 == 45)
    {
      objc_msgSend(obj, "__imFirstObject");
      id v124 = (id)objc_claimAutoreleasedReturnValue();
      long long v58 = +[NSNumber numberWithInt:2];
      long long v59 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v58, kFZChatParticipantStatusKey, v124, kFZPersonID, 0);

      [v134 addObject:v59];
      long long v60 = +[IMDChatRegistry sharedInstance];
      long long v61 = objc_msgSend(obj, "__imFirstObject");
      long long v62 = [*(id *)(a1 + 40) account];
      long long v63 = [v60 existingChatForID:v61 account:v62];
    }
    else
    {
      long long v64 = [*(id *)(a1 + 40) chatRegistry];
      long long v65 = [*(id *)(a1 + 40) account];
      id v124 = [v64 generateUnusedChatIdentifierForGroupChatWithAccount:v65];

      long long v152 = 0u;
      long long v153 = 0u;
      long long v150 = 0u;
      long long v151 = 0u;
      id v132 = obj;
      id v66 = [v132 countByEnumeratingWithState:&v150 objects:v159 count:16];
      if (v66)
      {
        uint64_t v67 = *(void *)v151;
        uint64_t v68 = kFZChatParticipantStatusKey;
        uint64_t v69 = kFZPersonID;
        do
        {
          for (j = 0; j != v66; j = (char *)j + 1)
          {
            if (*(void *)v151 != v67) {
              objc_enumerationMutation(v132);
            }
            uint64_t v71 = *(void *)(*((void *)&v150 + 1) + 8 * (void)j);
            unsigned int v72 = +[NSNumber numberWithInt:2];
            v73 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v72, v68, v71, v69, 0);

            [v134 addObject:v73];
          }
          id v66 = [v132 countByEnumeratingWithState:&v150 objects:v159 count:16];
        }
        while (v66);
      }

      long long v60 = +[IMDChatRegistry sharedInstance];
      long long v61 = [*(id *)(a1 + 40) account];
      long long v63 = [v60 existingChatForIDs:v132 account:v61 style:43];
    }

    if (v63)
    {
      uint64_t v74 = [v63 chatIdentifier];

      unsigned __int8 v154 = [v63 style];
      int v75 = v63;
    }
    else
    {
      __int16 v76 = *(void **)(a1 + 40);
      id v149 = v124;
      [v76 canonicalizeChatIdentifier:&v149 style:&v154];
      uint64_t v74 = (__CFString *)v149;

      [*(id *)(a1 + 40) didJoinChat:v74 style:v154 displayName:0 groupID:0 handleInfo:v134];
      int v77 = +[IMDChatRegistry sharedInstance];
      if (v123 == 45)
      {
        id v78 = objc_msgSend(obj, "__imFirstObject");
        BOOL v79 = [*(id *)(a1 + 40) account];
        int v75 = [v77 existingChatForID:v78 account:v79];
      }
      else
      {
        id v80 = [*(id *)(a1 + 40) account];
        int v75 = [v77 existingChatForIDs:obj account:v80 style:43];
      }
    }
    if (v122)
    {
      if (v125 || *(unsigned char *)(a1 + 105))
      {
        if (IMOSLoggingEnabled())
        {
          v81 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
          {
            v82 = [v128 guid];
            *(_DWORD *)int buf = 138412290;
            uint64_t v161 = (uint64_t)v82;
            _os_log_impl(&dword_0, v81, OS_LOG_TYPE_INFO, "Sending device requested no persistence for message %@, local device not responsible for sending", buf, 0xCu);
          }
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          __int16 v111 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
          {
            CFStringRef v112 = [v128 guid];
            *(_DWORD *)int buf = 138412290;
            uint64_t v161 = (uint64_t)v112;
            _os_log_impl(&dword_0, v111, OS_LOG_TYPE_INFO, "Sending device requested no persistence for message %@, sending to CT now", buf, 0xCu);
          }
        }
        [*(id *)(a1 + 40) sendCTMessageFromIMMessageItem:v128 forChat:v74 chat:v75 style:v154];
      }
      uint64_t v113 = *(void *)(a1 + 96);
      if (v113) {
        (*(void (**)(void))(v113 + 16))();
      }
LABEL_158:

      goto LABEL_159;
    }
    if (v125)
    {
      v83 = [*(id *)(a1 + 32) _numberForKey:off_998B0];
      unsigned int v84 = [v83 intValue];

      if (v84 == 2)
      {
        if (IMOSLoggingEnabled())
        {
          long long v89 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
          {
            long long v90 = [(__CFString *)v75 chatIdentifier];
            *(_DWORD *)int buf = 138412290;
            uint64_t v161 = (uint64_t)v90;
            _os_log_impl(&dword_0, v89, OS_LOG_TYPE_INFO, "We received an outgoing message and we are only reflecting it, setting shouldForceToSMS on chat %@ to YES", buf, 0xCu);
          }
        }
        long long v91 = *(void **)(a1 + 40);
        v88 = [(__CFString *)v75 chatIdentifier];
        objc_msgSend(v91, "_updateShouldForceToSMSForChatWithIdentifier:style:shouldForceToSMS:", v88, -[__CFString style](v75, "style"), 1);
        goto LABEL_118;
      }
      if (v84 == 1)
      {
        if (IMOSLoggingEnabled())
        {
          id v85 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
          {
            v86 = [(__CFString *)v75 chatIdentifier];
            *(_DWORD *)int buf = 138412290;
            uint64_t v161 = (uint64_t)v86;
            _os_log_impl(&dword_0, v85, OS_LOG_TYPE_INFO, "We received an outgoing message and we are only reflecting it, setting shouldForceToSMS on chat %@ to NO", buf, 0xCu);
          }
        }
        v87 = *(void **)(a1 + 40);
        v88 = [(__CFString *)v75 chatIdentifier];
        objc_msgSend(v87, "_updateShouldForceToSMSForChatWithIdentifier:style:shouldForceToSMS:", v88, -[__CFString style](v75, "style"), 0);
LABEL_118:
      }
    }
    if (v128)
    {
      long long v92 = [*(id *)(a1 + 40) loginID];
      [v128 setSender:v92];

      if (IMSharedHelperDeviceHasMultipleSubscriptions()) {
        [(__CFString *)v75 lastAddressedLocalHandle];
      }
      else {
      long long v94 = [*(id *)(a1 + 40) _callerIDUsingFromIdentifier:*(void *)(a1 + 80)];
      }
      [v128 setDestinationCallerID:v94];

      if (v75)
      {
        long long v95 = [*(id *)(a1 + 40) tapbackInterpreter];
        uint64_t v96 = [v95 interpretMessageItem:v128 inChat:v75];

        v128 = (void *)v96;
      }
      if (v125)
      {
        if (IMOSLoggingEnabled())
        {
          long long v97 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
          {
            long long v98 = [v128 guid];
            *(_DWORD *)int buf = 138412802;
            uint64_t v161 = (uint64_t)v98;
            __int16 v162 = 2112;
            CFStringRef v163 = v74;
            __int16 v164 = 2112;
            CFStringRef v165 = v75;
            _os_log_impl(&dword_0, v97, OS_LOG_TYPE_INFO, "send message with guid: %@  to identifier: %@   chat: %@", buf, 0x20u);
          }
        }
        long long v99 = *(void **)(a1 + 40);
        uint64_t v100 = v154;
        v135[0] = _NSConcreteStackBlock;
        v135[1] = 3221225472;
        v135[2] = sub_32B30;
        v135[3] = &unk_8D998;
        v135[4] = v99;
        id v136 = v128;
        v137 = v74;
        unsigned __int8 v139 = v154;
        id v138 = *(id *)(a1 + 96);
        [v99 processMessageForSending:v136 toChat:v137 style:v100 allowWatchdog:0 completionBlock:v135];
        v101 = &v136;
        v102 = (id *)&v137;
        uint64_t v103 = &v138;
      }
      else
      {
        int v104 = *(unsigned __int8 *)(a1 + 105);
        if (*(unsigned char *)(a1 + 105))
        {
          char v105 = 1;
          uint64_t v106 = a1;
        }
        else
        {
          v114 = +[NSDate date];
          [v128 setTime:v114];

          uint64_t v106 = a1;
          char v105 = *(unsigned char *)(a1 + 105);
        }
        __int16 v115 = *(void **)(v106 + 40);
        uint64_t v116 = v154;
        v140[0] = _NSConcreteStackBlock;
        v140[1] = 3221225472;
        v140[2] = sub_32874;
        v140[3] = &unk_8D970;
        BOOL v146 = v125 != 0;
        char v147 = v105;
        v140[4] = v115;
        id v141 = v128;
        v142 = v74;
        unsigned __int8 v148 = v154;
        id v145 = *(id *)(v106 + 96);
        v143 = v75;
        id v144 = *(id *)(v106 + 56);
        [v115 processMessageForSending:v141 toChat:v142 style:v116 allowWatchdog:v104 == 0 completionBlock:v140];

        v101 = &v141;
        v102 = (id *)&v142;
        uint64_t v103 = &v145;
      }

      if (IMOSLoggingEnabled())
      {
        __int16 v117 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
        {
          id v118 = [v128 guid];
          *(_DWORD *)int buf = 138412290;
          uint64_t v161 = (uint64_t)v118;
          _os_log_impl(&dword_0, v117, OS_LOG_TYPE_INFO, "Reflecting outgoing SMS with Guid: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        long long v93 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int buf = 0;
          _os_log_impl(&dword_0, v93, OS_LOG_TYPE_INFO, " Unable to create message item from message dictionary", buf, 2u);
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
      v128 = 0;
    }
    if ((IMSharedHelperDeviceHasMultipleSubscriptions() & 1) == 0)
    {
      v119 = *(void **)(a1 + 40);
      uint64_t v120 = v154;
      v121 = [*(id *)(a1 + 88) _stripFZIDPrefix];
      [v119 _updateLastAddressedIDsIfNeededForChatWithIdentifier:v74 style:v120 lastAddressedHandle:v121 lastAddressedSIMID:0];
    }
    goto LABEL_158;
  }
  unsigned int v39 = v38;
  if (IMOSLoggingEnabled())
  {
    id v40 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      uint64_t v41 = [v128 guid];
      char v42 = (void *)v41;
      CFStringRef v43 = @"YES";
      if (!v39) {
        CFStringRef v43 = @"NO";
      }
      *(_DWORD *)int buf = 138412546;
      uint64_t v161 = v41;
      __int16 v162 = 2112;
      CFStringRef v163 = v43;
      _os_log_impl(&dword_0, v40, OS_LOG_TYPE_INFO, "Found a Message with the same GUID %@ and Fail %@", buf, 0x16u);
    }
  }
  id v44 = [v126 service];
  uint64_t v45 = [v128 service];
  unsigned __int8 v46 = [v44 isEqualToString:v45];

  if ((v46 & (v39 == 0)) == 0)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_82;
    }
    int v53 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      id v54 = [v128 guid];
      id v55 = [v128 service];
      *(_DWORD *)int buf = 138412546;
      uint64_t v161 = (uint64_t)v54;
      __int16 v162 = 2112;
      CFStringRef v163 = v55;
      _os_log_impl(&dword_0, v53, OS_LOG_TYPE_INFO, "Found duplicate message for GUID %@ on Service %@ but allowing it to be processed since original message had an error", buf, 0x16u);
    }
LABEL_81:

    goto LABEL_82;
  }
  unsigned int v47 = [v126 needsRepeatForRelayReplication];
  int v48 = IMOSLoggingEnabled();
  if (v47)
  {
    if (v48)
    {
      long long v49 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        long long v50 = [v128 guid];
        *(_DWORD *)int buf = 138412290;
        uint64_t v161 = (uint64_t)v50;
        _os_log_impl(&dword_0, v49, OS_LOG_TYPE_INFO, "Found message with same GUID %@ but still needs relay replication", buf, 0xCu);
      }
    }
    [v126 setNeedsRepeatForRelayReplication:0];
    goto LABEL_82;
  }
  if (v122)
  {
    if (!v48) {
      goto LABEL_82;
    }
    int v53 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      int v56 = [v128 guid];
      *(_DWORD *)int buf = 138412290;
      uint64_t v161 = (uint64_t)v56;
      _os_log_impl(&dword_0, v53, OS_LOG_TYPE_INFO, "Found message with same GUID %@ but instructed to send message without persistence", buf, 0xCu);
    }
    goto LABEL_81;
  }
  uint64_t v107 = a1;
  if (v48)
  {
    v108 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
    {
      v109 = [v128 guid];
      v110 = [v128 service];
      *(_DWORD *)int buf = 138412546;
      uint64_t v161 = (uint64_t)v109;
      __int16 v162 = 2112;
      CFStringRef v163 = v110;
      _os_log_impl(&dword_0, v108, OS_LOG_TYPE_INFO, "Found duplicate message for GUID %@ on Service %@ and it did not have an error", buf, 0x16u);
    }
    uint64_t v107 = a1;
  }
  (*(void (**)(void))(*(void *)(v107 + 96) + 16))();
LABEL_159:
  long long v52 = v126;
LABEL_160:

LABEL_161:
}

void sub_32278(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x31FECLL);
  }
  _Unwind_Resume(a1);
}

id sub_323EC(void *a1)
{
  id v1 = a1;
  id v2 = +[NSDate date];
  id v3 = v2;
  if (v1)
  {
    id v4 = [v1 unsignedLongLongValue];
    if (IMOSLoggingEnabled())
    {
      CFStringRef v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        double v15 = *(double *)&v1;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Converting timestamp: %@ to date", (uint8_t *)&v14, 0xCu);
      }
    }
    double v6 = (double)(unint64_t)v4 / 1000000000.0;
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v14 = 134217984;
        double v15 = v6;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "  => seconds: %f", (uint8_t *)&v14, 0xCu);
      }
    }
    if (v6 <= 600000.0)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "  => Returning current date, failed sanity", (uint8_t *)&v14, 2u);
        }
      }
      uint64_t v8 = +[NSDate date];
    }
    else
    {
      uint64_t v8 = +[NSDate dateWithTimeIntervalSince1970:v6];

      if (IMOSLoggingEnabled())
      {
        id v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v14 = 138412290;
          double v15 = *(double *)&v8;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "  => Returning date: %@", (uint8_t *)&v14, 0xCu);
        }
      }
    }
    sub_4E2B0(v8);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = v2;
    uint64_t v8 = v10;
  }
  uint64_t v12 = v10;

  return v12;
}

id sub_326D0(id a1, id a2)
{
  id v2 = a2;
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [v2 objectForKey:off_99900];
      int v7 = 138412290;
      uint64_t v8 = v4;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Found Recipient %@", (uint8_t *)&v7, 0xCu);
    }
  }
  CFStringRef v5 = [v2 objectForKey:off_99900];

  return v5;
}

uint64_t sub_327F4(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:off_998E8])
  {
    uint64_t v2 = 45;
  }
  else if ([v1 isEqualToString:off_998F8])
  {
    uint64_t v2 = 43;
  }
  else if ([v1 isEqualToString:off_998F0])
  {
    uint64_t v2 = 35;
  }
  else
  {
    uint64_t v2 = 45;
  }

  return v2;
}

void sub_32874(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 80) || *(unsigned char *)(a1 + 81))
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "This messag was addressed to me, however I was told to reflect it only", (uint8_t *)&v14, 2u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      CFStringRef v5 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        id v15 = v3;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "  => Done marking message as sending: %@", (uint8_t *)&v14, 0xCu);
      }
    }
    double v6 = *(void **)(a1 + 32);
    int v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(unsigned __int8 *)(a1 + 82);
    id v10 = [v7 time];
    [v6 didSendMessage:v7 forChat:v8 style:v9 forceDate:v10];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        id v15 = v3;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "  => Done marking message as sending: %@", (uint8_t *)&v14, 0xCu);
      }
    }
    if (*(unsigned char *)(a1 + 81))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v12 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          id v13 = *(void **)(a1 + 64);
          int v14 = 138412290;
          id v15 = v13;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Message %@ is being replayed. Not sending out over CT", (uint8_t *)&v14, 0xCu);
        }
      }
    }
    else
    {
      [*(id *)(a1 + 32) sendCTMessageFromIMMessageItem:*(void *)(a1 + 40) forChat:*(void *)(a1 + 48) chat:*(void *)(a1 + 56) style:*(unsigned __int8 *)(a1 + 82)];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void sub_32B30(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "  => Done marking message as sending: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  CFStringRef v5 = *(void **)(a1 + 32);
  double v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v9 = [v6 time];
  [v5 didSendMessage:v6 forChat:v7 style:v8 forceDate:v9];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_32E08(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "SMS Service Session Received Outgoing download Message From Push Handler", buf, 2u);
    }
  }
  [*(id *)(a1 + 32) _approveSelfForSMSRelay];
  CFStringRef v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  CFStringRef v26 = sub_33370;
  uint64_t v27 = &unk_8DA58;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v28 = v5;
  uint64_t v29 = v6;
  id v30 = *(id *)(a1 + 48);
  char v37 = *(unsigned char *)(a1 + 96);
  id v31 = *(id *)(a1 + 56);
  id v32 = *(id *)(a1 + 64);
  id v33 = *(id *)(a1 + 72);
  id v7 = v3;
  id v36 = v7;
  id v34 = *(id *)(a1 + 80);
  id v35 = *(id *)(a1 + 88);
  uint64_t v8 = objc_retainBlock(&v24);
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "idsDeviceFromPushToken:", *(void *)(a1 + 48), v24, v25, v26, v27);
  if (IMOSLoggingEnabled())
  {
    int v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [v9 name];
      *(_DWORD *)int buf = 138412290;
      unsigned int v39 = v11;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, " Outgoing Download message request from %@", buf, 0xCu);
    }
  }
  uint64_t v12 = [*(id *)(a1 + 40) objectForKey:off_998C8];

  if (!v9 || v12 || ![*(id *)(a1 + 32) _localDeviceSupportsSMS])
  {
    if (IMOSLoggingEnabled())
    {
      unsigned int v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        BOOL v21 = *(void **)(a1 + 88);
        *(_DWORD *)int buf = 138412290;
        unsigned int v39 = v21;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, " This message was not for us to gatekeep, it was not addressed to us (Addressed To: %@", buf, 0xCu);
      }
    }
    goto LABEL_28;
  }
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, " This message was destined for me to send out, I am the gatekeeper", buf, 2u);
    }
  }
  if (([*(id *)(a1 + 32) isSMSRelayEnabled] & 1) == 0
    && ([v9 isDefaultPairedDevice] & 1) == 0)
  {
LABEL_34:
    ((void (*)(void ***, void))v8[2])(v8, 0);
    goto LABEL_29;
  }
  int v14 = *(void **)(a1 + 32);
  id v15 = [v9 uniqueID];
  uint64_t v16 = [*(id *)(a1 + 32) _allowedDevicesforSMSRelay];
  LODWORD(v14) = [v14 isIDInList:v15 ArrayToCheck:v16];

  int v17 = IMOSLoggingEnabled();
  if (!v14)
  {
    if (v17)
    {
      id v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = [v9 name];
        *(_DWORD *)int buf = 138412290;
        unsigned int v39 = v23;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, " Device %@ is on the blockList, sending back a failure", buf, 0xCu);
      }
    }
    goto LABEL_34;
  }
  if (v17)
  {
    unsigned int v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = [v9 name];
      *(_DWORD *)int buf = 138412290;
      unsigned int v39 = v19;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, " Device %@ is on the allowed list, Telling the block to continue", buf, 0xCu);
    }
  }
LABEL_28:
  [*(id *)(a1 + 32) _deferredReplicatedMessageReleaseWithAllowedMessage:*(void *)(a1 + 40) outgoingProxyBlock:v8];
LABEL_29:
}

void sub_332E8(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x332B4);
  }
  _Unwind_Resume(a1);
}

void sub_33370(uint64_t a1, int a2)
{
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      CFStringRef v5 = @"NO";
      if (a2) {
        CFStringRef v5 = @"YES";
      }
      *(_DWORD *)int buf = 138412290;
      uint64_t v77 = (uint64_t)v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Is Message from device on the allowed proxy list? %@", buf, 0xCu);
    }
  }
  int v6 = IMOSLoggingEnabled();
  if (a2)
  {
    if (v6)
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int buf = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Message Type is an outgoing download message", buf, 2u);
      }
    }
    uint64_t v8 = [*(id *)(a1 + 32) objectForKey:off_998C8];
    BOOL v59 = v8 != 0;

    if (!v8)
    {
      uint64_t v9 = [*(id *)(a1 + 40) idsDeviceFromPushToken:*(void *)(a1 + 48)];
      if (*(unsigned char *)(a1 + 104))
      {
        if (IMOSLoggingEnabled())
        {
          int v10 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            uint64_t v11 = *(void *)(a1 + 56);
            *(_DWORD *)int buf = 138412290;
            uint64_t v77 = v11;
            _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Message %@ was being replayed not forwarding to peers", buf, 0xCu);
          }
        }
      }
      else
      {
        [*(id *)(a1 + 40) _forwardMessageToPeers:*(void *)(a1 + 32) messageType:144 guid:*(void *)(a1 + 56) originalSender:v9];
      }
    }
    BOOL v15 = v8 == 0;
    uint64_t v16 = *(void **)(a1 + 40);
    char v17 = v15;
    char v58 = v17;
    unsigned int v18 = [*(id *)(a1 + 32) objectForKey:off_99950];
    id v13 = [v16 _convertIMMessageItemDictionaryToIMMessageItem:v18];

    int v19 = sub_323EC(*(void **)(a1 + 64));
    [v13 setTime:v19];

    unsigned int v20 = *(void **)(a1 + 40);
    uint64_t v21 = *(void *)(a1 + 72);
    id v22 = [v13 guid];
    [v20 _markFromStorageIfNeeded:v21 messageGUID:v22];

    uint64_t v23 = [*(id *)(a1 + 32) objectForKey:off_997F0];
    CFStringRef v24 = objc_msgSend(v23, "__imArrayByApplyingBlock:", &stru_8DA08);

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v14 = v24;
    id v25 = [v14 countByEnumeratingWithState:&v72 objects:v80 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v73;
      while (2)
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v73 != v26) {
            objc_enumerationMutation(v14);
          }
          uint64_t v28 = *(void *)(*((void *)&v72 + 1) + 8 * i);
          uint64_t v29 = +[IDSCTAdapter sharedInstance];
          LODWORD(v28) = [v29 isPhoneNumberEmergencyNumber:v28];

          if (v28)
          {
            if (IMOSLoggingEnabled())
            {
              int v48 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)int buf = 0;
                _os_log_impl(&dword_0, v48, OS_LOG_TYPE_INFO, "One of the recipients of this outgoing message is an emergency number, Not processing message", buf, 2u);
              }
            }
            (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
            id v32 = v14;
            goto LABEL_61;
          }
        }
        id v25 = [v14 countByEnumeratingWithState:&v72 objects:v80 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }

    id v30 = +[IMDMessageStore sharedInstance];
    id v31 = [v13 guid];
    id v32 = [v30 messageWithGUID:v31];

    unsigned int v33 = [v32 errorCode];
    if (v32)
    {
      unsigned int v34 = v33;
      if (IMOSLoggingEnabled())
      {
        id v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          uint64_t v36 = [v13 guid];
          char v37 = (void *)v36;
          CFStringRef v38 = @"YES";
          if (!v34) {
            CFStringRef v38 = @"NO";
          }
          *(_DWORD *)int buf = 138412546;
          uint64_t v77 = v36;
          __int16 v78 = 2112;
          CFStringRef v79 = v38;
          _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "Found a Message with the same GUID %@ and Fail %@", buf, 0x16u);
        }
      }
      BOOL v39 = v34 == 0;
      id v40 = [v32 service];
      uint64_t v41 = [v13 service];
      unsigned int v42 = [v40 isEqualToString:v41];

      if ((v42 & v39) != 0)
      {
        unsigned int v43 = [v32 needsRepeatForRelayReplication];
        int v44 = IMOSLoggingEnabled();
        if (!v43)
        {
          if (v44)
          {
            id v55 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              int v56 = [v13 guid];
              v57 = [v13 service];
              *(_DWORD *)int buf = 138412546;
              uint64_t v77 = (uint64_t)v56;
              __int16 v78 = 2112;
              CFStringRef v79 = v57;
              _os_log_impl(&dword_0, v55, OS_LOG_TYPE_INFO, "Found duplicate message for GUID %@ on Service %@ and it did not have an error", buf, 0x16u);
            }
          }
          (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
          goto LABEL_61;
        }
        if (v44)
        {
          uint64_t v45 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            unsigned __int8 v46 = [v13 guid];
            *(_DWORD *)int buf = 138412290;
            uint64_t v77 = (uint64_t)v46;
            _os_log_impl(&dword_0, v45, OS_LOG_TYPE_INFO, "Found message with same GUID %@ but still needs relay replication", buf, 0xCu);
          }
        }
        [v32 setNeedsRepeatForRelayReplication:0];
        uint64_t v47 = 1;
LABEL_60:
        long long v52 = *(void **)(*(void *)(a1 + 40) + 248);
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472;
        v60[2] = sub_33E54;
        v60[3] = &unk_8DA30;
        id v53 = *(id *)(a1 + 32);
        uint64_t v54 = *(void *)(a1 + 40);
        id v61 = v53;
        uint64_t v62 = v54;
        id v63 = v14;
        id v64 = v13;
        id v65 = *(id *)(a1 + 80);
        char v69 = v58;
        BOOL v70 = v59;
        char v71 = *(unsigned char *)(a1 + 104);
        id v68 = *(id *)(a1 + 96);
        id v66 = *(id *)(a1 + 56);
        id v67 = *(id *)(a1 + 88);
        [v52 retrieveAttachmentsForMessage:v64 ignoreStoredTransfers:v47 displayID:0 token:0 completionBlock:v60];

LABEL_61:
        goto LABEL_62;
      }
      if (IMOSLoggingEnabled())
      {
        long long v49 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          id v50 = [v13 guid];
          long long v51 = [v13 service];
          *(_DWORD *)int buf = 138412546;
          uint64_t v77 = (uint64_t)v50;
          __int16 v78 = 2112;
          CFStringRef v79 = v51;
          _os_log_impl(&dword_0, v49, OS_LOG_TYPE_INFO, "Found duplicate message for GUID %@ on Service %@ but allowing it to be processed since original message had an error", buf, 0x16u);
        }
      }
    }
    uint64_t v47 = 0;
    goto LABEL_60;
  }
  if (v6)
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Alert said no, sending back a failure ", buf, 2u);
    }
  }
  id v13 = [*(id *)(a1 + 40) idsDeviceFromPushToken:*(void *)(a1 + 48)];
  +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", *(void *)(a1 + 56), off_998B8, &__kCFBooleanTrue, off_997C0, 0);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) sendUnApproveToDevice:v13 extraKeys:v14];
  (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
LABEL_62:
}

void sub_33C68(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x3392CLL);
  }
  _Unwind_Resume(a1);
}

id sub_33D30(id a1, id a2)
{
  id v2 = a2;
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [v2 objectForKey:off_99900];
      int v7 = 138412290;
      uint64_t v8 = v4;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Found Recipient %@", (uint8_t *)&v7, 0xCu);
    }
  }
  CFStringRef v5 = [v2 objectForKey:off_99900];

  return v5;
}

void sub_33E54(uint64_t a1, void *a2, void *a3, int a4, int a5)
{
  id v63 = a2;
  id v64 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      CFStringRef v9 = @"NO";
      if (a4) {
        CFStringRef v9 = @"YES";
      }
      *(_DWORD *)int buf = 138412546;
      CFStringRef v91 = v9;
      __int16 v92 = 1024;
      LODWORD(v93) = a5;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "LegacySMSAttachmentController complete, success: %@   error: %d", buf, 0x12u);
    }
  }
  id v69 = objc_alloc_init((Class)NSMutableArray);
  unsigned __int8 v89 = 0;
  int v10 = [*(id *)(a1 + 32) objectForKey:off_998E0];
  int v65 = sub_327F4(v10);

  unsigned __int8 v89 = v65;
  if (v65 == 45)
  {
    id v66 = objc_msgSend(*(id *)(a1 + 48), "__imFirstObject");
    uint64_t v11 = +[NSNumber numberWithInt:2];
    uint64_t v12 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v11, kFZChatParticipantStatusKey, v66, kFZPersonID, 0, v63, v64);

    [v69 addObject:v12];
    id v13 = +[IMDChatRegistry sharedInstance];
    id v14 = objc_msgSend(*(id *)(a1 + 48), "__imFirstObject");
    BOOL v15 = [*(id *)(a1 + 40) account];
    uint64_t v16 = [v13 existingChatForID:v14 account:v15];
  }
  else
  {
    char v17 = [*(id *)(a1 + 40) chatRegistry];
    unsigned int v18 = [*(id *)(a1 + 40) account];
    id v66 = [v17 generateUnusedChatIdentifierForGroupChatWithAccount:v18];

    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id obj = *(id *)(a1 + 48);
    id v19 = [obj countByEnumeratingWithState:&v85 objects:v96 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v86;
      uint64_t v21 = kFZChatParticipantStatusKey;
      uint64_t v22 = kFZPersonID;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v86 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void *)(*((void *)&v85 + 1) + 8 * i);
          id v25 = +[NSNumber numberWithInt:2];
          uint64_t v26 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v25, v21, v24, v22, 0, v63, v64);

          [v69 addObject:v26];
        }
        id v19 = [obj countByEnumeratingWithState:&v85 objects:v96 count:16];
      }
      while (v19);
    }

    id v13 = +[IMDChatRegistry sharedInstance];
    uint64_t v27 = *(void *)(a1 + 48);
    id v14 = [*(id *)(a1 + 40) account];
    uint64_t v16 = [v13 existingChatForIDs:v27 account:v14 style:43];
  }

  if (v16)
  {
    id v28 = [v16 chatIdentifier];

    unsigned __int8 v89 = [v16 style];
    id v29 = v16;
  }
  else
  {
    id v30 = *(void **)(a1 + 40);
    id v84 = v66;
    [v30 canonicalizeChatIdentifier:&v84 style:&v89];
    id v28 = v84;

    [*(id *)(a1 + 40) didJoinChat:v28 style:v89 displayName:0 groupID:0 handleInfo:v69];
    id v31 = +[IMDChatRegistry sharedInstance];
    uint64_t v32 = *(void *)(a1 + 48);
    if (v65 == 45)
    {
      unsigned int v33 = objc_msgSend(*(id *)(a1 + 48), "__imFirstObject");
      unsigned int v34 = [*(id *)(a1 + 40) account];
      id v29 = [v31 existingChatForID:v33 account:v34];
    }
    else
    {
      unsigned int v33 = [*(id *)(a1 + 40) account];
      id v29 = [v31 existingChatForIDs:v32 account:v33 style:43];
    }
  }
  id v35 = *(void **)(a1 + 56);
  uint64_t v36 = [*(id *)(a1 + 40) loginID];
  [v35 setSender:v36];

  char HasMultipleSubscriptions = IMSharedHelperDeviceHasMultipleSubscriptions();
  CFStringRef v38 = *(void **)(a1 + 56);
  if (HasMultipleSubscriptions) {
    [v29 lastAddressedLocalHandle];
  }
  else {
  BOOL v39 = [*(id *)(a1 + 64) _stripFZIDPrefix];
  }
  [v38 setDestinationCallerID:v39];

  BOOL v40 = *(unsigned char *)(a1 + 96) == 0;
  int v41 = IMOSLoggingEnabled();
  if (v40)
  {
    if (v41)
    {
      uint64_t v47 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        int v48 = [*(id *)(a1 + 56) guid];
        *(_DWORD *)int buf = 138412802;
        CFStringRef v91 = v48;
        __int16 v92 = 2112;
        id v93 = v28;
        __int16 v94 = 2112;
        id v95 = v29;
        _os_log_impl(&dword_0, v47, OS_LOG_TYPE_INFO, "Noting relayed SMS message with guid %@ to identifier: %@   chat: %@", buf, 0x20u);
      }
    }
    long long v49 = *(void **)(a1 + 40);
    id v50 = *(void **)(a1 + 56);
    uint64_t v51 = v89;
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_34A4C;
    v70[3] = &unk_8D998;
    v70[4] = v49;
    id v71 = v50;
    id v72 = v28;
    unsigned __int8 v74 = v89;
    id v73 = *(id *)(a1 + 88);
    [v49 processMessageForSending:v71 toChat:v72 style:v51 allowWatchdog:0 completionBlock:v70];
    long long v52 = &v71;
    id v53 = &v72;
    uint64_t v54 = &v73;
  }
  else
  {
    if (v41)
    {
      unsigned int v42 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        unsigned int v43 = [*(id *)(a1 + 56) guid];
        *(_DWORD *)int buf = 138412802;
        CFStringRef v91 = v43;
        __int16 v92 = 2112;
        id v93 = v28;
        __int16 v94 = 2112;
        id v95 = v29;
        _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "Will relay SMS message with guid %@   to identifier: %@   chat: %@", buf, 0x20u);
      }
    }
    uint64_t v44 = a1;
    if (*(unsigned char *)(a1 + 97))
    {
      uint64_t v45 = 0;
      char v46 = 1;
    }
    else if (*(unsigned char *)(a1 + 98))
    {
      char v46 = 0;
      uint64_t v45 = 0;
    }
    else
    {
      id v55 = *(void **)(a1 + 56);
      int v56 = +[NSDate date];
      [v55 setTime:v56];

      uint64_t v44 = a1;
      char v46 = *(unsigned char *)(a1 + 97);
      uint64_t v45 = 1;
    }
    v57 = *(void **)(v44 + 40);
    char v58 = *(void **)(v44 + 56);
    uint64_t v59 = v89;
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_34790;
    v75[3] = &unk_8D970;
    char v81 = v46;
    char v82 = *(unsigned char *)(v44 + 98);
    v75[4] = v57;
    id v76 = v58;
    id v77 = v28;
    unsigned __int8 v83 = v89;
    id v80 = *(id *)(v44 + 88);
    id v78 = v29;
    id v79 = *(id *)(v44 + 72);
    [v57 processMessageForSending:v76 toChat:v77 style:v59 allowWatchdog:v45 completionBlock:v75];

    long long v52 = &v76;
    id v53 = &v77;
    uint64_t v54 = &v80;
  }

  if ((IMSharedHelperDeviceHasMultipleSubscriptions() & 1) == 0)
  {
    long long v60 = *(void **)(a1 + 40);
    uint64_t v61 = v89;
    uint64_t v62 = [*(id *)(a1 + 80) _stripFZIDPrefix];
    [v60 _updateLastAddressedIDsIfNeededForChatWithIdentifier:v28 style:v61 lastAddressedHandle:v62 lastAddressedSIMID:0];
  }
}

void sub_34748(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x344B4);
  }
  _Unwind_Resume(a1);
}

void sub_34790(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 80) || *(unsigned char *)(a1 + 81))
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "This messag was addressed to me, however I was told to reflect it only", (uint8_t *)&v14, 2u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      CFStringRef v5 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        id v15 = v3;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "  => Done marking message as sending: %@", (uint8_t *)&v14, 0xCu);
      }
    }
    int v6 = *(void **)(a1 + 32);
    int v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(unsigned __int8 *)(a1 + 82);
    int v10 = [v7 time];
    [v6 didSendMessage:v7 forChat:v8 style:v9 forceDate:v10];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        id v15 = v3;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "  => Done marking message as sending: %@", (uint8_t *)&v14, 0xCu);
      }
    }
    if (*(unsigned char *)(a1 + 81))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v12 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          id v13 = *(void **)(a1 + 64);
          int v14 = 138412290;
          id v15 = v13;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Message %@ is being replayed. Not sending out over CT", (uint8_t *)&v14, 0xCu);
        }
      }
    }
    else
    {
      [*(id *)(a1 + 32) sendCTMessageFromIMMessageItem:*(void *)(a1 + 40) forChat:*(void *)(a1 + 48) chat:*(void *)(a1 + 56) style:*(unsigned __int8 *)(a1 + 82)];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void sub_34A4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "  => Done marking message as sending: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  CFStringRef v5 = *(void **)(a1 + 32);
  int v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v9 = [v6 time];
  [v5 didSendMessage:v6 forChat:v7 style:v8 forceDate:v9];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_34C4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v12 = 138412290;
      uint64_t v13 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "SMS Service Session received Message ID sent: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  [*(id *)(a1 + 40) _approveSelfForSMSRelay];
  if ([*(id *)(a1 + 32) length])
  {
    [*(id *)(a1 + 40) _markFromStorageIfNeeded:*(void *)(a1 + 48) messageGUID:*(void *)(a1 + 32)];
    unsigned int v6 = [*(id *)(*(void *)(a1 + 40) + 192) containsObject:*(void *)(a1 + 32)];
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 32);
    if (v6)
    {
      [v7 _clearTimoutTimerForRelayMessageID:v8];
      int v10 = *(void **)(a1 + 40);
      uint64_t v9 = (id *)(a1 + 40);
      [v10 notifyDidSendMessageID:*(v9 - 1) shouldNotify:1];
      [*v9 _removeOriginatedMessage:*(v9 - 1)];
    }
    else
    {
      [v7 notifyDidSendMessageID:v8 shouldNotify:0];
      [*(id *)(a1 + 40) _clearTimoutTimerForRelayMessageID:*(void *)(a1 + 32)];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "  => Empty message ID, ignoring", (uint8_t *)&v12, 2u);
    }
  }
  v3[2](v3);
}

void sub_34FD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_34FF0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_35000(uint64_t a1)
{
}

void sub_35008(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _approveSelfForSMSRelay];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      int v12 = 138412546;
      uint64_t v13 = v5;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Told to mark message ID %@ as read with timestamp %@", (uint8_t *)&v12, 0x16u);
    }
  }
  [*(id *)(a1 + 32) _markFromStorageIfNeeded:*(void *)(a1 + 56) messageGUID:*(void *)(a1 + 40)];
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = sub_323EC(*(void **)(a1 + 48));
  [v7 didReceiveMessageReadForMessageID:v8 date:v9 completionBlock:v3];

  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

void sub_35278(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _approveSelfForSMSRelay];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 56);
      int v10 = 138412802;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "SMS Service Session Received Message ID:%@ Send Failure Message From Push Handler, from:%@ to:%@", (uint8_t *)&v10, 0x20u);
    }
  }
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v8 = a1 + 32;
  [v9 _markFromStorageIfNeeded:*(void *)(v8 + 32) messageGUID:*(void *)(v8 + 8)];
  [*(id *)v8 didReceiveError:4 forMessageID:*(void *)(v8 + 8) forceError:1];
  v3[2](v3);
}

void sub_357A0(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) _handleDeleteCommandWithMessageDictionary:*(void *)(a1 + 40)];
  id v3 = v4;
  if (v4)
  {
    (*((void (**)(id))v4 + 2))(v4);
    id v3 = v4;
  }
}

void sub_35B30(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) recoverChatsForCommandDictionary:*(void *)(a1 + 40)];
  id v3 = v4;
  if (v4)
  {
    (*((void (**)(id))v4 + 2))(v4);
    id v3 = v4;
  }
}

void sub_36390(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "SMS Service Session Received Message ID Send Failure Message From Push Handler", v5, 2u);
    }
  }
  [*(id *)(a1 + 32) _markFromStorageIfNeeded:*(void *)(a1 + 40) messageGUID:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) didReceiveError:4 forMessageID:*(void *)(a1 + 48) forceError:1];
  v3[2](v3);
}

void sub_368B0(id a1, IMUserNotification *a2)
{
  id v2 = a2;
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "User tapped cancel on the Pin Display Alert, This will not dismiss the entry field on the iPhone", v4, 2u);
    }
  }
}

void sub_37670(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _approveSelfForSMSRelay];
  id v4 = [*(id *)(a1 + 32) idsDeviceFromPushToken:*(void *)(a1 + 40)];
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [v4 name];
      int v10 = 138412290;
      uint64_t v11 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Incoming SMSFilteringSettings message from %@", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = [v4 uniqueIDOverride];
  [v7 _processReceivedSMSFilteringSettingsDictionary:v8 deviceID:v9];

  v3[2](v3);
}

id sub_39734(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) transferForGUID:a2];
}

NSString *__cdecl sub_39740(id a1, IMFileTransfer *a2)
{
  return (NSString *)@"\uFFFD";
}

void sub_3995C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) lastAddressedHandleForJunkReportMessageItem:*(void *)(a1 + 40)];
  uint64_t v5 = [*(id *)(a1 + 32) lastAddressedSIMIDForJunkReportMessageItem:*(void *)(a1 + 40)];
  uint64_t v6 = [*(id *)(a1 + 40) subject];
  if ([v6 length])
  {
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 40) fileTransferGUIDs];
    id v8 = [v7 count];

    if (!v8) {
      goto LABEL_10;
    }
  }
  if ([*(id *)(a1 + 32) _checkMMSEnablementForPhoneNumber:v4 simID:v5])
  {
    int v9 = 0;
    uint64_t v10 = 1;
    goto LABEL_11;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412546;
      CFStringRef v31 = @"YES";
      __int16 v32 = 2112;
      CFStringRef v33 = @"NO";
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Overriding shouldBroadcastMessage to be %@ and shouldSendMMS %@ based on _checkMMSEnablement", buf, 0x16u);
    }
  }
LABEL_10:
  uint64_t v10 = 0;
  int v9 = 1;
LABEL_11:
  if (IMOSLoggingEnabled())
  {
    __int16 v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      CFStringRef v13 = @"NO";
      if (v10) {
        CFStringRef v13 = @"YES";
      }
      *(_DWORD *)int buf = 138412290;
      CFStringRef v31 = v13;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "            Should Send MMS: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      CFStringRef v15 = @"NO";
      if (v9) {
        CFStringRef v15 = @"YES";
      }
      *(_DWORD *)int buf = 138412290;
      CFStringRef v31 = v15;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "   Should Broadcast Message: %@", buf, 0xCu);
    }
  }
  uint64_t v16 = *(void *)(a1 + 32);
  char v17 = *(void **)(a1 + 40);
  unsigned int v18 = *(void **)(v16 + 248);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_39CFC;
  v22[3] = &unk_8CF68;
  id v23 = v3;
  uint64_t v24 = v16;
  char v28 = v9;
  char v29 = v10;
  id v25 = v17;
  id v26 = v4;
  id v27 = v5;
  id v19 = v5;
  id v20 = v4;
  id v21 = v3;
  [v18 processAttachmentsForMessage:v17 generateTextParts:v10 lastAddressedHandle:v20 lastAddressedSIMID:v19 completionBlock:v22];
}

void sub_39CFC(uint64_t a1, void *a2, int a3, void *a4)
{
  id v54 = a2;
  id v53 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = MarcoLoggingStringForMessageData();
      *(_DWORD *)int buf = 138412290;
      *(void *)id v71 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "processAttachmentsForMessage Parts: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    int v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)int buf = 138412290;
      *(void *)id v71 = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Participants: %@", buf, 0xCu);
    }
  }
  id v11 = [*(id *)(a1 + 40) newTelephonyMessagesForHandles:*(void *)(a1 + 32) shouldBroadcastMessage:*(unsigned __int8 *)(a1 + 72)];
  if (!*(unsigned char *)(a1 + 73)) {
    [*(id *)(a1 + 40) addMessagePlainTextToTelephonyMessages:v11 messageItem:*(void *)(a1 + 48) processedMessageItem:v54];
  }
  [*(id *)(a1 + 40) setSubjectForTelephonyMessages:v11 messageItem:*(void *)(a1 + 48)];
  if (IMOSLoggingEnabled())
  {
    __int16 v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      CFStringRef v13 = @"NO";
      if (a3) {
        CFStringRef v13 = @"YES";
      }
      *(_DWORD *)int buf = 138412290;
      *(void *)id v71 = v13;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "    Parts all process: %@", buf, 0xCu);
    }
  }
  char v14 = a3 ^ 1;
  if (((a3 ^ 1) & 1) == 0) {
    [*(id *)(a1 + 40) processPartsOfTelephonyMessages:v11 parts:v53 messageItem:*(void *)(a1 + 48) isGroupChat:0 phoneNumber:*(void *)(a1 + 56) simID:*(void *)(a1 + 64)];
  }
  [*(id *)(a1 + 40) buildTelephonyPhoneNumbersForTelephonyMessages:v11 shouldBroadcastMessage:*(unsigned __int8 *)(a1 + 72) handles:*(void *)(a1 + 32)];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v11;
  id v15 = [obj countByEnumeratingWithState:&v65 objects:v78 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v66;
    char v17 = 1;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v66 != v16) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        [v19 setServiceCenter:0];
        id v20 = *(void **)(a1 + 40);
        if (v17) {
          [*(id *)(a1 + 48) guid];
        }
        else {
        id v21 = +[NSString stringGUID];
        }
        objc_msgSend(v19, "setMessageId:", objc_msgSend(v20, "_generateMessageIDForMessageGUID:completionBlock:failureBlock:", v21, 0, 0));

        [*(id *)(a1 + 40) setMessageTypeForTelephonyMessage:v19 shouldSendMMS:*(unsigned __int8 *)(a1 + 73)];
        uint64_t v22 = +[IMCTSubscriptionUtilities sharedInstance];
        id v23 = [v22 ctSubscriptionInfo];

        uint64_t v24 = objc_msgSend(v23, "__im_subscriptionContextForForSimID:phoneNumber:", *(void *)(a1 + 64), *(void *)(a1 + 56));
        if (v24)
        {
          [v19 setContext:v24];
          if (IMOSLoggingEnabled())
          {
            id v25 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              id v26 = [v54 guid];
              *(_DWORD *)int buf = 138412546;
              *(void *)id v71 = v26;
              *(_WORD *)&v71[8] = 2112;
              *(void *)id v72 = v24;
              _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Setting the context for junk report message guid = %@, context %@", buf, 0x16u);
            }
          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            id v27 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)int buf = 0;
              _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "Could not find a subscription context to send junk report with based on contact preferred subscription in context so failing message", buf, 2u);
            }
          }
          char v14 = 1;
        }

        char v17 = 0;
      }
      id v15 = [obj countByEnumeratingWithState:&v65 objects:v78 count:16];
      char v17 = 0;
    }
    while (v15);
  }

  int v28 = IMOSLoggingEnabled();
  if (v14)
  {
    if (v28)
    {
      char v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        *(void *)id v71 = obj;
        _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "   *** Parts failed, failing junk report message(s): %@", buf, 0xCu);
      }
    }
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v30 = obj;
    id v31 = [v30 countByEnumeratingWithState:&v57 objects:v69 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v58;
      do
      {
        for (j = 0; j != v31; j = (char *)j + 1)
        {
          if (*(void *)v58 != v32) {
            objc_enumerationMutation(v30);
          }
          uint64_t v34 = *(void *)(*((void *)&v57 + 1) + 8 * (void)j);
          if (IMOSLoggingEnabled())
          {
            id v35 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)int buf = 138412290;
              *(void *)id v71 = v34;
              _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "part error sending message %@", buf, 0xCu);
            }
          }
          if (IMOSLoggingEnabled())
          {
            uint64_t v36 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)int buf = 138412290;
              *(void *)id v71 = v34;
              _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, "   => failed CT Message: %@  (some parts failed)", buf, 0xCu);
            }
          }
        }
        id v31 = [v30 countByEnumeratingWithState:&v57 objects:v69 count:16];
      }
      while (v31);
    }

    char v37 = +[IMMetricsCollector sharedInstance];
    [v37 trackEvent:IMMetricsCollectorEventCarrierReportJunkCompletionStatus withDictionary:&off_90F50];
  }
  else
  {
    if (v28)
    {
      CFStringRef v38 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        *(void *)id v71 = obj;
        _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "   No parts failed, sending junk report message(s): %@", buf, 0xCu);
      }
    }
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v39 = obj;
    int v40 = 0;
    id v41 = [v39 countByEnumeratingWithState:&v61 objects:v77 count:16];
    if (v41)
    {
      int v55 = 0;
      uint64_t v42 = *(void *)v62;
      do
      {
        for (k = 0; k != v41; k = (char *)k + 1)
        {
          if (*(void *)v62 != v42) {
            objc_enumerationMutation(v39);
          }
          uint64_t v44 = *(void *)(*((void *)&v61 + 1) + 8 * (void)k);
          uint64_t v45 = +[CTMessageCenter sharedMessageCenter];
          id v46 = [v45 send:v44];

          if (v46)
          {
            if (IMOSLoggingEnabled())
            {
              long long v49 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
              {
                unsigned int v50 = [v39 count];
                *(_DWORD *)int buf = 67110146;
                *(_DWORD *)id v71 = v55 + k + 1;
                *(_WORD *)&v71[4] = 1024;
                *(_DWORD *)&v71[6] = v50;
                *(_WORD *)id v72 = 2112;
                *(void *)&v72[2] = v44;
                __int16 v73 = 1024;
                int v74 = (int)v46;
                __int16 v75 = 1024;
                int v76 = HIDWORD(v46);
                _os_log_impl(&dword_0, v49, OS_LOG_TYPE_INFO, "**** Failed sending message CT Junk Report Message (%d / %d): (%@) error: %d,%d\n", buf, 0x24u);
              }
            }
          }
          else
          {
            ++v40;
            if (IMOSLoggingEnabled())
            {
              uint64_t v47 = OSLogHandleForIMEventCategory();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
              {
                unsigned int v48 = [v39 count];
                *(_DWORD *)int buf = 67109634;
                *(_DWORD *)id v71 = v55 + k + 1;
                *(_WORD *)&v71[4] = 1024;
                *(_DWORD *)&v71[6] = v48;
                *(_WORD *)id v72 = 2112;
                *(void *)&v72[2] = v44;
                _os_log_impl(&dword_0, v47, OS_LOG_TYPE_INFO, "   => sent CT Junk Report Message (%d / %d): %@", buf, 0x18u);
              }
            }
          }
        }
        id v41 = [v39 countByEnumeratingWithState:&v61 objects:v77 count:16];
        v55 += (int)k;
      }
      while (v41);
    }

    BOOL v51 = v40 == [v39 count];
    long long v52 = +[IMMetricsCollector sharedInstance];
    char v37 = v52;
    if (v51) {
      [v52 trackEvent:IMMetricsCollectorEventCarrierReportJunkCompletionStatus withDictionary:&off_90F00];
    }
    else {
      [v52 trackEvent:IMMetricsCollectorEventCarrierReportJunkCompletionStatus withDictionary:&off_90F28];
    }
  }
}

void sub_3A9E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v41 = objc_alloc_init((Class)NSDate);
  uint64_t v43 = a1;
  id v4 = *(void **)(a1 + 32);
  a1 += 32;
  int v5 = *(unsigned __int8 *)(a1 + 32);
  uint64_t v6 = [v4 lastAddressedLocalHandle];
  uint64_t v7 = [*(id *)a1 lastAddressedSIMID];
  unsigned int v42 = +[IMCTSMSUtilities IMMMSGroupTextOnlyMessagesSendAsMMSForPhoneNumber:v6 simID:v7];

  long long v58 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v55 = 0u;
  id v8 = v3;
  char v9 = 0;
  id v10 = [v8 countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v56;
    uint64_t v12 = IMDMessageStoreHandleCanonicalIDKey;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v56 != v11) {
          objc_enumerationMutation(v8);
        }
        char v14 = [*(id *)(*((void *)&v55 + 1) + 8 * i) objectForKey:v12];
        char IsEmail = IMStringIsEmail();

        v9 |= IsEmail;
      }
      id v10 = [v8 countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v10);
  }

  uint64_t v16 = [*(id *)(v43 + 40) subject];
  if (([v16 length] != 0) | v9 & 1)
  {
    BOOL v17 = 1;
  }
  else
  {
    unsigned int v18 = [*(id *)(v43 + 40) fileTransferGUIDs];
    BOOL v17 = [v18 count] != 0;
  }
  if (((v5 != 45) & v42) == 1)
  {
    if (IMOSLoggingEnabled())
    {
      id v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        CFStringRef v60 = @"YES";
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "shouldSendMMS due to isGroupChat and isGroupMessagingEnabled %@", buf, 0xCu);
      }
    }
    BOOL v17 = 1;
  }
  else if (!(v42 | v17))
  {
    goto LABEL_24;
  }
  id v20 = *(void **)(v43 + 48);
  id v21 = [*(id *)(v43 + 32) lastAddressedLocalHandle];
  uint64_t v22 = [*(id *)(v43 + 32) lastAddressedSIMID];
  LOBYTE(v20) = [v20 _checkMMSEnablementForPhoneNumber:v21 simID:v22];

  if (v20)
  {
    int v23 = 0;
    goto LABEL_25;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412546;
      CFStringRef v60 = @"YES";
      __int16 v61 = 2112;
      CFStringRef v62 = @"NO";
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "Overriding shouldBroadcastMessage to be %@ and shouldSendMMS %@ based on _checkMMSEnablement", buf, 0x16u);
    }
  }
LABEL_24:
  BOOL v17 = 0;
  int v23 = 1;
LABEL_25:
  if (IMOSLoggingEnabled())
  {
    id v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      CFStringRef v26 = @"NO";
      if (v42) {
        CFStringRef v26 = @"YES";
      }
      *(_DWORD *)int buf = 138412290;
      CFStringRef v60 = v26;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "    Group Messaging Enabled: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      CFStringRef v28 = @"NO";
      if (v17) {
        CFStringRef v28 = @"YES";
      }
      *(_DWORD *)int buf = 138412290;
      CFStringRef v60 = v28;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "            Should Send MMS: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    char v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      CFStringRef v30 = @"NO";
      if (v23) {
        CFStringRef v30 = @"YES";
      }
      *(_DWORD *)int buf = 138412290;
      CFStringRef v60 = v30;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "   Should Broadcast Message: %@", buf, 0xCu);
    }
  }
  BOOL v31 = v5 != 45;
  uint64_t v32 = *(void *)(v43 + 40);
  CFStringRef v33 = *(void **)(*(void *)(v43 + 48) + 248);
  uint64_t v34 = [*(id *)(v43 + 32) lastAddressedLocalHandle];
  id v35 = [*(id *)(v43 + 32) lastAddressedSIMID];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_3B078;
  v44[3] = &unk_8DC40;
  id v45 = v8;
  char v50 = v23;
  BOOL v51 = v17;
  int8x16_t v40 = *(int8x16_t *)(v43 + 40);
  id v36 = (id)v40.i64[0];
  int8x16_t v46 = vextq_s8(v40, v40, 8uLL);
  BOOL v52 = v31;
  char v53 = v42;
  id v47 = *(id *)(v43 + 32);
  id v37 = *(id *)(v43 + 56);
  char v54 = *(unsigned char *)(v43 + 64);
  id v48 = v37;
  id v49 = v41;
  id v38 = v41;
  id v39 = v8;
  [v33 processAttachmentsForMessage:v32 generateTextParts:v17 lastAddressedHandle:v34 lastAddressedSIMID:v35 completionBlock:v44];
}

void sub_3B078(uint64_t a1, void *a2, int a3, void *a4)
{
  id v6 = a2;
  id v123 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      MarcoLoggingStringForMessageData();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)int buf = 138412290;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "processAttachmentsForMessage Parts: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    char v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)int buf = 138412290;
      *(void *)&uint8_t buf[4] = v10;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Participants: %@", buf, 0xCu);
    }
  }
  id v11 = objc_msgSend(*(id *)(a1 + 40), "newTelephonyMessagesForHandles:shouldBroadcastMessage:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 80), v123);
  uint64_t v12 = a1;
  if (!*(unsigned char *)(a1 + 81))
  {
    [*(id *)(a1 + 40) addMessagePlainTextToTelephonyMessages:v11 messageItem:*(void *)(a1 + 48) processedMessageItem:v6];
    uint64_t v12 = a1;
  }
  [*(id *)(v12 + 40) setSubjectForTelephonyMessages:v11 messageItem:*(void *)(v12 + 48)];
  if (IMOSLoggingEnabled())
  {
    CFStringRef v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      CFStringRef v14 = @"NO";
      if (a3) {
        CFStringRef v14 = @"YES";
      }
      *(_DWORD *)int buf = 138412290;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "    Parts all process: %@", buf, 0xCu);
    }
  }
  uint64_t v15 = a1;
  char v125 = a3 ^ 1;
  if (((a3 ^ 1) & 1) == 0)
  {
    if (*(unsigned char *)(a1 + 82)) {
      BOOL v16 = *(unsigned char *)(a1 + 83) != 0;
    }
    else {
      BOOL v16 = 0;
    }
    BOOL v17 = *(void **)(a1 + 40);
    unsigned int v18 = [*(id *)(a1 + 56) lastAddressedLocalHandle];
    id v19 = [*(id *)(a1 + 56) lastAddressedSIMID];
    [v17 processPartsOfTelephonyMessages:v11 parts:v124 messageItem:v6 isGroupChat:v16 phoneNumber:v18 simID:v19];

    uint64_t v15 = a1;
  }
  [*(id *)(v15 + 40) buildTelephonyPhoneNumbersForTelephonyMessages:v11 shouldBroadcastMessage:*(unsigned __int8 *)(v15 + 80) handles:*(void *)(v15 + 32)];
  long long v167 = 0u;
  long long v168 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  id obj = v11;
  id v128 = [obj countByEnumeratingWithState:&v165 objects:v177 count:16];
  if (v128)
  {
    uint64_t v127 = *(void *)v166;
    char v129 = 1;
    do
    {
      id v20 = 0;
      do
      {
        if (*(void *)v166 != v127) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v165 + 1) + 8 * (void)v20);
        [v21 setServiceCenter:0];
        uint64_t v22 = *(void **)(a1 + 40);
        if (v129)
        {
          int v23 = [*(id *)(a1 + 48) guid];
          v159[0] = _NSConcreteStackBlock;
          v159[1] = 3221225472;
          v159[2] = sub_3C8C4;
          v159[3] = &unk_8DBF0;
          v159[4] = *(void *)(a1 + 40);
          id v160 = *(id *)(a1 + 48);
          id v161 = *(id *)(a1 + 64);
          char v163 = *(unsigned char *)(a1 + 84);
          id v162 = *(id *)(a1 + 72);
          char v164 = *(unsigned char *)(a1 + 82);
          v152[0] = _NSConcreteStackBlock;
          v152[1] = 3221225472;
          v152[2] = sub_3CB04;
          v152[3] = &unk_8DC18;
          id v24 = *(id *)(a1 + 48);
          uint64_t v25 = *(void *)(a1 + 40);
          id v153 = v24;
          uint64_t v154 = v25;
          id v155 = *(id *)(a1 + 64);
          char v157 = *(unsigned char *)(a1 + 84);
          id v156 = *(id *)(a1 + 72);
          char v158 = *(unsigned char *)(a1 + 82);
          CFStringRef v26 = v152;
          id v27 = v159;
        }
        else
        {
          int v23 = +[NSString stringGUID];
          id v27 = 0;
          CFStringRef v26 = 0;
        }
        objc_msgSend(v21, "setMessageId:", objc_msgSend(v22, "_generateMessageIDForMessageGUID:completionBlock:failureBlock:", v23, v27, v26));

        [*(id *)(a1 + 40) setMessageTypeForTelephonyMessage:v21 shouldSendMMS:*(unsigned __int8 *)(a1 + 81)];
        id v132 = [*(id *)(a1 + 56) lastAddressedLocalHandle];
        id v130 = [*(id *)(a1 + 56) lastAddressedSIMID];
        if (IMOSLoggingEnabled())
        {
          CFStringRef v28 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            id v29 = [*(id *)(a1 + 56) guid];
            *(_DWORD *)int buf = 138412802;
            *(void *)&uint8_t buf[4] = v29;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v132;
            *(_WORD *)&buf[22] = 2112;
            v179 = v130;
            _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "Not first chat (%@): lastAddressedLocalHandle %@ lastAddressedSIMID %@", buf, 0x20u);
          }
        }
        CFStringRef v30 = +[IMCTSubscriptionUtilities sharedInstance];
        BOOL v31 = [v30 ctSubscriptionInfo];

        uint64_t v32 = [v31 subscriptions];
        BOOL v33 = [v32 count] == (char *)&dword_0 + 1;

        if (v33)
        {
          uint64_t v34 = [v31 subscriptions];
          id v35 = [v34 firstObject];

          if (v35) {
            goto LABEL_50;
          }
        }
        else
        {
          id v35 = objc_msgSend(v31, "__im_subscriptionContextForForSimID:phoneNumber:", v130, v132);
          if (v35) {
            goto LABEL_50;
          }
        }
        if (IMOSLoggingEnabled())
        {
          id v36 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            id v37 = [*(id *)(a1 + 56) guid];
            *(_DWORD *)int buf = 138412802;
            *(void *)&uint8_t buf[4] = v132;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v130;
            *(_WORD *)&buf[22] = 2112;
            v179 = v37;
            _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, "Could not find a subscription context to send with based on lastAddressedHandle %@ lastAddressedSIMID %@ so finding context preferred subscription for chat %@", buf, 0x20u);
          }
        }
        id v38 = objc_opt_new();
        long long v150 = 0u;
        long long v151 = 0u;
        long long v148 = 0u;
        long long v149 = 0u;
        id v39 = [*(id *)(a1 + 56) participants];
        id v40 = [v39 countByEnumeratingWithState:&v148 objects:v176 count:16];
        if (v40)
        {
          uint64_t v41 = *(void *)v149;
          do
          {
            for (i = 0; i != v40; i = (char *)i + 1)
            {
              if (*(void *)v149 != v41) {
                objc_enumerationMutation(v39);
              }
              uint64_t v43 = [*(id *)(*((void *)&v148 + 1) + 8 * i) ID];
              [v38 addObject:v43];
            }
            id v40 = [v39 countByEnumeratingWithState:&v148 objects:v176 count:16];
          }
          while (v40);
        }

        id v35 = objc_msgSend(v31, "__im_contactPreferredSubscriptionContextForChatHandleIDs:", v38);

        if (!v35)
        {
          if (IMOSLoggingEnabled())
          {
            char v54 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)int buf = 0;
              _os_log_impl(&dword_0, v54, OS_LOG_TYPE_INFO, "Could not find a subscription context to send with based on contact preferred subscription in context so failing message", buf, 2u);
            }
          }
          id v35 = 0;
          char v125 = 1;
          goto LABEL_59;
        }
LABEL_50:
        [v21 setContext:v35];
        if (IMOSLoggingEnabled())
        {
          uint64_t v44 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            id v45 = [v6 guid];
            *(_DWORD *)int buf = 138412546;
            *(void *)&uint8_t buf[4] = v45;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v35;
            _os_log_impl(&dword_0, v44, OS_LOG_TYPE_INFO, "Setting the context for message guid = %@, context %@ and updating lastAddressed if needed", buf, 0x16u);
          }
        }
        int8x16_t v46 = [v35 phoneNumber];
        if ((_FTAreIDsEquivalent() & 1) == 0)
        {

LABEL_58:
          id v49 = *(void **)(a1 + 40);
          uint64_t v50 = *(void *)(a1 + 64);
          uint64_t v51 = *(unsigned __int8 *)(a1 + 84);
          BOOL v52 = [v35 phoneNumber];
          char v53 = [v35 labelID];
          [v49 _updateLastAddressedIDsIfNeededForChatWithIdentifier:v50 style:v51 lastAddressedHandle:v52 lastAddressedSIMID:v53];

          goto LABEL_59;
        }
        id v47 = [v35 labelID];
        unsigned __int8 v48 = [v130 isEqualToString:v47];

        if ((v48 & 1) == 0) {
          goto LABEL_58;
        }
LABEL_59:

        if (v129)
        {
        }
        char v129 = 0;
        id v20 = (char *)v20 + 1;
      }
      while (v20 != v128);
      id v55 = [obj countByEnumeratingWithState:&v165 objects:v177 count:16];
      id v128 = v55;
      char v129 = 0;
    }
    while (v55);
  }

  int v56 = IMOSLoggingEnabled();
  if (v125)
  {
    if (v56)
    {
      long long v57 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        *(void *)&uint8_t buf[4] = obj;
        _os_log_impl(&dword_0, v57, OS_LOG_TYPE_INFO, "   *** Parts failed, failing message(s): %@", buf, 0xCu);
      }
    }
    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    id v58 = obj;
    id v59 = [v58 countByEnumeratingWithState:&v135 objects:v173 count:16];
    if (v59)
    {
      uint64_t v60 = *(void *)v136;
      do
      {
        for (j = 0; j != v59; j = (char *)j + 1)
        {
          if (*(void *)v136 != v60) {
            objc_enumerationMutation(v58);
          }
          uint64_t v62 = *(void *)(*((void *)&v135 + 1) + 8 * (void)j);
          if (IMOSLoggingEnabled())
          {
            long long v63 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)int buf = 138412290;
              *(void *)&uint8_t buf[4] = v62;
              _os_log_impl(&dword_0, v63, OS_LOG_TYPE_INFO, "part error sending message %@", buf, 0xCu);
            }
          }
          if (IMOSLoggingEnabled())
          {
            long long v64 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)int buf = 138412290;
              *(void *)&uint8_t buf[4] = v62;
              _os_log_impl(&dword_0, v64, OS_LOG_TYPE_INFO, "   => failed CT Message: %@  (some parts failed)", buf, 0xCu);
            }
          }
          long long v65 = *(void **)(a1 + 40);
          long long v66 = [*(id *)(a1 + 48) guid];
          long long v67 = [v65 _failureBlockForMessageGUID:v66];

          if (v67) {
            v67[2](v67, 25, 0);
          }
          long long v68 = *(void **)(a1 + 40);
          id v69 = [*(id *)(a1 + 48) guid];
          [v68 _clearMapForMessageGUID:v69];
        }
        id v59 = [v58 countByEnumeratingWithState:&v135 objects:v173 count:16];
      }
      while (v59);
    }
    goto LABEL_181;
  }
  if (v56)
  {
    BOOL v70 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412290;
      *(void *)&uint8_t buf[4] = obj;
      _os_log_impl(&dword_0, v70, OS_LOG_TYPE_INFO, "   No parts failed, sending message(s): %@", buf, 0xCu);
    }
  }
  long long v146 = 0u;
  long long v147 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  id v131 = obj;
  id v71 = [v131 countByEnumeratingWithState:&v144 objects:v175 count:16];
  if (v71)
  {
    uint64_t v133 = *(void *)v145;
    do
    {
      for (k = 0; k != v71; k = (char *)k + 1)
      {
        if (*(void *)v145 != v133) {
          objc_enumerationMutation(v131);
        }
        __int16 v73 = *(void **)(*((void *)&v144 + 1) + 8 * (void)k);
        id v74 = [v6 useStandalone];
        if (v74)
        {
          if (!IMOSLoggingEnabled()) {
            goto LABEL_112;
          }
          __int16 v75 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
          {
            id v76 = [v6 guid];
            *(_DWORD *)int buf = 138412290;
            *(void *)&uint8_t buf[4] = v76;
            _os_log_impl(&dword_0, v75, OS_LOG_TYPE_INFO, "   => Message should use standalone. SettingCTMessage's BypassSupportedMessageModesCheck for message: %@", buf, 0xCu);
          }
          goto LABEL_111;
        }
        if (IMSharedHelperDeviceHasMultipleSubscriptions())
        {
          id v77 = [v73 context];
          BOOL v78 = v77 == 0;

          if (v78)
          {
            if (IMOSLoggingEnabled())
            {
              __int16 v75 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
              {
                id v79 = [v6 guid];
                *(_DWORD *)int buf = 138412290;
                *(void *)&uint8_t buf[4] = v79;
                _os_log_impl(&dword_0, v75, OS_LOG_TYPE_INFO, "This message [%@] is not an SOS message but has nil context ******* FILE RADAR ******", buf, 0xCu);
              }
LABEL_111:
            }
          }
        }
LABEL_112:
        [v73 setBypassSupportedMessageModesCheck:v74];
        id v80 = +[IDSCTAdapter sharedInstance];
        char v81 = [*(id *)(a1 + 48) handle];
        unsigned int v82 = [v80 isPhoneNumberEmergencyNumber:v81];

        if (v82)
        {
          unsigned __int8 v83 = +[IMFeatureFlags sharedFeatureFlags];
          unsigned int v84 = [v83 stewieEnabled];

          if (v84 && ([*(id *)(a1 + 56) isEmergencyChat] & 1) == 0)
          {
            if (IMOSLoggingEnabled())
            {
              long long v85 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)int buf = 0;
                _os_log_impl(&dword_0, v85, OS_LOG_TYPE_INFO, "Sending: Chat has been marked as an emergency chat", buf, 2u);
              }
            }
            [*(id *)(a1 + 56) updateIsEmergencyChat:1];
          }
          if (IMOSLoggingEnabled())
          {
            long long v86 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
            {
              id v87 = [*(id *)(a1 + 48) handle];
              *(_DWORD *)int buf = 138412290;
              *(void *)&uint8_t buf[4] = v87;
              _os_log_impl(&dword_0, v86, OS_LOG_TYPE_INFO, "Sending SMS to emergency number: %@, need to disable ScreenTime restrictions", buf, 0xCu);
            }
          }
        }
        if (IMOSLoggingEnabled())
        {
          long long v88 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
          {
            if (v74) {
              CFStringRef v89 = @"YES";
            }
            else {
              CFStringRef v89 = @"NO";
            }
            *(_DWORD *)int buf = 138412546;
            *(void *)&uint8_t buf[4] = v89;
            if (v82) {
              CFStringRef v90 = @"YES";
            }
            else {
              CFStringRef v90 = @"NO";
            }
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v90;
            _os_log_impl(&dword_0, v88, OS_LOG_TYPE_INFO, "should use standalone %@ or to an Emergency number %@", buf, 0x16u);
          }
        }
        if ((v74 | v82) == 1)
        {
          if (IMOSLoggingEnabled())
          {
            CFStringRef v91 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)int buf = 0;
              _os_log_impl(&dword_0, v91, OS_LOG_TYPE_INFO, "Disabling ScreenTime restrictions as sending message to an Emergency number", buf, 2u);
            }
          }
          uint64_t v169 = 0;
          v170 = &v169;
          uint64_t v171 = 0x2050000000;
          __int16 v92 = (void *)qword_99C60;
          uint64_t v172 = qword_99C60;
          if (!qword_99C60)
          {
            *(void *)int buf = _NSConcreteStackBlock;
            *(void *)&buf[8] = 3221225472;
            *(void *)&uint8_t buf[16] = sub_54CA8;
            v179 = &unk_8D278;
            v180 = &v169;
            sub_54CA8((uint64_t)buf);
            __int16 v92 = (void *)v170[3];
          }
          id v93 = v92;
          _Block_object_dispose(&v169, 8);
          __int16 v94 = [v93 sharedMonitor];
          id v143 = 0;
          unsigned int v95 = [v94 enableEmergencyModeWithError:&v143];
          id v96 = v143;
          if (v96) {
            char v97 = 0;
          }
          else {
            char v97 = v95;
          }
          if ((v97 & 1) == 0 && IMOSLoggingEnabled())
          {
            long long v98 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)int buf = 138412546;
              CFStringRef v99 = @"NO";
              if (v95) {
                CFStringRef v99 = @"YES";
              }
              *(void *)&uint8_t buf[4] = v99;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v96;
              _os_log_impl(&dword_0, v98, OS_LOG_TYPE_INFO, "Enabling Emergency Mode reported %@ when sending message to an Emergency number with error: %@", buf, 0x16u);
            }
          }
        }
        uint64_t v100 = +[CTMessageCenter sharedMessageCenter];
        id v101 = [v100 send:v73];

        if (v101)
        {
          uint64_t v103 = *(void **)(a1 + 40);
          int v104 = [*(id *)(a1 + 48) guid];
          char v105 = [v103 _failureBlockForMessageGUID:v104];

          if (v105) {
            ((void (**)(void, void, id))v105)[2](v105, 0, v101);
          }
          uint64_t v106 = *(void **)(a1 + 40);
          uint64_t v107 = [*(id *)(a1 + 48) guid];
          [v106 _clearMapForMessageGUID:v107];

          if (IMOSLoggingEnabled())
          {
            v108 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)int buf = 138412802;
              *(void *)&uint8_t buf[4] = v73;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v101;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = HIDWORD(v101);
              _os_log_impl(&dword_0, v108, OS_LOG_TYPE_INFO, "**** Failed sending message (%@) error: %d,%d\n", buf, 0x18u);
            }
          }
        }
        else if (IMOSLoggingEnabled())
        {
          v102 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)int buf = 138412290;
            *(void *)&uint8_t buf[4] = v73;
            _os_log_impl(&dword_0, v102, OS_LOG_TYPE_INFO, "   => sent CT Message: %@", buf, 0xCu);
          }
        }
        v109 = [*(id *)(a1 + 48) notificationIDSTokenURI];
        v110 = v109;
        if (!v101)
        {
          if ([v109 length])
          {
            if (IMOSLoggingEnabled())
            {
              __int16 v111 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
              {
                uint64_t v112 = *(void *)(a1 + 64);
                *(_DWORD *)int buf = 138412546;
                *(void *)&uint8_t buf[4] = v110;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v112;
                _os_log_impl(&dword_0, v111, OS_LOG_TYPE_INFO, "Successfully sent message, setting message item notificationIDSTokenURI %@ for chatIdentifier %@", buf, 0x16u);
              }
            }
            uint64_t v113 = +[IMMessageNotificationTimeManager sharedInstance];
            [v113 setLatestNotificationIDSTokenURI:v110];

            v114 = +[IMMessageNotificationTimeManager sharedInstance];
            __int16 v115 = +[NSDate date];
            [v114 setDate:v115 forChatIdentifier:*(void *)(a1 + 64)];
          }
          else
          {
            uint64_t v116 = +[IMMessageNotificationTimeManager sharedInstance];
            [v116 tearDownSessionForChatIdentifier:*(void *)(a1 + 64)];

            long long v141 = 0u;
            long long v142 = 0u;
            long long v139 = 0u;
            long long v140 = 0u;
            __int16 v117 = +[IMDChatRegistry sharedInstance];
            v114 = [v117 allExistingSupportedServiceChatsWithIdentifier:*(void *)(a1 + 64) style:*(unsigned __int8 *)(a1 + 84)];

            id v118 = [v114 countByEnumeratingWithState:&v139 objects:v174 count:16];
            if (v118)
            {
              uint64_t v119 = *(void *)v140;
              do
              {
                for (m = 0; m != v118; m = (char *)m + 1)
                {
                  if (*(void *)v140 != v119) {
                    objc_enumerationMutation(v114);
                  }
                  v121 = *(void **)(*((void *)&v139 + 1) + 8 * (void)m);
                  unsigned int v122 = [v6 guid];
                  [v121 updateLastSeenMessageGuidIfNeeded:v122];
                }
                id v118 = [v114 countByEnumeratingWithState:&v139 objects:v174 count:16];
              }
              while (v118);
            }
          }
        }
      }
      id v71 = [v131 countByEnumeratingWithState:&v144 objects:v175 count:16];
    }
    while (v71);
  }
LABEL_181:
}

void sub_3C8C4(uint64_t a1)
{
  [*(id *)(a1 + 32) didSendMessage:*(void *)(a1 + 40) forChat:*(void *)(a1 + 48) style:*(unsigned __int8 *)(a1 + 64)];
  id v2 = [*(id *)(a1 + 40) handle];
  uint64_t IsEmail = IMStringIsEmail();

  id v4 = +[NSDate date];
  [v4 timeIntervalSinceDate:*(void *)(a1 + 56)];
  double v6 = v5;

  uint64_t v7 = [*(id *)(a1 + 40) fileTransferGUIDs];
  BOOL v8 = [v7 count] != 0;

  char v9 = +[NSNumber numberWithDouble:v6];
  v17[0] = IMMetricsCollectorFzErrorKey;
  uint64_t v10 = +[NSNumber numberWithLong:0];
  v18[0] = v10;
  v17[1] = IMMetricsCollectorIsGroupMessageKey;
  id v11 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 65)];
  v18[1] = v11;
  v17[2] = IMMetricsCollectorIsToPhoneNumberKey;
  uint64_t v12 = +[NSNumber numberWithBool:IsEmail ^ 1];
  v18[2] = v12;
  v17[3] = IMMetricsCollectorIsToEmailKey;
  CFStringRef v13 = +[NSNumber numberWithInt:IsEmail];
  v18[3] = v13;
  v17[4] = IMMetricsCollectorHasAttachmentsKey;
  CFStringRef v14 = +[NSNumber numberWithBool:v8];
  v17[5] = IMMetricsCollectorSendDurationKey;
  v18[4] = v14;
  void v18[5] = v9;
  uint64_t v15 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:6];

  BOOL v16 = +[IMMetricsCollector sharedInstance];
  [v16 trackEvent:IMMetricsCollectorEventSMSSentMessageSingleComponent withDictionary:v15];
}

void sub_3CB04(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v5 = HIDWORD(a3);
  [*(id *)(a1 + 32) setErrorCode:4];
  [*(id *)(a1 + 40) didSendMessage:*(void *)(a1 + 32) forChat:*(void *)(a1 + 48) style:*(unsigned __int8 *)(a1 + 64)];
  double v6 = [*(id *)(a1 + 32) handle];
  uint64_t IsEmail = IMStringIsEmail();

  BOOL v8 = +[NSDate date];
  [v8 timeIntervalSinceDate:*(void *)(a1 + 56)];
  double v10 = v9;

  id v11 = [*(id *)(a1 + 32) fileTransferGUIDs];
  BOOL v12 = [v11 count] != 0;

  CFStringRef v13 = +[NSNumber numberWithDouble:v10];
  v22[0] = IMMetricsCollectorFzErrorKey;
  CFStringRef v14 = +[NSNumber numberWithInt:a2];
  v23[0] = v14;
  v22[1] = IMMetricsCollectorCtErrorKey;
  uint64_t v15 = +[NSNumber numberWithInt:v5];
  v23[1] = v15;
  v22[2] = IMMetricsCollectorIsGroupMessageKey;
  BOOL v16 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 65)];
  v23[2] = v16;
  v22[3] = IMMetricsCollectorIsToPhoneNumberKey;
  BOOL v17 = +[NSNumber numberWithBool:IsEmail ^ 1];
  v23[3] = v17;
  void v22[4] = IMMetricsCollectorIsToEmailKey;
  unsigned int v18 = +[NSNumber numberWithInt:IsEmail];
  v23[4] = v18;
  v22[5] = IMMetricsCollectorHasAttachmentsKey;
  id v19 = +[NSNumber numberWithBool:v12];
  v22[6] = IMMetricsCollectorSendDurationKey;
  v23[5] = v19;
  v23[6] = v13;
  id v20 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:7];

  id v21 = +[IMMetricsCollector sharedInstance];
  [v21 trackEvent:IMMetricsCollectorEventSMSSentMessageSingleComponent withDictionary:v20];
}

void sub_4023C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v34 = 138412290;
      id v35 = v3;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "User Notificaion has been completed with information %@", (uint8_t *)&v34, 0xCu);
    }
  }
  if (![v3 response])
  {
    CFStringRef v13 = [v3 responseInformation];
    CFStringRef v14 = [v13 objectForKey:IMUserNotificationTextFieldValuesKey];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        int v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          LOWORD(v34) = 0;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "The user entered no code... or the code entered was not an NSString", (uint8_t *)&v34, 2u);
        }
      }
      [*(id *)(a1 + 32) sendApprovalResponseToDevice:*(void *)(a1 + 40) enteredCorrectly:0 wasCancelled:0];
      goto LABEL_38;
    }
    id v15 = objc_alloc_init((Class)NSNumberFormatter);
    BOOL v16 = *(void **)(*(void *)(a1 + 32) + 216);
    BOOL v17 = [*(id *)(a1 + 40) uniqueID];
    unsigned int v18 = [v16 _numberForKey:v17];

    id v19 = [v15 numberFromString:v14];
    if (v19 && v18)
    {
      unsigned int v20 = [v18 isEqualToNumber:v19];
      int v21 = IMOSLoggingEnabled();
      if (v20)
      {
        if (v21)
        {
          uint64_t v22 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            LOWORD(v34) = 0;
            _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "The Code Is Correct, Welcome", (uint8_t *)&v34, 2u);
          }
        }
        [*(id *)(a1 + 32) _addDeviceToAllowedSMSRelay:*(void *)(a1 + 40) shouldSendApproval:1];
        goto LABEL_37;
      }
      if (v21)
      {
        uint64_t v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          LOWORD(v34) = 0;
          _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "The Code Is Incorrect, Goodbye", (uint8_t *)&v34, 2u);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      id v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        LOWORD(v34) = 0;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "Unable to create a code number from the user inputed information or we have no pin to compare against, this will fail validation", (uint8_t *)&v34, 2u);
      }
    }
    [*(id *)(a1 + 32) sendApprovalResponseToDevice:*(void *)(a1 + 40) enteredCorrectly:0 wasCancelled:0];
LABEL_37:

LABEL_38:
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.sms.smsRelayDevices.changed", 0, 0, 0);
    id v27 = *(void **)(*(void *)(a1 + 32) + 216);
    CFStringRef v28 = [*(id *)(a1 + 40) uniqueID];
    id v29 = [v27 objectForKey:v28];

    if (v29)
    {
      CFStringRef v30 = *(void **)(*(void *)(a1 + 32) + 216);
      BOOL v31 = [*(id *)(a1 + 40) uniqueID];
      [v30 removeObjectForKey:v31];

      if (![*(id *)(*(void *)(a1 + 32) + 216) count])
      {
        uint64_t v32 = *(void *)(a1 + 32);
        BOOL v33 = *(void **)(v32 + 216);
        *(void *)(v32 + 216) = 0;
      }
    }

    goto LABEL_42;
  }
  if (IMOSLoggingEnabled())
  {
    unint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v34) = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "You Tapped Cancel, Goodbye!!", (uint8_t *)&v34, 2u);
    }
  }
  [*(id *)(a1 + 32) sendApprovalResponseToDevice:*(void *)(a1 + 40) enteredCorrectly:0 wasCancelled:1];
  double v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v6, @"com.apple.sms.smsRelayDevices.changed", 0, 0, 0);
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 216);
  BOOL v8 = [*(id *)(a1 + 40) uniqueID];
  double v9 = [v7 objectForKey:v8];

  if (v9)
  {
    double v10 = *(void **)(*(void *)(a1 + 32) + 216);
    id v11 = [*(id *)(a1 + 40) uniqueID];
    [v10 removeObjectForKey:v11];

    if (![*(id *)(*(void *)(a1 + 32) + 216) count])
    {
      uint64_t v12 = *(void *)(a1 + 32);
      CFStringRef v13 = *(void **)(v12 + 216);
      *(void *)(v12 + 216) = 0;
LABEL_42:
    }
  }
}

void sub_42580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_4259C(id *a1, uint64_t a2, uint64_t a3)
{
  id v10 = [a1[4] mutableCopy];
  double v6 = +[NSNumber numberWithInteger:a2];
  [v10 setObject:v6 forKeyedSubscript:off_997C8];

  uint64_t v7 = +[NSNumber numberWithInteger:a3];
  [v10 setObject:v7 forKeyedSubscript:off_997D0];

  id v8 = [a1[5] _shouldUploadToMMCS:a1[4]];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [WeakRetained relayDictionaryToPeers:v10 requiresUpload:v8];
}

void sub_43A7C(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = (void *)a1[4];
        *(_DWORD *)int buf = 138412546;
        id v24 = v8;
        __int16 v25 = 2112;
        id v26 = v6;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Performed spam extension capabilities query request for: %@ and received error: %@", buf, 0x16u);
      }
    }
    double v9 = 0;
    id v10 = 0;
  }
  else
  {
    id v10 = [v5 transactionalSubActions];
    double v9 = [v5 promotionalSubActions];
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412546;
        id v24 = v10;
        __int16 v25 = 2112;
        id v26 = v9;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Spam extension query response received: %@, %@", buf, 0x16u);
      }
    }
  }
  if (+[NSThread isMainThread])
  {
    +[IMSMSFilterCapabilitiesBinder executeCompletionBlockForFilterParamsUpdate:v10 promo:v9];
    uint64_t v12 = +[IMFeatureFlags sharedFeatureFlags];
    unsigned int v13 = [v12 isSMSFilterSyncEnabled];

    if (v13)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_43D7C;
      block[3] = &unk_8DCE0;
      block[4] = a1[5];
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_43E1C;
    v18[3] = &unk_8D0F8;
    id v19 = v10;
    id v14 = v9;
    uint64_t v15 = a1[5];
    id v20 = v14;
    uint64_t v21 = v15;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);
  }
  uint64_t v16 = *(void *)(a1[6] + 8);
  BOOL v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = 0;
}

id sub_43D7C(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Performed spam extension capabilities query request. Relaying updated sms filter settings", v4, 2u);
    }
  }
  return [*(id *)(a1 + 32) _relaySMSFilteringSettingsForFilterState:1];
}

void sub_43E1C(void *a1)
{
  +[IMSMSFilterCapabilitiesBinder executeCompletionBlockForFilterParamsUpdate:a1[4] promo:a1[5]];
  id v2 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v3 = [v2 isSMSFilterSyncEnabled];

  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_43EDC;
    block[3] = &unk_8DCE0;
    block[4] = a1[6];
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_43EDC(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Performed spam extension capabilities query request. Relaying updated sms filter settings", v4, 2u);
    }
  }
  return [*(id *)(a1 + 32) _relaySMSFilteringSettingsForFilterState:1];
}

id sub_44294(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeSpamCompletionBlockForMessageGuid:*(void *)(a1 + 40) category:0 subCategory:0 shouldRegister:*(unsigned __int8 *)(a1 + 48) receivedViaRelay:*(unsigned __int8 *)(a1 + 49)];
}

void sub_442B0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        *(_DWORD *)int buf = 138412546;
        uint64_t v22 = v8;
        __int16 v23 = 2112;
        id v24 = v6;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Performed spam extension query request for: %@ and received error: %@", buf, 0x16u);
      }
    }
    id v9 = 0;
    id v10 = 0;
  }
  else
  {
    id v10 = [v5 action];
    id v9 = +[IMSMSFilterCapabilitiesBinder localizeSubAction:](IMSMSFilterCapabilitiesBinder, "localizeSubAction:", [v5 subAction]);
    if (v9)
    {
      if (+[IMSMSFilterCapabilitiesBinder isValidSubAction:v10 subAction:v9])
      {
        if (!+[IMSMSFilterHelper isValidActiveFilterAction:v10 subAction:v9])id v9 = 0; {
      }
        }
      else
      {
        id v9 = 0;
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        *(_DWORD *)int buf = 138412802;
        uint64_t v22 = v12;
        __int16 v23 = 2048;
        id v24 = v10;
        __int16 v25 = 2048;
        id v26 = v9;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Performed spam extension query request for: %@ and received response actionResponse: %ld, subActionResponse: %ld", buf, 0x20u);
      }
    }
  }
  if (+[NSThread isMainThread])
  {
    [*(id *)(a1 + 40) _executeSpamCompletionBlockForMessageGuid:*(void *)(a1 + 48) category:v10 subCategory:v9 shouldRegister:*(unsigned __int8 *)(a1 + 64) receivedViaRelay:*(unsigned __int8 *)(a1 + 65)];
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_44574;
    block[3] = &unk_8DD58;
    unsigned int v13 = *(void **)(a1 + 48);
    block[4] = *(void *)(a1 + 40);
    id v17 = v13;
    id v18 = v10;
    id v19 = v9;
    __int16 v20 = *(_WORD *)(a1 + 64);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = 0;
}

id sub_44574(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeSpamCompletionBlockForMessageGuid:*(void *)(a1 + 40) category:*(void *)(a1 + 48) subCategory:*(void *)(a1 + 56) shouldRegister:*(unsigned __int8 *)(a1 + 64) receivedViaRelay:*(unsigned __int8 *)(a1 + 65)];
}

void sub_4495C(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 224)
    && [*(id *)(a1 + 40) isEqualToString:*(void *)(a1 + 48)])
  {
    id v2 = +[IMFeatureFlags sharedFeatureFlags];
    unsigned int v3 = [v2 isSMSFilterSyncEnabled];

    id v4 = *(void **)(a1 + 32);
    if (v3) {
      [v4 _disableSpamFilteringAndRelay];
    }
    else {
      [v4 _disableSpamFiltering];
    }
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Spam filter state changed to None", v6, 2u);
      }
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 224) = 0;
}

id sub_4560C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _relaySMSFilteringSettingsForFilterState:0];
}

void sub_47278(uint64_t a1, void *a2)
{
  id v33 = a2;
  uint64_t v32 = [v33 balloonBundleID];
  BOOL v31 = [v33 payloadData];
  if ([v32 length] && objc_msgSend(v31, "length"))
  {
    if (IMOSLoggingEnabled())
    {
      id v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int buf = 0;
        _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "We have a 3rd party message and need to transcode the payload data", buf, 2u);
      }
    }
    unsigned int v3 = [*(id *)(a1 + 32) fileTransferGUIDs];
    objc_msgSend(v3, "__imArrayByApplyingBlock:", &stru_8DDC0);
    id obj = (id)objc_claimAutoreleasedReturnValue();

    id v4 = +[IMTranscodeController sharedInstance];
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_4799C;
    v55[3] = &unk_8DDE8;
    id v56 = v32;
    id v57 = v33;
    id v58 = *(id *)(a1 + 56);
    [v4 transcodeFallbackFileTransferPayloadData:v31 balloonBundleID:v56 attachments:obj completionBlock:v55];

    id v5 = v56;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int buf = 0;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "We have transfers for this message and this is not a 3rd party message, so let's try and transcode them", buf, 2u);
      }
    }
    id obj = objc_alloc_init((Class)NSMutableArray);
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v7 = [*(id *)(a1 + 32) fileTransferGUIDs];
    id v8 = [v7 countByEnumeratingWithState:&v51 objects:v61 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v52;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v52 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v51 + 1) + 8 * (void)v10);
          uint64_t v12 = +[IMDFileTransferCenter sharedInstance];
          unsigned int v13 = [v12 transferForGUID:v11];

          if ([v13 isAutoloopVideo]) {
            [obj addObject:v13];
          }

          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v7 countByEnumeratingWithState:&v51 objects:v61 count:16];
      }
      while (v8);
    }

    uint64_t v14 = [*(id *)(a1 + 32) fileTransferGUIDs];
    int v15 = [v14 count];

    CFStringRef v30 = [*(id *)(a1 + 40) chatForChatIdentifier:*(void *)(a1 + 48) style:*(unsigned __int8 *)(a1 + 64)];
    uint64_t v16 = [v30 lastAddressedLocalHandle];
    id v17 = [v30 lastAddressedSIMID];
    int v18 = +[IMCTSMSUtilities IMMMSMaximumMessageByteCountForPhoneNumber:v16 simID:v17];

    if ([obj count])
    {
      id v19 = dispatch_group_create();
      id v35 = objc_alloc_init((Class)NSFileCoordinator);
      id v20 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(obj, "count"));
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id obj = obj;
      id v21 = [obj countByEnumeratingWithState:&v47 objects:v60 count:16];
      if (v21)
      {
        int v22 = (int)((double)v18 * 0.92 / (double)v15);
        uint64_t v23 = *(void *)v48;
        do
        {
          id v24 = 0;
          do
          {
            if (*(void *)v48 != v23) {
              objc_enumerationMutation(obj);
            }
            __int16 v25 = *(void **)(*((void *)&v47 + 1) + 8 * (void)v24);
            dispatch_group_enter(v19);
            id v26 = [v25 localURL];
            id v46 = 0;
            v42[0] = _NSConcreteStackBlock;
            v42[1] = 3221225472;
            v42[2] = sub_47C20;
            v42[3] = &unk_8DE38;
            v42[4] = v25;
            int v45 = v22;
            id v43 = v20;
            id v27 = v19;
            uint64_t v44 = v27;
            [v35 coordinateReadingItemAtURL:v26 options:0 error:&v46 byAccessor:v42];
            id v28 = v46;

            if (v28) {
              dispatch_group_leave(v27);
            }

            id v24 = (char *)v24 + 1;
          }
          while (v21 != v24);
          id v21 = [obj countByEnumeratingWithState:&v47 objects:v60 count:16];
        }
        while (v21);
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_47FC8;
      block[3] = &unk_8DE60;
      id v38 = *(id *)(a1 + 32);
      id v39 = v20;
      id v40 = v33;
      id v41 = *(id *)(a1 + 56);
      id v29 = v20;
      dispatch_group_notify(v19, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    id v5 = v30;
  }
}

NSString *__cdecl sub_47918(id a1, NSString *a2)
{
  id v2 = a2;
  unsigned int v3 = +[IMDFileTransferCenter sharedInstance];
  id v4 = [v3 transferForGUID:v2];

  id v5 = [v4 localPath];

  return (NSString *)v5;
}

void sub_4799C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v26 = a3;
  id v6 = +[NSMutableArray array];
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = IMBalloonExtensionIDWithSuffix();
  unsigned int v9 = [v7 isEqualToString:v8];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = v5;
  id v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (v9)
        {
          uint64_t v16 = [v10 lastObject];

          if (v15 == v16) {
            continue;
          }
        }
        id v17 = +[IMDFileTransferCenter sharedInstance];
        int v18 = [v17 createNewOutgoingTransferWithLocalFileURL:v15];

        [v6 addObject:v18];
      }
      id v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v12);
  }

  if ([v6 count])
  {
    id v19 = +[NSAttributedString __im_attributedStringWithFileTransfers:v6];
    id v20 = objc_msgSend(v19, "__im_attributedStringByAssigningMessagePartNumbers");
    id v21 = [v20 mutableCopy];
    [*(id *)(a1 + 40) setBody:v21];
    [*(id *)(a1 + 40) setFileTransferGUIDs:v6];
  }
  if (v26)
  {
    id v22 = [objc_alloc((Class)NSAttributedString) initWithString:v26];
    uint64_t v23 = [*(id *)(a1 + 40) body];
    if (v23)
    {
      id v24 = v23;
      id v25 = [v23 mutableCopy];
      [v25 appendAttributedString:v22];
    }
    else
    {
      id v25 = v22;
    }
    [*(id *)(a1 + 40) setBody:v25];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_47C20(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = +[NSFileManager defaultManager];
    id v5 = objc_msgSend(v4, "im_generateCopyForURL:", v3);

    id v6 = v3;
    if (v5)
    {
      id v6 = v5;
    }
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = +[IMTranscodeController sharedInstance];
  id v8 = [*(id *)(a1 + 32) type];
  unsigned int v9 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  id v21 = v9;
  id v10 = +[NSArray arrayWithObjects:&v21 count:1];
  id v11 = [*(id *)(a1 + 32) transcoderUserInfo];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_47E30;
  v16[3] = &unk_8DE10;
  id v17 = v6;
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  id v18 = v12;
  uint64_t v19 = v13;
  id v20 = *(id *)(a1 + 48);
  id v14 = v6;
  LOBYTE(v15) = 0;
  [v7 transcodeFallbackFileTransferContents:v14 utiType:v8 allowUnfilteredUTIs:&__NSArray0__struct target:1 sizes:v10 commonCapabilities:0 maxDimension:-1 transcoderUserInfo:v11 representations:0 isLQMEnabled:v15 completionBlock:v16];
}

void sub_47E30(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  if (IMOSLoggingEnabled())
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      int v23 = 138412546;
      uint64_t v24 = v19;
      __int16 v25 = 2112;
      id v26 = v14;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "fallback transcoded %@ to %@", (uint8_t *)&v23, 0x16u);
    }
  }
  if ([v14 count])
  {
    id v20 = *(void **)(a1 + 40);
    id v21 = [v14 lastObject];
    id v22 = [*(id *)(a1 + 48) guid];
    [v20 setObject:v21 forKey:v22];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void sub_47FC8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fileTransferGUIDs];
  id v3 = [v2 mutableCopy];
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = objc_alloc_init((Class)NSMutableArray);
  }
  id v6 = v5;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = *(id *)(a1 + 40);
  id v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v12 = +[IMDFileTransferCenter sharedInstance];
        id v13 = [*(id *)(a1 + 40) objectForKey:v11];
        id v14 = [v12 createNewOutgoingTransferWithLocalFileURL:v13];

        id v15 = [v6 indexOfObject:v11];
        if (v15 == (id)0x7FFFFFFFFFFFFFFFLL) {
          [v6 addObject:v14];
        }
        else {
          [v6 replaceObjectAtIndex:v15 withObject:v14];
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  if ([v6 count])
  {
    id v16 = +[NSAttributedString __im_attributedStringWithFileTransfers:v6];
    id v17 = objc_msgSend(v16, "__im_attributedStringByAssigningMessagePartNumbers");
    id v18 = [*(id *)(a1 + 48) copyForBackwardsCompatibility];
    [v18 setFileTransferGUIDs:v6];
    [v18 setBody:v17];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_48858(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412290;
      id v28 = v3;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Processed message, result: %@", buf, 0xCu);
    }
  }
  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = [v3 guid];
    [v5 _addOriginatedMessage:v6];

    [v3 setUseStandalone:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
    id v7 = [*(id *)(a1 + 40) notificationIDSTokenURI];
    LOBYTE(v5) = [v7 length] == 0;

    if ((v5 & 1) == 0)
    {
      id v8 = [*(id *)(a1 + 40) notificationIDSTokenURI];
      [v3 setNotificationIDSTokenURI:v8];
    }
    [v3 setDestinationCallerID:*(void *)(a1 + 48)];
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = [*(id *)(a1 + 40) destinationCallerID];
        uint64_t v11 = *(void *)(a1 + 48);
        *(_DWORD *)int buf = 138412546;
        id v28 = v10;
        __int16 v29 = 2112;
        uint64_t v30 = v11;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "sendMessage destinationCallerID: %@ mycallerID: %@", buf, 0x16u);
      }
    }
    uint64_t v12 = *(void *)(a1 + 80);
    id v13 = +[IMFeatureFlags sharedFeatureFlags];
    unsigned int v14 = [v13 stewieEnabled];

    if (v14 && [*(id *)(a1 + 56) isStewieChat])
    {
      if (IMOSLoggingEnabled())
      {
        id v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int buf = 0;
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "This is an emergency message asked to be sent over Stewie: Sending Message via Stewie", buf, 2u);
        }
      }
      id v16 = +[IMDChorosController sharedController];
      [v16 sendStewieMessage:v3 forChat:*(void *)(a1 + 56)];
    }
    else
    {
      if ((v12 & 1) == 0)
      {
        if ((v12 & 2) != 0)
        {
          [*(id *)(a1 + 32) didSendMessage:v3 forChat:*(void *)(a1 + 64) style:*(unsigned __int8 *)(a1 + 88)];
          id v17 = *(void **)(a1 + 32);
          id v18 = [v3 guid];
          [v17 _setTimeoutTimerForRelayMessageID:v18 timeout:180.0];
        }
        uint64_t v19 = 0;
        goto LABEL_25;
      }
      [*(id *)(a1 + 32) sendCTMessageFromIMMessageItem:v3 forChat:*(void *)(a1 + 64) chat:*(void *)(a1 + 56) style:*(unsigned __int8 *)(a1 + 88)];
    }
    uint64_t v19 = 1;
LABEL_25:
    long long v21 = *(void **)(a1 + 32);
    uint64_t v20 = a1 + 32;
    BYTE2(v25) = (v12 & 4) != 0;
    BYTE1(v25) = *(unsigned char *)(v20 + 58);
    LOBYTE(v25) = (v12 & 8) != 0;
    objc_msgSend(v21, "_finishSendingMessageItem:chatIdentifier:chatStyle:foundChat:didSendSMS:attemptingReplication:shouldForceFail:watchSendsOverCellular:forceReflection:callerID:", v3, *(void *)(v20 + 32), *(unsigned __int8 *)(v20 + 56), *(void *)(v20 + 24), v19, *(unsigned __int8 *)(v20 + 57), v25, *(void *)(v20 + 16));
    uint64_t v22 = *(void *)(v20 + 32);
    uint64_t v23 = *(unsigned __int8 *)(v20 + 56);
    v26.receiver = *(id *)v20;
    v26.super_class = (Class)LegacySMSServiceSession;
    objc_msgSendSuper2(&v26, "sendMessage:toChat:style:", v3, v22, v23);
    goto LABEL_30;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "No message, cannot continue sending!", buf, 2u);
    }
  }
LABEL_30:
}

void sub_495D4(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x4955CLL);
  }
  _Unwind_Resume(a1);
}

void sub_49620(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = [*(id *)(a1 + 32) guid];
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "** Performing delayed replication for %@", (uint8_t *)&v5, 0xCu);
    }
  }
  id v4 = [*(id *)(a1 + 40) replicationProxy];
  [v4 sendMessage:*(void *)(a1 + 32) toChat:*(void *)(a1 + 48) style:*(unsigned __int8 *)(a1 + 56)];
}

void sub_4A06C(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412290;
      id v36 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Message Transcode and Upload complete, Parts: %@", buf, 0xCu);
    }
  }
  if (a3)
  {
    id v7 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    if (*(void *)(a1 + 32))
    {
      id v8 = [*(id *)(a1 + 40) participants];
      id value = objc_msgSend(v8, "__imArrayByApplyingBlock:", &stru_8DED0);

      uint64_t v9 = [*(id *)(a1 + 48) _convertIMMessageItemToDictionary:*(void *)(a1 + 32)];
      if (v9)
      {
        CFDictionarySetValue(v7, off_99950, v9);
        if (value) {
          CFDictionarySetValue(v7, off_997F0, value);
        }
        id v10 = +[NSNumber numberWithInteger:*(void *)(a1 + 64)];
        if (v10) {
          CFDictionarySetValue(v7, off_998B0, v10);
        }

        if (*(unsigned char *)(a1 + 72)) {
          CFDictionarySetValue(v7, off_998D8, &__kCFBooleanTrue);
        }
        if (*(unsigned char *)(a1 + 73)) {
          CFDictionarySetValue(v7, off_998C8, &__kCFBooleanTrue);
        }
        uint64_t v11 = sub_4A76C((int)[*(id *)(a1 + 40) style]);
        if (v11) {
          CFDictionarySetValue(v7, off_998E0, v11);
        }
        uint64_t v12 = JWEncodeDictionary();
        id v13 = [*(id *)(a1 + 32) guid];
        unsigned int v14 = IDSGetUUIDData();
        id v15 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 74)];
        id v16 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, &__kCFBooleanFalse, IDSSendMessageOptionEnforceRemoteTimeoutsKey, v14, IDSSendMessageOptionUUIDKey, &off_90DC8, IDSSendMessageOptionCommandKey, v12, IDSSendMessageOptionDataToEncryptKey, v15, @"_SMSServiceRelayToWatchOnly", 0];

        if (!*(unsigned char *)(a1 + 75)) {
          goto LABEL_50;
        }
        id v17 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
        if (v17) {
          CFDictionarySetValue(v16, IDSSendMessageOptionTimeoutKey, v17);
        }

        if (*(unsigned char *)(a1 + 75))
        {
          id v18 = *(void **)(a1 + 48);
          uint64_t v19 = [*(id *)(a1 + 32) guid];
          [v18 _forwardMessageToPeers:v7 messageType:144 guid:v19 originalSender:0 hasAttachment:1 watchOnly:*(unsigned __int8 *)(a1 + 74)];
        }
        else
        {
LABEL_50:
          if (IMOSLoggingEnabled())
          {
            uint64_t v22 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)int buf = 0;
              _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "Relaying attachment to SMS capable device.", buf, 2u);
            }
          }
          uint64_t v23 = [*(id *)(a1 + 48) localDevice];
          if (!v23 || (unsigned int v24 = [*(id *)(a1 + 48) isProxyRegistered], v23, v24)) {
            [*(id *)(a1 + 48) sendDataToPeers:v16 forcedCallerID:*(void *)(a1 + 56) shouldFilterRecepients:*(unsigned __int8 *)(a1 + 75) requestProxySend:1 dontSendTo:0];
          }
        }
      }
      else if (IMOSLoggingEnabled())
      {
        uint64_t v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          objc_super v26 = *(void **)(a1 + 32);
          *(_DWORD *)int buf = 138412290;
          id v36 = v26;
          _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Failed to create an Message Dictionary from the IM Message, Original Message: %@", buf, 0xCu);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        long long v21 = *(void **)(a1 + 32);
        *(_DWORD *)int buf = 138412290;
        id v36 = v21;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Message Failed To process attachments for peer relay, Original Message: %@", buf, 0xCu);
      }
    }
    goto LABEL_46;
  }
  if (IMOSLoggingEnabled())
  {
    long long v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      id v28 = *(void **)(a1 + 32);
      *(_DWORD *)int buf = 138412290;
      id v36 = v28;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "Failed to process and upload attachments for peer relay: %@", buf, 0xCu);
    }
  }
  if (!*(unsigned char *)(a1 + 75))
  {
    uint64_t v30 = *(void **)(a1 + 48);
    __int16 v29 = (void **)(a1 + 48);
    BOOL v31 = v29 - 2;
    uint64_t v32 = [*(v29 - 2) guid];
    [v30 didReceiveError:4 forMessageID:v32 forceError:1];

    id v33 = *v29;
    id v7 = [*v31 guid];
    [v33 _clearMapForMessageGUID:v7];
LABEL_46:
  }
}

id sub_4A698(id a1, id a2)
{
  id v2 = a2;
  id v3 = [v2 ID];
  id v4 = off_99900;
  id v5 = [v2 unformattedID];
  id v6 = off_99908;
  id v7 = [v2 countryCode];

  id v8 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v3, v4, v5, v6, v7, off_99848, 0);

  return v8;
}

__CFString *sub_4A76C(int a1)
{
  switch(a1)
  {
    case '#':
      id v2 = &off_998F0;
      goto LABEL_7;
    case '-':
      id v2 = &off_998E8;
LABEL_7:
      id v3 = *v2;
      return v3;
    case '+':
      id v2 = &off_998F8;
      goto LABEL_7;
  }
  id v3 = 0;
  return v3;
}

void sub_4A7E4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Message Failed To Transcode and upload, error: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  uint64_t v9 = *(void **)(a1 + 32);
  id v8 = (void **)(a1 + 32);
  id v10 = [v8[1] guid];
  [v9 didReceiveError:4 forMessageID:v10 forceError:1];

  uint64_t v11 = *v8;
  uint64_t v12 = [v8[1] guid];
  [v11 _clearMapForMessageGUID:v12];
}

id sub_4A930(id a1, id a2)
{
  id v2 = a2;
  id v3 = [v2 ID];
  id v4 = off_99900;
  id v5 = [v2 unformattedID];
  id v6 = off_99908;
  id v7 = [v2 countryCode];

  id v8 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v3, v4, v5, v6, v7, off_99848, 0);

  return v8;
}

void sub_4B8CC(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x4B880);
  }
  _Unwind_Resume(a1);
}

id sub_4BB2C(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, " ** FailSendingSMSMessages is enabled, failing send message", buf, 2u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, " ** FailSendingSMSMessages is enabled, failing send message", v5, 2u);
    }
  }
  [*(id *)(a1 + 32) setErrorCode:5];
  return [*(id *)(a1 + 40) didSendMessage:*(void *)(a1 + 32) forChat:*(void *)(a1 + 48) style:*(unsigned __int8 *)(a1 + 56)];
}

void sub_4C6A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v7);
        uint64_t v9 = +[IMDMessageStore sharedInstance];
        id v10 = [v9 messageWithGUID:v8];

        uint64_t v11 = [*(id *)(a1 + 32) broadcasterForChatListeners];
        uint64_t v12 = [v10 accountID];
        [v11 account:v12 chat:0 style:0 chatProperties:0 messageUpdated:v10];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

id sub_4D1A8(id a1, id a2)
{
  id v2 = a2;
  id v3 = [v2 ID];
  id v4 = off_99900;
  id v5 = [v2 unformattedID];
  uint64_t v6 = off_99908;
  id v7 = [v2 countryCode];

  uint64_t v8 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v3, v4, v5, v6, v7, off_99848, 0);

  return v8;
}

void sub_4D678(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Refresh: CT MMS info changed", v6, 2u);
    }
  }
  [v4 updateMMSCapability];
}

void sub_4E29C(id a1)
{
}

id sub_4E2B0(void *a1)
{
  id v1 = a1;
  id v2 = +[NSDate date];
  id v3 = v2;
  if (!v1)
  {
    id v6 = 0;
    id v1 = v2;
    goto LABEL_20;
  }
  id v4 = (char *)[v2 compare:v1];
  if (v4 != (char *)-1)
  {
    if (v4 == (unsigned char *)&dword_0 + 1)
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_19:
        id v6 = v1;
        goto LABEL_20;
      }
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412546;
        id v11 = v1;
        __int16 v12 = 2112;
        long long v13 = v3;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, " * Date descending vs current (%@ vs %@)", (uint8_t *)&v10, 0x16u);
      }
    }
    else
    {
      if (v4 || !IMOSLoggingEnabled()) {
        goto LABEL_19;
      }
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412546;
        id v11 = v1;
        __int16 v12 = 2112;
        long long v13 = v3;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, " * Date is the same as current (%@ vs %@)", (uint8_t *)&v10, 0x16u);
      }
    }

    goto LABEL_19;
  }
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412546;
      id v11 = v1;
      __int16 v12 = 2112;
      long long v13 = v3;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, " * Clamping date %@ to current date (%@)", (uint8_t *)&v10, 0x16u);
    }
  }
  id v6 = v3;

  id v1 = v6;
LABEL_20:
  id v8 = v1;

  return v8;
}

void sub_4EAD0(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x4E968);
  }
  _Unwind_Resume(a1);
}

id *sub_52100(id *result, int a2)
{
  if (a2) {
    return (id *)[result[4] relayDictionaryToPeers:result[5] requiresUpload:*((unsigned __int8 *)result + 48)];
  }
  return result;
}

void sub_534CC(uint64_t a1, char a2, void *a3, char a4)
{
  id v7 = a3;
  char v8 = a2 ^ 1;
  if (*(unsigned char *)(a1 + 40)) {
    char v8 = 1;
  }
  if ((v8 & 1) == 0 && (a4 & 1) == 0)
  {
    [*(id *)(a1 + 32) _executeSMSRelayBlockForMessageWithGUID:v7];
LABEL_16:
    objc_msgSend(*(id *)(a1 + 32), "_clearSMSRelayMapForMessageWithGUID:", v7, v14);
    goto LABEL_17;
  }
  char v9 = v8 | a4 ^ 1;
  int v10 = IMOSLoggingEnabled();
  if (v9)
  {
    if (!v10) {
      goto LABEL_15;
    }
    id v11 = OSLogHandleForIMEventCategory();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    LOWORD(v14) = 0;
    __int16 v12 = "Not relaying to peers as we are message is being replayed.";
    long long v13 = (uint8_t *)&v14;
    goto LABEL_13;
  }
  if (!v10) {
    goto LABEL_15;
  }
  id v11 = OSLogHandleForIMEventCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int buf = 0;
    __int16 v12 = "Not relaying to peers since we're checking for spam";
    long long v13 = buf;
LABEL_13:
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, v12, v13, 2u);
  }
LABEL_14:

LABEL_15:
  if ((a4 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_17:
}

void sub_5386C(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  id v5 = a2;
  [v2 _receivedSMSDictionary:v3 requiresUpload:v4 isBeingReplayed:1];
  v5[2]();
}

uint64_t sub_5397C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_53AE4(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      if (*(unsigned char *)(a1 + 68)) {
        CFStringRef v3 = @"SMS";
      }
      else {
        CFStringRef v3 = @"MMS";
      }
      uint64_t v4 = *(void *)(a1 + 32);
      if (*(unsigned char *)(a1 + 69)) {
        CFStringRef v5 = @"YES";
      }
      else {
        CFStringRef v5 = @"NO";
      }
      id v6 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 64)];
      id v7 = +[NSNumber numberWithInteger:*(void *)(a1 + 48)];
      char v8 = +[NSNumber numberWithInteger:*(void *)(a1 + 56)];
      int v12 = 138413570;
      CFStringRef v13 = v3;
      __int16 v14 = 2112;
      uint64_t v15 = v4;
      __int16 v16 = 2112;
      CFStringRef v17 = v5;
      __int16 v18 = 2112;
      uint64_t v19 = v6;
      __int16 v20 = 2112;
      long long v21 = v7;
      __int16 v22 = 2112;
      uint64_t v23 = v8;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%@ Message sent notification %@: success %@ messageID %@ err1 %@ err2 %@", (uint8_t *)&v12, 0x3Eu);
    }
  }
  char v9 = *(void **)(a1 + 40);
  uint64_t v10 = *(unsigned int *)(a1 + 64);
  if (*(unsigned char *)(a1 + 69)) {
    return [v9 _processMessageSent:v10];
  }
  else {
    return [v9 _processMessageSendFailure:v10];
  }
}

uint64_t sub_53C9C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_53DD8(uint64_t a1)
{
  id v2 = _os_activity_create(&dword_0, "com.apple.messages.SMSReceivedMessage", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  if (IMOSLoggingEnabled())
  {
    CFStringRef v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Message received in block ", buf, 2u);
    }
  }
  id v4 = *(id *)(a1 + 32);
  CFStringRef v5 = +[CTMessageCenter sharedMessageCenter];
  id v6 = [v5 incomingMessageWithId:*(unsigned int *)(a1 + 48)];

  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412290;
      uint64_t v15 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "  => Message: %@", buf, 0xCu);
    }
  }
  if (v6)
  {
    id v10 = v6;
    id v11 = *(id *)(a1 + 40);
    id v12 = v4;
    im_dispatch_after();
  }
  else if (IMOSLoggingEnabled())
  {
    char v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)int buf = 67109120;
      LODWORD(v15) = v9;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Empty message supplied for message id: %d", buf, 8u);
    }
  }
  os_activity_scope_leave(&state);
}

void sub_540CC(uint64_t a1)
{
  id v2 = +[IMMetricsCollector sharedInstance];
  [v2 trackEvent:IMMetricsCollectorEventSMSReceived];

  unsigned __int8 v18 = 0;
  [*(id *)(a1 + 32) setContext:*(void *)(a1 + 40)];
  CFStringRef v3 = [*(id *)(a1 + 48) _convertCTMessageToDictionary:*(void *)(a1 + 32) requiresUpload:&v18];
  id v4 = [v3 objectForKey:LegacySMSCTMessageDictionaryGUIDKey];
  CFStringRef v5 = [v3 objectForKey:LegacySMSCTMessageDictionaryTypeKey];
  if ([v4 length])
  {
    id v6 = +[NSString stringWithFormat:@"%@-%@.smsdata", v5, v4];
    +[IMInternalPayloadUtilities writeMessagePayloadToDisk:v3 fileName:v6];
  }
  [*(id *)(a1 + 48) _receivedSMSDictionary:v3 requiresUpload:v18 isBeingReplayed:0];
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Session received SMS", buf, 2u);
    }
  }
  uint64_t v9 = +[IMUnlockMonitor sharedInstance];
  if ([v9 isUnderFirstDataProtectionLock])
  {
  }
  else
  {
    id v10 = +[IMDReplayController sharedInstance];
    unsigned int v11 = [v10 isRecordingReplayDB];

    if (!v11) {
      goto LABEL_20;
    }
  }
  id v12 = [*(id *)(a1 + 48) _getStorageDictionaryUsingMsgDict:v3 requiresUpload:v18];
  if (IMOSLoggingEnabled())
  {
    CFStringRef v13 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412290;
      id v20 = v3;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Received SMS before first unlock. Will store dictionary %@ to replay.", buf, 0xCu);
    }
  }
  __int16 v14 = +[IMDReplayController sharedInstance];
  id v17 = 0;
  [v14 storeMessage:v12 type:1 error:&v17];
  id v15 = v17;

  if (v15 && IMOSLoggingEnabled())
  {
    __int16 v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412546;
      id v20 = v15;
      __int16 v21 = 2112;
      __int16 v22 = v12;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "MessageReplay: Had error %@ trying to store msg %@ to replay", buf, 0x16u);
    }
  }
LABEL_20:
}

uint64_t sub_54430(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_54C0C(id a1)
{
  qword_9C050 = IMWeakLinkClass();
  qword_9C058 = IMWeakLinkClass();
  qword_9C078 = IMWeakLinkClass();
  qword_9C0D0 = IMWeakLinkClass();
  qword_9C0D8 = IMWeakLinkClass();
}

Class sub_54CA8(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_99C68)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_54DD4;
    v3[4] = &unk_8D2B0;
    v3[5] = v3;
    long long v4 = off_8DFE8;
    uint64_t v5 = 0;
    qword_99C68 = _sl_dlopen();
  }
  if (!qword_99C68) {
    sub_5F2F4(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("DMFEmergencyModeMonitor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_5F374();
  }
  qword_99C60 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_54DD4()
{
  uint64_t result = _sl_dlopen();
  qword_99C68 = result;
  return result;
}

id sub_54E48(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePhoneNumberCallerID];
}

id sub_54E50(uint64_t a1)
{
  id v2 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v3 = [v2 isSMSFilterSyncEnabled];

  long long v4 = *(void **)(a1 + 32);
  if (v3)
  {
    return _[v4 _checkAndUpdateFilterParamsForFilterExtension];
  }
  else
  {
    return [v4 _updateFilterParamsForFilterExtension];
  }
}

id sub_54ED0(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _checkAndUpdateSMSSpamFilterExtensionForUnregisteredOrUpdatedPlugins:*(void *)(a1 + 40) arePluginsRegistered:0];
}

id sub_54EE0(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _checkAndUpdateSMSSpamFilterExtensionForUnregisteredOrUpdatedPlugins:*(void *)(a1 + 40) arePluginsRegistered:1];
}

void sub_55CB4(_Unwind_Exception *exc_buf, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x55AACLL);
  }
  _Block_object_dispose((const void *)(v2 - 176), 8);
  _Block_object_dispose((const void *)(v2 - 248), 8);
  _Unwind_Resume(exc_buf);
}

void sub_55CFC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 248), 8);
  _Unwind_Resume(a1);
}

void sub_55E34(uint64_t a1, uint64_t a2)
{
}

void sub_55E44(uint64_t a1)
{
}

id sub_55E50(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) transferForGUID:a2];
}

void sub_55E5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:");
  id v7 = [v6 string];
  if (IMOSLoggingEnabled())
  {
    char v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412546;
      *(void *)&uint8_t buf[4] = a2;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = MarcoLoggingStringForMessageData();
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Found attribute. Value = [%@], string in range: %@", buf, 0x16u);
    }
  }
  if ([v7 isEqualToString:IMAttachmentCharacterString])
  {
    *(void *)int buf = 0;
    *(void *)&uint8_t buf[8] = 0;
    id v9 = [*(id *)(a1 + 32) attribute:IMFileTransferGUIDAttributeName atIndex:a3 effectiveRange:buf];
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id v28 = 138412290;
        id v29 = v9;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Found GUID for attachment part: %@", v28, 0xCu);
      }
    }
    if ([v9 length])
    {
      id v11 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count];
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v9];
      objc_msgSend(*(id *)(a1 + 40), "addObject:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
      [*(id *)(a1 + 48) addObject:v9];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        if (*(unsigned char *)(a1 + 72)) {
          CFStringRef v13 = @"YES";
        }
        else {
          CFStringRef v13 = @"NO";
        }
        *(_DWORD *)int buf = 138412290;
        *(void *)&uint8_t buf[4] = v13;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Found text part. Generate text parts? %@", buf, 0xCu);
      }
    }
    if (*(unsigned char *)(a1 + 72))
    {
      *(void *)int buf = 0;
      id v14 = objc_msgSend(objc_msgSend(objc_msgSend(v6, "__im_attributedStringByReplacingAdaptiveImageGlyphFileTransfersUsingFileTransferProvider:replacementTextProvider:removedTransferGUIDsOut:", *(void *)(a1 + 56), &stru_8E028, buf), "string"), "dataUsingEncoding:", 4);
      id v15 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      CFDictionarySetValue(v15, @"Type", @"text/plain");
      if (v14) {
        CFDictionarySetValue(v15, @"Data", v14);
      }
      if (@"text") {
        CFDictionarySetValue(v15, @"Tag", @"text");
      }
      __int16 v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"text_%d.txt", [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count]);
      if (v16) {
        CFDictionarySetValue(v15, @"Path", v16);
      }
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v15];

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v17 = *(void **)buf;
      id v18 = [*(id *)buf countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v24;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v24 != v19) {
              objc_enumerationMutation(v17);
            }
            uint64_t v21 = *(void *)(*((void *)&v23 + 1) + 8 * i);
            id v22 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count];
            [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v21];
            objc_msgSend(*(id *)(a1 + 40), "addObject:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v22));
            [*(id *)(a1 + 48) addObject:v21];
          }
          id v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v18);
      }
    }
  }
}

NSString *__cdecl sub_562E4(id a1, IMFileTransfer *a2)
{
  return (NSString *)@"\uFFFD";
}

id sub_562F0(uint64_t a1, void *a2)
{
  id v3 = [a2 guid];
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v3];
  objc_msgSend(*(id *)(a1 + 32), "addObject:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4));
  uint64_t v5 = *(void **)(a1 + 40);

  return [v5 addObject:v3];
}

void sub_56384(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, int a6)
{
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      CFStringRef v12 = @"NO";
      if (a6) {
        CFStringRef v12 = @"YES";
      }
      *(_DWORD *)int buf = 138412290;
      id v64 = (id)v12;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "   Transcode complete  (Succeeded: %@)", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    CFStringRef v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412290;
      id v64 = a5;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "   Error: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412290;
      id v64 = a3;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "   Output URLs: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412290;
      id v64 = a4;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "   Output Contexts: %@", buf, 0xCu);
    }
  }

  if (!a6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 1;
    if (IMOSLoggingEnabled())
    {
      long long v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        id v28 = *(void **)(a1 + 48);
        *(_DWORD *)int buf = 138412546;
        id v64 = v28;
        __int16 v65 = 2112;
        id v66 = a5;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "Failed transcoding file transfer: %@   error: %@", buf, 0x16u);
      }
    }
    goto LABEL_32;
  }
  id v16 = objc_msgSend(objc_msgSend(a3, "__imFirstObject"), "path");
  id v17 = objc_msgSend(a4, "__imFirstObject");
  if (!v16)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 1;
    if (IMOSLoggingEnabled())
    {
      id v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        uint64_t v30 = *(void **)(a1 + 48);
        *(_DWORD *)int buf = 138412290;
        id v64 = v30;
        _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Failed transcoding file transfer: %@   error: <NO OUTPUT PATH FOR ENCODED ITEM>", buf, 0xCu);
      }
    }
LABEL_32:
    [*(id *)(a1 + 56) failTransfer:*(void *)(a1 + 64) error:a5];
    goto LABEL_94;
  }
  id v18 = v17;
  id v19 = objc_msgSend(objc_msgSend(v16, "lastPathComponent"), "stringByDeletingPathExtension");
  if ((unint64_t)[v19 length] < 0xB)
  {
LABEL_40:
    BOOL v25 = 0;
    goto LABEL_41;
  }
  if (IMOSLoggingEnabled())
  {
    id v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412290;
      id v64 = v19;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Renaming file %@ as it is too long", buf, 0xCu);
    }
  }
  id v21 = objc_msgSend(objc_msgSend(objc_msgSend(v16, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", objc_msgSend(v19, "substringToIndex:", 9)), "stringByAppendingPathExtension:", objc_msgSend(v16, "pathExtension"));
  BOOL v22 = [v21 length] == 0;
  int v23 = IMOSLoggingEnabled();
  if (v22)
  {
    if (v23)
    {
      BOOL v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int buf = 0;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "Error generating new file name. Not renaming ", buf, 2u);
      }
    }
    goto LABEL_40;
  }
  if (v23)
  {
    long long v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412546;
      id v64 = v21;
      __int16 v65 = 2112;
      id v66 = v16;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "New path %@ old Path %@", buf, 0x16u);
    }
  }
  uint64_t v62 = 0;
  [+[NSFileManager defaultManager] moveItemAtPath:v16 toPath:v21 error:&v62];
  BOOL v25 = v62 == 0;
  if (v62)
  {
    if (IMOSLoggingEnabled())
    {
      long long v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412802;
        id v64 = v16;
        __int16 v65 = 2112;
        id v66 = v21;
        __int16 v67 = 2112;
        long long v68 = v62;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "Error moving file from path %@ to new path %@ with error %@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v16 = v21;
  }
LABEL_41:
  uint64_t v32 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(objc_msgSend(v18, "objectForKey:", IMTranscodeContextResponseDuration), "doubleValue");
  double v34 = v33;
  id v35 = objc_msgSend(+[IMFileManager defaultHFSFileManager](IMFileManager, "defaultHFSFileManager"), "MIMETypeOfPath:", v16);
  BOOL v36 = UTTypeConformsTo(*(CFStringRef *)(a1 + 40), kUTTypeAudio) == 0;
  int v37 = UTTypeConformsTo(*(CFStringRef *)(a1 + 40), kUTTypeImage);
  int v38 = UTTypeConformsTo(*(CFStringRef *)(a1 + 40), kUTTypeAudiovisualContent);
  if (v36)
  {
    if (!v37)
    {
      if (v38) {
        CFStringRef v40 = @"video";
      }
      else {
        CFStringRef v40 = @"ref";
      }
      goto LABEL_46;
    }
    id v39 = &SMILPieceImageTag;
  }
  else
  {
    id v39 = &SMILPieceAudioTag;
  }
  CFStringRef v40 = *v39;
LABEL_46:
  uint64_t v62 = 0;
  id v41 = objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 48), "localPath"), "lastPathComponent"), "stringByDeletingPathExtension");
  if (v25)
  {
    if (IMOSLoggingEnabled())
    {
      unsigned int v42 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        id v64 = v41;
        _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "updating content location. old content location %@", buf, 0xCu);
      }
    }
    id v41 = objc_msgSend(objc_msgSend(v16, "lastPathComponent"), "stringByDeletingPathExtension");
    if (IMOSLoggingEnabled())
    {
      id v43 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412546;
        id v64 = v16;
        __int16 v65 = 2112;
        id v66 = v41;
        _os_log_impl(&dword_0, v43, OS_LOG_TYPE_INFO, "content location updated to using outPutPath %@ content location %@", buf, 0x16u);
      }
    }
  }
  id v44 = objc_msgSend(objc_msgSend(+[IMFileManager defaultHFSFileManager](IMFileManager, "defaultHFSFileManager"), "attributesOfItemAtPath:error:", v16, &v62), "fileSize");
  int v45 = (__CFString *)[v16 pathExtension];
  if ([(__CFString *)v45 isEqualToString:@"jpeg"]) {
    CFStringRef v46 = @"jpg";
  }
  else {
    CFStringRef v46 = v45;
  }
  id v47 = [v41 stringByAppendingPathExtension:v46];
  if (v35) {
    CFDictionarySetValue(v32, @"Type", v35);
  }
  if (v40) {
    CFDictionarySetValue(v32, @"Tag", v40);
  }
  if (v16) {
    CFDictionarySetValue(v32, @"Filename", v16);
  }
  long long v48 = +[NSNumber numberWithDouble:v34];
  if (v48) {
    CFDictionarySetValue(v32, @"Duration", v48);
  }
  if (v47) {
    CFDictionarySetValue(v32, @"Path", v47);
  }
  if (IMOSLoggingEnabled())
  {
    long long v49 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_0, v49, OS_LOG_TYPE_INFO, "Part:", buf, 2u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v50 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412290;
      id v64 = v16;
      _os_log_impl(&dword_0, v50, OS_LOG_TYPE_INFO, "  =>              Path: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v51 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      long long v52 = *(void **)(a1 + 40);
      *(_DWORD *)int buf = 138412290;
      id v64 = v52;
      _os_log_impl(&dword_0, v51, OS_LOG_TYPE_INFO, "  =>               UTI: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v53 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412290;
      id v64 = (id)v40;
      _os_log_impl(&dword_0, v53, OS_LOG_TYPE_INFO, "  =>               Tag: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v54 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412290;
      id v64 = v47;
      _os_log_impl(&dword_0, v54, OS_LOG_TYPE_INFO, "  =>  Content Location: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v55 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412290;
      id v64 = v35;
      _os_log_impl(&dword_0, v55, OS_LOG_TYPE_INFO, "  =>              MIME: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v56 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 134217984;
      id v64 = v44;
      _os_log_impl(&dword_0, v56, OS_LOG_TYPE_INFO, "  =>         File Size: %llu", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v57 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412290;
      id v64 = v32;
      _os_log_impl(&dword_0, v57, OS_LOG_TYPE_INFO, "    Generated part: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v58 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      uint64_t v59 = *(void *)(a1 + 112);
      *(_DWORD *)int buf = 138412546;
      id v64 = v32;
      __int16 v65 = 1024;
      LODWORD(v66) = v59;
      _os_log_impl(&dword_0, v58, OS_LOG_TYPE_INFO, "  Setting part %@ into parts at index: %d", buf, 0x12u);
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) replaceObjectAtIndex:*(void *)(a1 + 112) withObject:v32];
  objc_msgSend(objc_msgSend(*(id *)(a1 + 56), "transferForGUID:", *(void *)(a1 + 64)), "setMessageGUID:", objc_msgSend(*(id *)(a1 + 72), "guid"));
  [*(id *)(a1 + 56) updateTransfer:*(void *)(a1 + 64) currentBytes:v44 totalBytes:v44];
  objc_msgSend(*(id *)(a1 + 56), "startFinalizingTransfer:", objc_msgSend(*(id *)(a1 + 48), "guid"));

LABEL_94:
  uint64_t v62 = 0;
  if (*(void *)(a1 + 80))
  {
    if (![+[NSFileManager defaultManager] removeItemAtURL:*(void *)(a1 + 80) error:&v62])
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v60 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          __int16 v61 = *(void **)(a1 + 80);
          *(_DWORD *)int buf = 138412546;
          id v64 = v61;
          __int16 v65 = 2112;
          id v66 = v62;
          _os_log_impl(&dword_0, v60, OS_LOG_TYPE_INFO, "Error cleaning up linked path: %@  error: %@", buf, 0x16u);
        }
      }
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 88));
}

void sub_5716C(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = [*(id *)(a1 + 32) fileTransferGUIDs];
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        CFStringRef v4 = @"NO";
      }
      else {
        CFStringRef v4 = @"YES";
      }
      int v6 = 138412546;
      id v7 = v3;
      __int16 v8 = 2112;
      CFStringRef v9 = v4;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "  All done part generation set for: %@   success: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, void, BOOL, void, void))(v5 + 16))(v5, *(void *)(a1 + 32), *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 0, *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), 0);
  }

  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

id sub_57C40(uint64_t a1, NSURL *a2)
{
  uint64_t v2 = a2;
  if (![(NSString *)[(NSURL *)a2 pathExtension] length])
  {
    id v5 = objc_msgSend(+[IMFileManager defaultHFSFileManager](IMFileManager, "defaultHFSFileManager"), "pathExtensionForUTIType:", objc_msgSend(*(id *)(a1 + 32), "type"));
    if (![v5 length]) {
      id v5 = objc_msgSend(+[IMFileManager defaultHFSFileManager](IMFileManager, "defaultHFSFileManager"), "pathExtensionForMIMEType:", objc_msgSend(*(id *)(a1 + 32), "mimeType"));
    }
    if ([v5 length])
    {
      int v6 = [[(NSString *)[(NSURL *)v2 absoluteString] stringByDeletingPathExtension] stringByAppendingPathExtension:v5];
      if ([(NSString *)v6 length]) {
        uint64_t v2 = +[NSURL fileURLWithPath:v6];
      }
    }
  }
  if (v2) {
    CFStringRef v4 = (NSURL *)[+[NSFileManager defaultManager] im_generateCopyForURL:v2];
  }
  else {
    CFStringRef v4 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412546;
      long long v26 = v2;
      __int16 v27 = 2112;
      id v28 = v4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Source URL: %@  Link: %@", buf, 0x16u);
    }
  }
  __int16 v8 = +[LegacySMSRelayTranscodeController sharedInstance];
  if (v4) {
    uint64_t v2 = v4;
  }
  id v9 = [*(id *)(a1 + 32) type];
  id v10 = [*(id *)(a1 + 32) transcoderUserInfo];
  int v11 = *(_DWORD *)(a1 + 112);
  unsigned int v12 = [*(id *)(a1 + 40) shouldSendLowResolutionOnly];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_57ED0;
  v17[3] = &unk_8E190;
  long long v18 = *(_OWORD *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 72);
  uint64_t v19 = *(void *)(a1 + 64);
  id v20 = v4;
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v21 = v13;
  uint64_t v22 = v14;
  long long v15 = *(_OWORD *)(a1 + 96);
  long long v23 = *(_OWORD *)(a1 + 80);
  long long v24 = v15;
  return [(LegacySMSRelayTranscodeController *)v8 transcodeFileTransferContents:v2 utiType:v9 transcoderUserInfo:v10 highQualityMaxByteSize:(unint64_t)((double)v11 * 0.92) lowQualityMaxByteSize:(unint64_t)((double)v11 * 0.92) representations:v12 ^ 1 completionBlock:v17];
}

void sub_57ED0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, int a6, int a7)
{
  id v36 = [*(id *)(a1 + 32) transferForGUID:*(void *)(a1 + 40)];
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      CFStringRef v11 = @"NO";
      if (a7) {
        CFStringRef v11 = @"YES";
      }
      *(_DWORD *)int buf = 138412546;
      id v52 = v36;
      __int16 v53 = 2112;
      CFStringRef v54 = v11;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Transcode processing complete for transfer: %@  (Attempted Transcode: %@)", buf, 0x16u);
    }
  }
  if (a6)
  {
    if (IMOSLoggingEnabled())
    {
      unsigned int v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        id v52 = a3;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Transcoding succeeded with output URLs: %@", buf, 0xCu);
      }
    }
    id v13 = objc_msgSend(objc_msgSend(v36, "localPath"), "lastPathComponent");
    id v14 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "__imFirstObject"), "path"), "lastPathComponent");
    id v15 = [v13 pathExtension];
    id v16 = [v14 pathExtension];
    if (v15)
    {
      id v17 = v16;
      if (v16)
      {
        if (([v15 isEqualToString:v16] & 1) == 0)
        {
          objc_msgSend(v36, "setTransferredFilename:", objc_msgSend(v13, "stringByAppendingPathExtension:", v17));
          if (IMOSLoggingEnabled())
          {
            long long v18 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              id v19 = [v13 stringByAppendingPathExtension:v17];
              *(_DWORD *)int buf = 138412290;
              id v52 = v19;
              _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "          Setting transferred filename: %@", buf, 0xCu);
            }
          }
        }
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        id v52 = a3;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "All URLs: %@", buf, 0xCu);
      }
    }
    uint64_t v21 = dispatch_group_create();
    dispatch_group_enter(v21);
    if ([a3 count])
    {
      unint64_t v22 = 0;
      do
      {
        id v23 = [a3 objectAtIndex:v22];
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24)) {
          break;
        }
        id v24 = v23;
        dispatch_group_enter(v21);
        BOOL v25 = +[IMTransferServicesCompressionController sharedInstance];
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_5853C;
        v38[3] = &unk_8E140;
        v38[4] = v36;
        int8x16_t v39 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
        CFStringRef v40 = a5;
        uint64_t v27 = *(void *)(a1 + 80);
        uint64_t v26 = *(void *)(a1 + 88);
        int v45 = v21;
        uint64_t v46 = v26;
        unint64_t v48 = v22;
        long long v41 = *(_OWORD *)(a1 + 64);
        int8x16_t v47 = vextq_s8(*(int8x16_t *)(a1 + 96), *(int8x16_t *)(a1 + 96), 8uLL);
        char v49 = a7;
        uint64_t v42 = v27;
        id v43 = v24;
        uint64_t v44 = *(void *)(a1 + 56);
        [(IMTransferServicesCompressionController *)v25 compressFileTransfer:v24 completionBlock:v38];
        ++v22;
      }
      while (v22 < (unint64_t)[a3 count]);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_593DC;
    block[3] = &unk_8E168;
    uint64_t v28 = *(void *)(a1 + 104);
    uint64_t v29 = *(void *)(a1 + 48);
    void block[4] = a3;
    void block[5] = v29;
    block[6] = v21;
    block[7] = v28;
    dispatch_group_notify(v21, (dispatch_queue_t)&_dispatch_main_q, block);
    dispatch_group_leave(v21);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 25;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 0;
    if (IMOSLoggingEnabled())
    {
      uint64_t v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        id v52 = a5;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Transcoding failed with error: %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      BOOL v31 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        id v52 = v36;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "Failed transcoding transfer: %@", buf, 0xCu);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "failTransfer:reason:", objc_msgSend(v36, "guid"), 15);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
    CFStringRef v50 = 0;
    if (*(void *)(a1 + 56))
    {
      if (![+[NSFileManager defaultManager] removeItemAtURL:*(void *)(a1 + 56) error:&v50])
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v32 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            double v33 = *(void **)(a1 + 56);
            *(_DWORD *)int buf = 138412546;
            id v52 = v33;
            __int16 v53 = 2112;
            CFStringRef v54 = v50;
            _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "Error cleaning up linked path: %@  error: %@", buf, 0x16u);
          }
        }
      }
    }
  }
}

id sub_5853C(uint64_t a1, const __CFString *a2, __CFString *a3, uint64_t a4, int a5, int a6)
{
  if (IMOSLoggingEnabled())
  {
    CFStringRef v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      CFStringRef v12 = @"NO";
      if (a6) {
        CFStringRef v12 = @"YES";
      }
      *(_DWORD *)int buf = 138412290;
      CFStringRef v49 = v12;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Compressed attachment: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412290;
      CFStringRef v49 = a2;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "           Input Path: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412290;
      CFStringRef v49 = a3;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "          Output Path: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      CFStringRef v16 = @"NO";
      if (a5) {
        CFStringRef v16 = @"YES";
      }
      *(_DWORD *)int buf = 138412290;
      CFStringRef v49 = v16;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "              Success: %@", buf, 0xCu);
    }
  }
  if (a6)
  {
    id v17 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "localPath"), "lastPathComponent");
    id v18 = objc_msgSend(-[__CFString path](a3, "path"), "lastPathComponent");
    id v19 = [v17 pathExtension];
    id v20 = [v18 pathExtension];
    if (v19)
    {
      id v21 = v20;
      if (v20)
      {
        if (([v19 isEqualToString:v20] & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "setTransferredFilename:", objc_msgSend(v17, "stringByAppendingPathExtension:", v21));
          if (IMOSLoggingEnabled())
          {
            unint64_t v22 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              CFStringRef v23 = (const __CFString *)[*(id *)(a1 + 32) transferredFilename];
              *(_DWORD *)int buf = 138412290;
              CFStringRef v49 = v23;
              _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "          Setting transferred filename: %@", buf, 0xCu);
            }
          }
        }
      }
    }
  }
  +[NSDate timeIntervalSinceReferenceDate];
  uint64_t v25 = v24;
  uint64_t v26 = +[IMTransferServicesController sharedInstance];
  id v27 = objc_msgSend(-[__CFString path](a3, "path"), "stringByResolvingAndStandardizingPath");
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_589B8;
  v47[3] = &unk_8E0F0;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  int8x16_t v28 = *(int8x16_t *)(a1 + 40);
  void v47[4] = *(void *)(a1 + 40);
  int8x16_t v29 = vextq_s8(v28, v28, 8uLL);
  uint64_t v30 = v28.i64[0];
  v36[2] = sub_58AC8;
  v36[3] = &unk_8E118;
  uint64_t v44 = v25;
  uint64_t v45 = *(void *)(a1 + 136);
  long long v31 = *(_OWORD *)(a1 + 56);
  int8x16_t v37 = v29;
  long long v38 = v31;
  long long v32 = *(_OWORD *)(a1 + 72);
  long long v33 = *(_OWORD *)(a1 + 120);
  char v46 = *(unsigned char *)(a1 + 144);
  long long v34 = *(_OWORD *)(a1 + 88);
  long long v39 = v32;
  long long v40 = v34;
  long long v41 = a3;
  long long v42 = *(_OWORD *)(a1 + 104);
  long long v43 = v33;
  return [(IMTransferServicesController *)v26 sendFilePath:v27 topic:IDSServiceNameSMSRelay userInfo:0 transferID:v30 encryptFile:1 progressBlock:v47 completionBlock:v36];
}

id sub_589B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (IMOSLoggingEnabled())
  {
    __int16 v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 134218496;
      uint64_t v11 = a2;
      __int16 v12 = 2048;
      uint64_t v13 = a3;
      __int16 v14 = 2048;
      uint64_t v15 = a4;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Send progress updated to %lld of %lld (%lld bps)", (uint8_t *)&v10, 0x20u);
    }
  }
  return [+[IMDFileTransferCenter sharedInstance] updateTransfer:*(void *)(a1 + 32) currentBytes:a2 totalBytes:a3];
}

void sub_58AC8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, const void *a6, void *a7, const void *a8, void *a9, uint64_t a10)
{
  *(double *)&CFStringRef v50 = COERCE_DOUBLE([*(id *)(a1 + 32) transferForGUID:*(void *)(a1 + 40)]);
  int v16 = IMOSLoggingEnabled();
  if (a3)
  {
    if (v16)
    {
      id v17 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412802;
        double v53 = *(double *)&v50;
        __int16 v54 = 2112;
        CFStringRef v55 = @"YES";
        __int16 v56 = 2112;
        uint64_t v57 = a4;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Finished uploading transfer: %@   success: %@  error: %@", buf, 0x20u);
      }
    }
    CFStringRef v49 = a7;
    if (IMOSLoggingEnabled())
    {
      id v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        +[NSDate timeIntervalSinceReferenceDate];
        double v20 = v19 - *(double *)(a1 + 136);
        *(_DWORD *)int buf = 134217984;
        double v53 = v20;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Time taken: %f", buf, 0xCu);
      }
    }
    *(double *)&id v21 = COERCE_DOUBLE(objc_msgSend(-[__CFString userInfo](v50, "userInfo"), "mutableCopy"));
    if (*(double *)&v21 == 0.0) {
      *(double *)&id v21 = COERCE_DOUBLE(CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks));
    }
    CFStringRef v22 = @"file-size";
    uint64_t v23 = *(void *)(a1 + 144);
    CFStringRef v24 = @"decryption-key";
    CFStringRef v25 = @"mmcs-url";
    CFStringRef v26 = @"mmcs-owner";
    CFStringRef v27 = @"mmcs-signature-hex";
    if (v23)
    {
      CFStringRef v27 = +[NSString stringWithFormat:@"%@-%d", @"mmcs-signature-hex", v23];
      CFStringRef v26 = +[NSString stringWithFormat:@"%@-%d", @"mmcs-owner", *(void *)(a1 + 144)];
      CFStringRef v25 = +[NSString stringWithFormat:@"%@-%d", @"mmcs-url", *(void *)(a1 + 144)];
      CFStringRef v24 = +[NSString stringWithFormat:@"%@-%d", @"decryption-key", *(void *)(a1 + 144)];
      CFStringRef v22 = +[NSString stringWithFormat:@"%@-%d", @"file-size", *(void *)(a1 + 144)];
    }
    id v28 = objc_msgSend(v49, "__imHexString");
    if (v28) {
      CFDictionarySetValue(v21, v27, v28);
    }
    if (a6) {
      CFDictionarySetValue(v21, v26, a6);
    }
    if (a8) {
      CFDictionarySetValue(v21, v25, a8);
    }
    id v29 = objc_msgSend(a9, "__imHexString");
    if (v29) {
      CFDictionarySetValue(v21, v24, v29);
    }
    uint64_t v30 = [+[NSNumber numberWithInteger:a10] stringValue];
    if (v30) {
      CFDictionarySetValue(v21, v22, v30);
    }
    if (IMOSLoggingEnabled())
    {
      long long v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412546;
        double v53 = *(double *)&v21;
        __int16 v54 = 2112;
        CFStringRef v55 = v50;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "  setting userinfo: %@  on transfer: %@", buf, 0x16u);
      }
    }
    [(__CFString *)v50 setUserInfo:v21];
    -[__CFString setMessageGUID:](v50, "setMessageGUID:", [*(id *)(a1 + 56) guid]);
    [*(id *)(a1 + 32) updateTransfer:*(void *)(a1 + 40) currentBytes:a10 totalBytes:a10];
    [*(id *)(a1 + 32) endTransfer:*(void *)(a1 + 40)];
    [(__CFDictionary *)v21 setObject:*(void *)(a1 + 40) forKey:off_99A58[0]];
    id v32 = [*(id *)(a1 + 64) filename];
    [(__CFDictionary *)v21 setObject:v32 forKey:off_99A60[0]];
    id v33 = [*(id *)(a1 + 64) type];
    [(__CFDictionary *)v21 setObject:v33 forKey:off_99A68];
    [*(id *)(a1 + 72) addObject:v21];
  }
  else
  {
    if (v16)
    {
      long long v34 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412802;
        double v53 = *(double *)&v50;
        __int16 v54 = 2112;
        CFStringRef v55 = @"NO";
        __int16 v56 = 2112;
        uint64_t v57 = a4;
        _os_log_impl(&dword_0, v34, OS_LOG_TYPE_INFO, "Failed uploading transfer: %@   success: %@  error: %@", buf, 0x20u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        double v36 = COERCE_DOUBLE([(__CFString *)v50 transferDataURL]);
        *(_DWORD *)int buf = 138412290;
        double v53 = v36;
        _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "transfer data url: %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      int8x16_t v37 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        +[NSDate timeIntervalSinceReferenceDate];
        double v39 = v38 - *(double *)(a1 + 136);
        *(_DWORD *)int buf = 134217984;
        double v53 = v39;
        _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "Time taken: %f", buf, 0xCu);
      }
    }
    uint64_t v40 = *(void *)(a1 + 112);
    if (v40) {
      (*(void (**)(uint64_t, uint64_t, const void *, uint64_t))(v40 + 16))(v40, a4, a8, a10);
    }
    id v41 = [*(id *)(a1 + 48) code];
    if (v41 == (id)-6)
    {
      [*(id *)(a1 + 32) failTransfer:*(void *)(a1 + 40) reason:23];
    }
    else if (v41 == (id)-5)
    {
      [*(id *)(a1 + 32) failTransfer:*(void *)(a1 + 40) reason:22];
    }
    else
    {
      [*(id *)(a1 + 32) failTransfer:*(void *)(a1 + 40) error:a4];
    }
    if (IMOSLoggingEnabled())
    {
      long long v42 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        double v53 = *(double *)&a4;
        _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "  setting complete success to NO because of attachment send result. (Error: %@)", buf, 0xCu);
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = 0;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = _FZErrorTypeFromNSError();
  }
  if (*(unsigned char *)(a1 + 152))
  {
    CFStringRef v51 = 0;
    if (![+[NSFileManager defaultManager] removeItemAtURL:*(void *)(a1 + 80) error:&v51])
    {
      if (IMOSLoggingEnabled())
      {
        long long v43 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          double v44 = *(double *)(a1 + 80);
          *(_DWORD *)int buf = 138412546;
          double v53 = v44;
          __int16 v54 = 2112;
          CFStringRef v55 = v51;
          _os_log_impl(&dword_0, v43, OS_LOG_TYPE_INFO, "Error cleaning up transcoded path: %@  error: %@", buf, 0x16u);
        }
      }
    }
  }
  CFStringRef v51 = 0;
  if (*(void *)(a1 + 88))
  {
    if (![+[NSFileManager defaultManager] removeItemAtURL:*(void *)(a1 + 88) error:&v51])
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v45 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          double v46 = *(double *)(a1 + 88);
          *(_DWORD *)int buf = 138412546;
          double v53 = v46;
          __int16 v54 = 2112;
          CFStringRef v55 = v51;
          _os_log_impl(&dword_0, v45, OS_LOG_TYPE_INFO, "Error cleaning up linked path: %@  error: %@", buf, 0x16u);
        }
      }
    }
  }
  if ([*(id *)(a1 + 96) path])
  {
    if (objc_msgSend(objc_msgSend(*(id *)(a1 + 96), "path"), "hasPrefix:", objc_msgSend((id)IMSafeTemporaryDirectory(), "path")))
    {
      if (!-[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", [*(id *)(a1 + 96) path], &v51))
      {
        if (IMOSLoggingEnabled())
        {
          int8x16_t v47 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            double v48 = COERCE_DOUBLE([*(id *)(a1 + 96) path]);
            *(_DWORD *)int buf = 138412546;
            double v53 = v48;
            __int16 v54 = 2112;
            CFStringRef v55 = v51;
            _os_log_impl(&dword_0, v47, OS_LOG_TYPE_INFO, "Error cleaning up output path: %@  error: %@", buf, 0x16u);
          }
        }
      }
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 104));
}

void sub_593DC(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        CFStringRef v4 = @"YES";
      }
      else {
        CFStringRef v4 = @"NO";
      }
      int v5 = 138412546;
      uint64_t v6 = v3;
      __int16 v7 = 2112;
      CFStringRef v8 = v4;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "  All done url set for: %@   success: %@", (uint8_t *)&v5, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
}

void sub_594E4(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
        CFStringRef v4 = @"YES";
      }
      else {
        CFStringRef v4 = @"NO";
      }
      int v6 = 138412546;
      uint64_t v7 = v3;
      __int16 v8 = 2112;
      CFStringRef v9 = v4;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "  All done transfer set for: %@   success: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(uint64_t, void, void, void))(v5 + 16))(v5, *(void *)(a1 + 40), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
  }

  dispatch_release(*(dispatch_object_t *)(a1 + 48));
}

void sub_59920(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x597D0);
  }
  _Unwind_Resume(exc_buf);
}

void sub_59994(uint64_t a1, char a2)
{
  if (IMOSLoggingEnabled())
  {
    CFStringRef v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      CFStringRef v5 = *(const __CFString **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)int buf = 138412290;
      CFStringRef v76 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Network availability check complete: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    int v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      CFStringRef v7 = @"YES";
      if ((a2 & 2) == 0) {
        CFStringRef v7 = @"NO";
      }
      *(_DWORD *)int buf = 138412290;
      CFStringRef v76 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "   Cell available: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      CFStringRef v9 = @"YES";
      if ((a2 & 1) == 0) {
        CFStringRef v9 = @"NO";
      }
      *(_DWORD *)int buf = 138412290;
      CFStringRef v76 = v9;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "   WiFi available: %@", buf, 0xCu);
    }
  }
  int v10 = +[IMDFileTransferCenter sharedInstance];
  uint64_t v71 = 0;
  id v72 = &v71;
  uint64_t v73 = 0x2020000000;
  char v74 = 1;
  uint64_t v67 = 0;
  long long v68 = &v67;
  uint64_t v69 = 0x2020000000;
  int v70 = 0;
  group = dispatch_group_create();
  double v48 = v10;
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      CFStringRef v12 = (const __CFString *)[*(id *)(a1 + 32) fileTransferGUIDs];
      *(_DWORD *)int buf = 138412290;
      CFStringRef v76 = v12;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Checking message file tranfers: %@", buf, 0xCu);
    }
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v13 = [*(id *)(a1 + 32) fileTransferGUIDs];
  id v14 = [v13 countByEnumeratingWithState:&v63 objects:v85 count:16];
  if (!v14) {
    goto LABEL_54;
  }
  char v15 = 0;
  uint64_t v50 = *(void *)v64;
  uint64_t v47 = IDSServiceNameSMSRelay;
  id v46 = v13;
  do
  {
    id v51 = v14;
    for (i = 0; i != v51; i = (char *)i + 1)
    {
      if (*(void *)v64 != v50) {
        objc_enumerationMutation(v13);
      }
      CFStringRef v17 = *(const __CFString **)(*((void *)&v63 + 1) + 8 * i);
      id v18 = (__CFString *)[(IMDFileTransferCenter *)v10 transferForGUID:v17];
      if (v18)
      {
        dispatch_group_enter(group);
        id v19 = objc_msgSend(-[NSFileManager im_randomTemporaryFileURLWithFileName:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "im_randomTemporaryFileURLWithFileName:", objc_msgSend(-[__CFString filename](v18, "filename"), "lastPathComponent")), "path");
        [(__CFString *)v18 _setNeedsWrapper:0];
        -[__CFString setMessageGUID:](v18, "setMessageGUID:", [*(id *)(a1 + 32) guid]);
        -[IMDFileTransferCenter assignTransfer:toAccount:otherPerson:](v10, "assignTransfer:toAccount:otherPerson:", v17, [*(id *)(a1 + 32) accountID], *(void *)(a1 + 40));
        double v20 = (__CFString *)[(__CFString *)v18 userInfo];
        CFStringRef v54 = (const __CFString *)[(__CFString *)v20 _stringForKey:@"mmcs-url"];
        id v21 = (__CFString *)[(__CFString *)v20 _stringForKey:@"mmcs-signature-hex"];
        if (v54)
        {
          CFStringRef v22 = v21;
          if (IMOSLoggingEnabled())
          {
            uint64_t v23 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)int buf = 138412290;
              CFStringRef v76 = v22;
              _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, " => Settled on signature: %@", buf, 0xCu);
            }
          }
          id v49 = [(__CFString *)v20 _stringForKey:@"mmcs-owner"];
          id v53 = objc_msgSend(-[__CFString objectForKey:](v20, "objectForKey:", @"file-size"), "stringValue");
          id v24 = [(__CFString *)v20 _stringForKey:@"decryption-key"];
          if (IMOSLoggingEnabled())
          {
            CFStringRef v25 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)int buf = 138412290;
              CFStringRef v76 = v18;
              _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, " transfer: %@", buf, 0xCu);
            }
          }
          if (IMOSLoggingEnabled())
          {
            CFStringRef v26 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)int buf = 138412290;
              CFStringRef v76 = v20;
              _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "    user info: %@", buf, 0xCu);
            }
          }
          if (IMOSLoggingEnabled())
          {
            CFStringRef v27 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)int buf = 138413314;
              CFStringRef v76 = v54;
              __int16 v77 = 2112;
              id v78 = v49;
              __int16 v79 = 2112;
              id v80 = v22;
              __int16 v81 = 2112;
              id v82 = v24;
              __int16 v83 = 2112;
              id v84 = v53;
              _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, " urlString: %@   owner: %@    signature: %@  key: %@  fileSizeString: %@", buf, 0x34u);
            }
          }
          if (IMOSLoggingEnabled())
          {
            id v28 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)int buf = 0;
              _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, " ** Auto downloading file!", buf, 2u);
            }
          }
          +[NSDate timeIntervalSinceReferenceDate];
          uint64_t v30 = v29;
          uint64_t v31 = a1;
          unsigned int v32 = [*(id *)(a1 + 32) isFromMe];
          id v33 = *(void **)(a1 + 32);
          if (v32) {
            id v34 = +[IMSenderContext fromMeContextWithServiceName:](IMSenderContext, "fromMeContextWithServiceName:", [v33 service]);
          }
          else {
            id v34 = +[IMSenderContext untrustedContextWithServiceName:](IMSenderContext, "untrustedContextWithServiceName:", [v33 service]);
          }
          id v37 = v34;
          double v38 = +[IMTransferServicesController sharedInstance];
          id v39 = [v19 stringByResolvingAndStandardizingPath];
          id v40 = [(__CFString *)v22 _FTDataFromHexString];
          id v41 = [v24 _FTDataFromHexString];
          id v42 = [v53 integerValue];
          id v43 = [*(id *)(v31 + 32) balloonBundleID];
          v62[0] = _NSConcreteStackBlock;
          v62[1] = 3221225472;
          v62[2] = sub_5A470;
          v62[3] = &unk_8E0F0;
          v62[4] = v17;
          v61[0] = _NSConcreteStackBlock;
          v61[1] = 3221225472;
          v61[2] = sub_5A580;
          v61[3] = &unk_8E208;
          v61[12] = v30;
          uint64_t v44 = *(void *)(v31 + 32);
          v61[4] = v18;
          v61[5] = v44;
          v61[6] = v53;
          v61[7] = v48;
          v61[10] = &v71;
          v61[11] = &v67;
          v61[8] = v17;
          v61[9] = group;
          [(IMTransferServicesController *)v38 receiveFileTransfer:v17 transferGUID:v17 topic:v47 path:v39 requestURLString:v54 ownerID:v49 signature:v40 decryptionKey:v41 fileSize:v42 balloonBundleID:v43 senderContext:v37 progressBlock:v62 completionBlock:v61];
          char v15 = 1;
          a1 = v31;
          int v10 = v48;
          id v13 = v46;
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            double v36 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)int buf = 0;
              _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, " => No signature found, nothing to download here", buf, 2u);
            }
          }
          [(IMDFileTransferCenter *)v10 failTransfer:[(__CFString *)v18 guid] error:0];
          *((unsigned char *)v72 + 24) = 0;
          *((_DWORD *)v68 + 6) = 35;
          dispatch_group_leave(group);
          char v15 = 1;
        }
      }
      else if (IMOSLoggingEnabled())
      {
        id v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)int buf = 138412290;
          CFStringRef v76 = v17;
          _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "No transfer found for guid: %@", buf, 0xCu);
        }
      }
    }
    id v14 = [v13 countByEnumeratingWithState:&v63 objects:v85 count:16];
  }
  while (v14);
  if (v15)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_5AA10;
    block[3] = &unk_8E230;
    uint64_t v45 = *(void *)(a1 + 48);
    long long v56 = *(_OWORD *)(a1 + 32);
    uint64_t v59 = &v71;
    uint64_t v60 = &v67;
    uint64_t v57 = group;
    uint64_t v58 = v45;
    dispatch_group_notify(group, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
LABEL_54:
    dispatch_release(group);
  }
  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v71, 8);
}

void sub_5A390(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  if (a2 == 1)
  {
    objc_begin_catch(exc_buf);
    objc_end_catch();
    JUMPOUT(0x59BD4);
  }
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v28, 8);
  _Unwind_Resume(exc_buf);
}

id sub_5A470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (IMOSLoggingEnabled())
  {
    __int16 v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 134218496;
      uint64_t v11 = a2;
      __int16 v12 = 2048;
      uint64_t v13 = a3;
      __int16 v14 = 2048;
      uint64_t v15 = a4;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Receive progress updated to %lld of %lld (%lld bps)", (uint8_t *)&v10, 0x20u);
    }
  }
  return [+[IMDFileTransferCenter sharedInstance] updateTransfer:*(void *)(a1 + 32) currentBytes:a2 totalBytes:a3];
}

void sub_5A580(uint64_t a1, double a2, double a3, uint64_t a4, uint64_t a5, int a6, char a7, const __CFString *a8)
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v15 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      CFStringRef v17 = @"NO";
      *(_DWORD *)uint64_t v31 = 138412802;
      if (a6) {
        CFStringRef v17 = @"YES";
      }
      *(void *)&v31[4] = v16;
      __int16 v32 = 2112;
      CFStringRef v33 = v17;
      __int16 v34 = 2112;
      CFStringRef v35 = a8;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Finished downloading transfer: %@   success: %@  error: %@", v31, 0x20u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      +[NSDate timeIntervalSinceReferenceDate];
      double v20 = v19 - *(double *)(a1 + 96);
      *(_DWORD *)uint64_t v31 = 134217984;
      *(double *)&v31[4] = v20;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Time taken: %f", v31, 0xCu);
    }
  }
  if (!a6)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        uint64_t v30 = *(void *)(a1 + 32);
        *(_DWORD *)uint64_t v31 = 138412546;
        *(void *)&v31[4] = v30;
        __int16 v32 = 2112;
        CFStringRef v33 = a8;
        _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Failed retreiving file transfer: %@   error: %@", v31, 0x16u);
      }
    }
    objc_msgSend(*(id *)(a1 + 56), "failTransfer:error:", objc_msgSend(*(id *)(a1 + 32), "guid", *(void *)v31), a8);
    goto LABEL_28;
  }
  id v21 = +[NSURL fileURLWithPath:a5];
  [*(id *)(a1 + 32) setUserInfo:0];
  if (!v21
    || ![+[NSFileManager defaultManager] fileExistsAtPath:[(NSURL *)v21 path]])
  {
    if (IMOSLoggingEnabled())
    {
      CFStringRef v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        uint64_t v27 = *(void *)(a1 + 32);
        *(_DWORD *)uint64_t v31 = 138412290;
        *(void *)&v31[4] = v27;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "Could not locate file for transfer: %@", v31, 0xCu);
      }
    }
LABEL_28:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 35;
    goto LABEL_29;
  }
  if (IMOSLoggingEnabled())
  {
    CFStringRef v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v31 = 138412290;
      *(void *)&v31[4] = a5;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "Adding gatekeeper properties to: %@", v31, 0xCu);
    }
  }
  [+[IMDFileTransferCenter sharedInstance] addDefaultGatekeeperPropertiesToDirectory:a5];
  objc_msgSend(*(id *)(a1 + 32), "setMessageGUID:", objc_msgSend(*(id *)(a1 + 40), "guid"));
  [*(id *)(a1 + 32) _setLocalURL:v21];
  id v23 = [*(id *)(a1 + 48) integerValue];
  [*(id *)(a1 + 56) updateTransfer:*(void *)(a1 + 64) currentBytes:v23 totalBytes:v23];
  [*(id *)(a1 + 56) endTransfer:*(void *)(a1 + 64)];
  id v24 = +[IMDFileTransferCenter sharedInstance];
  uint64_t v25 = *(void *)(a1 + 64);
  if (a7) {
    -[IMDFileTransferCenter successfullyGeneratedPreviewForTransfer:withPreviewSize:](v24, "successfullyGeneratedPreviewForTransfer:withPreviewSize:", v25, a2, a3);
  }
  else {
    [(IMDFileTransferCenter *)v24 failTransferPreviewGeneration:v25];
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v31 = 138412290;
      *(void *)&v31[4] = v21;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "Set transfer local url to: %@", v31, 0xCu);
    }
  }
LABEL_29:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void sub_5AA10(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = [*(id *)(a1 + 32) fileTransferGUIDs];
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
        CFStringRef v4 = @"YES";
      }
      else {
        CFStringRef v4 = @"NO";
      }
      int v6 = 138412546;
      id v7 = v3;
      __int16 v8 = 2112;
      CFStringRef v9 = v4;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "  All done transfer set for: %@   success: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(uint64_t, void, void, void, void))(v5 + 16))(v5, *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
}

id sub_5BFEC(uint64_t a1)
{
  return [*(id *)(a1 + 32) remotefileRequest:*(void *)(a1 + 40) attempts:*(void *)(a1 + 48) + 1];
}

id sub_5C000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v7 = IMOSLoggingEnabled();
  if (!a3 || a4)
  {
    if (v7)
    {
      CFStringRef v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        uint64_t v12 = a4;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "File safe render failed for Peer Relay: %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else if (v7)
  {
    __int16 v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      uint64_t v12 = a3;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "File safe render success with output URLs: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "_sendFileURL:forMessageGUID:attachmentIndex:", a3, objc_msgSend(*(id *)(a1 + 40), "guid"), *(void *)(a1 + 48));
}

void sub_5C180(uint64_t a1, const __CFString *a2, __CFString *a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      CFStringRef v13 = @"NO";
      if (a7) {
        CFStringRef v13 = @"YES";
      }
      *(_DWORD *)int buf = 138412546;
      CFStringRef v34 = a2;
      __int16 v35 = 2112;
      CFStringRef v36 = v13;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Transcode processing complete for transfer: %@  (Attempted Transcode: %@)", buf, 0x16u);
    }
  }
  int v14 = IMOSLoggingEnabled();
  if (a6)
  {
    if (v14)
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        CFStringRef v34 = a3;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Transcoding succeeded with output URLs: %@", buf, 0xCu);
      }
    }
    CFStringRef v16 = (const __CFString *)[(__CFString *)a3 lastObject];
    CFStringRef v17 = +[NSData dataWithContentsOfFile:v16];
    if (IMOSLoggingEnabled())
    {
      id v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        CFStringRef v19 = *(const __CFString **)(a1 + 32);
        *(_DWORD *)int buf = 138412546;
        CFStringRef v34 = v19;
        __int16 v35 = 2112;
        CFStringRef v36 = v16;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Forwarding Attachment with guid %@ to local peer. Filepath %@", buf, 0x16u);
      }
    }
    +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", [*(id *)(a1 + 40) guid], @"message-guid", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(void *)(a1 + 48)), @"attachment-index", v17, @"message-data", 0);
    id v20 = [(id)JWEncodeDictionary() _FTCopyGzippedData];
    id v21 = +[NSDictionary dictionaryWithObjectsAndKeys:v20, @"dict", @"remote-file-response", @"local-type", 0];

    id v22 = +[IMDAccountController sharedAccountController];
    id v23 = (__CFString *)[v22 anySessionForServiceName:IMServiceNameSMS];
    if (IMOSLoggingEnabled())
    {
      id v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        CFStringRef v25 = (const __CFString *)objc_msgSend(-[__CFString service](v23, "service"), "internalName");
        *(_DWORD *)int buf = 138412546;
        CFStringRef v34 = v23;
        __int16 v35 = 2112;
        CFStringRef v36 = v25;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "We have the sms service session %@ %@", buf, 0x16u);
      }
    }
    unsigned int v26 = [(__CFString *)v23 sendToLocalPeers:v21];
    if (IMOSLoggingEnabled())
    {
      uint64_t v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        CFStringRef v28 = @"NO";
        if (v26) {
          CFStringRef v28 = @"YES";
        }
        *(_DWORD *)int buf = 138412290;
        CFStringRef v34 = v28;
        uint64_t v29 = "Got success? %@";
        uint64_t v30 = v27;
        uint32_t v31 = 12;
        goto LABEL_24;
      }
    }
  }
  else if (v14)
  {
    __int16 v32 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      uint64_t v29 = "Transcoding Failed for Peer Relay:";
      uint64_t v30 = v32;
      uint32_t v31 = 2;
LABEL_24:
      _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, v29, buf, v31);
    }
  }
}

id sub_5C5B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) remotefileRequest:*(void *)(a1 + 40) attempts:*(void *)(a1 + 48) + 1];
}

void *sub_5C954()
{
  swift_beginAccess();
  id v1 = objc_getAssociatedObject(v0, &unk_99A70);
  swift_endAccess();
  if (v1)
  {
    sub_5F4C0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_5CBD8((uint64_t)v7, (uint64_t)v8);
  if (!v9)
  {
    sub_5CC84((uint64_t)v8);
    goto LABEL_8;
  }
  type metadata accessor for SMSReachabilityController();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    type metadata accessor for SMSServiceReachabilityDelegate();
    id v3 = v0;
    id v4 = sub_5CDA0(v3);
    type metadata accessor for SMSReachabilityController();
    uint64_t v2 = (void *)swift_allocObject();
    v2[2] = v4;
    v2[3] = &off_8E400;
    swift_beginAccess();
    swift_retain();
    objc_setAssociatedObject(v3, &unk_99A70, v2, (char *)&dword_0 + 1);
    swift_endAccess();
    swift_release();
    return v2;
  }
  return (void *)v6;
}

uint64_t _sSo23LegacySMSServiceSessionC3SMSE21calculateReachability4with15responseHandlerySo09IMServiceF7RequestC_So0jf8ResponseI0_ptF_0(uint64_t a1, uint64_t a2)
{
  id v4 = sub_5C954();
  (*(void (**)(uint64_t, uint64_t))(*v4 + 96))(a1, a2);

  return swift_release();
}

uint64_t sub_5CBD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5CC40(&qword_99A78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_5CC40(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_5CC84(uint64_t a1)
{
  uint64_t v2 = sub_5CC40(&qword_99A78);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_5CDA0(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithServiceSession:a1];

  return v3;
}

uint64_t type metadata accessor for SMSServiceReachabilityDelegate()
{
  return self;
}

id sub_5CE90()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SMSServiceReachabilityDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t SMSReachabilityController.delegate.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t SMSReachabilityController.__allocating_init(delegate:)(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t SMSReachabilityController.init(delegate:)(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return v2;
}

void SMSReachabilityController.calculateReachability(with:responseHandler:)(id a1, void *a2)
{
  uint64_t v5 = sub_5F420();
  uint64_t v6 = *(char **)(v5 - 8);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v9 = (char *)&v93 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  id v96 = (char *)&v93 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  char v97 = (char *)&v93 - v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v93 - v14;
  CFStringRef v16 = *(void **)(v2 + 16);
  id v17 = [a1 context];
  id v99 = v16;
  LODWORD(v16) = [v16 isSMSEnabledForContext:v17];

  if (!v16)
  {
    if (qword_99B68 != -1) {
      swift_once();
    }
    uint64_t v48 = sub_5DFEC(v5, (uint64_t)static Logger.sms);
    id v49 = v6;
    (*((void (**)(char *, uint64_t, uint64_t))v6 + 2))(v9, v48, v5);
    id v50 = a1;
    id v51 = sub_5F400();
    os_log_type_t v52 = sub_5F490();
    if (os_log_type_enabled(v51, v52))
    {
      char v97 = v49;
      id v53 = (uint8_t *)swift_slowAlloc();
      uint64_t v95 = swift_slowAlloc();
      aBlock[0] = v95;
      id v96 = (char *)v5;
      __int16 v94 = v53;
      *(_DWORD *)id v53 = 136315138;
      id v54 = [v50 handleIDs];
      CFStringRef v55 = a2;
      uint64_t v56 = sub_5F480();

      uint64_t v101 = v56;
      sub_5CC40(&qword_99B70);
      id v98 = a1;
      sub_5E67C();
      uint64_t v57 = sub_5F430();
      unint64_t v59 = v58;
      a2 = v55;
      swift_bridgeObjectRelease();
      uint64_t v101 = sub_5E024(v57, v59, aBlock);
      sub_5F4A0();

      a1 = v98;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v51, v52, "SMS is unavailable for sending to %s: SMS not available for context", v94, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*((void (**)(char *, char *))v97 + 1))(v9, v96);
    }
    else
    {

      (*((void (**)(char *, uint64_t))v49 + 1))(v9, v5);
    }
    NSString v60 = [v99 internalServiceName];
    if (!v60)
    {
      sub_5F450();
      NSString v60 = sub_5F440();
      swift_bridgeObjectRelease();
    }
    Class isa = (Class)[v50 handleIDs];
    if (!isa)
    {
      sub_5F480();
      Class isa = sub_5F470().super.isa;
      swift_bridgeObjectRelease();
    }
    id v62 = [self finalResultForService:v60 handleIDs:isa allAreReachable:0 checkedServer:0 error:3];
    goto LABEL_44;
  }
  uint64_t v95 = (uint64_t)a2;
  id v18 = [a1 handleIDs];
  uint64_t v19 = sub_5F480();

  uint64_t v20 = *(void *)(v19 + 16);
  id v98 = a1;
  if (!v20)
  {
LABEL_7:
    swift_bridgeObjectRelease();
LABEL_8:
    id v24 = [a1 context];
    id v25 = [v99 maxChatParticipantsForContext:v24];

    id v26 = [a1 handleIDs];
    uint64_t v27 = sub_5F480();

    uint64_t v28 = *(void *)(v27 + 16);
    swift_bridgeObjectRelease();
    if ((uint64_t)v25 >= v28)
    {
      long long v63 = v6;
      if (qword_99B68 != -1) {
        swift_once();
      }
      uint64_t v64 = v5;
      uint64_t v65 = sub_5DFEC(v5, (uint64_t)static Logger.sms);
      long long v66 = v96;
      (*((void (**)(char *, uint64_t, uint64_t))v6 + 2))(v96, v65, v64);
      id v67 = a1;
      long long v68 = sub_5F400();
      os_log_type_t v69 = sub_5F490();
      if (os_log_type_enabled(v68, v69))
      {
        char v97 = v63;
        int v70 = (uint8_t *)swift_slowAlloc();
        __int16 v94 = (uint8_t *)swift_slowAlloc();
        aBlock[0] = (uint64_t)v94;
        *(_DWORD *)int v70 = 136315138;
        id v71 = [v67 handleIDs];
        uint64_t v72 = sub_5F480();

        uint64_t v101 = v72;
        id v93 = v70 + 4;
        sub_5CC40(&qword_99B70);
        sub_5E67C();
        uint64_t v73 = sub_5F430();
        unint64_t v75 = v74;
        swift_bridgeObjectRelease();
        uint64_t v101 = sub_5E024(v73, v75, aBlock);
        sub_5F4A0();

        a1 = v98;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_0, v68, v69, "SMS is available for sending to %s", v70, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*((void (**)(char *, uint64_t))v97 + 1))(v66, v64);
      }
      else
      {

        (*((void (**)(char *, uint64_t))v63 + 1))(v66, v64);
      }
      a2 = (void *)v95;
      NSString v60 = [v99 internalServiceName];
      if (!v60)
      {
        sub_5F450();
        NSString v60 = sub_5F440();
        swift_bridgeObjectRelease();
      }
      Class isa = (Class)[v67 handleIDs];
      if (!isa)
      {
        sub_5F480();
        Class isa = sub_5F470().super.isa;
        swift_bridgeObjectRelease();
      }
      id v62 = [self finalResultForService:v60 handleIDs:isa allAreReachable:1 checkedServer:0 error:0];
    }
    else
    {
      uint64_t v29 = v6;
      if (qword_99B68 != -1) {
        swift_once();
      }
      uint64_t v30 = v5;
      uint64_t v31 = sub_5DFEC(v5, (uint64_t)static Logger.sms);
      __int16 v32 = v97;
      (*((void (**)(char *, uint64_t, uint64_t))v6 + 2))(v97, v31, v5);
      id v33 = a1;
      CFStringRef v34 = (uint8_t *)sub_5F400();
      os_log_type_t v35 = sub_5F490();
      int v36 = v35;
      if (os_log_type_enabled((os_log_t)v34, v35))
      {
        uint64_t v37 = swift_slowAlloc();
        id v96 = (char *)swift_slowAlloc();
        aBlock[0] = (uint64_t)v96;
        *(_DWORD *)uint64_t v37 = 136315650;
        id v38 = [v33 handleIDs];
        __int16 v94 = v34;
        id v39 = v38;
        uint64_t v40 = sub_5F480();

        uint64_t v101 = v40;
        sub_5CC40(&qword_99B70);
        sub_5E67C();
        LODWORD(v93) = v36;
        uint64_t v41 = sub_5F430();
        unint64_t v43 = v42;
        swift_bridgeObjectRelease();
        uint64_t v101 = sub_5E024(v41, v43, aBlock);
        sub_5F4A0();

        swift_bridgeObjectRelease();
        *(_WORD *)(v37 + 12) = 2050;
        id v44 = [v33 handleIDs];
        uint64_t v45 = sub_5F480();

        uint64_t v46 = *(void *)(v45 + 16);
        swift_bridgeObjectRelease();
        uint64_t v101 = v46;
        sub_5F4A0();

        *(_WORD *)(v37 + 22) = 2050;
        uint64_t v101 = (uint64_t)v25;
        sub_5F4A0();
        uint64_t v47 = v94;
        _os_log_impl(&dword_0, (os_log_t)v94, (os_log_type_t)v93, "SMS is unavailable for sending to %s: have %{public}ld participants but max is %{public}ld", (uint8_t *)v37, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        a1 = v98;
        swift_slowDealloc();

        (*((void (**)(char *, uint64_t))v29 + 1))(v97, v30);
      }
      else
      {

        (*((void (**)(char *, uint64_t))v29 + 1))(v32, v30);
      }
      a2 = (void *)v95;
      NSString v60 = [v99 internalServiceName];
      if (!v60)
      {
        sub_5F450();
        NSString v60 = sub_5F440();
        swift_bridgeObjectRelease();
      }
      Class isa = (Class)[v33 handleIDs];
      if (!isa)
      {
        sub_5F480();
        Class isa = sub_5F470().super.isa;
        a2 = (void *)v95;
        swift_bridgeObjectRelease();
      }
      id v62 = [self finalResultForService:v60 handleIDs:isa allAreReachable:1 checkedServer:0 error:1];
    }
LABEL_44:
    id v90 = v62;
    goto LABEL_45;
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = v19 + 40;
  while (1)
  {
    swift_bridgeObjectRetain();
    NSString v22 = sub_5F440();
    int IsEmail = IMStringIsEmail();
    swift_bridgeObjectRelease();

    if (IsEmail) {
      break;
    }
    v21 += 16;
    if (!--v20)
    {
      swift_bridgeObjectRelease();
      a1 = v98;
      goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease_n();
  a1 = v98;
  id v76 = [v98 context];
  unsigned __int8 v77 = [v99 isMMSEnabledForContext:v76];

  if (v77) {
    goto LABEL_8;
  }
  if (qword_99B68 != -1) {
    swift_once();
  }
  uint64_t v78 = sub_5DFEC(v5, (uint64_t)static Logger.sms);
  __int16 v79 = (void (**)(char *, uint64_t))v6;
  (*((void (**)(char *, uint64_t, uint64_t))v6 + 2))(v15, v78, v5);
  id v80 = a1;
  __int16 v81 = sub_5F400();
  os_log_type_t v82 = sub_5F490();
  if (os_log_type_enabled(v81, v82))
  {
    __int16 v83 = (void (**)(char *, char *))v79;
    id v84 = (uint8_t *)swift_slowAlloc();
    char v97 = (char *)swift_slowAlloc();
    aBlock[0] = (uint64_t)v97;
    *(_DWORD *)id v84 = 136315138;
    id v85 = [v80 handleIDs];
    uint64_t v86 = sub_5F480();

    uint64_t v101 = v86;
    __int16 v94 = v84 + 4;
    sub_5CC40(&qword_99B70);
    id v96 = (char *)v5;
    sub_5E67C();
    uint64_t v87 = sub_5F430();
    unint64_t v89 = v88;
    a1 = v98;
    swift_bridgeObjectRelease();
    uint64_t v101 = sub_5E024(v87, v89, aBlock);
    sub_5F4A0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v81, v82, "SMS is unavailable for sending to %s: has email recipients but MMS not available for context", v84, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v83[1](v15, v96);
  }
  else
  {

    v79[1](v15, v5);
  }
  NSString v60 = [v99 internalServiceName];
  if (!v60)
  {
    sub_5F450();
    NSString v60 = sub_5F440();
    swift_bridgeObjectRelease();
  }
  Class isa = (Class)[v80 handleIDs];
  if (!isa)
  {
    sub_5F480();
    Class isa = sub_5F470().super.isa;
    swift_bridgeObjectRelease();
  }
  CFStringRef v91 = self;
  aBlock[4] = (uint64_t)sub_5DEF8;
  aBlock[5] = 0;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_5DF2C;
  aBlock[3] = (uint64_t)&unk_8E518;
  __int16 v92 = _Block_copy(aBlock);
  id v90 = [v91 finalResultForService:v60 handleIDs:isa allAreReachable:0 handleIsReachable:v92 checkedServer:0 error:6];
  _Block_release(v92);
  a2 = (void *)v95;
LABEL_45:

  [a2 reachabilityRequest:a1 updatedWithResult:v90];
}

uint64_t sub_5DEF8()
{
  NSString v0 = sub_5F440();
  int IsEmail = IMStringIsEmail();

  return IsEmail ^ 1u;
}

uint64_t sub_5DF2C(uint64_t a1)
{
  id v1 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  uint64_t v2 = sub_5F450();
  uint64_t v4 = v3;
  swift_retain();
  LOBYTE(v2) = v1(v2, v4);
  swift_release();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t SMSReachabilityController.deinit()
{
  swift_unknownObjectRelease();
  return v0;
}

uint64_t SMSReachabilityController.__deallocating_deinit()
{
  swift_unknownObjectRelease();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t sub_5DFEC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_5E024(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_5E0F8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_5E7AC((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_5E7AC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_5E75C((uint64_t)v12);
  return v7;
}

uint64_t sub_5E0F8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_5F4B0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_5E2B4(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_5F4E0();
  if (!v8)
  {
    sub_5F4F0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_5F500();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_5E2B4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_5E34C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_5E52C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_5E52C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_5E34C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_5E4C4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_5F4D0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_5F4F0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_5F460();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_5F500();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_5F4F0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_5E4C4(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_5CC40(&qword_99C28);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_5E52C(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_5CC40(&qword_99C28);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_5F500();
  __break(1u);
  return result;
}

unint64_t sub_5E67C()
{
  unint64_t result = qword_99B78;
  if (!qword_99B78)
  {
    sub_5E6D8(&qword_99B70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_99B78);
  }
  return result;
}

uint64_t sub_5E6D8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_5E720(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_5E730()
{
  return swift_release();
}

uint64_t type metadata accessor for SMSReachabilityController()
{
  return self;
}

uint64_t sub_5E75C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_5E7AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t Logger.sms.unsafeMutableAddressor()
{
  if (qword_99B68 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_5F420();

  return sub_5DFEC(v0, (uint64_t)static Logger.sms);
}

uint64_t sub_5E870()
{
  uint64_t v0 = sub_5F420();
  sub_5E978(v0, static Logger.sms);
  sub_5DFEC(v0, (uint64_t)static Logger.sms);
  sub_5F3F0();
  return sub_5F410();
}

uint64_t static Logger.sms.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_99B68 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_5F420();
  uint64_t v3 = sub_5DFEC(v2, (uint64_t)static Logger.sms);
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t *sub_5E978(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_5E9DC()
{
  sub_C564();
  sub_C570(&dword_0, v0, v1, "Could not get utiType from transfer: %@", v2);
}

void sub_5EA48(void *a1)
{
  objc_end_catch();
}

void sub_5EA6C()
{
  sub_C534();
  sub_C548(&dword_0, &_os_log_default, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_5EAF4(void *a1)
{
  objc_end_catch();
}

void sub_5EB24(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 guid];
  sub_C564();
  sub_C570(&dword_0, a2, v4, "Message failed to relay: %@", v5);
}

void sub_5EBB4()
{
  sub_C564();
  sub_C570(&dword_0, v0, v1, "Chat: %@", v2);
}

void sub_5EC20(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 guid];
  sub_C564();
  sub_C570(&dword_0, a2, v4, "Found a chat that is not 1-1 chat for message relay: %@", v5);
}

void sub_5ECB0(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *DeviceManagementLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SMSMessageSender.m", 33, @"%s", *a1);

  __break(1u);
}

void sub_5ED30()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"Class getDMFEmergencyModeMonitorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SMSMessageSender.m", 34, @"Unable to find class %s", "DMFEmergencyModeMonitor");

  __break(1u);
}

void sub_5EDAC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412546;
  CFStringRef v3 = @"mc";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "Failed type check! {key: %@, class: %@}", (uint8_t *)&v2, 0x16u);
}

void sub_5EE38()
{
  sub_C534();
  sub_C548(&dword_0, &_os_log_default, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_5EEC0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Could not get utiType from transfer: %@", (uint8_t *)&v2, 0xCu);
}

void sub_5EF38(void *a1)
{
  uint64_t v1 = [a1 uniqueID];
  sub_C548(&dword_0, &_os_log_default, v2, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v3, v4, v5, v6, 2u);
}

void sub_5EFDC()
{
  sub_C534();
  sub_C548(&dword_0, &_os_log_default, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_5F060()
{
  sub_C534();
  sub_C548(&dword_0, &_os_log_default, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_5F0E4()
{
  sub_C534();
  sub_C548(&dword_0, &_os_log_default, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_5F168()
{
  sub_C534();
  sub_C548(&dword_0, &_os_log_default, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_5F1EC()
{
  sub_C534();
  sub_C548(&dword_0, &_os_log_default, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_5F270()
{
  sub_C534();
  sub_C548(&dword_0, &_os_log_default, v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

void sub_5F2F4(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *DeviceManagementLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"LegacySMSServiceSession.m", 89, @"%s", *a1);

  __break(1u);
}

void sub_5F374()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"Class getDMFEmergencyModeMonitorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"LegacySMSServiceSession.m", 90, @"Unable to find class %s", "DMFEmergencyModeMonitor");

  __break(1u);
  sub_5F3F0();
}

uint64_t sub_5F3F0()
{
  return static Logger.messagesSubsystem.getter();
}

uint64_t sub_5F400()
{
  return Logger.logObject.getter();
}

uint64_t sub_5F410()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_5F420()
{
  return type metadata accessor for Logger();
}

uint64_t sub_5F430()
{
  return BidirectionalCollection<>.joined(separator:)();
}

NSString sub_5F440()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_5F450()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_5F460()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_5F470()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_5F480()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_5F490()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_5F4A0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_5F4B0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_5F4C0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_5F4D0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_5F4E0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_5F4F0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_5F500()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return _CFNotificationCenterGetDistributedCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return _CFStringCreateWithFileSystemRepresentation(alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

uint64_t CMFBlockListIsItemBlocked()
{
  return _CMFBlockListIsItemBlocked();
}

uint64_t CMFItemCreateWithEmailAddress()
{
  return _CMFItemCreateWithEmailAddress();
}

uint64_t CMFItemCreateWithPhoneNumber()
{
  return _CMFItemCreateWithPhoneNumber();
}

uint64_t CTTelephonyCenterAddObserver()
{
  return _CTTelephonyCenterAddObserver();
}

uint64_t CTTelephonyCenterGetDefault()
{
  return _CTTelephonyCenterGetDefault();
}

uint64_t CTTelephonyCenterRemoveObserver()
{
  return _CTTelephonyCenterRemoveObserver();
}

uint64_t FastRandomUInt()
{
  return _FastRandomUInt();
}

uint64_t HSAAuthenticationProcessIncomingMessage()
{
  return _HSAAuthenticationProcessIncomingMessage();
}

uint64_t IDSCopyIDForDevice()
{
  return _IDSCopyIDForDevice();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return _IDSCopyIDForPhoneNumber();
}

uint64_t IDSGetUUIDData()
{
  return _IDSGetUUIDData();
}

uint64_t IMBalloonExtensionIDWithSuffix()
{
  return _IMBalloonExtensionIDWithSuffix();
}

uint64_t IMChatCanonicalIDSIDsForAddress()
{
  return _IMChatCanonicalIDSIDsForAddress();
}

uint64_t IMCopyNormalizedAttributes()
{
  return _IMCopyNormalizedAttributes();
}

uint64_t IMCopySafeNameOfFontFamilyName()
{
  return _IMCopySafeNameOfFontFamilyName();
}

uint64_t IMCountryCodeForIncomingTextMessage()
{
  return _IMCountryCodeForIncomingTextMessage();
}

uint64_t IMCreateEscapedAttributeValueFromString()
{
  return _IMCreateEscapedAttributeValueFromString();
}

uint64_t IMCreateEscapedStringFromString()
{
  return _IMCreateEscapedStringFromString();
}

uint64_t IMDAreAllAliasesUnknown()
{
  return _IMDAreAllAliasesUnknown();
}

uint64_t IMExtensionPayloadUnarchivingClasses()
{
  return _IMExtensionPayloadUnarchivingClasses();
}

uint64_t IMFileURLIsActuallyAnimated()
{
  return _IMFileURLIsActuallyAnimated();
}

uint64_t IMFormattedDisplayStringForID()
{
  return _IMFormattedDisplayStringForID();
}

uint64_t IMGenerateLoginID()
{
  return _IMGenerateLoginID();
}

uint64_t IMGetCachedDomainBoolForKey()
{
  return _IMGetCachedDomainBoolForKey();
}

uint64_t IMGetCachedDomainIntForKey()
{
  return _IMGetCachedDomainIntForKey();
}

uint64_t IMGetCachedDomainValueForKey()
{
  return _IMGetCachedDomainValueForKey();
}

uint64_t IMGetDomainBoolForKey()
{
  return _IMGetDomainBoolForKey();
}

uint64_t IMGetDomainValueForKey()
{
  return _IMGetDomainValueForKey();
}

uint64_t IMGreenTeaMessageTransmitLog()
{
  return _IMGreenTeaMessageTransmitLog();
}

uint64_t IMLogHandleForCategory()
{
  return _IMLogHandleForCategory();
}

uint64_t IMLogString()
{
  return _IMLogString();
}

uint64_t IMMMSPartCombinationCanBeSent()
{
  return _IMMMSPartCombinationCanBeSent();
}

uint64_t IMNormalizeFormattedString()
{
  return _IMNormalizeFormattedString();
}

uint64_t IMNormalizePhoneNumber()
{
  return _IMNormalizePhoneNumber();
}

uint64_t IMNormalizedPhoneNumberForCFPhoneNumberRef()
{
  return _IMNormalizedPhoneNumberForCFPhoneNumberRef();
}

uint64_t IMOSLoggingEnabled()
{
  return _IMOSLoggingEnabled();
}

uint64_t IMPhoneNumberRefCopyForPhoneNumber()
{
  return _IMPhoneNumberRefCopyForPhoneNumber();
}

uint64_t IMPreferredAccountMap()
{
  return _IMPreferredAccountMap();
}

uint64_t IMPreviewConstraintsZero()
{
  return _IMPreviewConstraintsZero();
}

uint64_t IMSMSEnabled()
{
  return _IMSMSEnabled();
}

uint64_t IMSafeTemporaryDirectory()
{
  return _IMSafeTemporaryDirectory();
}

uint64_t IMSetDomainBoolForKey()
{
  return _IMSetDomainBoolForKey();
}

uint64_t IMSetDomainValueForKey()
{
  return _IMSetDomainValueForKey();
}

uint64_t IMSharedHelperDeviceHasMultipleActiveSubscriptions()
{
  return _IMSharedHelperDeviceHasMultipleActiveSubscriptions();
}

uint64_t IMSharedHelperDeviceHasMultipleSubscriptions()
{
  return _IMSharedHelperDeviceHasMultipleSubscriptions();
}

uint64_t IMSharedHelperDeviceHasMultipleSubscriptionsWithAtLeastOneActive()
{
  return _IMSharedHelperDeviceHasMultipleSubscriptionsWithAtLeastOneActive();
}

uint64_t IMSharedHelperDeviceIsAltAccount()
{
  return _IMSharedHelperDeviceIsAltAccount();
}

uint64_t IMSharedHelperDeviceIsiPad()
{
  return _IMSharedHelperDeviceIsiPad();
}

uint64_t IMSharedHelperRetrieveSimDetailsFromTelephony()
{
  return _IMSharedHelperRetrieveSimDetailsFromTelephony();
}

uint64_t IMSharedUtilitiesFrameworkBundle()
{
  return _IMSharedUtilitiesFrameworkBundle();
}

uint64_t IMShouldHandleInternalPhishingAttempts()
{
  return _IMShouldHandleInternalPhishingAttempts();
}

uint64_t IMShouldLog()
{
  return _IMShouldLog();
}

uint64_t IMSingleObjectArray()
{
  return _IMSingleObjectArray();
}

uint64_t IMStringIsEmail()
{
  return _IMStringIsEmail();
}

uint64_t IMStripLoginID()
{
  return _IMStripLoginID();
}

uint64_t IMSyncronizeAppPreferences()
{
  return _IMSyncronizeAppPreferences();
}

uint64_t IMWeakLinkClass()
{
  return _IMWeakLinkClass();
}

uint64_t JWDecodeDictionary()
{
  return _JWDecodeDictionary();
}

uint64_t JWEncodeDictionary()
{
  return _JWEncodeDictionary();
}

uint64_t JWUUIDPushObjectToString()
{
  return _JWUUIDPushObjectToString();
}

uint64_t MarcoLoggingStringForMessageData()
{
  return _MarcoLoggingStringForMessageData();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t OSLogHandleForIDSCategory()
{
  return _OSLogHandleForIDSCategory();
}

uint64_t OSLogHandleForIMEventCategory()
{
  return _OSLogHandleForIMEventCategory();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return _OSLogHandleForIMFoundationCategory();
}

uint64_t SMSCopySanitizedContentID()
{
  return _SMSCopySanitizedContentID();
}

uint64_t SMSCopySanitizedContentLocation()
{
  return _SMSCopySanitizedContentLocation();
}

uint64_t StringGUID()
{
  return _StringGUID();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return _UTTypeConformsTo(inUTI, inConformsToUTI);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
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

uint64_t _FTAreIDsEquivalent()
{
  return __FTAreIDsEquivalent();
}

uint64_t _FZErrorTypeFromNSError()
{
  return __FZErrorTypeFromNSError();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

uid_t geteuid(void)
{
  return _geteuid();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return _getpwuid(a1);
}

uid_t getuid(void)
{
  return _getuid();
}

uint64_t im_dispatch_after()
{
  return _im_dispatch_after();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeak(id *location)
{
  return _objc_loadWeak(location);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

uint64_t os_log_shim_legacy_logging_enabled()
{
  return _os_log_shim_legacy_logging_enabled();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

id objc_msgSend_GUID(void *a1, const char *a2, ...)
{
  return _[a1 GUID];
}

id objc_msgSend_ID(void *a1, const char *a2, ...)
{
  return _[a1 ID];
}

id objc_msgSend_IDSDeviceSupportsIncomingSMSRelayFilteringForDeviceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IDSDeviceSupportsIncomingSMSRelayFilteringForDeviceType:");
}

id objc_msgSend_IMCountryCodeForPhoneNumber_simID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IMCountryCodeForPhoneNumber:simID:");
}

id objc_msgSend_IMMMSEmailAddressToMatchForPhoneNumber_simID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IMMMSEmailAddressToMatchForPhoneNumber:simID:");
}

id objc_msgSend_IMMMSEnabledForPhoneNumber_simID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IMMMSEnabledForPhoneNumber:simID:");
}

id objc_msgSend_IMMMSGroupTextOnlyMessagesSendAsMMSForPhoneNumber_simID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IMMMSGroupTextOnlyMessagesSendAsMMSForPhoneNumber:simID:");
}

id objc_msgSend_IMMMSGroupTextReplicationSupportedForPhoneNumber_simID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IMMMSGroupTextReplicationSupportedForPhoneNumber:simID:");
}

id objc_msgSend_IMMMSGroupTextReplicationSupportsSMILContentLocationForPhoneNumber_simID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IMMMSGroupTextReplicationSupportsSMILContentLocationForPhoneNumber:simID:");
}

id objc_msgSend_IMMMSMaxRecipientsForPhoneNumber_simID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IMMMSMaxRecipientsForPhoneNumber:simID:");
}

id objc_msgSend_IMMMSMaximumMessageByteCountForPhoneNumber_simID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IMMMSMaximumMessageByteCountForPhoneNumber:simID:");
}

id objc_msgSend_IMReadMMSUserOverrideForPhoneNumber_simID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IMReadMMSUserOverrideForPhoneNumber:simID:");
}

id objc_msgSend_IMSynchronizeMMSCapabilityToWatch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IMSynchronizeMMSCapabilityToWatch:");
}

id objc_msgSend_IMSynchronizePreferredSubscriptionMMSCapabilityToWatch(void *a1, const char *a2, ...)
{
  return _[a1 IMSynchronizePreferredSubscriptionMMSCapabilityToWatch];
}

id objc_msgSend_MIMETypeOfPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "MIMETypeOfPath:");
}

id objc_msgSend_SHA256HexString(void *a1, const char *a2, ...)
{
  return _[a1 SHA256HexString];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTITypeOfPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UTITypeOfPath:");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__FTCopyGzippedData(void *a1, const char *a2, ...)
{
  return _[a1 _FTCopyGzippedData];
}

id objc_msgSend__FTDataFromHexString(void *a1, const char *a2, ...)
{
  return _[a1 _FTDataFromHexString];
}

id objc_msgSend__FTOptionallyDecompressData(void *a1, const char *a2, ...)
{
  return _[a1 _FTOptionallyDecompressData];
}

id objc_msgSend__IDSDataFromBase64String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_IDSDataFromBase64String:");
}

id objc_msgSend___imArrayByApplyingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__imArrayByApplyingBlock:");
}

id objc_msgSend___imFirstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__imFirstObject");
}

id objc_msgSend___imHexString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__imHexString");
}

id objc_msgSend___imSetFromArray(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__imSetFromArray");
}

id objc_msgSend___im_attributedStringByAssigningMessagePartNumbers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__im_attributedStringByAssigningMessagePartNumbers");
}

id objc_msgSend___im_attributedStringByReplacingAdaptiveImageGlyphFileTransfersUsingFileTransferProvider_replacementTextProvider_removedTransferGUIDsOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__im_attributedStringByReplacingAdaptiveImageGlyphFileTransfersUsingFileTransferProvider:replacementTextProvider:removedTransferGUIDsOut:");
}

id objc_msgSend___im_attributedStringWithFileTransfers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__im_attributedStringWithFileTransfers:");
}

id objc_msgSend___im_contactPreferredSubscriptionContextForChatHandleIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__im_contactPreferredSubscriptionContextForChatHandleIDs:");
}

id objc_msgSend___im_containsPhoneNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__im_containsPhoneNumber:");
}

id objc_msgSend___im_enumerateAdaptiveImageGlyphFileTransfersUsingFileTransferProvider_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__im_enumerateAdaptiveImageGlyphFileTransfersUsingFileTransferProvider:block:");
}

id objc_msgSend___im_iMessageDateFromTimeStamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__im_iMessageDateFromTimeStamp:");
}

id objc_msgSend___im_subscriptionContextForForSimID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__im_subscriptionContextForForSimID:");
}

id objc_msgSend___im_subscriptionContextForForSimID_phoneNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__im_subscriptionContextForForSimID:phoneNumber:");
}

id objc_msgSend___im_subscriptionContextOrDefaultForForSlotID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__im_subscriptionContextOrDefaultForForSlotID:");
}

id objc_msgSend__acceptIncomingPushes(void *a1, const char *a2, ...)
{
  return _[a1 _acceptIncomingPushes];
}

id objc_msgSend__addAttachmentPartWithSource_toContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addAttachmentPartWithSource:toContext:");
}

id objc_msgSend__addDefaultPairedDeviceToAllowedSMSRelayList(void *a1, const char *a2, ...)
{
  return _[a1 _addDefaultPairedDeviceToAllowedSMSRelayList];
}

id objc_msgSend__addDeviceToAllowedSMSRelay_shouldSendApproval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addDeviceToAllowedSMSRelay:shouldSendApproval:");
}

id objc_msgSend__addDeviceToChallengedSMSRelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addDeviceToChallengedSMSRelay:");
}

id objc_msgSend__addOriginatedMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addOriginatedMessage:");
}

id objc_msgSend__addPart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addPart:");
}

id objc_msgSend__allowedDevicesforSMSRelay(void *a1, const char *a2, ...)
{
  return _[a1 _allowedDevicesforSMSRelay];
}

id objc_msgSend__allowedIDSDevicesforSMSRelay(void *a1, const char *a2, ...)
{
  return _[a1 _allowedIDSDevicesforSMSRelay];
}

id objc_msgSend__allowedToGeneratePreviewForTransfer_smsMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_allowedToGeneratePreviewForTransfer:smsMessage:");
}

id objc_msgSend__allowedToSendMessage_toChatIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_allowedToSendMessage:toChatIdentifier:");
}

id objc_msgSend__appearsToBeEmail(void *a1, const char *a2, ...)
{
  return _[a1 _appearsToBeEmail];
}

id objc_msgSend__appearsToBePhoneNumber(void *a1, const char *a2, ...)
{
  return _[a1 _appearsToBePhoneNumber];
}

id objc_msgSend__approveSelfForSMSRelay(void *a1, const char *a2, ...)
{
  return _[a1 _approveSelfForSMSRelay];
}

id objc_msgSend__areAllParticipantsUnknown_fromSender_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_areAllParticipantsUnknown:fromSender:");
}

id objc_msgSend__areiMessageAndiCloudAccountTheSame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_areiMessageAndiCloudAccountTheSame:");
}

id objc_msgSend__buildCTPhoneNumberWithParticipantInfo_ctMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildCTPhoneNumberWithParticipantInfo:ctMessage:");
}

id objc_msgSend__callerIDAccountFromSettings(void *a1, const char *a2, ...)
{
  return _[a1 _callerIDAccountFromSettings];
}

id objc_msgSend__callerIDForChatWithChatIdentifier_chatStyle_foundChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_callerIDForChatWithChatIdentifier:chatStyle:foundChat:");
}

id objc_msgSend__callerIDForRelay(void *a1, const char *a2, ...)
{
  return _[a1 _callerIDForRelay];
}

id objc_msgSend__callerIDUsingFromIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_callerIDUsingFromIdentifier:");
}

id objc_msgSend__canRelayMMS(void *a1, const char *a2, ...)
{
  return _[a1 _canRelayMMS];
}

id objc_msgSend__canSendWithCallerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canSendWithCallerID:");
}

id objc_msgSend__carrierReportJunkMetricsForSMSWithSubject_isGroupchat_hasAttachments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_carrierReportJunkMetricsForSMSWithSubject:isGroupchat:hasAttachments:");
}

id objc_msgSend__categorizeRelayMessageWithCategory_subCategory_deviceID_shouldRegister_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_categorizeRelayMessageWithCategory:subCategory:deviceID:shouldRegister:completion:");
}

id objc_msgSend__challengedDevicesforSMSRelay(void *a1, const char *a2, ...)
{
  return _[a1 _challengedDevicesforSMSRelay];
}

id objc_msgSend__chatForSendingMessageItem_chatIdentifier_chatStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_chatForSendingMessageItem:chatIdentifier:chatStyle:");
}

id objc_msgSend__chatsForDeleteAndRecoveryChatMetadataDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_chatsForDeleteAndRecoveryChatMetadataDictionary:");
}

id objc_msgSend__checkAndSetRelayService(void *a1, const char *a2, ...)
{
  return _[a1 _checkAndSetRelayService];
}

id objc_msgSend__checkAndUpdateSMSFilteringSettingsForDeviceID_smsFilterCapabilitiesOptions_filterExtensionName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkAndUpdateSMSFilteringSettingsForDeviceID:smsFilterCapabilitiesOptions:filterExtensionName:");
}

id objc_msgSend__checkIfMessageIsSpam_fromSender_withGuid_shouldRegister_receiverISOCountryCode_receivedViaRelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkIfMessageIsSpam:fromSender:withGuid:shouldRegister:receiverISOCountryCode:receivedViaRelay:");
}

id objc_msgSend__checkMMSEnablementForPhoneNumber_simID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkMMSEnablementForPhoneNumber:simID:");
}

id objc_msgSend__clearInactivityTimer(void *a1, const char *a2, ...)
{
  return _[a1 _clearInactivityTimer];
}

id objc_msgSend__clearMapForMessageGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearMapForMessageGUID:");
}

id objc_msgSend__clearPendingIncomingMessageQueue(void *a1, const char *a2, ...)
{
  return _[a1 _clearPendingIncomingMessageQueue];
}

id objc_msgSend__clearSMSRelayMapForMessageWithGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearSMSRelayMapForMessageWithGUID:");
}

id objc_msgSend__clearSpamMapForMessageGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearSpamMapForMessageGUID:");
}

id objc_msgSend__clearTimoutTimerForRelayMessageID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearTimoutTimerForRelayMessageID:");
}

id objc_msgSend__compatibleMessageToSendForMessageItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_compatibleMessageToSendForMessageItem:");
}

id objc_msgSend__completionBlockForMessageGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_completionBlockForMessageGUID:");
}

id objc_msgSend__convertCTMessagePartToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_convertCTMessagePartToDictionary:");
}

id objc_msgSend__convertCTMessageToDictionary_requiresUpload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_convertCTMessageToDictionary:requiresUpload:");
}

id objc_msgSend__convertIMMessageItemDictionaryToIMMessageItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_convertIMMessageItemDictionaryToIMMessageItem:");
}

id objc_msgSend__convertIMMessageItemToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_convertIMMessageItemToDictionary:");
}

id objc_msgSend__copyMessageDictionaryForLogging(void *a1, const char *a2, ...)
{
  return _[a1 _copyMessageDictionaryForLogging];
}

id objc_msgSend__countryCodeForIncomingTextMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_countryCodeForIncomingTextMessage:");
}

id objc_msgSend__createNewChatIdentifierFromChatIdentifier_andCategoryLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createNewChatIdentifierFromChatIdentifier:andCategoryLabel:");
}

id objc_msgSend__deferredReplicatedMessageReleaseWithAllowedMessage_outgoingProxyBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deferredReplicatedMessageReleaseWithAllowedMessage:outgoingProxyBlock:");
}

id objc_msgSend__destinationForDevice_forcedIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_destinationForDevice:forcedIdentity:");
}

id objc_msgSend__deviceAllowedToDisableRelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deviceAllowedToDisableRelay:");
}

id objc_msgSend__deviceForCallerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deviceForCallerID:");
}

id objc_msgSend__disableScreenTimeRestrictionsForMessageItem_chat_watchSendsOverCellular_emergencyNumbersFoundInRecipients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_disableScreenTimeRestrictionsForMessageItem:chat:watchSendsOverCellular:emergencyNumbersFoundInRecipients:");
}

id objc_msgSend__disableSpamFiltering(void *a1, const char *a2, ...)
{
  return _[a1 _disableSpamFiltering];
}

id objc_msgSend__disableSpamFilteringAndRelay(void *a1, const char *a2, ...)
{
  return _[a1 _disableSpamFilteringAndRelay];
}

id objc_msgSend__doClearChats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_doClearChats:");
}

id objc_msgSend__dominentPhoneNumberAlias(void *a1, const char *a2, ...)
{
  return _[a1 _dominentPhoneNumberAlias];
}

id objc_msgSend__enableSMSRelayForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enableSMSRelayForDevice:");
}

id objc_msgSend__enableSpamFiltering(void *a1, const char *a2, ...)
{
  return _[a1 _enableSpamFiltering];
}

id objc_msgSend__enqueueBlock_withTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enqueueBlock:withTimeout:");
}

id objc_msgSend__executeSMSRelayBlockForMessageWithGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_executeSMSRelayBlockForMessageWithGUID:");
}

id objc_msgSend__executeSMSRelayBlockForMessageWithGUID_category_subCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_executeSMSRelayBlockForMessageWithGUID:category:subCategory:");
}

id objc_msgSend__executeSpamCompletionBlockForMessageGuid_category_subCategory_shouldRegister_receivedViaRelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_executeSpamCompletionBlockForMessageGuid:category:subCategory:shouldRegister:receivedViaRelay:");
}

id objc_msgSend__existingStoredMessageWithCompletedTransfersForMessageGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_existingStoredMessageWithCompletedTransfersForMessageGUID:");
}

id objc_msgSend__extractSMSSenderAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractSMSSenderAddress:");
}

id objc_msgSend__failureBlockForMessageGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_failureBlockForMessageGUID:");
}

id objc_msgSend__finishSendingMessageItem_chatIdentifier_chatStyle_foundChat_didSendSMS_attemptingReplication_shouldForceFail_watchSendsOverCellular_forceReflection_callerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_finishSendingMessageItem:chatIdentifier:chatStyle:foundChat:didSendSMS:attemptingReplication:shouldForceFail:watchSendsOverCellular:forceReflection:callerID:");
}

id objc_msgSend__fixIncomingDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fixIncomingDate:");
}

id objc_msgSend__forwardMessageToPeers_messageType_guid_originalSender_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_forwardMessageToPeers:messageType:guid:originalSender:");
}

id objc_msgSend__forwardMessageToPeers_messageType_guid_originalSender_hasAttachment_watchOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_forwardMessageToPeers:messageType:guid:originalSender:hasAttachment:watchOnly:");
}

id objc_msgSend__forwardMessageToPeers_messageType_guid_originalSender_watchOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_forwardMessageToPeers:messageType:guid:originalSender:watchOnly:");
}

id objc_msgSend__generateMessageIDForMessageGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateMessageIDForMessageGUID:");
}

id objc_msgSend__generateMessageIDForMessageGUID_completionBlock_failureBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateMessageIDForMessageGUID:completionBlock:failureBlock:");
}

id objc_msgSend__generatePreviewForTransfer_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generatePreviewForTransfer:message:");
}

id objc_msgSend__getSpamExtensionID(void *a1, const char *a2, ...)
{
  return _[a1 _getSpamExtensionID];
}

id objc_msgSend__getSpamExtensionName(void *a1, const char *a2, ...)
{
  return _[a1 _getSpamExtensionName];
}

id objc_msgSend__getStorageDictionaryUsingMsgDict_requiresUpload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getStorageDictionaryUsingMsgDict:requiresUpload:");
}

id objc_msgSend__handleDeleteCommandWithMessageDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleDeleteCommandWithMessageDictionary:");
}

id objc_msgSend__hasPeerDevices(void *a1, const char *a2, ...)
{
  return _[a1 _hasPeerDevices];
}

id objc_msgSend__hasPhoneNumberAliasActive(void *a1, const char *a2, ...)
{
  return _[a1 _hasPhoneNumberAliasActive];
}

id objc_msgSend__hasRelayDevice(void *a1, const char *a2, ...)
{
  return _[a1 _hasRelayDevice];
}

id objc_msgSend__iMessageCapabilityForSIMID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_iMessageCapabilityForSIMID:");
}

id objc_msgSend__ignoreIncomingPushes(void *a1, const char *a2, ...)
{
  return _[a1 _ignoreIncomingPushes];
}

id objc_msgSend__isAliasActiveForSMSRelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isAliasActiveForSMSRelay:");
}

id objc_msgSend__isConnectedOverBT_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isConnectedOverBT:");
}

id objc_msgSend__isDefaultPairedDeviceRelayingLocally_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isDefaultPairedDeviceRelayingLocally:");
}

id objc_msgSend__isDeviceATrustedHSA2Device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isDeviceATrustedHSA2Device:");
}

id objc_msgSend__isMessageCategorized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isMessageCategorized:");
}

id objc_msgSend__isOneOfMyActiveAlias_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isOneOfMyActiveAlias:");
}

id objc_msgSend__isSpamFilteringEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _isSpamFilteringEnabled];
}

id objc_msgSend__joinOneToOneChatWithChatIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_joinOneToOneChatWithChatIdentifier:");
}

id objc_msgSend__localDeviceSupportsSMS(void *a1, const char *a2, ...)
{
  return _[a1 _localDeviceSupportsSMS];
}

id objc_msgSend__localDeviceSupportsSMSAndDoesNotHaveAPhoneNumberForSIMID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_localDeviceSupportsSMSAndDoesNotHaveAPhoneNumberForSIMID:");
}

id objc_msgSend__localizedBackwardsCompatibleExpressiveSendText(void *a1, const char *a2, ...)
{
  return _[a1 _localizedBackwardsCompatibleExpressiveSendText];
}

id objc_msgSend__markFromStorageIfNeeded_messageGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_markFromStorageIfNeeded:messageGUID:");
}

id objc_msgSend__messageDictionaryToRelayWithIncomingMessageDictionary_smsMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_messageDictionaryToRelayWithIncomingMessageDictionary:smsMessage:");
}

id objc_msgSend__messageGUIDForMessageID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_messageGUIDForMessageID:");
}

id objc_msgSend__messageReplayObjectWithService_account_incomingData_fromID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_messageReplayObjectWithService:account:incomingData:fromID:");
}

id objc_msgSend__messageReplayObjectWithService_account_incomingTopLevelMessage_fromID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_messageReplayObjectWithService:account:incomingTopLevelMessage:fromID:");
}

id objc_msgSend__migrateSMSRelayForMICIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _migrateSMSRelayForMICIfNeeded];
}

id objc_msgSend__myCTPhoneNumber(void *a1, const char *a2, ...)
{
  return _[a1 _myCTPhoneNumber];
}

id objc_msgSend__newFeatureRequiredByMessageItem_chatIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newFeatureRequiredByMessageItem:chatIdentifier:");
}

id objc_msgSend__newSMSFilteringSettingsDictForFilterState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newSMSFilteringSettingsDictForFilterState:");
}

id objc_msgSend__noteDeviceHasMICForSMSRelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_noteDeviceHasMICForSMSRelay:");
}

id objc_msgSend__numberForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_numberForKey:");
}

id objc_msgSend__numberOfRepliesFor_fallbackFilterCategory_fallbackFilterSubCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_numberOfRepliesFor:fallbackFilterCategory:fallbackFilterSubCategory:");
}

id objc_msgSend__periodicReplicationTimeInterval(void *a1, const char *a2, ...)
{
  return _[a1 _periodicReplicationTimeInterval];
}

id objc_msgSend__plainTextPartWithString_index_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_plainTextPartWithString:index:");
}

id objc_msgSend__prepareSMSRelayBlockForMessageDictionary_messageGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareSMSRelayBlockForMessageDictionary:messageGUID:");
}

id objc_msgSend__processMessageSendFailure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processMessageSendFailure:");
}

id objc_msgSend__processMessageSendFailureID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processMessageSendFailureID:");
}

id objc_msgSend__processMessageSent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processMessageSent:");
}

id objc_msgSend__processMessageSentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processMessageSentID:");
}

id objc_msgSend__processMessagesForRelayIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _processMessagesForRelayIfNeeded];
}

id objc_msgSend__processReceivedDictionary_storageContext_receivedViaRelay_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processReceivedDictionary:storageContext:receivedViaRelay:withCompletionBlock:");
}

id objc_msgSend__processReceivedSMSFilteringSettingsDictionary_deviceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processReceivedSMSFilteringSettingsDictionary:deviceID:");
}

id objc_msgSend__processReceivedSMSFilteringSettingsDictionaryInBlastDoor_deviceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processReceivedSMSFilteringSettingsDictionaryInBlastDoor:deviceID:");
}

id objc_msgSend__processReceivedSMSFilteringSettingsMessage_deviceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processReceivedSMSFilteringSettingsMessage:deviceID:");
}

id objc_msgSend__processSMSorMMSMessageReceivedWithContext_messageID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processSMSorMMSMessageReceivedWithContext:messageID:");
}

id objc_msgSend__readMMSUserOverrideForSingleSubscription(void *a1, const char *a2, ...)
{
  return _[a1 _readMMSUserOverrideForSingleSubscription];
}

id objc_msgSend__receivedSMSDictionary_requiresUpload_isBeingReplayed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedSMSDictionary:requiresUpload:isBeingReplayed:");
}

id objc_msgSend__registerForAccountChanges(void *a1, const char *a2, ...)
{
  return _[a1 _registerForAccountChanges];
}

id objc_msgSend__registerForCTNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _registerForCTNotifications];
}

id objc_msgSend__registerForIncomingMessages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerForIncomingMessages:");
}

id objc_msgSend__registerMessageGUID_completionBlock_failureBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerMessageGUID:completionBlock:failureBlock:");
}

id objc_msgSend__relayCurrentSMSFilteringSettings(void *a1, const char *a2, ...)
{
  return _[a1 _relayCurrentSMSFilteringSettings];
}

id objc_msgSend__relayMessage_chat_didSendSMS_attemptingReplication_forceReflection_relayToWatchOnly_shouldDisableScreenTimeRestrictions_callerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_relayMessage:chat:didSendSMS:attemptingReplication:forceReflection:relayToWatchOnly:shouldDisableScreenTimeRestrictions:callerID:");
}

id objc_msgSend__relaySMSFilteringSettingsForFilterState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_relaySMSFilteringSettingsForFilterState:");
}

id objc_msgSend__releasePendingMessagesAndProcessReceivedSMSMessage_storageContext_receivedViaRelay_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_releasePendingMessagesAndProcessReceivedSMSMessage:storageContext:receivedViaRelay:completionBlock:");
}

id objc_msgSend__removeDeviceFromAllowedSMSRelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeDeviceFromAllowedSMSRelay:");
}

id objc_msgSend__removeDeviceHasMICForSMSRelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeDeviceHasMICForSMSRelay:");
}

id objc_msgSend__removeOriginatedMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeOriginatedMessage:");
}

id objc_msgSend__replicateMessage_chatIdentifier_chatStyle_lastKnownReplicationDate_callerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_replicateMessage:chatIdentifier:chatStyle:lastKnownReplicationDate:callerID:");
}

id objc_msgSend__replicatedMessageGUIDToReleaseFromMessageDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_replicatedMessageGUIDToReleaseFromMessageDictionary:");
}

id objc_msgSend__replicationDisabledByServerBag(void *a1, const char *a2, ...)
{
  return _[a1 _replicationDisabledByServerBag];
}

id objc_msgSend__replicationRequiredForFeaturesUsedByMessageBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_replicationRequiredForFeaturesUsedByMessageBody:");
}

id objc_msgSend__replicationRequiredForFeaturesUsedByMessageItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_replicationRequiredForFeaturesUsedByMessageItem:");
}

id objc_msgSend__replicationRequirementsSatisfiedForPhoneNumber_simID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_replicationRequirementsSatisfiedForPhoneNumber:simID:");
}

id objc_msgSend__resetAndBroadcastBlackholeErrorStateIfNeededForChatIdentifier_chatStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetAndBroadcastBlackholeErrorStateIfNeededForChatIdentifier:chatStyle:");
}

id objc_msgSend__scheduleSchoolModeTimer(void *a1, const char *a2, ...)
{
  return _[a1 _scheduleSchoolModeTimer];
}

id objc_msgSend__sendFileURL_forMessageGUID_attachmentIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendFileURL:forMessageGUID:attachmentIndex:");
}

id objc_msgSend__sendMessageToAllSMSRelayDevicesWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendMessageToAllSMSRelayDevicesWithOptions:");
}

id objc_msgSend__sendMessageToPairedDeviceWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendMessageToPairedDeviceWithOptions:");
}

id objc_msgSend__sendPinCodeToDeviceAndPromptForResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendPinCodeToDeviceAndPromptForResponse:");
}

id objc_msgSend__sendingDecisionForMessageItem_callerID_chat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendingDecisionForMessageItem:callerID:chat:");
}

id objc_msgSend__service_account_incomingData_fromID_context_isBeingReplayed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_service:account:incomingData:fromID:context:isBeingReplayed:");
}

id objc_msgSend__service_account_incomingTopLevelMessage_fromID_messageContext_isBeingReplayed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_service:account:incomingTopLevelMessage:fromID:messageContext:isBeingReplayed:");
}

id objc_msgSend__setClearMessageSendTimer(void *a1, const char *a2, ...)
{
  return _[a1 _setClearMessageSendTimer];
}

id objc_msgSend__setContentIDAndLocationForSMILPart_messageGUID_isGroupChat_phoneNumber_simID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContentIDAndLocationForSMILPart:messageGUID:isGroupChat:phoneNumber:simID:");
}

id objc_msgSend__setLocalURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setLocalURL:");
}

id objc_msgSend__setNeedsWrapper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setNeedsWrapper:");
}

id objc_msgSend__setTimeoutTimerForRelayMessageID_timeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTimeoutTimerForRelayMessageID:timeout:");
}

id objc_msgSend__setUpRelay(void *a1, const char *a2, ...)
{
  return _[a1 _setUpRelay];
}

id objc_msgSend__shouldAutoEnableDevicesforSMSRelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldAutoEnableDevicesforSMSRelay:");
}

id objc_msgSend__shouldCheckChatForSMSSpam_shouldRegister_participants_sender_fallbackFilterCategory_fallbackFilterSubCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldCheckChatForSMSSpam:shouldRegister:participants:sender:fallbackFilterCategory:fallbackFilterSubCategory:");
}

id objc_msgSend__shouldFailSMSMessageForTesting_chatIdentifier_chatStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldFailSMSMessageForTesting:chatIdentifier:chatStyle:");
}

id objc_msgSend__shouldForceReplicationForStaleChatWithLastKnownReplicationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldForceReplicationForStaleChatWithLastKnownReplicationDate:");
}

id objc_msgSend__shouldReplicateMessageItem_chatStyle_lastKnownReplicationDate_callerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldReplicateMessageItem:chatStyle:lastKnownReplicationDate:callerID:");
}

id objc_msgSend__shouldUploadToMMCS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldUploadToMMCS:");
}

id objc_msgSend__sizeLimitsForTransfer_bigSize_smallSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sizeLimitsForTransfer:bigSize:smallSize:");
}

id objc_msgSend__smsSpamCheck_withMessageBody_withGuid_sender_shouldRegister_receiverISOCountryCode_receivedViaRelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_smsSpamCheck:withMessageBody:withGuid:sender:shouldRegister:receiverISOCountryCode:receivedViaRelay:");
}

id objc_msgSend__sosReplicationDisabledByServerBag(void *a1, const char *a2, ...)
{
  return _[a1 _sosReplicationDisabledByServerBag];
}

id objc_msgSend__storeSMSRelayExecutionBlock_forMessageGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_storeSMSRelayExecutionBlock:forMessageGUID:");
}

id objc_msgSend__storeSpamCompletionBlock_forMessageGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_storeSpamCompletionBlock:forMessageGUID:");
}

id objc_msgSend__stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stringForKey:");
}

id objc_msgSend__stripFZIDPrefix(void *a1, const char *a2, ...)
{
  return _[a1 _stripFZIDPrefix];
}

id objc_msgSend__synchronizeMMSCapabilityToWatch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_synchronizeMMSCapabilityToWatch:");
}

id objc_msgSend__unregisterForCTNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _unregisterForCTNotifications];
}

id objc_msgSend__updateCategoryForChat_andMessage_category_subCategory_shouldRegister_spamExtensionName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateCategoryForChat:andMessage:category:subCategory:shouldRegister:spamExtensionName:");
}

id objc_msgSend__updateFilterParamsForFilterExtension(void *a1, const char *a2, ...)
{
  return _[a1 _updateFilterParamsForFilterExtension];
}

id objc_msgSend__updateLastAddressedIDsIfNeededForChatWithIdentifier_style_lastAddressedHandle_lastAddressedSIMID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLastAddressedIDsIfNeededForChatWithIdentifier:style:lastAddressedHandle:lastAddressedSIMID:");
}

id objc_msgSend__updateLastAddressedIDsIfNeededForChatWithIdentifier_style_lastAddressedHandle_lastAddressedSIMID_iMessageCapability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLastAddressedIDsIfNeededForChatWithIdentifier:style:lastAddressedHandle:lastAddressedSIMID:iMessageCapability:");
}

id objc_msgSend__updateListenerIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _updateListenerIfNeeded];
}

id objc_msgSend__updatePhoneNumberCallerID(void *a1, const char *a2, ...)
{
  return _[a1 _updatePhoneNumberCallerID];
}

id objc_msgSend__updateRelayStatus(void *a1, const char *a2, ...)
{
  return _[a1 _updateRelayStatus];
}

id objc_msgSend__updateShouldForceToSMSForChatWithIdentifier_style_shouldForceToSMS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateShouldForceToSMSForChatWithIdentifier:style:shouldForceToSMS:");
}

id objc_msgSend__updateSpamFilteringState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSpamFilteringState:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_acceptTransfer_path_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptTransfer:path:");
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_account_capabilitiesChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "account:capabilitiesChanged:");
}

id objc_msgSend_account_chat_style_chatProperties_messageUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "account:chat:style:chatProperties:messageUpdated:");
}

id objc_msgSend_accountDefaults(void *a1, const char *a2, ...)
{
  return _[a1 accountDefaults];
}

id objc_msgSend_accountForAlias_fromAccounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountForAlias:fromAccounts:");
}

id objc_msgSend_accountHasAlias_aliastoCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountHasAlias:aliastoCheck:");
}

id objc_msgSend_accountID(void *a1, const char *a2, ...)
{
  return _[a1 accountID];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return _[a1 accountType];
}

id objc_msgSend_accountWithUniqueID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountWithUniqueID:");
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return _[a1 accounts];
}

id objc_msgSend_acknowledgeIncomingMessageWithId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acknowledgeIncomingMessageWithId:");
}

id objc_msgSend_acknowledgeOutgoingMessageWithId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acknowledgeOutgoingMessageWithId:");
}

id objc_msgSend_acquireAssertionToUnsuspendProcess(void *a1, const char *a2, ...)
{
  return _[a1 acquireAssertionToUnsuspendProcess];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return _[a1 action];
}

id objc_msgSend_addAttachmentPart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttachmentPart:");
}

id objc_msgSend_addBlock_withTimeout_forKey_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addBlock:withTimeout:forKey:description:");
}

id objc_msgSend_addDefaultGatekeeperPropertiesToDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDefaultGatekeeperPropertiesToDirectory:");
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDelegate:queue:");
}

id objc_msgSend_addEmailRecipient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEmailRecipient:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addListener_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addListener:");
}

id objc_msgSend_addMessagePlainTextToTelephonyMessages_messageItem_processedMessageItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMessagePlainTextToTelephonyMessages:messageItem:processedMessageItem:");
}

id objc_msgSend_addMessagesID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMessagesID:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addPart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPart:");
}

id objc_msgSend_addPhoneRecipient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPhoneRecipient:");
}

id objc_msgSend_addRegistrationDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRegistrationDelegate:queue:");
}

id objc_msgSend_addText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addText:");
}

id objc_msgSend_addTextPart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTextPart:");
}

id objc_msgSend_addUserNotification_listener_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addUserNotification:listener:completionHandler:");
}

id objc_msgSend_aliases(void *a1, const char *a2, ...)
{
  return _[a1 aliases];
}

id objc_msgSend_allExistingChatsWithIdentifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allExistingChatsWithIdentifier:style:");
}

id objc_msgSend_allExistingSupportedServiceChatsWithIdentifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allExistingSupportedServiceChatsWithIdentifier:style:");
}

id objc_msgSend_allIncomingMessages(void *a1, const char *a2, ...)
{
  return _[a1 allIncomingMessages];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allKeysForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeysForObject:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_anySessionForServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anySessionForServiceName:");
}

id objc_msgSend_appNameAndBundleIDFoURL_outAppName_outBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appNameAndBundleIDFoURL:outAppName:outBundleID:");
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendAttributedString:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendInlineImageWithGUID_filename_width_height_isAnimoji_isAdaptiveImageGlyph_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendInlineImageWithGUID:filename:width:height:isAnimoji:isAdaptiveImageGlyph:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_appendText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendText:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByApplyingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByApplyingSelector:");
}

id objc_msgSend_arrayForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayForKey:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assignTransfer_toAccount_otherPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assignTransfer:toAccount:otherPerson:");
}

id objc_msgSend_associatedMessageGUID(void *a1, const char *a2, ...)
{
  return _[a1 associatedMessageGUID];
}

id objc_msgSend_associatedMessageType(void *a1, const char *a2, ...)
{
  return _[a1 associatedMessageType];
}

id objc_msgSend_attachment(void *a1, const char *a2, ...)
{
  return _[a1 attachment];
}

id objc_msgSend_attachmentController(void *a1, const char *a2, ...)
{
  return _[a1 attachmentController];
}

id objc_msgSend_attachmentParts(void *a1, const char *a2, ...)
{
  return _[a1 attachmentParts];
}

id objc_msgSend_attribute_atIndex_effectiveRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attribute:atIndex:effectiveRange:");
}

id objc_msgSend_attributedSubstringFromRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributedSubstringFromRange:");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_balloonBundleID(void *a1, const char *a2, ...)
{
  return _[a1 balloonBundleID];
}

id objc_msgSend_bestCandidateGroupChatWithFromIdentifier_toIdentifier_displayName_participants_groupID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bestCandidateGroupChatWithFromIdentifier:toIdentifier:displayName:participants:groupID:");
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return _[a1 body];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_broadcaster(void *a1, const char *a2, ...)
{
  return _[a1 broadcaster];
}

id objc_msgSend_broadcasterForChatListeners(void *a1, const char *a2, ...)
{
  return _[a1 broadcasterForChatListeners];
}

id objc_msgSend_buildTelephonyPhoneNumbersForTelephonyMessages_shouldBroadcastMessage_handles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildTelephonyPhoneNumbersForTelephonyMessages:shouldBroadcastMessage:handles:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_calculateFallbackHashFragmentFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calculateFallbackHashFragmentFor:");
}

id objc_msgSend_canSend(void *a1, const char *a2, ...)
{
  return _[a1 canSend];
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:selector:object:");
}

id objc_msgSend_canonicalFormat(void *a1, const char *a2, ...)
{
  return _[a1 canonicalFormat];
}

id objc_msgSend_canonicalizeChatIdentifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canonicalizeChatIdentifier:style:");
}

id objc_msgSend_capabilities(void *a1, const char *a2, ...)
{
  return _[a1 capabilities];
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_characterIsMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterIsMember:");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_chat(void *a1, const char *a2, ...)
{
  return _[a1 chat];
}

id objc_msgSend_chatForChatIdentifier_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chatForChatIdentifier:style:");
}

id objc_msgSend_chatForMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chatForMessage:");
}

id objc_msgSend_chatIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 chatIdentifier];
}

id objc_msgSend_chatRegistry(void *a1, const char *a2, ...)
{
  return _[a1 chatRegistry];
}

id objc_msgSend_chatStyle(void *a1, const char *a2, ...)
{
  return _[a1 chatStyle];
}

id objc_msgSend_cleanUnformattedPhoneNumber_countryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanUnformattedPhoneNumber:countryCode:");
}

id objc_msgSend_cloudKitSyncingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 cloudKitSyncingEnabled];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_commandToHandlerBlock(void *a1, const char *a2, ...)
{
  return _[a1 commandToHandlerBlock];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_compressFileTransfer_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compressFileTransfer:completionBlock:");
}

id objc_msgSend_conformsToType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToType:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsObjectIdenticalTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObjectIdenticalTo:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _[a1 content];
}

id objc_msgSend_contentBody(void *a1, const char *a2, ...)
{
  return _[a1 contentBody];
}

id objc_msgSend_contentData(void *a1, const char *a2, ...)
{
  return _[a1 contentData];
}

id objc_msgSend_contentId(void *a1, const char *a2, ...)
{
  return _[a1 contentId];
}

id objc_msgSend_contentLocation(void *a1, const char *a2, ...)
{
  return _[a1 contentLocation];
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return _[a1 contentType];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_coordinateReadingItemAtURL_options_error_byAccessor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coordinateReadingItemAtURL:options:error:byAccessor:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyForBackwardsCompatibility(void *a1, const char *a2, ...)
{
  return _[a1 copyForBackwardsCompatibility];
}

id objc_msgSend_copyHandlersForEnumerating(void *a1, const char *a2, ...)
{
  return _[a1 copyHandlersForEnumerating];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return _[a1 countryCode];
}

id objc_msgSend_createHandleInfoForParticipants_unformattedIDs_countryCodes_isGroupChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createHandleInfoForParticipants:unformattedIDs:countryCodes:isGroupChat:");
}

id objc_msgSend_createNewOutgoingTransferWithLocalFileURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createNewOutgoingTransferWithLocalFileURL:");
}

id objc_msgSend_ctPhoneNumber(void *a1, const char *a2, ...)
{
  return _[a1 ctPhoneNumber];
}

id objc_msgSend_ctSubscriptionInfo(void *a1, const char *a2, ...)
{
  return _[a1 ctSubscriptionInfo];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataValue(void *a1, const char *a2, ...)
{
  return _[a1 dataValue];
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:");
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultHFSFileManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultHFSFileManager];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_deleteCharactersInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteCharactersInRange:");
}

id objc_msgSend_deleteChatsForCommandDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteChatsForCommandDictionary:");
}

id objc_msgSend_deleteCommandDictionaryWithIncomingDictionary_inferredRecoverableDeleteForLegacyCommandsWithDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteCommandDictionaryWithIncomingDictionary:inferredRecoverableDeleteForLegacyCommandsWithDate:");
}

id objc_msgSend_deleteMessagePartsForCommandDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteMessagePartsForCommandDictionary:");
}

id objc_msgSend_deleteMessagesForCommandDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteMessagesForCommandDictionary:");
}

id objc_msgSend_deleteMessagesWithChatIdentifiers_style_onServices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteMessagesWithChatIdentifiers:style:onServices:");
}

id objc_msgSend_deriveConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 deriveConfiguration];
}

id objc_msgSend_destinationCallerID(void *a1, const char *a2, ...)
{
  return _[a1 destinationCallerID];
}

id objc_msgSend_deviceIsLockedDown(void *a1, const char *a2, ...)
{
  return _[a1 deviceIsLockedDown];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _[a1 deviceType];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return _[a1 devices];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryValue(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryValue];
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_didChangeMemberStatus_forHandle_fromHandle_unformattedNumber_countryCode_forChat_style_account_destinationCallerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didChangeMemberStatus:forHandle:fromHandle:unformattedNumber:countryCode:forChat:style:account:destinationCallerID:");
}

id objc_msgSend_didJoinChat_style_displayName_groupID_handleInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didJoinChat:style:displayName:groupID:handleInfo:");
}

id objc_msgSend_didJoinChat_style_displayName_groupID_lastAddressedHandle_lastAddressedSIMID_handleInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didJoinChat:style:displayName:groupID:lastAddressedHandle:lastAddressedSIMID:handleInfo:");
}

id objc_msgSend_didJoinChat_style_displayName_groupID_originalGroupID_handleInfo_category_spamExtensionName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didJoinChat:style:displayName:groupID:originalGroupID:handleInfo:category:spamExtensionName:");
}

id objc_msgSend_didJoinReadOnlyChat_style_displayName_groupID_handleInfo_category_spamExtensionName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didJoinReadOnlyChat:style:displayName:groupID:handleInfo:category:spamExtensionName:");
}

id objc_msgSend_didLeaveChat_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didLeaveChat:style:");
}

id objc_msgSend_didReceiveError_forMessageID_forceError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveError:forMessageID:forceError:");
}

id objc_msgSend_didReceiveMessage_forChat_style_fromIDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveMessage:forChat:style:fromIDSID:");
}

id objc_msgSend_didReceiveMessageReadForMessageID_date_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveMessageReadForMessageID:date:completionBlock:");
}

id objc_msgSend_didReceiveReplaceMessageID_forChat_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveReplaceMessageID:forChat:style:");
}

id objc_msgSend_didSendDeliveredQuietlyReceiptForMessageID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSendDeliveredQuietlyReceiptForMessageID:");
}

id objc_msgSend_didSendMessage_forChat_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSendMessage:forChat:style:");
}

id objc_msgSend_didSendMessage_forChat_style_forceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSendMessage:forChat:style:forceDate:");
}

id objc_msgSend_didSendMessagePlayedReceiptForMessageID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSendMessagePlayedReceiptForMessageID:");
}

id objc_msgSend_didSendMessageReadReceiptForMessageID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSendMessageReadReceiptForMessageID:");
}

id objc_msgSend_didSendMessageSavedReceiptForMessageID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSendMessageSavedReceiptForMessageID:");
}

id objc_msgSend_didSendNotifyRecipientCommandForMessageID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSendNotifyRecipientCommandForMessageID:");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_enableEmergencyModeWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableEmergencyModeWithError:");
}

id objc_msgSend_endTransfer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endTransfer:");
}

id objc_msgSend_enrollSelfDeviceInSMSRelay(void *a1, const char *a2, ...)
{
  return _[a1 enrollSelfDeviceInSMSRelay];
}

id objc_msgSend_enumerateAttribute_inRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:");
}

id objc_msgSend_enumerateAttributesInRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateMessagesToRelayOnService_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateMessagesToRelayOnService:usingBlock:");
}

id objc_msgSend_errorCode(void *a1, const char *a2, ...)
{
  return _[a1 errorCode];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_executeCompletionBlockForFilterParamsUpdate_promo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeCompletionBlockForFilterParamsUpdate:promo:");
}

id objc_msgSend_existingChatForID_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingChatForID:account:");
}

id objc_msgSend_existingChatForIDs_account_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingChatForIDs:account:style:");
}

id objc_msgSend_existingChatWithGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingChatWithGUID:");
}

id objc_msgSend_existingChatWithIdentifier_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingChatWithIdentifier:account:");
}

id objc_msgSend_existingiMessageChatForID_withChatStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingiMessageChatForID:withChatStyle:");
}

id objc_msgSend_expressiveSendStyleID(void *a1, const char *a2, ...)
{
  return _[a1 expressiveSendStyleID];
}

id objc_msgSend_failTransfer_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failTransfer:error:");
}

id objc_msgSend_failTransfer_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failTransfer:reason:");
}

id objc_msgSend_failTransferPreviewGeneration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failTransferPreviewGeneration:");
}

id objc_msgSend_fallbackHash(void *a1, const char *a2, ...)
{
  return _[a1 fallbackHash];
}

id objc_msgSend_fetchCloudKitAccountStatusWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCloudKitAccountStatusWithCompletion:");
}

id objc_msgSend_fetchFilterExtensionNameForDeviceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchFilterExtensionNameForDeviceID:");
}

id objc_msgSend_fetchSMSFilterCapabilitiesOptions(void *a1, const char *a2, ...)
{
  return _[a1 fetchSMSFilterCapabilitiesOptions];
}

id objc_msgSend_fetchSMSFilterExtensionParams(void *a1, const char *a2, ...)
{
  return _[a1 fetchSMSFilterExtensionParams];
}

id objc_msgSend_fetchiCloudAccountPersonID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchiCloudAccountPersonID:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return _[a1 fileSize];
}

id objc_msgSend_fileTransferGUIDs(void *a1, const char *a2, ...)
{
  return _[a1 fileTransferGUIDs];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_filename(void *a1, const char *a2, ...)
{
  return _[a1 filename];
}

id objc_msgSend_filterExtensionName(void *a1, const char *a2, ...)
{
  return _[a1 filterExtensionName];
}

id objc_msgSend_filterSubCategory(void *a1, const char *a2, ...)
{
  return _[a1 filterSubCategory];
}

id objc_msgSend_filteringController(void *a1, const char *a2, ...)
{
  return _[a1 filteringController];
}

id objc_msgSend_first(void *a1, const char *a2, ...)
{
  return _[a1 first];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return _[a1 flags];
}

id objc_msgSend_forceAutoBugCaptureWithSubType_errorPayload_type_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceAutoBugCaptureWithSubType:errorPayload:type:context:");
}

id objc_msgSend_fromID(void *a1, const char *a2, ...)
{
  return _[a1 fromID];
}

id objc_msgSend_fromMeContextWithServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fromMeContextWithServiceName:");
}

id objc_msgSend_generatePreviewForTransfer_messageItem_senderContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generatePreviewForTransfer:messageItem:senderContext:");
}

id objc_msgSend_generateSafeRender_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateSafeRender:completionBlock:");
}

id objc_msgSend_generateSafeRender_constraints_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateSafeRender:constraints:completionBlock:");
}

id objc_msgSend_generateUnusedChatIdentifierForGroupChatWithAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateUnusedChatIdentifierForGroupChatWithAccount:");
}

id objc_msgSend_getNumberOfTimesRespondedToThread(void *a1, const char *a2, ...)
{
  return _[a1 getNumberOfTimesRespondedToThread];
}

id objc_msgSend_getPlainTextForMessage_processedMessageItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPlainTextForMessage:processedMessageItem:");
}

id objc_msgSend_guid(void *a1, const char *a2, ...)
{
  return _[a1 guid];
}

id objc_msgSend_guidForNewIncomingTransferWithFilename_isDirectory_totalBytes_hfsType_hfsCreator_hfsFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "guidForNewIncomingTransferWithFilename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:");
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return _[a1 handle];
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handler_deleteCommand_toIdentifier_fromIdentifier_fromToken_timeStamp_needsDeliveryReceipt_deliveryContext_storageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handler:deleteCommand:toIdentifier:fromIdentifier:fromToken:timeStamp:needsDeliveryReceipt:deliveryContext:storageContext:");
}

id objc_msgSend_handler_incomingDisplayPinCode_toIdentifier_fromIdentifier_fromToken_messageGUID_timeStamp_storageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handler:incomingDisplayPinCode:toIdentifier:fromIdentifier:fromToken:messageGUID:timeStamp:storageContext:");
}

id objc_msgSend_handler_incomingDownloadMessage_toIdentifier_fromIdentifier_fromToken_timeStamp_storageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handler:incomingDownloadMessage:toIdentifier:fromIdentifier:fromToken:timeStamp:storageContext:");
}

id objc_msgSend_handler_incomingEnrollMeRequest_toIdentifier_fromIdentifier_fromToken_messageGUID_timeStamp_storageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handler:incomingEnrollMeRequest:toIdentifier:fromIdentifier:fromToken:messageGUID:timeStamp:storageContext:");
}

id objc_msgSend_handler_incomingPlainTextMessage_toIdentifier_fromIdentifier_fromToken_timeStamp_storageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handler:incomingPlainTextMessage:toIdentifier:fromIdentifier:fromToken:timeStamp:storageContext:");
}

id objc_msgSend_handler_incomingResponseForApproval_toIdentifier_fromIdentifier_fromToken_messageGUID_timeStamp_storageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handler:incomingResponseForApproval:toIdentifier:fromIdentifier:fromToken:messageGUID:timeStamp:storageContext:");
}

id objc_msgSend_handler_incomingSMSFilteringSettingsMessage_fromToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handler:incomingSMSFilteringSettingsMessage:fromToken:");
}

id objc_msgSend_handler_localFileRequest_storageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handler:localFileRequest:storageContext:");
}

id objc_msgSend_handler_localFileResponse_storageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handler:localFileResponse:storageContext:");
}

id objc_msgSend_handler_localIncomingDownloadMessage_storageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handler:localIncomingDownloadMessage:storageContext:");
}

id objc_msgSend_handler_localIncommingMessage_storageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handler:localIncommingMessage:storageContext:");
}

id objc_msgSend_handler_localMessageError_storageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handler:localMessageError:storageContext:");
}

id objc_msgSend_handler_localMessageRead_storageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handler:localMessageRead:storageContext:");
}

id objc_msgSend_handler_localMessageSent_storageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handler:localMessageSent:storageContext:");
}

id objc_msgSend_handler_localOutgoingDownloadMessage_isBeingReplayed_storageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handler:localOutgoingDownloadMessage:isBeingReplayed:storageContext:");
}

id objc_msgSend_handler_localOutgoingMessage_isBeingReplayed_storageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handler:localOutgoingMessage:isBeingReplayed:storageContext:");
}

id objc_msgSend_handler_messageIDRead_timeStamp_toIdentifier_fromIdentifier_storageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handler:messageIDRead:timeStamp:toIdentifier:fromIdentifier:storageContext:");
}

id objc_msgSend_handler_messageIDSendFailure_toIdentifier_fromIdentifier_timeStamp_storageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handler:messageIDSendFailure:toIdentifier:fromIdentifier:timeStamp:storageContext:");
}

id objc_msgSend_handler_messageIDSent_toIdentifier_fromIdentifier_timeStamp_storageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handler:messageIDSent:toIdentifier:fromIdentifier:timeStamp:storageContext:");
}

id objc_msgSend_handler_outgoingDownloadMessage_toIdentifier_fromIdentifier_fromToken_messageGUID_timeStamp_isBeingReplayed_storageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handler:outgoingDownloadMessage:toIdentifier:fromIdentifier:fromToken:messageGUID:timeStamp:isBeingReplayed:storageContext:");
}

id objc_msgSend_handler_outgoingPlainTextMessage_toIdentifier_fromIdentifier_fromToken_messageGUID_timeStamp_isBeingReplayed_isInProxyMode_storageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handler:outgoingPlainTextMessage:toIdentifier:fromIdentifier:fromToken:messageGUID:timeStamp:isBeingReplayed:isInProxyMode:storageContext:");
}

id objc_msgSend_handler_outgoingPlainTextMessage_toIdentifier_fromIdentifier_fromToken_messageGUID_timeStamp_isBeingReplayed_storageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handler:outgoingPlainTextMessage:toIdentifier:fromIdentifier:fromToken:messageGUID:timeStamp:isBeingReplayed:storageContext:");
}

id objc_msgSend_handler_recoverCommand_toIdentifier_fromIdentifier_fromToken_timeStamp_needsDeliveryReceipt_deliveryContext_storageContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handler:recoverCommand:toIdentifier:fromIdentifier:fromToken:timeStamp:needsDeliveryReceipt:deliveryContext:storageContext:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasRelayDevice(void *a1, const char *a2, ...)
{
  return _[a1 hasRelayDevice];
}

id objc_msgSend_has_sendEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "has_sendEnabled");
}

id objc_msgSend_has_spamCategory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "has_spamCategory");
}

id objc_msgSend_historicalMessageGUIDsDeleted_chatGUIDs_queryID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "historicalMessageGUIDsDeleted:chatGUIDs:queryID:");
}

id objc_msgSend_iMessageCapability(void *a1, const char *a2, ...)
{
  return _[a1 iMessageCapability];
}

id objc_msgSend_identities(void *a1, const char *a2, ...)
{
  return _[a1 identities];
}

id objc_msgSend_idsDeviceForFromID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsDeviceForFromID:");
}

id objc_msgSend_idsDeviceFromPushToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsDeviceFromPushToken:");
}

id objc_msgSend_idsDeviceFromUniqueID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsDeviceFromUniqueID:");
}

id objc_msgSend_im_generateCopyForURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "im_generateCopyForURL:");
}

id objc_msgSend_im_randomTemporaryFileURLWithFileName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "im_randomTemporaryFileURLWithFileName:");
}

id objc_msgSend_im_registeredURIs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "im_registeredURIs");
}

id objc_msgSend_immediatelyReachable(void *a1, const char *a2, ...)
{
  return _[a1 immediatelyReachable];
}

id objc_msgSend_incomingMessageWithId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "incomingMessageWithId:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initWithAccount_service_replicatingForSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:service:replicatingForSession:");
}

id objc_msgSend_initWithAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAttributedString:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContent:");
}

id objc_msgSend_initWithContentLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentLocation:");
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfFile:");
}

id objc_msgSend_initWithData_accountUniqueID_fromID_loginID_serviceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:accountUniqueID:fromID:loginID:serviceName:");
}

id objc_msgSend_initWithData_contentType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:contentType:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithDictionary_accountUniqueID_fromID_loginID_serviceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:accountUniqueID:fromID:loginID:serviceName:");
}

id objc_msgSend_initWithExtensionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExtensionIdentifier:");
}

id objc_msgSend_initWithFirst_second_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFirst:second:");
}

id objc_msgSend_initWithFlags_options_timeout_wifiTimeout_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFlags:options:timeout:wifiTimeout:completionBlock:");
}

id objc_msgSend_initWithID_unformattedID_countryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithID:unformattedID:countryCode:");
}

id objc_msgSend_initWithIdentifier_timeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:timeout:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithSender_time_body_attributes_fileTransferGUIDs_flags_error_guid_threadIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:threadIdentifier:");
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithService:");
}

id objc_msgSend_initWithService_commands_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithService:commands:");
}

id objc_msgSend_initWithSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSession:");
}

id objc_msgSend_initWithSession_forMessage_chat_chatStyle_recipients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSession:forMessage:chat:chatStyle:recipients:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_internalName(void *a1, const char *a2, ...)
{
  return _[a1 internalName];
}

id objc_msgSend_interpretMessageItem_inChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interpretMessageItem:inChat:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isAdaptiveImageGlyph(void *a1, const char *a2, ...)
{
  return _[a1 isAdaptiveImageGlyph];
}

id objc_msgSend_isAutoloopVideo(void *a1, const char *a2, ...)
{
  return _[a1 isAutoloopVideo];
}

id objc_msgSend_isBlackholed(void *a1, const char *a2, ...)
{
  return _[a1 isBlackholed];
}

id objc_msgSend_isCarrierPigeonEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isCarrierPigeonEnabled];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return _[a1 isConnected];
}

id objc_msgSend_isDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 isDefaultPairedDevice];
}

id objc_msgSend_isEmergencyChat(void *a1, const char *a2, ...)
{
  return _[a1 isEmergencyChat];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToIgnoringCase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToIgnoringCase:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFilterUnknownSendersEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isFilterUnknownSendersEnabled];
}

id objc_msgSend_isFiltered(void *a1, const char *a2, ...)
{
  return _[a1 isFiltered];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return _[a1 isFinished];
}

id objc_msgSend_isFromMe(void *a1, const char *a2, ...)
{
  return _[a1 isFromMe];
}

id objc_msgSend_isGroupMessagingEnabledFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isGroupMessagingEnabledFor:");
}

id objc_msgSend_isHSATrusted(void *a1, const char *a2, ...)
{
  return _[a1 isHSATrusted];
}

id objc_msgSend_isIDInList_ArrayToCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isIDInList:ArrayToCheck:");
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return _[a1 isInternalInstall];
}

id objc_msgSend_isInternationalSpamFilteringEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isInternationalSpamFilteringEnabled];
}

id objc_msgSend_isLazuliEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isLazuliEnabled];
}

id objc_msgSend_isLocalDeviceProxyRegistered(void *a1, const char *a2, ...)
{
  return _[a1 isLocalDeviceProxyRegistered];
}

id objc_msgSend_isLocallyPaired(void *a1, const char *a2, ...)
{
  return _[a1 isLocallyPaired];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _[a1 isMainThread];
}

id objc_msgSend_isMmsConfiguredForSub_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMmsConfiguredForSub:");
}

id objc_msgSend_isNearby(void *a1, const char *a2, ...)
{
  return _[a1 isNearby];
}

id objc_msgSend_isPhoneNumberEmergencyNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPhoneNumberEmergencyNumber:");
}

id objc_msgSend_isPriusCompatibilityEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isPriusCompatibilityEnabled];
}

id objc_msgSend_isPriusEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isPriusEnabled];
}

id objc_msgSend_isProxyRegistered(void *a1, const char *a2, ...)
{
  return _[a1 isProxyRegistered];
}

id objc_msgSend_isRecordingReplayDB(void *a1, const char *a2, ...)
{
  return _[a1 isRecordingReplayDB];
}

id objc_msgSend_isReplicationEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isReplicationEnabled];
}

id objc_msgSend_isSMSFilterSyncEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isSMSFilterSyncEnabled];
}

id objc_msgSend_isSMSFilteringEnabledInSMSFilterCapabilitiesOptions(void *a1, const char *a2, ...)
{
  return _[a1 isSMSFilteringEnabledInSMSFilterCapabilitiesOptions];
}

id objc_msgSend_isSMSRefactorEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isSMSRefactorEnabled];
}

id objc_msgSend_isSMSRelayEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isSMSRelayEnabled];
}

id objc_msgSend_isSOS(void *a1, const char *a2, ...)
{
  return _[a1 isSOS];
}

id objc_msgSend_isSOSAlertingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isSOSAlertingEnabled];
}

id objc_msgSend_isScreenLit(void *a1, const char *a2, ...)
{
  return _[a1 isScreenLit];
}

id objc_msgSend_isSetupComplete(void *a1, const char *a2, ...)
{
  return _[a1 isSetupComplete];
}

id objc_msgSend_isSimpleString(void *a1, const char *a2, ...)
{
  return _[a1 isSimpleString];
}

id objc_msgSend_isStewieChat(void *a1, const char *a2, ...)
{
  return _[a1 isStewieChat];
}

id objc_msgSend_isSticker(void *a1, const char *a2, ...)
{
  return _[a1 isSticker];
}

id objc_msgSend_isUnderFirstDataProtectionLock(void *a1, const char *a2, ...)
{
  return _[a1 isUnderFirstDataProtectionLock];
}

id objc_msgSend_isValidActiveFilterAction_subAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidActiveFilterAction:subAction:");
}

id objc_msgSend_isValidMMS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidMMS:");
}

id objc_msgSend_isValidSMSFilterCapabilitiesOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidSMSFilterCapabilitiesOptions:");
}

id objc_msgSend_isValidSubAction_subAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidSubAction:subAction:");
}

id objc_msgSend_isValidSubActionForDeviceID_action_subAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidSubActionForDeviceID:action:subAction:");
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _[a1 items];
}

id objc_msgSend_joinChat_handleInfo_style_groupID_lastAddressedHandle_lastAddressedSIMID_joinProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "joinChat:handleInfo:style:groupID:lastAddressedHandle:lastAddressedSIMID:joinProperties:");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _[a1 label];
}

id objc_msgSend_labelID(void *a1, const char *a2, ...)
{
  return _[a1 labelID];
}

id objc_msgSend_lastAddressedHandleForJunkReportMessageItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastAddressedHandleForJunkReportMessageItem:");
}

id objc_msgSend_lastAddressedLocalHandle(void *a1, const char *a2, ...)
{
  return _[a1 lastAddressedLocalHandle];
}

id objc_msgSend_lastAddressedSIMID(void *a1, const char *a2, ...)
{
  return _[a1 lastAddressedSIMID];
}

id objc_msgSend_lastAddressedSIMIDForJunkReportMessageItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastAddressedSIMIDForJunkReportMessageItem:");
}

id objc_msgSend_lastMessage(void *a1, const char *a2, ...)
{
  return _[a1 lastMessage];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_lastReplicationSinceLoadDate(void *a1, const char *a2, ...)
{
  return _[a1 lastReplicationSinceLoadDate];
}

id objc_msgSend_leftChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leftChat:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_linkedUserURIs(void *a1, const char *a2, ...)
{
  return _[a1 linkedUserURIs];
}

id objc_msgSend_localCommandToHandlerBlock(void *a1, const char *a2, ...)
{
  return _[a1 localCommandToHandlerBlock];
}

id objc_msgSend_localDevice(void *a1, const char *a2, ...)
{
  return _[a1 localDevice];
}

id objc_msgSend_localPath(void *a1, const char *a2, ...)
{
  return _[a1 localPath];
}

id objc_msgSend_localURL(void *a1, const char *a2, ...)
{
  return _[a1 localURL];
}

id objc_msgSend_localizeSubAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizeSubAction:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_loginID(void *a1, const char *a2, ...)
{
  return _[a1 loginID];
}

id objc_msgSend_loginStatus(void *a1, const char *a2, ...)
{
  return _[a1 loginStatus];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return _[a1 longValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_makeObjectsPerformSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeObjectsPerformSelector:");
}

id objc_msgSend_markMessageGUIDUnread_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markMessageGUIDUnread:");
}

id objc_msgSend_marketingNameForModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "marketingNameForModel:");
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _[a1 message];
}

id objc_msgSend_messageFilterSubActionResponseForBlastDoorSMSMessageFilterSubCategoryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageFilterSubActionResponseForBlastDoorSMSMessageFilterSubCategoryType:");
}

id objc_msgSend_messageId(void *a1, const char *a2, ...)
{
  return _[a1 messageId];
}

id objc_msgSend_messageSent_onService_compatibilityService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageSent:onService:compatibilityService:");
}

id objc_msgSend_messageType(void *a1, const char *a2, ...)
{
  return _[a1 messageType];
}

id objc_msgSend_messageWithGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageWithGUID:");
}

id objc_msgSend_messagesAppDomain(void *a1, const char *a2, ...)
{
  return _[a1 messagesAppDomain];
}

id objc_msgSend_mimeType(void *a1, const char *a2, ...)
{
  return _[a1 mimeType];
}

id objc_msgSend_modelIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 modelIdentifier];
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_myCTPhoneNumber(void *a1, const char *a2, ...)
{
  return _[a1 myCTPhoneNumber];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_needsRepeatForRelayReplication(void *a1, const char *a2, ...)
{
  return _[a1 needsRepeatForRelayReplication];
}

id objc_msgSend_newTelephonyMessagesForHandles_shouldBroadcastMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newTelephonyMessagesForHandles:shouldBroadcastMessage:");
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 newlineCharacterSet];
}

id objc_msgSend_nonRetainingArray(void *a1, const char *a2, ...)
{
  return _[a1 nonRetainingArray];
}

id objc_msgSend_noteItemFromStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "noteItemFromStorage:");
}

id objc_msgSend_noteLastItemFromStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "noteLastItemFromStorage:");
}

id objc_msgSend_notificationIDSTokenURI(void *a1, const char *a2, ...)
{
  return _[a1 notificationIDSTokenURI];
}

id objc_msgSend_notifyDidSendMessageID_shouldNotify_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDidSendMessageID:shouldNotify:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberFromString:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_orderedParts(void *a1, const char *a2, ...)
{
  return _[a1 orderedParts];
}

id objc_msgSend_originalCommand(void *a1, const char *a2, ...)
{
  return _[a1 originalCommand];
}

id objc_msgSend_originatedDeviceEmail(void *a1, const char *a2, ...)
{
  return _[a1 originatedDeviceEmail];
}

id objc_msgSend_originatedDeviceNumber(void *a1, const char *a2, ...)
{
  return _[a1 originatedDeviceNumber];
}

id objc_msgSend_originatedDeviceSIM(void *a1, const char *a2, ...)
{
  return _[a1 originatedDeviceSIM];
}

id objc_msgSend_originatedDeviceUniqueID(void *a1, const char *a2, ...)
{
  return _[a1 originatedDeviceUniqueID];
}

id objc_msgSend_outHTML(void *a1, const char *a2, ...)
{
  return _[a1 outHTML];
}

id objc_msgSend_outgoing(void *a1, const char *a2, ...)
{
  return _[a1 outgoing];
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 outgoingResponseIdentifier];
}

id objc_msgSend_outputMessage(void *a1, const char *a2, ...)
{
  return _[a1 outputMessage];
}

id objc_msgSend_pairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 pairedDevice];
}

id objc_msgSend_parseContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseContext:");
}

id objc_msgSend_parser_foundAttributes_inRange_fileTransferGUID_filename_bookmark_width_height_isAnimoji_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parser:foundAttributes:inRange:fileTransferGUID:filename:bookmark:width:height:isAnimoji:");
}

id objc_msgSend_participants(void *a1, const char *a2, ...)
{
  return _[a1 participants];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_pathExtensionForMIMEType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathExtensionForMIMEType:");
}

id objc_msgSend_pathExtensionForUTIType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathExtensionForUTIType:");
}

id objc_msgSend_payloadData(void *a1, const char *a2, ...)
{
  return _[a1 payloadData];
}

id objc_msgSend_pendingRemoteFileRequests(void *a1, const char *a2, ...)
{
  return _[a1 pendingRemoteFileRequests];
}

id objc_msgSend_performCapabilitiesQueryRequest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performCapabilitiesQueryRequest:completion:");
}

id objc_msgSend_performQueryRequest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performQueryRequest:completion:");
}

id objc_msgSend_phoneAliasForDominentPhoneAlias_registeredPhoneNumber_preferedCallerID_CTPhoneNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneAliasForDominentPhoneAlias:registeredPhoneNumber:preferedCallerID:CTPhoneNumber:");
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return _[a1 phoneNumber];
}

id objc_msgSend_phoneNumberWithDigits_digits_countryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneNumberWithDigits:digits:countryCode:");
}

id objc_msgSend_plain(void *a1, const char *a2, ...)
{
  return _[a1 plain];
}

id objc_msgSend_plainTextContentBody(void *a1, const char *a2, ...)
{
  return _[a1 plainTextContentBody];
}

id objc_msgSend_processAttachmentsForMessage_generateTextParts_lastAddressedHandle_lastAddressedSIMID_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processAttachmentsForMessage:generateTextParts:lastAddressedHandle:lastAddressedSIMID:completionBlock:");
}

id objc_msgSend_processAttachmentsForPeerRelayForMessage_lastAddressHandle_lastAddressedSIMID_completionBlock_uploadFailureBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processAttachmentsForPeerRelayForMessage:lastAddressHandle:lastAddressedSIMID:completionBlock:uploadFailureBlock:");
}

id objc_msgSend_processMessageForSending_toChat_style_allowWatchdog_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processMessageForSending:toChat:style:allowWatchdog:completionBlock:");
}

id objc_msgSend_processMessageSendFailure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processMessageSendFailure:");
}

id objc_msgSend_processPartsOfTelephonyMessages_parts_messageItem_isGroupChat_phoneNumber_simID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processPartsOfTelephonyMessages:parts:messageItem:isGroupChat:phoneNumber:simID:");
}

id objc_msgSend_profileID(void *a1, const char *a2, ...)
{
  return _[a1 profileID];
}

id objc_msgSend_promotionalSubActions(void *a1, const char *a2, ...)
{
  return _[a1 promotionalSubActions];
}

id objc_msgSend_pushToken(void *a1, const char *a2, ...)
{
  return _[a1 pushToken];
}

id objc_msgSend_randomSixDigitCode(void *a1, const char *a2, ...)
{
  return _[a1 randomSixDigitCode];
}

id objc_msgSend_receiveFileTransfer_topic_path_requestURLString_ownerID_signature_decryptionKey_fileSize_progressBlock_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveFileTransfer:topic:path:requestURLString:ownerID:signature:decryptionKey:fileSize:progressBlock:completionBlock:");
}

id objc_msgSend_receiveFileTransfer_transferGUID_topic_path_requestURLString_ownerID_signature_decryptionKey_fileSize_balloonBundleID_senderContext_progressBlock_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveFileTransfer:transferGUID:topic:path:requestURLString:ownerID:signature:decryptionKey:fileSize:balloonBundleID:senderContext:progressBlock:completionBlock:");
}

id objc_msgSend_receivedBlackholeError(void *a1, const char *a2, ...)
{
  return _[a1 receivedBlackholeError];
}

id objc_msgSend_recipients(void *a1, const char *a2, ...)
{
  return _[a1 recipients];
}

id objc_msgSend_recoverChatsForCommandDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recoverChatsForCommandDictionary:");
}

id objc_msgSend_refreshServiceCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 refreshServiceCapabilities];
}

id objc_msgSend_registeredPhoneNumbers(void *a1, const char *a2, ...)
{
  return _[a1 registeredPhoneNumbers];
}

id objc_msgSend_registeredSIMIDs(void *a1, const char *a2, ...)
{
  return _[a1 registeredSIMIDs];
}

id objc_msgSend_registration(void *a1, const char *a2, ...)
{
  return _[a1 registration];
}

id objc_msgSend_rejectTransfer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rejectTransfer:");
}

id objc_msgSend_relayController(void *a1, const char *a2, ...)
{
  return _[a1 relayController];
}

id objc_msgSend_relayDictionaryToPeers_requiresUpload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayDictionaryToPeers:requiresUpload:");
}

id objc_msgSend_relayDictionaryToPeers_requiresUpload_serviceName_requiredCapabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayDictionaryToPeers:requiresUpload:serviceName:requiredCapabilities:");
}

id objc_msgSend_relayMessageToPeers_forChat_serviceName_reflectOnly_requiredCapabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayMessageToPeers:forChat:serviceName:reflectOnly:requiredCapabilities:");
}

id objc_msgSend_releasePendingMessageWithGUID_serviceName_chat_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releasePendingMessageWithGUID:serviceName:chat:completion:");
}

id objc_msgSend_remapMessageError_toError_forChat_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remapMessageError:toError:forChat:completion:");
}

id objc_msgSend_remoteFileResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteFileResponse:");
}

id objc_msgSend_remotefileRequest_attempts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remotefileRequest:attempts:");
}

id objc_msgSend_removeAttribute_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAttribute:range:");
}

id objc_msgSend_removeChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeChat:");
}

id objc_msgSend_removeDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDelegate:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeListener_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeListener:");
}

id objc_msgSend_removeNotificationsForServiceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeNotificationsForServiceIdentifier:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectIdenticalTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectIdenticalTo:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_replaceMessage(void *a1, const char *a2, ...)
{
  return _[a1 replaceMessage];
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_replayMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replayMessage:");
}

id objc_msgSend_replicationProxy(void *a1, const char *a2, ...)
{
  return _[a1 replicationProxy];
}

id objc_msgSend_replyEnabled(void *a1, const char *a2, ...)
{
  return _[a1 replyEnabled];
}

id objc_msgSend_replyToGUID(void *a1, const char *a2, ...)
{
  return _[a1 replyToGUID];
}

id objc_msgSend_resolveUnformattedRepresentationsForHandles_onService_message_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolveUnformattedRepresentationsForHandles:onService:message:completionBlock:");
}

id objc_msgSend_resourcePath(void *a1, const char *a2, ...)
{
  return _[a1 resourcePath];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return _[a1 response];
}

id objc_msgSend_responseInformation(void *a1, const char *a2, ...)
{
  return _[a1 responseInformation];
}

id objc_msgSend_retrieveAccountAndPhoneAliasForAccounts_shouldFilterRecepients_requestProxySend_preferredCallerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrieveAccountAndPhoneAliasForAccounts:shouldFilterRecepients:requestProxySend:preferredCallerID:");
}

id objc_msgSend_retrieveAttachmentsForMessage_ignoreStoredTransfers_displayID_token_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrieveAttachmentsForMessage:ignoreStoredTransfers:displayID:token:completionBlock:");
}

id objc_msgSend_retrievePhoneAccountAndPhoneAliasFromIDSAccounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrievePhoneAccountAndPhoneAliasFromIDSAccounts:");
}

id objc_msgSend_retryGroupPhotoUpload_toChatID_identifier_style_account_isPhotoRefresh_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retryGroupPhotoUpload:toChatID:identifier:style:account:isPhotoRefresh:");
}

id objc_msgSend_richLinkURLs(void *a1, const char *a2, ...)
{
  return _[a1 richLinkURLs];
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return _[a1 second];
}

id objc_msgSend_send_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "send:");
}

id objc_msgSend_sendApprovalDisplayPinToDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendApprovalDisplayPinToDevice:");
}

id objc_msgSend_sendApprovalEnrollMe(void *a1, const char *a2, ...)
{
  return _[a1 sendApprovalEnrollMe];
}

id objc_msgSend_sendApprovalResponseToDevice_enteredCorrectly_wasCancelled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendApprovalResponseToDevice:enteredCorrectly:wasCancelled:");
}

id objc_msgSend_sendAsGroupMessage(void *a1, const char *a2, ...)
{
  return _[a1 sendAsGroupMessage];
}

id objc_msgSend_sendBlastDoorError_guid_messageTypeString_senderURI_senderToken_messageContext_payloadAttachmentURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendBlastDoorError:guid:messageTypeString:senderURI:senderToken:messageContext:payloadAttachmentURL:");
}

id objc_msgSend_sendCTMessageFromIMMessageItem_forChat_chat_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCTMessageFromIMMessageItem:forChat:chat:style:");
}

id objc_msgSend_sendDataToPeers_forcedCallerID_shouldFilterRecepients_requestProxySend_dontSendTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDataToPeers:forcedCallerID:shouldFilterRecepients:requestProxySend:dontSendTo:");
}

id objc_msgSend_sendDictionary_senderContext_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDictionary:senderContext:withCompletionBlock:");
}

id objc_msgSend_sendEditedMessage_previousMessage_partIndex_editType_toChatIdentifier_style_account_backwardCompatabilityText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEditedMessage:previousMessage:partIndex:editType:toChatIdentifier:style:account:backwardCompatabilityText:");
}

id objc_msgSend_sendEnabled(void *a1, const char *a2, ...)
{
  return _[a1 sendEnabled];
}

id objc_msgSend_sendEnrollmentRelatedMessageOverIDS_deviceToSendTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEnrollmentRelatedMessageOverIDS:deviceToSendTo:");
}

id objc_msgSend_sendFilePath_topic_userInfo_transferID_encryptFile_progressBlock_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendFilePath:topic:userInfo:transferID:encryptFile:progressBlock:completionBlock:");
}

id objc_msgSend_sendFileToLocalPeers_metadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendFileToLocalPeers:metadata:");
}

id objc_msgSend_sendGroupPhotoUpdate_toChatID_identifier_style_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendGroupPhotoUpdate:toChatID:identifier:style:account:");
}

id objc_msgSend_sendMessage_toChat_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessage:toChat:style:");
}

id objc_msgSend_sendNotificationMessageIfNeededForIncomingMessageFromChatIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendNotificationMessageIfNeededForIncomingMessageFromChatIdentifier:");
}

id objc_msgSend_sendReadReceiptForMessage_toChat_reflectOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendReadReceiptForMessage:toChat:reflectOnly:");
}

id objc_msgSend_sendRepositionStickerMessage_chatIdentifier_accountID_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendRepositionStickerMessage:chatIdentifier:accountID:style:");
}

id objc_msgSend_sendResourceAtURL_metadata_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_sendSMSDictionary_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendSMSDictionary:withCompletionBlock:");
}

id objc_msgSend_sendStewieMessage_forChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendStewieMessage:forChat:");
}

id objc_msgSend_sendToLocalPeers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendToLocalPeers:");
}

id objc_msgSend_sendUnApproveToDevice_extraKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendUnApproveToDevice:extraKeys:");
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return _[a1 sender];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return _[a1 service];
}

id objc_msgSend_service_sendMessage_fromAccount_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "service:sendMessage:fromAccount:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_serviceCenter(void *a1, const char *a2, ...)
{
  return _[a1 serviceCenter];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _[a1 serviceName];
}

id objc_msgSend_serviceSessionDidLoginWithAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceSessionDidLoginWithAccount:");
}

id objc_msgSend_serviceSessionDidLogoutWithAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceSessionDidLogoutWithAccount:");
}

id objc_msgSend_serviceWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceWithName:");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_setAccountID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountID:");
}

id objc_msgSend_setAdaptiveImageGlyphContentDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdaptiveImageGlyphContentDescription:");
}

id objc_msgSend_setAdaptiveImageGlyphContentIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdaptiveImageGlyphContentIdentifier:");
}

id objc_msgSend_setBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBody:");
}

id objc_msgSend_setBypassSupportedMessageModesCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBypassSupportedMessageModesCheck:");
}

id objc_msgSend_setContentId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentId:");
}

id objc_msgSend_setContentLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentLocation:");
}

id objc_msgSend_setContentType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentType:");
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContext:");
}

id objc_msgSend_setDate_forChatIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDate:forChatIdentifier:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDestinationCallerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDestinationCallerID:");
}

id objc_msgSend_setErrorCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorCode:");
}

id objc_msgSend_setFallbackHash_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFallbackHash:");
}

id objc_msgSend_setFileTransferGUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFileTransferGUIDs:");
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFlags:");
}

id objc_msgSend_setGuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGuid:");
}

id objc_msgSend_setHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandle:");
}

id objc_msgSend_setLastReplicationSinceLoadDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastReplicationSinceLoadDate:");
}

id objc_msgSend_setLatestNotificationIDSTokenURI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLatestNotificationIDSTokenURI:");
}

id objc_msgSend_setLoginStatus_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLoginStatus:message:");
}

id objc_msgSend_setMessageBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessageBody:");
}

id objc_msgSend_setMessageGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessageGUID:");
}

id objc_msgSend_setMessageId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessageId:");
}

id objc_msgSend_setMessageType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessageType:");
}

id objc_msgSend_setMessageTypeForTelephonyMessage_shouldSendMMS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessageTypeForTelephonyMessage:shouldSendMMS:");
}

id objc_msgSend_setNeedsRelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsRelay:");
}

id objc_msgSend_setNeedsRepeatForRelayReplication_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsRepeatForRelayReplication:");
}

id objc_msgSend_setNotificationIDSTokenURI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationIDSTokenURI:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOriginalUnformattedID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginalUnformattedID:");
}

id objc_msgSend_setOutgoing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutgoing:");
}

id objc_msgSend_setOutputMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutputMessage:");
}

id objc_msgSend_setPendingRemoteFileRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingRemoteFileRequests:");
}

id objc_msgSend_setPlainBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlainBody:");
}

id objc_msgSend_setReceiverISOCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReceiverISOCountryCode:");
}

id objc_msgSend_setRegistered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegistered:");
}

id objc_msgSend_setReplaceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReplaceID:");
}

id objc_msgSend_setReplyToGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReplyToGUID:");
}

id objc_msgSend_setRepresentedApplicationBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRepresentedApplicationBundle:");
}

id objc_msgSend_setSendAsGroupMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSendAsGroupMessage:");
}

id objc_msgSend_setSender_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSender:");
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setService:");
}

id objc_msgSend_setServiceCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceCenter:");
}

id objc_msgSend_setShouldSendMMS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldSendMMS:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:");
}

id objc_msgSend_setSubject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubject:");
}

id objc_msgSend_setSubjectForTelephonyMessages_messageItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubjectForTelephonyMessages:messageItem:");
}

id objc_msgSend_setSwyAppName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwyAppName:");
}

id objc_msgSend_setSwyBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwyBundleID:");
}

id objc_msgSend_setTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTime:");
}

id objc_msgSend_setTransferredFilename_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransferredFilename:");
}

id objc_msgSend_setUseStandalone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseStandalone:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUsesNotificationCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesNotificationCenter:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_sharedAccountController(void *a1, const char *a2, ...)
{
  return _[a1 sharedAccountController];
}

id objc_msgSend_sharedCache(void *a1, const char *a2, ...)
{
  return _[a1 sharedCache];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return _[a1 sharedController];
}

id objc_msgSend_sharedDaemon(void *a1, const char *a2, ...)
{
  return _[a1 sharedDaemon];
}

id objc_msgSend_sharedFeatureFlags(void *a1, const char *a2, ...)
{
  return _[a1 sharedFeatureFlags];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedInstanceForBagType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstanceForBagType:");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedMessageCenter(void *a1, const char *a2, ...)
{
  return _[a1 sharedMessageCenter];
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return _[a1 sharedMonitor];
}

id objc_msgSend_shouldFixIncomingDate(void *a1, const char *a2, ...)
{
  return _[a1 shouldFixIncomingDate];
}

id objc_msgSend_shouldInferRecoverableDeleteForCommandDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldInferRecoverableDeleteForCommandDictionary:");
}

id objc_msgSend_shouldSendLowResolutionOnly(void *a1, const char *a2, ...)
{
  return _[a1 shouldSendLowResolutionOnly];
}

id objc_msgSend_shouldSendMMS(void *a1, const char *a2, ...)
{
  return _[a1 shouldSendMMS];
}

id objc_msgSend_shouldUpdateSMSFilterSyncDeviceParamsForDeviceID_smsFilterCapabilitiesOptions_filterExtensionName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldUpdateSMSFilterSyncDeviceParamsForDeviceID:smsFilterCapabilitiesOptions:filterExtensionName:");
}

id objc_msgSend_shouldUploadToMMCS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldUploadToMMCS:");
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return _[a1 slotID];
}

id objc_msgSend_smil(void *a1, const char *a2, ...)
{
  return _[a1 smil];
}

id objc_msgSend_smsFilterCapabilitiesOptions(void *a1, const char *a2, ...)
{
  return _[a1 smsFilterCapabilitiesOptions];
}

id objc_msgSend_smsFilteringSettings(void *a1, const char *a2, ...)
{
  return _[a1 smsFilteringSettings];
}

id objc_msgSend_smsHandshakeState(void *a1, const char *a2, ...)
{
  return _[a1 smsHandshakeState];
}

id objc_msgSend_smsSession(void *a1, const char *a2, ...)
{
  return _[a1 smsSession];
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_spamCategory(void *a1, const char *a2, ...)
{
  return _[a1 spamCategory];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startFinalizingTransfer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startFinalizingTransfer:");
}

id objc_msgSend_startTransfer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTransfer:");
}

id objc_msgSend_stewieEnabled(void *a1, const char *a2, ...)
{
  return _[a1 stewieEnabled];
}

id objc_msgSend_storeMessage_forceReplace_modifyError_modifyFlags_flagMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:");
}

id objc_msgSend_storeMessage_type_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeMessage:type:error:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringByRemovingCharactersFromSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByRemovingCharactersFromSet:");
}

id objc_msgSend_stringByRemovingURLEscapes(void *a1, const char *a2, ...)
{
  return _[a1 stringByRemovingURLEscapes];
}

id objc_msgSend_stringByRemovingWhitespace(void *a1, const char *a2, ...)
{
  return _[a1 stringByRemovingWhitespace];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByResolvingAndStandardizingPath(void *a1, const char *a2, ...)
{
  return _[a1 stringByResolvingAndStandardizingPath];
}

id objc_msgSend_stringGUID(void *a1, const char *a2, ...)
{
  return _[a1 stringGUID];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithLTREmbedding(void *a1, const char *a2, ...)
{
  return _[a1 stringWithLTREmbedding];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _[a1 style];
}

id objc_msgSend_subAction(void *a1, const char *a2, ...)
{
  return _[a1 subAction];
}

id objc_msgSend_subject(void *a1, const char *a2, ...)
{
  return _[a1 subject];
}

id objc_msgSend_subscriptionContextForChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionContextForChat:");
}

id objc_msgSend_subscriptions(void *a1, const char *a2, ...)
{
  return _[a1 subscriptions];
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_successfullyGeneratedPreviewForTransfer_withPreviewSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "successfullyGeneratedPreviewForTransfer:withPreviewSize:");
}

id objc_msgSend_supportsCellularData(void *a1, const char *a2, ...)
{
  return _[a1 supportsCellularData];
}

id objc_msgSend_supportsIncomingSMSRelayFiltering(void *a1, const char *a2, ...)
{
  return _[a1 supportsIncomingSMSRelayFiltering];
}

id objc_msgSend_supportsMMS(void *a1, const char *a2, ...)
{
  return _[a1 supportsMMS];
}

id objc_msgSend_supportsMMSRelay(void *a1, const char *a2, ...)
{
  return _[a1 supportsMMSRelay];
}

id objc_msgSend_supportsSMSRelay(void *a1, const char *a2, ...)
{
  return _[a1 supportsSMSRelay];
}

id objc_msgSend_tapbackInterpreter(void *a1, const char *a2, ...)
{
  return _[a1 tapbackInterpreter];
}

id objc_msgSend_tearDownSessionForChatIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tearDownSessionForChatIdentifier:");
}

id objc_msgSend_telephoneNumber(void *a1, const char *a2, ...)
{
  return _[a1 telephoneNumber];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textParts(void *a1, const char *a2, ...)
{
  return _[a1 textParts];
}

id objc_msgSend_threadIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 threadIdentifier];
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return _[a1 time];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeRead(void *a1, const char *a2, ...)
{
  return _[a1 timeRead];
}

id objc_msgSend_trackEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackEvent:");
}

id objc_msgSend_trackEvent_withDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackEvent:withDictionary:");
}

id objc_msgSend_trackMessage(void *a1, const char *a2, ...)
{
  return _[a1 trackMessage];
}

id objc_msgSend_trackSpamEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackSpamEvent:");
}

id objc_msgSend_transactionalSubActions(void *a1, const char *a2, ...)
{
  return _[a1 transactionalSubActions];
}

id objc_msgSend_transcodeFallbackFileTransferContents_utiType_allowUnfilteredUTIs_target_sizes_commonCapabilities_maxDimension_transcoderUserInfo_representations_isLQMEnabled_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transcodeFallbackFileTransferContents:utiType:allowUnfilteredUTIs:target:sizes:commonCapabilities:maxDimension:transcoderUserInfo:representations:isLQMEnabled:completionBlock:");
}

id objc_msgSend_transcodeFallbackFileTransferPayloadData_balloonBundleID_attachments_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transcodeFallbackFileTransferPayloadData:balloonBundleID:attachments:completionBlock:");
}

id objc_msgSend_transcodeFileTransferContents_utiType_isSticker_allowUnfilteredUTIs_target_sizes_commonCapabilities_maxDimension_transcoderUserInfo_representations_isLQMEnabled_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transcodeFileTransferContents:utiType:isSticker:allowUnfilteredUTIs:target:sizes:commonCapabilities:maxDimension:transcoderUserInfo:representations:isLQMEnabled:completionBlock:");
}

id objc_msgSend_transcodeFileTransferContents_utiType_transcoderUserInfo_highQualityMaxByteSize_lowQualityMaxByteSize_representations_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transcodeFileTransferContents:utiType:transcoderUserInfo:highQualityMaxByteSize:lowQualityMaxByteSize:representations:completionBlock:");
}

id objc_msgSend_transcoderUserInfo(void *a1, const char *a2, ...)
{
  return _[a1 transcoderUserInfo];
}

id objc_msgSend_transferDataURL(void *a1, const char *a2, ...)
{
  return _[a1 transferDataURL];
}

id objc_msgSend_transferForGUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transferForGUID:");
}

id objc_msgSend_transferredFilename(void *a1, const char *a2, ...)
{
  return _[a1 transferredFilename];
}

id objc_msgSend_trimmedString(void *a1, const char *a2, ...)
{
  return _[a1 trimmedString];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_typeWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "typeWithIdentifier:");
}

id objc_msgSend_unformattedID(void *a1, const char *a2, ...)
{
  return _[a1 unformattedID];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return _[a1 uniqueID];
}

id objc_msgSend_uniqueIDOverride(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIDOverride];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIdentifier];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_untrustedContext(void *a1, const char *a2, ...)
{
  return _[a1 untrustedContext];
}

id objc_msgSend_untrustedContextWithServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "untrustedContextWithServiceName:");
}

id objc_msgSend_updateDisplayName_fromDisplayName_fromID_forChatID_identifier_style_messageID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDisplayName:fromDisplayName:fromID:forChatID:identifier:style:messageID:");
}

id objc_msgSend_updateIsBlackholed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIsBlackholed:");
}

id objc_msgSend_updateIsEmergencyChat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIsEmergencyChat:");
}

id objc_msgSend_updateLastAddressedHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLastAddressedHandle:");
}

id objc_msgSend_updateLastAddressedHandle_forceUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLastAddressedHandle:forceUpdate:");
}

id objc_msgSend_updateLastAddressedSIMID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLastAddressedSIMID:");
}

id objc_msgSend_updateLastSeenMessageGuidIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLastSeenMessageGuidIfNeeded:");
}

id objc_msgSend_updateMMSCapability(void *a1, const char *a2, ...)
{
  return _[a1 updateMMSCapability];
}

id objc_msgSend_updateReceivedBlackholeError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateReceivedBlackholeError:");
}

id objc_msgSend_updateSMSCategory_subCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSMSCategory:subCategory:");
}

id objc_msgSend_updateSMSFilterCapabilitiesOptionsForDeviceID_smsFilterCapabilitiesOptions_filterExtensionName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSMSFilterCapabilitiesOptionsForDeviceID:smsFilterCapabilitiesOptions:filterExtensionName:");
}

id objc_msgSend_updateSMSHandshakeState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSMSHandshakeState:");
}

id objc_msgSend_updateSMSSpamExtensionNameChatProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSMSSpamExtensionNameChatProperty:");
}

id objc_msgSend_updateShouldForceToSMS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateShouldForceToSMS:");
}

id objc_msgSend_updateTransfer_currentBytes_totalBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTransfer:currentBytes:totalBytes:");
}

id objc_msgSend_useStandalone(void *a1, const char *a2, ...)
{
  return _[a1 useStandalone];
}

id objc_msgSend_userDefaultVoice(void *a1, const char *a2, ...)
{
  return _[a1 userDefaultVoice];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userNotificationWithIdentifier_timeout_alertLevel_displayFlags_displayInformation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:");
}

id objc_msgSend_userNotificationWithIdentifier_title_message_defaultButton_alternateButton_otherButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:");
}

id objc_msgSend_verifyCurrentRelayDevicesActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyCurrentRelayDevicesActive:");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return _[a1 version];
}

id objc_msgSend_watchConnectedOverBT(void *a1, const char *a2, ...)
{
  return _[a1 watchConnectedOverBT];
}

id objc_msgSend_writeAccountDefaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeAccountDefaults:");
}

id objc_msgSend_writeMessagePayloadToDisk_fileName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeMessagePayloadToDisk:fileName:");
}

id objc_msgSend_writeMessagePayloadToTemporaryDirectory_fileName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeMessagePayloadToTemporaryDirectory:fileName:");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:");
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:atomically:");
}