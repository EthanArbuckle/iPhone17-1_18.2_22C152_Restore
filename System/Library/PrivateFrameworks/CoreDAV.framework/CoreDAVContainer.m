@interface CoreDAVContainer
+ (id)convertPushTransportsForNSServerNotificationCenter:(id)a3;
+ (id)copyPropertyMappingsForParser;
- (BOOL)_anyPrivilegesMatches:(id)a3;
- (BOOL)hasBindPrivileges;
- (BOOL)hasReadPrivileges;
- (BOOL)hasUnbindPrivileges;
- (BOOL)hasWriteContentPrivileges;
- (BOOL)hasWritePropertiesPrivileges;
- (BOOL)isPrincipal;
- (BOOL)isUnauthenticated;
- (BOOL)supportsPrincipalPropertySearchReport;
- (BOOL)supportsSyncCollectionReport;
- (CoreDAVContainer)initWithURL:(id)a3 andProperties:(id)a4;
- (CoreDAVResourceTypeItem)resourceType;
- (CoreDAVSupportedReportSetItem)supportedReportSetItem;
- (NSDictionary)bulkRequests;
- (NSDictionary)pushTransports;
- (NSSet)privileges;
- (NSSet)privilegesAsStringSet;
- (NSSet)resourceTypeAsStringSet;
- (NSSet)supportedReports;
- (NSSet)supportedReportsAsStringSet;
- (NSString)containerTitle;
- (NSString)pushKey;
- (NSString)quotaAvailable;
- (NSString)quotaUsed;
- (NSString)syncToken;
- (NSURL)addMemberURL;
- (NSURL)owner;
- (NSURL)resourceID;
- (NSURL)url;
- (id)description;
- (void)applyParsedProperties:(id)a3;
- (void)setAddMemberURL:(id)a3;
- (void)setBulkRequests:(id)a3;
- (void)setContainerTitle:(id)a3;
- (void)setIsUnauthenticated:(BOOL)a3;
- (void)setOwner:(id)a3;
- (void)setPrivileges:(id)a3;
- (void)setPushKey:(id)a3;
- (void)setPushTransports:(id)a3;
- (void)setQuotaAvailable:(id)a3;
- (void)setQuotaUsed:(id)a3;
- (void)setResourceID:(id)a3;
- (void)setResourceType:(id)a3;
- (void)setSupportedReportSetItem:(id)a3;
- (void)setSyncToken:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation CoreDAVContainer

+ (id)copyPropertyMappingsForParser
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [v2 CDVAddItemParserMappingWithNameSpace:@"DAV:" name:@"resourcetype" parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:@"DAV:" name:@"displayname" parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:@"DAV:" name:@"owner" parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:@"DAV:" name:@"current-user-privilege-set" parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:@"http://calendarserver.org/ns/" name:@"pushkey" parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:@"http://calendarserver.org/ns/" name:@"push-transports" parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:@"DAV:" name:@"resource-id" parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:@"DAV:" name:@"quota-available-bytes" parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:@"DAV:" name:@"quota-used-bytes" parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:@"DAV:" name:@"supported-report-set" parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:@"DAV:" name:@"add-member" parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:@"http://me.com/_namespace/" name:@"bulk-requests" parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:@"DAV:" name:@"sync-token" parseClass:objc_opt_class()];
  return v2;
}

- (CoreDAVContainer)initWithURL:(id)a3 andProperties:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(CoreDAVContainer *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    [(CoreDAVContainer *)v10 applyParsedProperties:v8];
  }

  return v10;
}

- (id)description
{
  v23.receiver = self;
  v23.super_class = (Class)CoreDAVContainer;
  v3 = [(CoreDAVContainer *)&v23 description];
  v4 = (void *)MEMORY[0x263F089D8];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  id v7 = [v4 stringWithFormat:@"%@ %p: ", v6, self];

  [v7 appendFormat:@" PARENT CLASS: %@", v3];
  id v8 = [(CoreDAVContainer *)self url];
  [v7 appendFormat:@"\n\turl: %@", v8];

  v9 = [(CoreDAVContainer *)self resourceType];
  [v7 appendFormat:@"\n\tresourceType: %@", v9];

  BOOL v10 = [(CoreDAVContainer *)self isUnauthenticated];
  v11 = @"NO";
  if (v10) {
    v11 = @"YES";
  }
  [v7 appendFormat:@"\n\tisUnauthenticated: %@", v11];
  v12 = [(CoreDAVContainer *)self containerTitle];
  [v7 appendFormat:@"\n\tcontainerTitle: %@", v12];

  v13 = [(CoreDAVContainer *)self privilegesAsStringSet];
  [v7 appendFormat:@"\n\tprivileges: %@", v13];

  v14 = [(CoreDAVContainer *)self pushKey];
  [v7 appendFormat:@"\n\tpushKey: %@", v14];

  v15 = [(CoreDAVContainer *)self resourceID];
  [v7 appendFormat:@"\n\tresourceID: %@", v15];

  v16 = [(CoreDAVContainer *)self quotaAvailable];
  [v7 appendFormat:@"\n\tquotaAvailable: %@", v16];

  v17 = [(CoreDAVContainer *)self quotaUsed];
  [v7 appendFormat:@"\n\tquotaUsed: %@", v17];

  v18 = [(CoreDAVContainer *)self supportedReportsAsStringSet];
  [v7 appendFormat:@"\n\tsupportedReports: %@", v18];

  v19 = [(CoreDAVContainer *)self pushTransports];
  [v7 appendFormat:@"\n\tpushTransports: %@", v19];

  v20 = [(CoreDAVContainer *)self bulkRequests];
  [v7 appendFormat:@"\n\tbulkRequests: %@", v20];

  v21 = [(CoreDAVContainer *)self syncToken];
  [v7 appendFormat:@"\n\tsyncToken: %@", v21];

  return v7;
}

- (void)applyParsedProperties:(id)a3
{
  id v4 = a3;
  v5 = [v4 CDVObjectForKeyWithNameSpace:@"DAV:" andName:@"resourcetype"];
  [(CoreDAVContainer *)self setResourceType:v5];

  v6 = [(CoreDAVContainer *)self resourceType];
  id v7 = [v6 unauthenticated];
  [(CoreDAVContainer *)self setIsUnauthenticated:v7 != 0];

  id v8 = [v4 CDVObjectForKeyWithNameSpace:@"DAV:" andName:@"displayname"];
  v9 = [v8 payloadAsString];
  [(CoreDAVContainer *)self setContainerTitle:v9];

  BOOL v10 = [v4 CDVObjectForKeyWithNameSpace:@"DAV:" andName:@"current-user-privilege-set"];
  v11 = [v10 privileges];
  [(CoreDAVContainer *)self setPrivileges:v11];

  v12 = [v4 CDVObjectForKeyWithNameSpace:@"http://calendarserver.org/ns/" andName:@"pushkey"];
  v13 = [v12 payloadAsString];
  [(CoreDAVContainer *)self setPushKey:v13];

  v14 = [v4 CDVObjectForKeyWithNameSpace:@"DAV:" andName:@"resource-id"];
  v15 = [v14 href];
  v16 = [v15 payloadAsFullURL];
  [(CoreDAVContainer *)self setResourceID:v16];

  v17 = [v4 CDVObjectForKeyWithNameSpace:@"DAV:" andName:@"quota-available-bytes"];
  v18 = [v17 payloadAsString];
  [(CoreDAVContainer *)self setQuotaAvailable:v18];

  v19 = [v4 CDVObjectForKeyWithNameSpace:@"DAV:" andName:@"quota-used-bytes"];
  v20 = [v19 payloadAsString];
  [(CoreDAVContainer *)self setQuotaUsed:v20];

  v21 = [v4 CDVObjectForKeyWithNameSpace:@"DAV:" andName:@"supported-report-set"];
  [(CoreDAVContainer *)self setSupportedReportSetItem:v21];

  v22 = [v4 CDVObjectForKeyWithNameSpace:@"DAV:" andName:@"owner"];
  objc_super v23 = [v22 href];
  v24 = [v23 payloadAsFullURL];
  [(CoreDAVContainer *)self setOwner:v24];

  v25 = [v4 CDVObjectForKeyWithNameSpace:@"DAV:" andName:@"add-member"];
  v26 = [v25 href];
  v27 = [v26 payloadAsFullURL];
  [(CoreDAVContainer *)self setAddMemberURL:v27];

  v28 = [v4 CDVObjectForKeyWithNameSpace:@"http://calendarserver.org/ns/" andName:@"push-transports"];
  v29 = +[CoreDAVContainer convertPushTransportsForNSServerNotificationCenter:v28];
  [(CoreDAVContainer *)self setPushTransports:v29];

  v30 = [v4 CDVObjectForKeyWithNameSpace:@"http://me.com/_namespace/" andName:@"bulk-requests"];
  v31 = [v30 dictRepresentation];
  [(CoreDAVContainer *)self setBulkRequests:v31];

  id v33 = [v4 CDVObjectForKeyWithNameSpace:@"DAV:" andName:@"sync-token"];

  v32 = [v33 payloadAsString];
  [(CoreDAVContainer *)self setSyncToken:v32];
}

- (NSSet)supportedReports
{
  id v2 = [(CoreDAVContainer *)self supportedReportSetItem];
  v3 = [v2 supportedReports];

  return (NSSet *)v3;
}

- (NSSet)resourceTypeAsStringSet
{
  id v2 = [(CoreDAVContainer *)self resourceType];
  v3 = [v2 stringSet];

  return (NSSet *)v3;
}

- (BOOL)isPrincipal
{
  v3 = [(CoreDAVContainer *)self resourceType];
  if (v3)
  {
    id v4 = [(CoreDAVContainer *)self resourceType];
    v5 = [v4 principal];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSSet)privilegesAsStringSet
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = [(CoreDAVContainer *)self privileges];
  uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        BOOL v6 = [v5 extraChildItems];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v8; ++j)
            {
              if (*(void *)v21 != v9) {
                objc_enumerationMutation(v6);
              }
              v11 = *(void **)(*((void *)&v20 + 1) + 8 * j);
              id v12 = [NSString alloc];
              v13 = [v11 nameSpace];
              v14 = [v11 name];
              v15 = (void *)[v12 initWithCDVNameSpace:v13 andName:v14];

              [v3 addObject:v15];
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v8);
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v19);
  }

  if (![v3 count])
  {

    id v3 = 0;
  }
  return (NSSet *)v3;
}

- (BOOL)_anyPrivilegesMatches:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = (uint64_t (**)(id, void))a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v5 = [(CoreDAVContainer *)self privileges];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        v11 = objc_msgSend(v10, "extraChildItems", 0);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              if (v4[2](v4, *(void *)(*((void *)&v18 + 1) + 8 * j)))
              {

                BOOL v16 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
      BOOL v16 = 0;
    }
    while (v7);
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_19:

  return v16;
}

- (BOOL)hasReadPrivileges
{
  id v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"all", @"read", 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__CoreDAVContainer_hasReadPrivileges__block_invoke;
  v6[3] = &unk_2641DFBE8;
  id v7 = v3;
  id v4 = v3;
  LOBYTE(self) = [(CoreDAVContainer *)self _anyPrivilegesMatches:v6];

  return (char)self;
}

uint64_t __37__CoreDAVContainer_hasReadPrivileges__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 nameSpace];
  if ([@"DAV:" isEqualToString:v4])
  {
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v3 name];
    uint64_t v7 = [v5 containsObject:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)hasWriteContentPrivileges
{
  id v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"all", @"write", @"write-content", 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__CoreDAVContainer_hasWriteContentPrivileges__block_invoke;
  v6[3] = &unk_2641DFBE8;
  id v7 = v3;
  id v4 = v3;
  LOBYTE(self) = [(CoreDAVContainer *)self _anyPrivilegesMatches:v6];

  return (char)self;
}

uint64_t __45__CoreDAVContainer_hasWriteContentPrivileges__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 nameSpace];
  if ([@"DAV:" isEqualToString:v4])
  {
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v3 name];
    uint64_t v7 = [v5 containsObject:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)hasWritePropertiesPrivileges
{
  id v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"all", @"write", @"write-properties", 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__CoreDAVContainer_hasWritePropertiesPrivileges__block_invoke;
  v6[3] = &unk_2641DFBE8;
  id v7 = v3;
  id v4 = v3;
  LOBYTE(self) = [(CoreDAVContainer *)self _anyPrivilegesMatches:v6];

  return (char)self;
}

uint64_t __48__CoreDAVContainer_hasWritePropertiesPrivileges__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 nameSpace];
  if ([@"DAV:" isEqualToString:v4])
  {
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v3 name];
    uint64_t v7 = [v5 containsObject:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)hasBindPrivileges
{
  id v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"all", @"write", @"bind", 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__CoreDAVContainer_hasBindPrivileges__block_invoke;
  v6[3] = &unk_2641DFBE8;
  id v7 = v3;
  id v4 = v3;
  LOBYTE(self) = [(CoreDAVContainer *)self _anyPrivilegesMatches:v6];

  return (char)self;
}

uint64_t __37__CoreDAVContainer_hasBindPrivileges__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 nameSpace];
  if ([@"DAV:" isEqualToString:v4])
  {
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v3 name];
    uint64_t v7 = [v5 containsObject:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)hasUnbindPrivileges
{
  id v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"all", @"write", @"unbind", 0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __39__CoreDAVContainer_hasUnbindPrivileges__block_invoke;
  v6[3] = &unk_2641DFBE8;
  id v7 = v3;
  id v4 = v3;
  LOBYTE(self) = [(CoreDAVContainer *)self _anyPrivilegesMatches:v6];

  return (char)self;
}

uint64_t __39__CoreDAVContainer_hasUnbindPrivileges__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 nameSpace];
  if ([@"DAV:" isEqualToString:v4])
  {
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v3 name];
    uint64_t v7 = [v5 containsObject:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (NSSet)supportedReportsAsStringSet
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = [(CoreDAVContainer *)self supportedReports];
  uint64_t v20 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v6 = [v5 report];
        uint64_t v7 = [v6 extraChildItems];

        uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v22 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * j);
              id v13 = [NSString alloc];
              uint64_t v14 = [v12 nameSpace];
              v15 = [v12 name];
              BOOL v16 = (void *)[v13 initWithCDVNameSpace:v14 andName:v15];

              [v3 addObject:v16];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v9);
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v20);
  }

  if (![v3 count])
  {

    id v3 = 0;
  }
  return (NSSet *)v3;
}

- (BOOL)supportsPrincipalPropertySearchReport
{
  id v2 = [(CoreDAVContainer *)self supportedReportSetItem];
  char v3 = [v2 supportsReportWithNameSpace:@"DAV:" andName:@"principal-property-search"];

  return v3;
}

- (BOOL)supportsSyncCollectionReport
{
  id v2 = [(CoreDAVContainer *)self supportedReportSetItem];
  char v3 = [v2 supportsReportWithNameSpace:@"DAV:" andName:@"sync-collection"];

  return v3;
}

+ (id)convertPushTransportsForNSServerNotificationCenter:(id)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v46 = a3;
  obuint64_t j = [v46 transports];
  uint64_t v58 = [obj countByEnumeratingWithState:&v67 objects:v73 count:16];
  if (v58)
  {
    id v56 = 0;
    uint64_t v57 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v58; ++i)
      {
        if (*(void *)v68 != v57) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        v5 = [v4 attributes];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v63 objects:v72 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v64;
LABEL_8:
          uint64_t v9 = 0;
          while (1)
          {
            if (*(void *)v64 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void **)(*((void *)&v63 + 1) + 8 * v9);
            v11 = [v10 name];
            char v12 = [v11 isEqualToString:@"type"];

            if (v12) {
              break;
            }
            if (v7 == ++v9)
            {
              uint64_t v7 = [v5 countByEnumeratingWithState:&v63 objects:v72 count:16];
              if (v7) {
                goto LABEL_8;
              }
              goto LABEL_44;
            }
          }
          uint64_t v13 = [v10 value];

          if (!v13) {
            continue;
          }
          v55 = (void *)v13;
          id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          v15 = [v4 subscriptionURL];
          BOOL v16 = [v15 href];
          v17 = [v16 payloadAsFullURL];

          if (v17)
          {
            long long v18 = [v17 absoluteString];
            [v14 setObject:v18 forKey:@"subscription-url"];
          }
          uint64_t v19 = [v4 tokenURL];
          uint64_t v20 = [v19 href];
          long long v21 = [v20 payloadAsFullURL];

          if (v21)
          {
            long long v22 = [v21 absoluteString];
            [v14 setObject:v22 forKey:@"token-url"];
          }
          long long v23 = [v4 apsBundleID];
          uint64_t v24 = [v23 payloadAsString];

          if (v24) {
            [v14 setObject:v24 forKey:@"apsbundleid"];
          }
          v53 = v21;
          long long v25 = [v4 courierServer];
          uint64_t v26 = [v25 payloadAsString];

          if (v26) {
            [v14 setObject:v26 forKey:@"courierserver"];
          }
          long long v27 = v17;
          long long v28 = [v4 apsEnv];
          uint64_t v29 = [v28 payloadAsString];

          if (v29) {
            [v14 setObject:v29 forKey:@"env"];
          }
          uint64_t v30 = [v4 refreshInterval];
          uint64_t v31 = [v30 payloadAsString];

          if (v31) {
            [v14 setObject:v31 forKey:@"refresh-interval"];
          }
          v49 = (void *)v31;
          v52 = (void *)v24;
          v54 = v27;
          v32 = [v4 xmppServer];
          uint64_t v33 = [v32 payloadAsString];

          if (v33) {
            [v14 setObject:v33 forKey:@"xmpp-server"];
          }
          v48 = (void *)v33;
          v50 = (void *)v29;
          v51 = (void *)v26;
          v34 = [v4 xmppURI];
          v35 = [v34 payloadAsString];

          if (v35) {
            [v14 setObject:v35 forKey:@"xmpp-uri"];
          }
          long long v61 = 0u;
          long long v62 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          v36 = [v4 extraChildItems];
          uint64_t v37 = [v36 countByEnumeratingWithState:&v59 objects:v71 count:16];
          if (v37)
          {
            uint64_t v38 = v37;
            uint64_t v39 = *(void *)v60;
            do
            {
              for (uint64_t j = 0; j != v38; ++j)
              {
                if (*(void *)v60 != v39) {
                  objc_enumerationMutation(v36);
                }
                v41 = *(void **)(*((void *)&v59 + 1) + 8 * j);
                v42 = [v41 payloadAsString];
                if (v42)
                {
                  v43 = [v41 name];
                  [v14 setObject:v42 forKey:v43];
                }
              }
              uint64_t v38 = [v36 countByEnumeratingWithState:&v59 objects:v71 count:16];
            }
            while (v38);
          }

          id v44 = v56;
          if (!v56) {
            id v44 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          }
          id v56 = v44;
          [v44 setObject:v14 forKey:v55];

          v5 = v55;
        }
LABEL_44:
      }
      uint64_t v58 = [obj countByEnumeratingWithState:&v67 objects:v73 count:16];
    }
    while (v58);
  }
  else
  {
    id v56 = 0;
  }

  return v56;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (BOOL)isUnauthenticated
{
  return self->_isUnauthenticated;
}

- (void)setIsUnauthenticated:(BOOL)a3
{
  self->_isUnauthenticated = a3;
}

- (NSString)containerTitle
{
  return self->_containerTitle;
}

- (void)setContainerTitle:(id)a3
{
}

- (NSSet)privileges
{
  return self->_privileges;
}

- (void)setPrivileges:(id)a3
{
}

- (NSString)pushKey
{
  return self->_pushKey;
}

- (void)setPushKey:(id)a3
{
}

- (NSDictionary)pushTransports
{
  return self->_pushTransports;
}

- (void)setPushTransports:(id)a3
{
}

- (NSURL)resourceID
{
  return self->_resourceID;
}

- (void)setResourceID:(id)a3
{
}

- (NSString)quotaAvailable
{
  return self->_quotaAvailable;
}

- (void)setQuotaAvailable:(id)a3
{
}

- (NSString)quotaUsed
{
  return self->_quotaUsed;
}

- (void)setQuotaUsed:(id)a3
{
}

- (CoreDAVSupportedReportSetItem)supportedReportSetItem
{
  return self->_supportedReportSetItem;
}

- (void)setSupportedReportSetItem:(id)a3
{
}

- (CoreDAVResourceTypeItem)resourceType
{
  return self->_resourceType;
}

- (void)setResourceType:(id)a3
{
}

- (NSURL)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
}

- (NSURL)addMemberURL
{
  return self->_addMemberURL;
}

- (void)setAddMemberURL:(id)a3
{
}

- (NSDictionary)bulkRequests
{
  return self->_bulkRequests;
}

- (void)setBulkRequests:(id)a3
{
}

- (NSString)syncToken
{
  return self->_syncToken;
}

- (void)setSyncToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncToken, 0);
  objc_storeStrong((id *)&self->_bulkRequests, 0);
  objc_storeStrong((id *)&self->_addMemberURL, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_quotaUsed, 0);
  objc_storeStrong((id *)&self->_quotaAvailable, 0);
  objc_storeStrong((id *)&self->_supportedReportSetItem, 0);
  objc_storeStrong((id *)&self->_resourceID, 0);
  objc_storeStrong((id *)&self->_pushTransports, 0);
  objc_storeStrong((id *)&self->_pushKey, 0);
  objc_storeStrong((id *)&self->_privileges, 0);
  objc_storeStrong((id *)&self->_containerTitle, 0);
  objc_storeStrong((id *)&self->_resourceType, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end