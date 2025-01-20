@interface CalDAVAddDropBoxAttachmentsTaskGroup
+ (id)dropboxACEItemsForPrincipalURLs:(id)a3 baseURL:(id)a4 writable:(BOOL)a5;
- (BOOL)attendeesCanManageDropBox;
- (CalDAVAddDropBoxAttachmentsTaskGroup)initWithAccountInfoProvider:(id)a3 dropboxURL:(id)a4 attachments:(id)a5 contentTypes:(id)a6 attendeePrincipalURLs:(id)a7 attendeesCanManageDropBox:(BOOL)a8 taskManager:(id)a9;
- (CoreDAVUpdateACLTaskGroup)updateACLTaskGroup;
- (NSDictionary)attachments;
- (NSDictionary)contentTypes;
- (NSDictionary)etags;
- (NSDictionary)putFailureSizes;
- (NSMutableDictionary)sentAttachmentURLsToETags;
- (NSSet)aceItems;
- (NSSet)attendeePrincipalURLs;
- (NSURL)dropboxURL;
- (int)state;
- (void)_finishWithError:(id)a3 state:(int)a4;
- (void)_makeDropBox;
- (void)_sendAttachments;
- (void)_updateACLWithState:(int)a3;
- (void)setAceItems:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setAttendeePrincipalURLs:(id)a3;
- (void)setAttendeesCanManageDropBox:(BOOL)a3;
- (void)setContentTypes:(id)a3;
- (void)setDropboxURL:(id)a3;
- (void)setPutFailureSizes:(id)a3;
- (void)setSentAttachmentURLsToETags:(id)a3;
- (void)setState:(int)a3;
- (void)setUpdateACLTaskGroup:(id)a3;
- (void)startTaskGroup;
- (void)task:(id)a3 didFinishWithError:(id)a4;
- (void)taskGroup:(id)a3 didFinishWithError:(id)a4;
@end

@implementation CalDAVAddDropBoxAttachmentsTaskGroup

- (CalDAVAddDropBoxAttachmentsTaskGroup)initWithAccountInfoProvider:(id)a3 dropboxURL:(id)a4 attachments:(id)a5 contentTypes:(id)a6 attendeePrincipalURLs:(id)a7 attendeesCanManageDropBox:(BOOL)a8 taskManager:(id)a9
{
  BOOL v9 = a8;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CalDAVAddDropBoxAttachmentsTaskGroup;
  v19 = [(CoreDAVTaskGroup *)&v23 initWithAccountInfoProvider:a3 taskManager:a9];
  v20 = v19;
  if (v19)
  {
    [(CalDAVAddDropBoxAttachmentsTaskGroup *)v19 setState:0];
    [(CalDAVAddDropBoxAttachmentsTaskGroup *)v20 setAttendeesCanManageDropBox:v9];
    v21 = [MEMORY[0x263EFF9A0] dictionary];
    [(CalDAVAddDropBoxAttachmentsTaskGroup *)v20 setSentAttachmentURLsToETags:v21];

    [(CalDAVAddDropBoxAttachmentsTaskGroup *)v20 setDropboxURL:v15];
    [(CalDAVAddDropBoxAttachmentsTaskGroup *)v20 setAttachments:v16];
    [(CalDAVAddDropBoxAttachmentsTaskGroup *)v20 setContentTypes:v17];
    [(CalDAVAddDropBoxAttachmentsTaskGroup *)v20 setAttendeePrincipalURLs:v18];
    [(CalDAVAddDropBoxAttachmentsTaskGroup *)v20 setAceItems:0];
  }

  return v20;
}

- (NSDictionary)etags
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = [(CalDAVAddDropBoxAttachmentsTaskGroup *)self sentAttachmentURLsToETags];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = [(CalDAVAddDropBoxAttachmentsTaskGroup *)self sentAttachmentURLsToETags];
        v11 = [v10 objectForKey:v9];

        v12 = [MEMORY[0x263EFF9D0] null];

        if (v11 != v12) {
          [v3 setObject:v11 forKey:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

- (void)_finishWithError:(id)a3 state:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(CalDAVAddDropBoxAttachmentsTaskGroup *)self setState:v4];
  if (v4 == 10)
  {
    uint64_t v7 = [MEMORY[0x263F34B30] sharedLogging];
    v8 = [v7 logHandleForAccountInfoProvider:0];
    uint64_t v9 = v8;
    if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      int v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_213CEC000, v9, OS_LOG_TYPE_ERROR, "Finishing %{public}@ early because state machine reached an unexpected state.", (uint8_t *)&v12, 0xCu);
    }
  }
  [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:v6 delegateCallbackBlock:0];
}

- (void)_updateACLWithState:(int)a3
{
  [(CalDAVAddDropBoxAttachmentsTaskGroup *)self setState:*(void *)&a3];
  uint64_t v4 = [(CalDAVAddDropBoxAttachmentsTaskGroup *)self aceItems];

  if (!v4)
  {
    uint64_t v5 = [(CalDAVAddDropBoxAttachmentsTaskGroup *)self attendeePrincipalURLs];
    id v6 = [(CalDAVAddDropBoxAttachmentsTaskGroup *)self dropboxURL];
    uint64_t v7 = +[CalDAVAddDropBoxAttachmentsTaskGroup dropboxACEItemsForPrincipalURLs:v5 baseURL:v6 writable:[(CalDAVAddDropBoxAttachmentsTaskGroup *)self attendeesCanManageDropBox]];
    [(CalDAVAddDropBoxAttachmentsTaskGroup *)self setAceItems:v7];
  }
  id v8 = objc_alloc(MEMORY[0x263F34BB0]);
  uint64_t v9 = [(CoreDAVTaskGroup *)self accountInfoProvider];
  v10 = [(CalDAVAddDropBoxAttachmentsTaskGroup *)self aceItems];
  v11 = [(CalDAVAddDropBoxAttachmentsTaskGroup *)self dropboxURL];
  int v12 = [(CoreDAVTaskGroup *)self taskManager];
  v13 = (void *)[v8 initWithAccountInfoProvider:v9 aceItems:v10 url:v11 taskManager:v12];
  [(CalDAVAddDropBoxAttachmentsTaskGroup *)self setUpdateACLTaskGroup:v13];

  uint64_t v14 = [(CalDAVAddDropBoxAttachmentsTaskGroup *)self updateACLTaskGroup];
  [v14 setDelegate:self];

  id v15 = [(CalDAVAddDropBoxAttachmentsTaskGroup *)self updateACLTaskGroup];
  [v15 startTaskGroup];
}

- (void)_makeDropBox
{
  [(CalDAVAddDropBoxAttachmentsTaskGroup *)self setState:3];
  id v3 = objc_alloc(MEMORY[0x263F34B38]);
  uint64_t v4 = [(CalDAVAddDropBoxAttachmentsTaskGroup *)self dropboxURL];
  id v7 = (id)[v3 initWithPropertiesToSet:0 atURL:v4];

  uint64_t v5 = [(CoreDAVTaskGroup *)self accountInfoProvider];
  [v7 setAccountInfoProvider:v5];

  [v7 setDelegate:self];
  id v6 = [(CoreDAVTaskGroup *)self taskManager];
  [v6 submitQueuedCoreDAVTask:v7];
}

- (void)_sendAttachments
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = [(CalDAVAddDropBoxAttachmentsTaskGroup *)self attachments];
  unint64_t v4 = [v3 count];
  uint64_t v5 = [(CalDAVAddDropBoxAttachmentsTaskGroup *)self sentAttachmentURLsToETags];
  unint64_t v6 = [v5 count];

  if (v4 <= v6)
  {
    [(CalDAVAddDropBoxAttachmentsTaskGroup *)self _finishWithError:0 state:11];
  }
  else
  {
    [(CalDAVAddDropBoxAttachmentsTaskGroup *)self setState:5];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = [(CalDAVAddDropBoxAttachmentsTaskGroup *)self attachments];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          v13 = [(CalDAVAddDropBoxAttachmentsTaskGroup *)self sentAttachmentURLsToETags];
          uint64_t v14 = [v13 objectForKey:v12];

          if (!v14)
          {
            id v15 = [(CalDAVAddDropBoxAttachmentsTaskGroup *)self contentTypes];
            long long v16 = [v15 objectForKey:v12];

            if ([v16 length])
            {
              long long v17 = [(CalDAVAddDropBoxAttachmentsTaskGroup *)self attachments];
              id v18 = [v17 objectForKey:v12];

              uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F34B98]) initWithDataPayload:v18 dataContentType:v16 atURL:v12 previousETag:0];
              [v19 setForceToServer:1];
              v20 = [(CoreDAVTaskGroup *)self accountInfoProvider];
              [v19 setAccountInfoProvider:v20];

              [v19 setDelegate:self];
              v21 = [(CoreDAVTaskGroup *)self taskManager];
              [v21 submitQueuedCoreDAVTask:v19];
            }
            else
            {
              [(CalDAVAddDropBoxAttachmentsTaskGroup *)self _finishWithError:0 state:8];
            }

            goto LABEL_18;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_18:
  }
}

- (void)startTaskGroup
{
  id v3 = [(CalDAVAddDropBoxAttachmentsTaskGroup *)self attendeePrincipalURLs];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    [(CalDAVAddDropBoxAttachmentsTaskGroup *)self _updateACLWithState:1];
  }
  else
  {
    [(CalDAVAddDropBoxAttachmentsTaskGroup *)self setState:2];
    id v5 = objc_alloc(MEMORY[0x263F34AE8]);
    unint64_t v6 = [(CalDAVAddDropBoxAttachmentsTaskGroup *)self dropboxURL];
    id v9 = (id)[v5 initWithURL:v6];

    id v7 = [(CoreDAVTaskGroup *)self accountInfoProvider];
    [v9 setAccountInfoProvider:v7];

    [v9 setDelegate:self];
    uint64_t v8 = [(CoreDAVTaskGroup *)self taskManager];
    [v8 submitQueuedCoreDAVTask:v9];
  }
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  id v22 = a3;
  id v6 = a4;
  if ([(CalDAVAddDropBoxAttachmentsTaskGroup *)self state] == 2)
  {
    if (v6)
    {
      [(CalDAVAddDropBoxAttachmentsTaskGroup *)self _makeDropBox];
      goto LABEL_20;
    }
LABEL_15:
    [(CalDAVAddDropBoxAttachmentsTaskGroup *)self _sendAttachments];
    goto LABEL_20;
  }
  if ([(CalDAVAddDropBoxAttachmentsTaskGroup *)self state] == 3)
  {
    if (!v6)
    {
      id v18 = [(CalDAVAddDropBoxAttachmentsTaskGroup *)self attendeePrincipalURLs];
      uint64_t v19 = [v18 count];

      if (v19)
      {
        [(CalDAVAddDropBoxAttachmentsTaskGroup *)self _updateACLWithState:4];
        goto LABEL_20;
      }
      goto LABEL_15;
    }
    id v7 = self;
    id v8 = v6;
    uint64_t v9 = 6;
LABEL_12:
    [(CalDAVAddDropBoxAttachmentsTaskGroup *)v7 _finishWithError:v8 state:v9];
    goto LABEL_20;
  }
  if ([(CalDAVAddDropBoxAttachmentsTaskGroup *)self state] != 5
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v7 = self;
    id v8 = v6;
    uint64_t v9 = 10;
    goto LABEL_12;
  }
  id v10 = v22;
  v11 = v10;
  if (v6)
  {
    uint64_t v12 = NSNumber;
    v13 = [v10 requestDataPayload];
    uint64_t v14 = objc_msgSend(v12, "numberWithUnsignedLongLong:", objc_msgSend(v13, "length"));

    id v15 = NSDictionary;
    long long v16 = [v11 url];
    long long v17 = [v15 dictionaryWithObject:v14 forKey:v16];
    [(CalDAVAddDropBoxAttachmentsTaskGroup *)self setPutFailureSizes:v17];

    [(CalDAVAddDropBoxAttachmentsTaskGroup *)self _finishWithError:v6 state:9];
  }
  else
  {
    uint64_t v14 = [v10 nextETag];
    if (!v14)
    {
      uint64_t v14 = [MEMORY[0x263EFF9D0] null];
    }
    v20 = [(CalDAVAddDropBoxAttachmentsTaskGroup *)self sentAttachmentURLsToETags];
    v21 = [v11 url];
    [v20 setObject:v14 forKey:v21];

    [(CalDAVAddDropBoxAttachmentsTaskGroup *)self _sendAttachments];
  }

LABEL_20:
}

- (void)taskGroup:(id)a3 didFinishWithError:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([(CalDAVAddDropBoxAttachmentsTaskGroup *)self state] == 1)
  {
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 state] == 5)
      {
        [(CalDAVAddDropBoxAttachmentsTaskGroup *)self _makeDropBox];
        goto LABEL_12;
      }
      goto LABEL_8;
    }
LABEL_9:
    [(CalDAVAddDropBoxAttachmentsTaskGroup *)self _sendAttachments];
    goto LABEL_12;
  }
  if ([(CalDAVAddDropBoxAttachmentsTaskGroup *)self state] != 4)
  {
    id v7 = self;
    id v8 = v6;
    uint64_t v9 = 10;
    goto LABEL_11;
  }
  if (!v6) {
    goto LABEL_9;
  }
LABEL_8:
  id v7 = self;
  id v8 = v6;
  uint64_t v9 = 7;
LABEL_11:
  [(CalDAVAddDropBoxAttachmentsTaskGroup *)v7 _finishWithError:v8 state:v9];
LABEL_12:
  [(CalDAVAddDropBoxAttachmentsTaskGroup *)self setUpdateACLTaskGroup:0];
}

+ (id)dropboxACEItemsForPrincipalURLs:(id)a3 baseURL:(id)a4 writable:(BOOL)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x263F34E10];
  uint64_t v8 = [MEMORY[0x263F34AA0] privilegeItemWithNameSpace:*MEMORY[0x263F34E10] andName:*MEMORY[0x263F34EE8]];
  uint64_t v9 = [MEMORY[0x263F34AA0] privilegeItemWithNameSpace:v7 andName:*MEMORY[0x263F34F60]];
  id v10 = [MEMORY[0x263EFFA08] setWithObject:v8];
  uint64_t v27 = (void *)v9;
  v28 = (void *)v8;
  v31 = v10;
  if (a5)
  {
    objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v8, v9, 0);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = v10;
  }
  uint64_t v12 = v11;
  v13 = [MEMORY[0x263EFF9C0] set];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v6;
  uint64_t v14 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v30 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v33 != v30) {
          objc_enumerationMutation(obj);
        }
        long long v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v18 = (void *)[objc_alloc(MEMORY[0x263F34B78]) initTypeIsHREFWithURL:v17];
        uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F34AA0]) initWithPrincipal:v18 shouldInvert:0 action:0 withPrivileges:v12];
        [v13 addObject:v19];

        v20 = [v17 CDVfixedURLByAppendingPathComponent:@"calendar-proxy-read/"];
        v21 = (void *)[objc_alloc(MEMORY[0x263F34B78]) initTypeIsHREFWithURL:v20];

        id v22 = (void *)[objc_alloc(MEMORY[0x263F34AA0]) initWithPrincipal:v21 shouldInvert:0 action:0 withPrivileges:v31];
        [v13 addObject:v22];

        long long v23 = [v17 CDVfixedURLByAppendingPathComponent:@"calendar-proxy-write/"];
        long long v24 = (void *)[objc_alloc(MEMORY[0x263F34B78]) initTypeIsHREFWithURL:v23];

        long long v25 = (void *)[objc_alloc(MEMORY[0x263F34AA0]) initWithPrincipal:v24 shouldInvert:0 action:0 withPrivileges:v12];
        [v13 addObject:v25];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v15);
  }

  return v13;
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (NSDictionary)putFailureSizes
{
  return self->_putFailureSizes;
}

- (void)setPutFailureSizes:(id)a3
{
}

- (BOOL)attendeesCanManageDropBox
{
  return self->_attendeesCanManageDropBox;
}

- (void)setAttendeesCanManageDropBox:(BOOL)a3
{
  self->_attendeesCanManageDropBox = a3;
}

- (NSMutableDictionary)sentAttachmentURLsToETags
{
  return self->_sentAttachmentURLsToETags;
}

- (void)setSentAttachmentURLsToETags:(id)a3
{
}

- (NSURL)dropboxURL
{
  return self->_dropboxURL;
}

- (void)setDropboxURL:(id)a3
{
}

- (NSDictionary)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (NSDictionary)contentTypes
{
  return self->_contentTypes;
}

- (void)setContentTypes:(id)a3
{
}

- (NSSet)attendeePrincipalURLs
{
  return self->_attendeePrincipalURLs;
}

- (void)setAttendeePrincipalURLs:(id)a3
{
}

- (NSSet)aceItems
{
  return self->_aceItems;
}

- (void)setAceItems:(id)a3
{
}

- (CoreDAVUpdateACLTaskGroup)updateACLTaskGroup
{
  return self->_updateACLTaskGroup;
}

- (void)setUpdateACLTaskGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateACLTaskGroup, 0);
  objc_storeStrong((id *)&self->_aceItems, 0);
  objc_storeStrong((id *)&self->_attendeePrincipalURLs, 0);
  objc_storeStrong((id *)&self->_contentTypes, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_dropboxURL, 0);
  objc_storeStrong((id *)&self->_sentAttachmentURLsToETags, 0);
  objc_storeStrong((id *)&self->_putFailureSizes, 0);
}

@end