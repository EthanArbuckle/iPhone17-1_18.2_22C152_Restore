@interface CalDAVModifySharedCalendarShareeListTaskGroup
- (BOOL)muteNotifications;
- (CalDAVModifySharedCalendarShareeListTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4;
- (CalDAVModifySharedCalendarShareeListTaskGroup)initWithShareesToSet:(id)a3 shareesToRemove:(id)a4 muteNotifications:(BOOL)a5 summary:(id)a6 atCalendarURL:(id)a7 accountInfoProvider:(id)a8 taskManager:(id)a9;
- (NSMutableSet)invalidSharees;
- (NSSet)shareesToRemove;
- (NSSet)shareesToSet;
- (NSString)summary;
- (NSURL)calendarURL;
- (id)generateModificationMessageBody;
- (void)setCalendarURL:(id)a3;
- (void)setInvalidSharees:(id)a3;
- (void)setMuteNotifications:(BOOL)a3;
- (void)setShareesToRemove:(id)a3;
- (void)setShareesToSet:(id)a3;
- (void)setSummary:(id)a3;
- (void)startTaskGroup;
- (void)task:(id)a3 didFinishWithError:(id)a4;
@end

@implementation CalDAVModifySharedCalendarShareeListTaskGroup

- (CalDAVModifySharedCalendarShareeListTaskGroup)initWithAccountInfoProvider:(id)a3 taskManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"Initializing this class instance with an inherited initializer not allowed." userInfo:0];
  objc_exception_throw(v7);
}

- (CalDAVModifySharedCalendarShareeListTaskGroup)initWithShareesToSet:(id)a3 shareesToRemove:(id)a4 muteNotifications:(BOOL)a5 summary:(id)a6 atCalendarURL:(id)a7 accountInfoProvider:(id)a8 taskManager:(id)a9
{
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  v22.receiver = self;
  v22.super_class = (Class)CalDAVModifySharedCalendarShareeListTaskGroup;
  v19 = [(CoreDAVTaskGroup *)&v22 initWithAccountInfoProvider:a8 taskManager:a9];
  v20 = v19;
  if (v19)
  {
    [(CalDAVModifySharedCalendarShareeListTaskGroup *)v19 setShareesToRemove:v16];
    [(CalDAVModifySharedCalendarShareeListTaskGroup *)v20 setShareesToSet:v15];
    [(CalDAVModifySharedCalendarShareeListTaskGroup *)v20 setCalendarURL:v18];
    [(CalDAVModifySharedCalendarShareeListTaskGroup *)v20 setSummary:v17];
    [(CalDAVModifySharedCalendarShareeListTaskGroup *)v20 setInvalidSharees:0];
    [(CalDAVModifySharedCalendarShareeListTaskGroup *)v20 setMuteNotifications:v12];
  }

  return v20;
}

- (void)startTaskGroup
{
  v3 = [CalDAVModifySharedCalendarShareeListPostTask alloc];
  v4 = [(CalDAVModifySharedCalendarShareeListTaskGroup *)self generateModificationMessageBody];
  id v5 = [(CalDAVModifySharedCalendarShareeListTaskGroup *)self calendarURL];
  v8 = [(CoreDAVPostTask *)v3 initWithDataPayload:v4 dataContentType:@"text/xml" atURL:v5 previousETag:0];

  id v6 = [(CoreDAVTaskGroup *)self accountInfoProvider];
  [(CalDAVModifySharedCalendarShareeListPostTask *)v8 setAccountInfoProvider:v6];

  [(CalDAVModifySharedCalendarShareeListPostTask *)v8 setDelegate:self];
  id v7 = [(CoreDAVTaskGroup *)self taskManager];
  [v7 submitQueuedCoreDAVTask:v8];
}

- (id)generateModificationMessageBody
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F34BB8]);
  uint64_t v4 = *MEMORY[0x263F34DA8];
  objc_msgSend(v3, "startElement:inNamespace:withAttributeNamesAndValues:");
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v40 = self;
  obuint64_t j = [(CalDAVModifySharedCalendarShareeListTaskGroup *)self shareesToSet];
  uint64_t v5 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v38 = *(void *)v46;
    uint64_t v36 = *MEMORY[0x263F34E50];
    id v34 = (id)*MEMORY[0x263F34E10];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v46 != v38) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        [v3 startElement:@"set" inNamespace:v4 withAttributeNamesAndValues:0];
        v9 = [v8 href];
        v10 = [v9 payloadAsString];
        [v3 appendElement:v36 inNamespace:v34 withStringContent:v10 withAttributeNamesAndValues:0];

        v11 = [v8 commonName];
        BOOL v12 = [v11 payloadAsString];
        [v3 appendElement:@"common-name" inNamespace:v4 withStringContent:v12 withAttributeNamesAndValues:0];

        v13 = [(CalDAVModifySharedCalendarShareeListTaskGroup *)v40 summary];
        [v3 appendElement:@"summary" inNamespace:v4 withStringContent:v13 withAttributeNamesAndValues:0];

        v14 = [v8 access];
        id v15 = [v14 accessLevel];

        id v16 = [v15 name];

        if (v16)
        {
          id v17 = [v15 name];
          id v18 = [v15 nameSpace];
          [v3 appendElement:v17 inNamespace:v18 withStringContent:0 withAttributeNamesAndValues:0];
        }
        [v3 endElement:@"set" inNamespace:v4];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v6);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v35 = [(CalDAVModifySharedCalendarShareeListTaskGroup *)v40 shareesToRemove];
  uint64_t v19 = [v35 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v42;
    uint64_t v39 = *MEMORY[0x263F34E50];
    uint64_t v37 = *MEMORY[0x263F34E10];
    id obja = (id)*MEMORY[0x263F34EB8];
    uint64_t v31 = *MEMORY[0x263F34F68];
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v42 != v21) {
          objc_enumerationMutation(v35);
        }
        v23 = *(void **)(*((void *)&v41 + 1) + 8 * j);
        v24 = [v23 href];
        v25 = [v24 payloadAsString];
        uint64_t v26 = [v25 length];

        if (v26)
        {
          [v3 startElement:@"remove" inNamespace:v4 withAttributeNamesAndValues:0];
          v27 = [v23 href];
          v28 = [v27 payloadAsString];
          [v3 appendElement:v39 inNamespace:v37 withStringContent:v28 withAttributeNamesAndValues:0];

          if ([(CalDAVModifySharedCalendarShareeListTaskGroup *)v40 muteNotifications]) {
            [v3 appendElement:obja inNamespace:v31 withStringContent:0 withAttributeNamesAndValues:0];
          }
          [v3 endElement:@"remove" inNamespace:v4];
        }
      }
      uint64_t v20 = [v35 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v20);
  }

  [v3 endElement:@"share" inNamespace:v4];
  v29 = [v3 data];

  return v29;
}

- (void)task:(id)a3 didFinishWithError:(id)a4
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    if ([v6 responseStatusCode] == 207)
    {
      v52 = self;
      id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      id v48 = v6;
      long long v47 = [v6 responseBodyParser];
      [v47 rootElement];
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v46 = v65 = 0u;
      obuint64_t j = [v46 responses];
      uint64_t v9 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v63;
        uint64_t v49 = *(void *)v63;
        do
        {
          uint64_t v12 = 0;
          uint64_t v50 = v10;
          do
          {
            if (*(void *)v63 != v11) {
              objc_enumerationMutation(obj);
            }
            v13 = *(void **)(*((void *)&v62 + 1) + 8 * v12);
            v14 = [v13 status];
            id v15 = [v14 payloadAsString];
            int v16 = [v15 CDVIsHTTPStatusLineWithStatusCode:403];

            if (v16)
            {
              uint64_t v53 = v12;
              long long v60 = 0u;
              long long v61 = 0u;
              long long v58 = 0u;
              long long v59 = 0u;
              id v17 = [v13 hrefs];
              uint64_t v18 = [v17 countByEnumeratingWithState:&v58 objects:v69 count:16];
              if (v18)
              {
                uint64_t v19 = v18;
                uint64_t v20 = *(void *)v59;
                do
                {
                  for (uint64_t i = 0; i != v19; ++i)
                  {
                    if (*(void *)v59 != v20) {
                      objc_enumerationMutation(v17);
                    }
                    objc_super v22 = *(void **)(*((void *)&v58 + 1) + 8 * i);
                    v23 = [v22 payloadAsFullURL];
                    v24 = [v23 absoluteString];

                    if (v24)
                    {
                      [v8 addObject:v24];
                    }
                    else
                    {
                      v25 = [MEMORY[0x263F34B30] sharedLogging];
                      uint64_t v26 = [v25 logHandleForAccountInfoProvider:0];
                      v27 = v26;
                      if (v26 && os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v68 = v22;
                        _os_log_impl(&dword_213CEC000, v27, OS_LOG_TYPE_ERROR, "HREF had unusable URL payload, %@", buf, 0xCu);
                      }
                    }
                  }
                  uint64_t v19 = [v17 countByEnumeratingWithState:&v58 objects:v69 count:16];
                }
                while (v19);
              }

              uint64_t v11 = v49;
              uint64_t v10 = v50;
              uint64_t v12 = v53;
            }
            ++v12;
          }
          while (v12 != v10);
          uint64_t v10 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
        }
        while (v10);
      }

      if ([v8 count])
      {
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        self = v52;
        v28 = [(CalDAVModifySharedCalendarShareeListTaskGroup *)v52 shareesToSet];
        uint64_t v29 = [v28 countByEnumeratingWithState:&v54 objects:v66 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v55;
          do
          {
            for (uint64_t j = 0; j != v30; ++j)
            {
              if (*(void *)v55 != v31) {
                objc_enumerationMutation(v28);
              }
              v33 = *(void **)(*((void *)&v54 + 1) + 8 * j);
              id v34 = [v33 href];
              id v35 = [v34 payloadAsFullURL];
              uint64_t v36 = [v35 absoluteString];
              int v37 = [v8 containsObject:v36];

              self = v52;
              if (v37)
              {
                uint64_t v38 = [(CalDAVModifySharedCalendarShareeListTaskGroup *)v52 invalidSharees];

                if (!v38)
                {
                  id v39 = objc_alloc_init(MEMORY[0x263EFF9C0]);
                  [(CalDAVModifySharedCalendarShareeListTaskGroup *)v52 setInvalidSharees:v39];
                }
                v40 = [(CalDAVModifySharedCalendarShareeListTaskGroup *)v52 invalidSharees];
                [v40 addObject:v33];
              }
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v54 objects:v66 count:16];
          }
          while (v30);
        }

        long long v41 = [(CalDAVModifySharedCalendarShareeListTaskGroup *)self invalidSharees];
        uint64_t v42 = [v41 count];

        if (v42)
        {
          id v7 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"CalDAVErrorDomain" code:0 userInfo:0];
LABEL_45:
          id v6 = v48;

          goto LABEL_46;
        }
      }
      else
      {
        long long v43 = [MEMORY[0x263F34B30] sharedLogging];
        long long v44 = [v43 logHandleForAccountInfoProvider:0];
        long long v45 = v44;
        self = v52;
        if (v44 && os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v68) = 207;
          _os_log_impl(&dword_213CEC000, v45, OS_LOG_TYPE_DEFAULT, "No invalid sharees found but status was %d", buf, 8u);
        }
      }
      id v7 = 0;
      goto LABEL_45;
    }
    id v7 = 0;
  }
LABEL_46:
  [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:v7 delegateCallbackBlock:0];
}

- (NSMutableSet)invalidSharees
{
  return self->_invalidSharees;
}

- (void)setInvalidSharees:(id)a3
{
}

- (NSSet)shareesToRemove
{
  return self->_shareesToRemove;
}

- (void)setShareesToRemove:(id)a3
{
}

- (NSSet)shareesToSet
{
  return self->_shareesToSet;
}

- (void)setShareesToSet:(id)a3
{
}

- (NSURL)calendarURL
{
  return self->_calendarURL;
}

- (void)setCalendarURL:(id)a3
{
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (BOOL)muteNotifications
{
  return self->_muteNotifications;
}

- (void)setMuteNotifications:(BOOL)a3
{
  self->_muteNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_calendarURL, 0);
  objc_storeStrong((id *)&self->_shareesToSet, 0);
  objc_storeStrong((id *)&self->_shareesToRemove, 0);
  objc_storeStrong((id *)&self->_invalidSharees, 0);
}

@end