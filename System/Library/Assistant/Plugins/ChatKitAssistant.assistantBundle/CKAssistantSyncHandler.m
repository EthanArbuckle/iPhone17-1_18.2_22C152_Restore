@interface CKAssistantSyncHandler
- (NSMutableArray)domainObjects;
- (NSMutableArray)postAnchors;
- (NSString)finalAnchor;
- (id)identifierForChatIdentifier:(id)a3;
- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6;
- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4;
- (void)setDomainObjects:(id)a3;
- (void)setFinalAnchor:(id)a3;
- (void)setPostAnchors:(id)a3;
- (void)syncDidEnd;
@end

@implementation CKAssistantSyncHandler

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

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6
{
  id v24 = a3;
  id v25 = a4;
  id v10 = a5;
  id v23 = a6;
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v24;
      __int16 v28 = 2112;
      id v29 = v25;
      __int16 v30 = 2112;
      id v31 = v10;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "beginSyncWithAnchor: %@ validity: %@ forKey: %@", buf, 0x20u);
    }
  }
  if ([v10 isEqualToString:@"com.apple.chatkit.groups"])
  {
    [(CKAssistantSyncHandler *)self syncDidEnd];
    CFArrayRef v12 = (const __CFArray *)IMDChatRecordCopyAllNamedChats();
    CFArrayRef v13 = v12;
    if (v12)
    {
      if (CFArrayGetCount(v12))
      {
        [(CKAssistantSyncHandler *)self setFinalAnchor:0];
        [(CKAssistantSyncHandler *)self setPostAnchors:0];
        [(CKAssistantSyncHandler *)self setDomainObjects:0];
        v14 = +[NSMutableArray array];
        v15 = +[NSMutableArray array];
        v16 = +[NSMutableString string];
        objc_msgSend(v16, "appendFormat:", @"%ld:", CFArrayGetCount(v13));
        if (CFArrayGetCount(v13) >= 1)
        {
          CFIndex v17 = 0;
          do
          {
            if (CFArrayGetValueAtIndex(v13, v17))
            {
              v26 = 0;
              *(void *)buf = 0;
              _IMDChatRecordBulkCopy();
              if (objc_msgSend(v26, "length", 0, &v26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                     0,
                     0,
                     0))
              {
                id v18 = objc_alloc_init((Class)SASmsGroupName);
                v19 = [(CKAssistantSyncHandler *)self identifierForChatIdentifier:*(void *)buf];
                [v18 setIdentifier:v19];

                [v18 setGroupName:v26];
                [v18 setGroupNameId:*(void *)buf];
                [v15 addObject:v18];
                v20 = +[NSString stringWithFormat:@"%ld", v17];
                [v14 addObject:v20];

                v21 = +[NSString stringWithFormat:@"%@-%@", *(void *)buf, v26];
                [v16 appendString:v21];
              }
              if (*(void *)buf) {
                CFRelease(*(CFTypeRef *)buf);
              }
              if (v26) {
                CFRelease(v26);
              }
            }
            ++v17;
          }
          while (v17 < CFArrayGetCount(v13));
        }
        v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lu", [v16 hash]);
        [v14 addObject:v22];
        if (([v22 isEqualToString:v25] & 1) == 0)
        {
          [v23 resetWithValidity:v22];
          [(CKAssistantSyncHandler *)self setPostAnchors:v14];
          [(CKAssistantSyncHandler *)self setDomainObjects:v15];
        }
        CFRelease(v13);
      }
      else
      {
        CFRelease(v13);
      }
    }
  }
}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      unint64_t v25 = (unint64_t)v6;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "getChangeAfterAnchor: %@", (uint8_t *)&v24, 0xCu);
    }
  }
  v9 = [(CKAssistantSyncHandler *)self domainObjects];
  if (![v9 count])
  {

    goto LABEL_12;
  }
  id v10 = [(CKAssistantSyncHandler *)self finalAnchor];
  unsigned __int8 v11 = [v10 isEqualToString:v6];

  if (v11)
  {
LABEL_12:
    unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_13;
  }
  if (v6)
  {
    CFArrayRef v12 = [(CKAssistantSyncHandler *)self postAnchors];
    id v13 = [v12 indexOfObject:v6];

    if (v13 == (id)0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = (unint64_t)v13 + 1;
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
LABEL_13:
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = [(CKAssistantSyncHandler *)self domainObjects];
      id v17 = [v16 count];
      int v24 = 134218240;
      unint64_t v25 = v14;
      __int16 v26 = 2048;
      id v27 = v17;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Syncing index: %lu from %lu available objects.", (uint8_t *)&v24, 0x16u);
    }
  }
  if (v14 == 0x7FFFFFFFFFFFFFFFLL
    || ([(CKAssistantSyncHandler *)self domainObjects],
        id v18 = objc_claimAutoreleasedReturnValue(),
        BOOL v19 = v14 < (unint64_t)[v18 count],
        v18,
        !v19))
  {
    [v7 setObject:0];
    [v7 setPostAnchor:v6];
  }
  else
  {
    v20 = [(CKAssistantSyncHandler *)self domainObjects];
    v21 = [v20 objectAtIndex:v14];
    [v7 setObject:v21];

    v22 = [(CKAssistantSyncHandler *)self postAnchors];
    id v23 = [v22 objectAtIndex:v14];
    [v7 setPostAnchor:v23];
  }
}

- (void)syncDidEnd
{
  finalAnchor = self->_finalAnchor;
  self->_finalAnchor = 0;

  postAnchors = self->_postAnchors;
  self->_postAnchors = 0;

  domainObjects = self->_domainObjects;
  self->_domainObjects = 0;
}

- (NSString)finalAnchor
{
  return self->_finalAnchor;
}

- (void)setFinalAnchor:(id)a3
{
}

- (NSMutableArray)postAnchors
{
  return self->_postAnchors;
}

- (void)setPostAnchors:(id)a3
{
}

- (NSMutableArray)domainObjects
{
  return self->_domainObjects;
}

- (void)setDomainObjects:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainObjects, 0);
  objc_storeStrong((id *)&self->_postAnchors, 0);

  objc_storeStrong((id *)&self->_finalAnchor, 0);
}

@end