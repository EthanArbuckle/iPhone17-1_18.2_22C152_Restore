@interface CKAssistantSearch
- (id)_appInfoForMessage:(id)a3;
- (id)_getPersonAttributeFromHandle:(id)a3;
- (id)_getRecipientsFromMessage:(id)a3;
- (id)_getSenderFromMessage:(id)a3;
- (id)_messageTypeForMessage:(id)a3;
- (id)_perform;
- (id)_smsForIMSPIMessage:(id)a3;
- (id)_validate;
- (id)personFromRawAddress:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation CKAssistantSearch

- (id)personFromRawAddress:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    v4 = +[IMContactStore sharedInstance];
    v5 = [v4 fetchCNContactForHandleWithID:v3];

    if (v5)
    {
      id v38 = v3;
      id v40 = objc_alloc_init((Class)SAPerson);
      v6 = +[NSMutableArray array];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      v7 = +[IMContactStore phoneNumbersForCNContact:v5];
      id v8 = [v7 countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v46;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v46 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v45 + 1) + 8 * i);
            id v13 = objc_alloc_init((Class)SAPhone);
            [v13 setNumber:v12];
            [v6 addObject:v13];
          }
          id v9 = [v7 countByEnumeratingWithState:&v45 objects:v50 count:16];
        }
        while (v9);
      }

      if (v6)
      {
        id v14 = [v6 copy];
        [v40 setPhones:v14];
      }
      v39 = +[NSMutableArray array];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      v15 = +[IMContactStore emailsForCNContact:v5];
      id v16 = [v15 countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v42;
        do
        {
          for (j = 0; j != v17; j = (char *)j + 1)
          {
            if (*(void *)v42 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v41 + 1) + 8 * (void)j);
            id v21 = objc_alloc_init((Class)SAEmail);
            [v21 setEmailAddress:v20];
            [v6 addObject:v21];
          }
          id v17 = [v15 countByEnumeratingWithState:&v41 objects:v49 count:16];
        }
        while (v17);
      }

      v22 = v40;
      if (v39)
      {
        id v23 = [v39 copy];
        [v40 setEmails:v23];
      }
      v24 = +[IMContactStore firstNameForCNContact:v5];
      if ([v24 length]) {
        [v40 setFirstName:v24];
      }
      v25 = +[IMContactStore lastNameForCNContact:v5];
      if ([v25 length]) {
        [v40 setLastName:v25];
      }
      v26 = [v5 middleName];
      if ([v26 length]) {
        [v40 setMiddleName:v26];
      }
      v27 = +[IMContactStore fullNameForCNContact:v5];
      if ([v27 length]) {
        [v40 setFullName:v27];
      }
      v36 = v25;
      v28 = [v5 namePrefix];
      if ([v28 length]) {
        [v40 setPrefix:v28];
      }
      v29 = [v5 nameSuffix];
      if ([v29 length]) {
        [v40 setSuffix:v29];
      }
      v37 = v24;
      v30 = +[IMContactStore nickNameForCNContact:v5];
      if ([v30 length]) {
        [v40 setNickName:v30];
      }
      v31 = [v5 birthday];
      if (v31)
      {
        v32 = +[NSCalendar currentCalendar];
        v33 = [v32 dateFromComponents:v31];
        [v40 setBirthday:v33];

        v22 = v40;
      }

      id v3 = v38;
    }
    else
    {
      v22 = 0;
    }
    id v34 = v22;
  }
  else
  {
    id v34 = 0;
  }

  return v34;
}

- (id)_messageTypeForMessage:(id)a3
{
  id v3 = [a3 messageType];
  switch((unint64_t)v3)
  {
    case 'e':
      v4 = (void **)&SASmsSmsMessageTypeAudioMessageValue;
      break;
    case 'f':
      v4 = (void **)&SASmsSmsMessageTypeDigitalTouchValue;
      break;
    case 'g':
      v4 = (void **)&SASmsSmsMessageTypeHandwritingValue;
      break;
    case 'h':
      v4 = (void **)&SASmsSmsMessageTypeStickerValue;
      break;
    case 'i':
      v4 = (void **)&SASmsSmsMessageTypeTapBackLikedValue;
      break;
    case 'j':
      v4 = (void **)&SASmsSmsMessageTypeTapBackDislikedValue;
      break;
    case 'k':
      v4 = (void **)&SASmsSmsMessageTypeTapBackEmphasizedValue;
      break;
    case 'l':
      v4 = (void **)&SASmsSmsMessageTypeTapBackLovedValue;
      break;
    case 'm':
      v4 = (void **)&SASmsSmsMessageTypeTapBackQuestionedValue;
      break;
    case 'n':
      v4 = (void **)&SASmsSmsMessageTypeTapBackLaughedValue;
      break;
    default:
      v4 = (void **)&SASmsSmsMessageTypeMessageValue;
      switch((unint64_t)v3)
      {
        case 0xC8uLL:
          v4 = (void **)&SASmsSmsMessageTypeMediaTypeImageValue;
          break;
        case 0xC9uLL:
          v4 = (void **)&SASmsSmsMessageTypeMediaTypeVideoValue;
          break;
        case 0xCAuLL:
          v4 = (void **)&SASmsSmsMessageTypeMediaTypeAudioValue;
          break;
        case 0xCBuLL:
          v4 = (void **)&SASmsSmsMessageTypeMediaTypeCalendarValue;
          break;
        case 0xCCuLL:
          v4 = (void **)&SASmsSmsMessageTypeMediaTypeAddressCardValue;
          break;
        case 0xCDuLL:
          v4 = (void **)&SASmsSmsMessageTypeMediaTypePassValue;
          break;
        case 0xD0uLL:
          v4 = (void **)&SASmsSmsMessageTypeMediaTypeLocationValue;
          break;
        default:
          goto LABEL_20;
      }
      break;
  }
LABEL_20:
  v5 = *v4;

  return v5;
}

- (id)_getPersonAttributeFromHandle:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)SAPersonAttribute);
  v6 = [v4 address];
  [v5 setData:v6];

  v7 = [v4 address];
  id v8 = [(CKAssistantSearch *)self personFromRawAddress:v7];

  id v9 = [v4 displayName];

  [v5 setDisplayText:v9];
  [v5 setObject:v8];

  return v5;
}

- (id)_getRecipientsFromMessage:(id)a3
{
  id v4 = [a3 recipients];
  if ((unint64_t)[v4 count] >= 2)
  {
    id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = -[CKAssistantSearch _getPersonAttributeFromHandle:](self, "_getPersonAttributeFromHandle:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          if (v11) {
            [v5 addObject:v11];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_getSenderFromMessage:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)SAPersonAttribute);
  id v6 = [v4 sender];
  id v7 = [v6 address];
  id v8 = [(CKAssistantSearch *)self personFromRawAddress:v7];

  [v5 setObject:v8];
  uint64_t v9 = [v4 sender];
  uint64_t v10 = [v9 address];
  [v5 setData:v10];

  v11 = [v8 fullName];
  if (v11)
  {
    uint64_t v12 = [v8 fullName];
    [v5 setDisplayText:v12];
  }
  else
  {
    uint64_t v12 = [v4 sender];
    long long v13 = [v12 address];
    [v5 setDisplayText:v13];
  }

  return v5;
}

- (id)_smsForIMSPIMessage:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)SASmsSms);
  id v6 = [v4 date];
  [v5 setDateSent:v6];

  id v7 = [v4 subject];
  [v5 setSubject:v7];

  id v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isAudioMessage]);
  [v5 setIsAudioMessage:v8];

  uint64_t v9 = [v4 displayName];
  objc_msgSend(v5, "setHasGroupName:", objc_msgSend(v9, "length") != 0);

  uint64_t v10 = [v4 lastReadDate];
  [v5 setDateLastMessageReadInThread:v10];

  v11 = [(CKAssistantSearch *)self _messageTypeForMessage:v4];
  [v5 setMessageType:v11];

  uint64_t v12 = [v4 chatGuids];
  long long v13 = [v12 firstObject];
  [v5 setChatIdentifier:v13];

  long long v14 = [v4 lastReadDate];
  [v5 setDateLastMessageReadInThread:v14];

  long long v15 = [v4 effect];
  [v5 setEffect:v15];

  if ([v5 hasGroupName])
  {
    long long v16 = [v4 displayName];
    [v5 setGroupName:v16];
  }
  id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"x-apple-sms:guid=%lld", [v4 messageID]);
  uint64_t v18 = +[NSURL URLWithString:v17];
  [v5 setIdentifier:v18];

  v19 = [(CKAssistantSearch *)self _getSenderFromMessage:v4];
  [v5 setMsgSender:v19];

  uint64_t v20 = [(CKAssistantSearch *)self _getRecipientsFromMessage:v4];
  [v5 setMsgRecipients:v20];

  if (IMOSLoggingEnabled())
  {
    id v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = [v5 msgRecipients];
      id v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v22 count]);
      *(_DWORD *)buf = 138412290;
      v26 = v23;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Message has %@ recipients.", buf, 0xCu);
    }
  }

  return v5;
}

- (id)_appInfoForMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 bundleId];
  if ([v4 length])
  {
    id v5 = objc_alloc_init((Class)SASyncAppIdentifyingInfo);
    [v5 setBundleId:v4];
    id v6 = objc_alloc_init((Class)SAAppInfo);
    id v7 = [v3 displayAppName];
    [v6 setDisplayAppName:v7];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_validate
{
  return 0;
}

- (id)_perform
{
  uint64_t v3 = +[NSMutableArray array];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_50E0;
  v54[3] = &unk_104C0;
  v54[4] = self;
  id v42 = (id)v3;
  id v55 = v42;
  dispatch_semaphore_t dsema = v4;
  dispatch_semaphore_t v56 = dsema;
  long long v44 = objc_retainBlock(v54);
  id v5 = [(CKAssistantSearch *)self smsGroup];
  id v6 = [v5 groupNameId];
  LOBYTE(v3) = [v6 length] == 0;

  if (v3)
  {
    long long v14 = [(CKAssistantSearch *)self senders];
    BOOL v15 = [v14 count] == 0;

    if (v15)
    {
      if (IMOSLoggingEnabled())
      {
        v37 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "No senders or groups specified, searching for last 10 unread messages", buf, 2u);
        }
      }
      IMSPIQueryUnreadMessages();
    }
    else
    {
      long long v16 = [(CKAssistantSearch *)self senders];
      long long v41 = [v16 objectAtIndex:0];

      id v17 = +[NSMutableArray array];
      uint64_t v18 = +[NSMutableArray array];
      v19 = +[NSMutableArray array];
      uint64_t v20 = +[IMContactStore sharedInstance];
      id v21 = [v41 internalGUID];
      v22 = [v20 fetchCNContactWithIdentifier:v21];

      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id obj = v22;
      id v23 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v51;
        do
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v51 != v24) {
              objc_enumerationMutation(obj);
            }
            uint64_t v26 = *(void *)(*((void *)&v50 + 1) + 8 * i);
            v27 = +[IMContactStore phoneNumbersForCNContact:v26];
            [v17 addObjectsFromArray:v27];

            v28 = +[IMContactStore emailsForCNContact:v26];
            [v17 addObjectsFromArray:v28];
          }
          id v23 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
        }
        while (v23);
      }

      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v29 = v17;
      id v30 = [v29 countByEnumeratingWithState:&v46 objects:v61 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v47;
        uint64_t v32 = IMSPIiMessageService;
        uint64_t v33 = IMSPISMSService;
        do
        {
          for (j = 0; j != v30; j = (char *)j + 1)
          {
            if (*(void *)v47 != v31) {
              objc_enumerationMutation(v29);
            }
            v35 = +[CKAssistantSearchUtilities canonicalizeNumber:*(void *)(*((void *)&v46 + 1) + 8 * (void)j)];
            if (v35)
            {
              [v19 addObject:v35];
              [v18 addObject:v32];
              [v19 addObject:v35];
              [v18 addObject:v33];
            }
          }
          id v30 = [v29 countByEnumeratingWithState:&v46 objects:v61 count:16];
        }
        while (v30);
      }

      if (IMOSLoggingEnabled())
      {
        v36 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v58 = v18;
          __int16 v59 = 2112;
          v60 = v19;
          _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, "Searching for last 10 messages with IDs %@ and services %@", buf, 0x16u);
        }
      }
      IMSPIQueryMessagesWithIDs();
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = [(CKAssistantSearch *)self smsGroup];
        uint64_t v9 = [v8 groupNameId];
        *(_DWORD *)buf = 138412290;
        v58 = v9;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Searching for imessages with groupID %@", buf, 0xCu);
      }
    }
    uint64_t v10 = +[NSArray arrayWithObject:IMSPIiMessageService];
    v11 = [(CKAssistantSearch *)self smsGroup];
    uint64_t v12 = [v11 groupNameId];
    long long v13 = +[NSArray arrayWithObject:v12];

    IMSPIQueryMessagesWithChatIdentifiers();
  }
  dispatch_time_t v38 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(dsema, v38);
  id v39 = objc_alloc_init((Class)SASmsSearchCompleted);
  [v39 setResults:v42];

  return v39;
}

- (void)performWithCompletion:(id)a3
{
  dispatch_semaphore_t v4 = (void (**)(id, void *))a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "CKAssistantSearch performWithCompletion", (uint8_t *)&v10, 2u);
    }
  }
  id v6 = [(CKAssistantSearch *)self _validate];
  if (!v6)
  {
    id v6 = [(CKAssistantSearch *)self _perform];
  }
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v6 dictionary];
      int v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "CKAssistantSearch returning %@", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t v9 = [v6 dictionary];
  v4[2](v4, v9);
}

@end