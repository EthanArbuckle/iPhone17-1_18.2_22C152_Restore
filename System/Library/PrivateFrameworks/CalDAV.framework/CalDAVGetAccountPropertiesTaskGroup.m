@interface CalDAVGetAccountPropertiesTaskGroup
- (BOOL)forceOptionsRequest;
- (BOOL)supportsCalendarUserSearch;
- (CalDAVServerVersion)serverVersion;
- (NSSet)calendarHomes;
- (NSSet)preferredUserAddresses;
- (NSURL)delegatePrincipalURL;
- (NSURL)dropboxURL;
- (NSURL)homeURL;
- (NSURL)inboxURL;
- (NSURL)notificationURL;
- (NSURL)outboxURL;
- (NSURL)updatedPrincipalURL;
- (id)_copyAccountPropertiesPropFindElements;
- (id)description;
- (id)homeSet;
- (id)userAddresses;
- (void)_setPropertiesFromParsedResponses:(id)a3;
- (void)processPrincipalHeaders:(id)a3;
- (void)setDelegatePrincipalURL:(id)a3;
- (void)setHomeURL:(id)a3;
- (void)startTaskGroup;
@end

@implementation CalDAVGetAccountPropertiesTaskGroup

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CalDAVGetAccountPropertiesTaskGroup;
  v3 = [(CoreDAVGetAccountPropertiesTaskGroup *)&v7 description];
  v4 = (void *)[v3 mutableCopy];

  [v4 appendFormat:@"\tCalendar home paths: %@\n", self->_calendarHomes];
  [v4 appendFormat:@"\tInbox path: %@\n", self->_inboxURL];
  [v4 appendFormat:@"\tOutbox path: %@\n", self->_outboxURL];
  [v4 appendFormat:@"\tDropbox path: %@\n", self->_dropboxURL];
  [v4 appendFormat:@"\tNotification path: %@\n", self->_notificationURL];
  v5 = [(CalDAVGetAccountPropertiesTaskGroup *)self userAddresses];
  [v4 appendFormat:@"\tUser addresses: %@\n", v5];

  [v4 appendFormat:@"\tServer version: %@\n", self->_serverVersion];
  [v4 appendFormat:@"\tNew Principal URL: %@\n", self->_updatedPrincipalURL];
  return v4;
}

- (id)_copyAccountPropertiesPropFindElements
{
  v11.receiver = self;
  v11.super_class = (Class)CalDAVGetAccountPropertiesTaskGroup;
  id v3 = [(CoreDAVGetAccountPropertiesTaskGroup *)&v11 _copyAccountPropertiesPropFindElements];
  v4 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithSet:v3];
  [v4 CDVAddItemParserMappingWithNameSpace:*MEMORY[0x263F34E10] name:*MEMORY[0x263F34E08] parseClass:objc_opt_class()];
  uint64_t v5 = *MEMORY[0x263F34CD8];
  [v4 CDVAddItemParserMappingWithNameSpace:*MEMORY[0x263F34CD8] name:*MEMORY[0x263F34C90] parseClass:objc_opt_class()];
  [v4 CDVAddItemParserMappingWithNameSpace:v5 name:*MEMORY[0x263F34CE0] parseClass:objc_opt_class()];
  [v4 CDVAddItemParserMappingWithNameSpace:v5 name:*MEMORY[0x263F34CB0] parseClass:objc_opt_class()];
  [v4 CDVAddItemParserMappingWithNameSpace:v5 name:*MEMORY[0x263F34CC8] parseClass:objc_opt_class()];
  [v4 CDVAddItemParserMappingWithNameSpace:v5 name:*MEMORY[0x263F34EA8] parseClass:objc_opt_class()];
  uint64_t v6 = *MEMORY[0x263F34DA8];
  [v4 CDVAddItemParserMappingWithNameSpace:*MEMORY[0x263F34DA8] name:*MEMORY[0x263F34D38] parseClass:objc_opt_class()];
  [v4 CDVAddItemParserMappingWithNameSpace:v6 name:*MEMORY[0x263F34D58] parseClass:objc_opt_class()];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
  v8 = [WeakRetained host];
  int v9 = [v8 hasSuffix:@"me.com"];

  if (v9) {
    [v4 CDVAddItemParserMappingWithNameSpace:*MEMORY[0x263F34EA0] name:*MEMORY[0x263F34E80] parseClass:objc_opt_class()];
  }

  return v4;
}

- (void)startTaskGroup
{
  id v10 = [(CalDAVGetAccountPropertiesTaskGroup *)self _copyAccountPropertiesPropFindElements];
  id v3 = [(CalDAVGetAccountPropertiesTaskGroup *)self delegatePrincipalURL];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(CoreDAVTaskGroup *)self accountInfoProvider];
    id v5 = [v6 principalURL];
  }
  objc_super v7 = (void *)[objc_alloc(MEMORY[0x263F34B80]) initWithPropertiesToFind:v10 atURL:v5 withDepth:2];
  [*(id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C70]) addObject:v7];
  [v7 setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
  [v7 setAccountInfoProvider:WeakRetained];

  id v9 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C78]));
  [v9 submitQueuedCoreDAVTask:v7];
}

- (id)homeSet
{
  return self->_calendarHomes;
}

- (void)_setPropertiesFromParsedResponses:(id)a3
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id obj = a3;
  uint64_t v71 = [obj countByEnumeratingWithState:&v74 objects:v80 count:16];
  if (v71)
  {
    uint64_t v70 = *(void *)v75;
    uint64_t v5 = *MEMORY[0x263F34CD8];
    uint64_t v69 = *MEMORY[0x263F34CE0];
    uint64_t v68 = *MEMORY[0x263F34C90];
    uint64_t v67 = *MEMORY[0x263F34CB0];
    uint64_t v6 = *MEMORY[0x263F34DA8];
    uint64_t v65 = *MEMORY[0x263F34D58];
    uint64_t v64 = *MEMORY[0x263F34CC8];
    uint64_t v63 = *MEMORY[0x263F34D38];
    uint64_t v7 = *MEMORY[0x263F34E10];
    uint64_t v62 = *MEMORY[0x263F34E08];
    uint64_t v59 = *MEMORY[0x263F34ED8];
    uint64_t v61 = *MEMORY[0x263F34F48];
    *(void *)&long long v4 = 138412290;
    long long v58 = v4;
    uint64_t v66 = *MEMORY[0x263F34DA8];
    uint64_t v72 = *MEMORY[0x263F34E10];
    do
    {
      for (uint64_t i = 0; i != v71; ++i)
      {
        if (*(void *)v75 != v70) {
          objc_enumerationMutation(obj);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v74 + 1) + 8 * i), "successfulPropertiesToValues", v58);
        id v10 = [v9 CDVObjectForKeyWithNameSpace:v5 andName:v69];
        objc_super v11 = +[CalDAVCalendarUserAddressItemTranslator userAddressesForAddressSetItem:v10];
        preferredUserAddresses = self->_preferredUserAddresses;
        self->_preferredUserAddresses = v11;

        v13 = [v9 CDVObjectForKeyWithNameSpace:v5 andName:v68];
        v14 = [v13 hrefsAsFullURLs];
        calendarHomes = self->_calendarHomes;
        self->_calendarHomes = v14;

        v16 = [v9 CDVObjectForKeyWithNameSpace:v5 andName:v67];
        v17 = [v16 href];
        v18 = [v17 payloadAsFullURL];
        inboxURL = self->_inboxURL;
        self->_inboxURL = v18;

        v20 = [v9 CDVObjectForKeyWithNameSpace:v6 andName:v65];
        v21 = [v20 href];
        v22 = [v21 payloadAsFullURL];
        notificationURL = self->_notificationURL;
        self->_notificationURL = v22;

        v24 = [v9 CDVObjectForKeyWithNameSpace:v5 andName:v64];
        v25 = [v24 href];
        v26 = [v25 payloadAsFullURL];
        outboxURL = self->_outboxURL;
        self->_outboxURL = v26;

        v28 = [v9 CDVObjectForKeyWithNameSpace:v6 andName:v63];
        v29 = [v28 href];
        v30 = [v29 payloadAsFullURL];
        dropboxURL = self->_dropboxURL;
        self->_dropboxURL = v30;

        v32 = [v9 CDVObjectForKeyWithNameSpace:v7 andName:v62];
        v33 = v32;
        if (!v32)
        {
          v35 = [MEMORY[0x263F34B30] sharedLogging];
          id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
          v37 = [v35 logHandleForAccountInfoProvider:WeakRetained];

          if (v37 && os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v58;
            v79 = v9;
            v38 = v37;
            v39 = "Could not find the current user principal. Found properties: [%@]";
            goto LABEL_14;
          }
LABEL_16:

          uint64_t v7 = v72;
          goto LABEL_17;
        }
        v34 = [v32 unauthenticated];

        if (v34)
        {
          v35 = [MEMORY[0x263F34B30] sharedLogging];
          id v36 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
          v37 = [v35 logHandleForAccountInfoProvider:v36];

          if (!v37 || !os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_16;
          }
          *(_WORD *)buf = 0;
          v38 = v37;
          v39 = "Not authenticated to get current user principal";
          uint32_t v40 = 2;
          goto LABEL_15;
        }
        v52 = [v33 href];
        v53 = [v52 payloadAsFullURL];
        updatedPrincipalURL = self->_updatedPrincipalURL;
        self->_updatedPrincipalURL = v53;

        if (!self->_updatedPrincipalURL)
        {
          v35 = [MEMORY[0x263F34B30] sharedLogging];
          id v55 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
          v37 = [v35 logHandleForAccountInfoProvider:v55];

          if (!v37 || !os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_16;
          }
          *(_DWORD *)buf = v58;
          v79 = v33;
          v38 = v37;
          v39 = "Could not find the current user principal's HREF.  Current user principal: [%@]";
LABEL_14:
          uint32_t v40 = 12;
LABEL_15:
          _os_log_impl(&dword_213CEC000, v38, OS_LOG_TYPE_DEFAULT, v39, buf, v40);
          goto LABEL_16;
        }
LABEL_17:
        if (self->_updatedPrincipalURL) {
          goto LABEL_33;
        }
        v42 = [v9 CDVObjectForKeyWithNameSpace:v7 andName:v59];
        v43 = v42;
        if (!v42)
        {
          v47 = [MEMORY[0x263F34B30] sharedLogging];
          id v56 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
          v49 = [v47 logHandleForAccountInfoProvider:v56];

          if (v49 && os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v58;
            v79 = v9;
            v50 = v49;
            v51 = "Could not find the user's principal URL. Found properties: [%@]";
LABEL_30:
            _os_log_impl(&dword_213CEC000, v50, OS_LOG_TYPE_DEFAULT, v51, buf, 0xCu);
          }
LABEL_31:

          uint64_t v7 = v72;
          goto LABEL_32;
        }
        v44 = [v42 href];
        v45 = [v44 payloadAsFullURL];
        v46 = self->_updatedPrincipalURL;
        self->_updatedPrincipalURL = v45;

        if (!self->_updatedPrincipalURL)
        {
          v47 = [MEMORY[0x263F34B30] sharedLogging];
          id v48 = objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F34C60]));
          v49 = [v47 logHandleForAccountInfoProvider:v48];

          if (v49 && os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v58;
            v79 = v9;
            v50 = v49;
            v51 = "Could not find the href of the user's principal URL. Found properties: [%@]";
            goto LABEL_30;
          }
          goto LABEL_31;
        }
LABEL_32:

LABEL_33:
        v57 = [v9 CDVObjectForKeyWithNameSpace:v7 andName:v61];
        uint64_t v6 = v66;
        self->_supportsCalendarUserSearch = [v57 supportsReportWithNameSpace:v66 andName:@"calendarserver-principal-search"];
      }
      uint64_t v71 = [obj countByEnumeratingWithState:&v74 objects:v80 count:16];
    }
    while (v71);
  }
  v73.receiver = self;
  v73.super_class = (Class)CalDAVGetAccountPropertiesTaskGroup;
  [(CoreDAVGetAccountPropertiesTaskGroup *)&v73 _setPropertiesFromParsedResponses:obj];
}

- (id)userAddresses
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v4 = [(CalDAVGetAccountPropertiesTaskGroup *)self preferredUserAddresses];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) address];
        id v10 = [v9 absoluteString];
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)forceOptionsRequest
{
  return 1;
}

- (void)processPrincipalHeaders:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[CalDAVServerVersion versionWithHTTPHeaders:v4];
  serverVersion = self->_serverVersion;
  self->_serverVersion = v5;

  if ([(CoreDAVGetAccountPropertiesTaskGroup *)self fetchPrincipalSearchProperties]) {
    [(CoreDAVGetAccountPropertiesTaskGroup *)self setFetchPrincipalSearchProperties:[(CalDAVServerVersion *)self->_serverVersion supportsPrincipalPropertySearch]];
  }
  v7.receiver = self;
  v7.super_class = (Class)CalDAVGetAccountPropertiesTaskGroup;
  [(CoreDAVGetAccountPropertiesTaskGroup *)&v7 processPrincipalHeaders:v4];
}

- (NSURL)delegatePrincipalURL
{
  return self->_delegatePrincipalURL;
}

- (void)setDelegatePrincipalURL:(id)a3
{
}

- (NSURL)homeURL
{
  return self->_homeURL;
}

- (void)setHomeURL:(id)a3
{
}

- (NSSet)calendarHomes
{
  return self->_calendarHomes;
}

- (NSSet)preferredUserAddresses
{
  return self->_preferredUserAddresses;
}

- (NSURL)inboxURL
{
  return self->_inboxURL;
}

- (NSURL)outboxURL
{
  return self->_outboxURL;
}

- (NSURL)dropboxURL
{
  return self->_dropboxURL;
}

- (NSURL)notificationURL
{
  return self->_notificationURL;
}

- (NSURL)updatedPrincipalURL
{
  return self->_updatedPrincipalURL;
}

- (CalDAVServerVersion)serverVersion
{
  return self->_serverVersion;
}

- (BOOL)supportsCalendarUserSearch
{
  return self->_supportsCalendarUserSearch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverVersion, 0);
  objc_storeStrong((id *)&self->_updatedPrincipalURL, 0);
  objc_storeStrong((id *)&self->_notificationURL, 0);
  objc_storeStrong((id *)&self->_dropboxURL, 0);
  objc_storeStrong((id *)&self->_outboxURL, 0);
  objc_storeStrong((id *)&self->_inboxURL, 0);
  objc_storeStrong((id *)&self->_preferredUserAddresses, 0);
  objc_storeStrong((id *)&self->_calendarHomes, 0);
  objc_storeStrong((id *)&self->_homeURL, 0);
  objc_storeStrong((id *)&self->_delegatePrincipalURL, 0);
}

@end