@interface CoreDAVSyncReportTask
- (BOOL)hadUnexpectedChangeOfSyncTokenWithZeroResponses;
- (BOOL)moreToSync;
- (BOOL)wasInvalidSyncToken;
- (CoreDAVSyncReportTask)initWithPropertiesToFind:(id)a3 atURL:(id)a4 withDepth:(int)a5 previousSyncToken:(id)a6;
- (NSString)nextSyncToken;
- (NSString)previousSyncToken;
- (id)copyDefaultParserForContentType:(id)a3;
- (id)description;
- (id)httpMethod;
- (id)notFoundHREFs;
- (id)requestBody;
- (void)finishCoreDAVTaskWithError:(id)a3;
@end

@implementation CoreDAVSyncReportTask

- (CoreDAVSyncReportTask)initWithPropertiesToFind:(id)a3 atURL:(id)a4 withDepth:(int)a5 previousSyncToken:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!a5)
  {
    id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"The depth parameter must not be CoreDAVDepthNone.  A value representing an actual depth must be specified." userInfo:0];
    objc_exception_throw(v17);
  }
  v13 = v12;
  v18.receiver = self;
  v18.super_class = (Class)CoreDAVSyncReportTask;
  v14 = [(CoreDAVPropertyFindBaseTask *)&v18 initWithPropertiesToFind:v10 atURL:v11];
  v15 = v14;
  if (v14)
  {
    v14->super.super._depth = a5;
    objc_storeStrong((id *)&v14->_previousSyncToken, a6);
  }

  return v15;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v6.receiver = self;
  v6.super_class = (Class)CoreDAVSyncReportTask;
  v4 = [(CoreDAVPropertyFindBaseTask *)&v6 description];
  [v3 appendFormat:@"%@", v4];

  [v3 appendFormat:@"\n  Previous Sync Token: [%@]", self->_previousSyncToken];
  return v3;
}

- (id)httpMethod
{
  return @"REPORT";
}

- (id)requestBody
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CoreDAVPropertyFindBaseTask *)self propertiesToFind];
  if (v3
    && (v4 = (void *)v3,
        [(CoreDAVPropertyFindBaseTask *)self propertiesToFind],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v4,
        v6))
  {
    v7 = objc_alloc_init(CoreDAVXMLData);
    -[CoreDAVXMLData startElement:inNamespace:withAttributeNamesAndValues:](v7, "startElement:inNamespace:withAttributeNamesAndValues:");
    [(CoreDAVXMLData *)v7 appendElement:@"sync-token" inNamespace:@"DAV:" withStringContent:self->_previousSyncToken withAttributeNamesAndValues:0];
    v8 = [(id)objc_opt_class() stringFromDepth:self->super.super._depth];
    if (v8) {
      [(CoreDAVXMLData *)v7 appendElement:@"sync-level" inNamespace:@"DAV:" withStringContent:v8 withAttributeNamesAndValues:0];
    }
    [(CoreDAVXMLData *)v7 startElement:@"prop" inNamespace:@"DAV:" withAttributeNamesAndValues:0];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v9 = [(CoreDAVPropertyFindBaseTask *)self propertiesToFind];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v15 = [v14 name];
          v16 = [v14 nameSpace];
          [(CoreDAVXMLData *)v7 appendElement:v15 inNamespace:v16 withStringContent:0 withAttributeNamesAndValues:0];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }

    [(CoreDAVXMLData *)v7 endElement:@"prop" inNamespace:@"DAV:"];
    [(CoreDAVXMLData *)v7 endElement:@"sync-collection" inNamespace:@"DAV:"];
    id v17 = [(CoreDAVXMLData *)v7 data];
  }
  else
  {
    id v17 = 0;
  }
  return v17;
}

- (id)notFoundHREFs
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v4 = [(CoreDAVPropertyFindBaseTask *)self multiStatus];
  v5 = [v4 responses];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v29;
    unint64_t v10 = 0x2641DF000uLL;
    *(void *)&long long v7 = 138412290;
    long long v26 = v7;
    v27 = v5;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "status", v26);
        v14 = [v13 payloadAsString];
        int v15 = [v14 CDVIsHTTPStatusLineWithStatusCode:404];

        if (v15)
        {
          v16 = [v12 firstHref];
          id v17 = [v16 payloadAsFullURL];

          if (v17)
          {
            [v3 addObject:v17];
          }
          else
          {
            objc_super v18 = [*(id *)(v10 + 2264) sharedLogging];
            long long v19 = [v18 logHandleForAccountInfoProvider:0];
            long long v20 = v19;
            if (v19 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              long long v21 = [v12 firstHref];
              [v21 payloadAsString];
              id v22 = v3;
              uint64_t v24 = v23 = v10;
              *(_DWORD *)buf = v26;
              v33 = v24;
              _os_log_impl(&dword_213BFC000, v20, OS_LOG_TYPE_ERROR, "The server gave us an invalid URL. Ignoring it. \"%@\"", buf, 0xCu);

              unint64_t v10 = v23;
              id v3 = v22;
              v5 = v27;
            }
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v8);
  }

  return v3;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  v4 = [CoreDAVXMLParser alloc];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(CoreDAVTask *)self url];
  long long v7 = [(CoreDAVXMLParser *)v4 initWithRootElementNameSpace:@"DAV:" name:@"multistatus" parseClass:v5 baseURL:v6];

  uint64_t v8 = [(CoreDAVPropertyFindBaseTask *)self parseHints];
  [(CoreDAVXMLParser *)v7 setParseHints:v8];

  return v7;
}

- (BOOL)hadUnexpectedChangeOfSyncTokenWithZeroResponses
{
  if (!self->_previousSyncToken) {
    return 0;
  }
  nextSyncToken = self->_nextSyncToken;
  if (!nextSyncToken || -[NSString isEqualToString:](nextSyncToken, "isEqualToString:")) {
    return 0;
  }
  uint64_t v5 = [(CoreDAVPropertyFindBaseTask *)self multiStatus];
  uint64_t v6 = [v5 responses];
  BOOL v4 = [v6 count] == 0;

  return v4;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(CoreDAVPropertyFindBaseTask *)self updateMultiStatusFromResponse];
  uint64_t v5 = [(CoreDAVPropertyFindBaseTask *)self multiStatus];
  uint64_t v6 = [v5 syncToken];
  nextSyncToken = self->_nextSyncToken;
  self->_nextSyncToken = v6;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v8 = [(CoreDAVPropertyFindBaseTask *)self multiStatus];
  uint64_t v9 = [v8 responses];

  id v10 = (id)[v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    id v25 = v4;
    uint64_t v11 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v14 = [v13 firstHref];
        int v15 = [v14 payloadAsFullURL];
        v16 = [(CoreDAVTask *)self url];
        int v17 = [v15 isEqual:v16];

        if (v17)
        {
          id v10 = v13;
          goto LABEL_11;
        }
      }
      id v10 = (id)[v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v10) {
        continue;
      }
      break;
    }
LABEL_11:
    id v4 = v25;
  }

  objc_super v18 = [v10 errorItem];
  long long v19 = [v18 numberOfMatchesWithinLimits];
  self->_moreToSync = v19 != 0;

  long long v20 = [v10 errorItem];
  long long v21 = [v20 validSyncToken];
  self->_wasInvalidSyncToken = v21 != 0;

  id v22 = [(CoreDAVTask *)self responseBodyParser];
  unint64_t v23 = [v22 rootError];
  uint64_t v24 = [v23 validSyncToken];
  self->_wasInvalidSyncToken |= v24 != 0;

  v26.receiver = self;
  v26.super_class = (Class)CoreDAVSyncReportTask;
  [(CoreDAVPropertyFindBaseTask *)&v26 finishCoreDAVTaskWithError:v4];
}

- (NSString)nextSyncToken
{
  return self->_nextSyncToken;
}

- (BOOL)moreToSync
{
  return self->_moreToSync;
}

- (BOOL)wasInvalidSyncToken
{
  return self->_wasInvalidSyncToken;
}

- (NSString)previousSyncToken
{
  return self->_previousSyncToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousSyncToken, 0);
  objc_storeStrong((id *)&self->_nextSyncToken, 0);
}

@end