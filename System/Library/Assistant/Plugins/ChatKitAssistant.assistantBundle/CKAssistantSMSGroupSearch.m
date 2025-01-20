@interface CKAssistantSMSGroupSearch
- (id)_search;
- (id)_validate;
- (id)identifierForChatIdentifier:(id)a3;
- (void)performWithCompletion:(id)a3;
@end

@implementation CKAssistantSMSGroupSearch

- (id)identifierForChatIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    v4 = [@"x-apple-sms-group://" stringByAppendingString:v3];
    v5 = +[NSURL URLWithString:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_search
{
  id v3 = objc_alloc_init((Class)SASmsGroupSearchCompleted);
  CFArrayRef v4 = (const __CFArray *)IMDChatRecordCopyAllNamedChats();
  if (v4)
  {
    CFArrayRef v5 = v4;
    if (!CFArrayGetCount(v4))
    {
      CFRelease(v5);
      v14 = 0;
      goto LABEL_25;
    }
    id v6 = objc_alloc_init((Class)NSMutableArray);
    if (CFArrayGetCount(v5) >= 1)
    {
      CFIndex v7 = 0;
      do
      {
        if (CFArrayGetValueAtIndex(v5, v7))
        {
          v16[1] = 0;
          *(void *)buf = 0;
          v16[0] = 0;
          _IMDChatRecordBulkCopy();
          if (objc_msgSend(v16[0], "length", 0, v16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                 0,
                 0,
                 0))
          {
            v8 = [(CKAssistantSMSGroupSearch *)self smsGroupName];
            [v8 isEqualToString:v16[0]];
          }
        }
        ++v7;
      }
      while (v7 < CFArrayGetCount(v5));
    }
    if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = [(CKAssistantSMSGroupSearch *)self smsGroupName];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v10;
        __int16 v18 = 2112;
        id v19 = v6;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Looking at groups with name %@ and found groups names %@", buf, 0x16u);
      }
    }
    [v3 setSmsGroups:v6];
    CFRelease(v5);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = [(CKAssistantSMSGroupSearch *)self smsGroupName];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v12;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Looking at groups with name %@ but there were no named chats at all", buf, 0xCu);
      }
    }
    id v6 = v3;
    id v3 = 0;
  }

  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v3;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "SMS Group search returning result %@", buf, 0xCu);
    }
  }
  id v3 = v3;
  v14 = v3;
LABEL_25:

  return v14;
}

- (id)_validate
{
  v2 = [(CKAssistantSMSGroupSearch *)self smsGroupName];
  if ([v2 length]) {
    id v3 = 0;
  }
  else {
    id v3 = [objc_alloc((Class)SACommandFailed) initWithReason:@"CKAssistantSMSGroupSearch has nil or empty group name"];
  }

  return v3;
}

- (void)performWithCompletion:(id)a3
{
  CFArrayRef v4 = (void (**)(id, void *))a3;
  if (IMOSLoggingEnabled())
  {
    CFArrayRef v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "SMSGroupSearch performWithCompletion", buf, 2u);
    }
  }
  uint64_t v6 = [(CKAssistantSMSGroupSearch *)self _validate];
  if (v6)
  {
    CFIndex v7 = (void *)v6;
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "SMSGroupSearch performWithCompletion", v10, 2u);
      }
    }
  }
  else
  {
    CFIndex v7 = [(CKAssistantSMSGroupSearch *)self _perform];
  }
  v9 = [v7 dictionary];
  v4[2](v4, v9);
}

@end