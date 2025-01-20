@interface CoreDAVMultiPutTask
- (CoreDAVMultiPutTask)initWithURL:(id)a3 checkCTag:(id)a4 uuidsToAddActions:(id)a5 hrefsToModDeleteActions:(id)a6;
- (NSDictionary)hrefToETag;
- (NSDictionary)hrefToErrorItems;
- (NSDictionary)hrefToStatus;
- (NSDictionary)uuidToErrorItems;
- (NSDictionary)uuidToHREF;
- (NSDictionary)uuidToStatus;
- (NSString)nextCTag;
- (id)additionalHeaderValues;
- (id)copyDefaultParserForContentType:(id)a3;
- (id)httpMethod;
- (id)requestBody;
- (void)fillOutDataWithUUIDsToAddActions:(id)a3 hrefsToModDeleteActions:(id)a4;
- (void)finishCoreDAVTaskWithError:(id)a3;
@end

@implementation CoreDAVMultiPutTask

- (CoreDAVMultiPutTask)initWithURL:(id)a3 checkCTag:(id)a4 uuidsToAddActions:(id)a5 hrefsToModDeleteActions:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  if ([(CoreDAVMultiPutTask *)self isMemberOfClass:objc_opt_class()])
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"CoreDAVMultiPutTask.m", 43, @"You instantiated a class that doesn't want to be instantiated.  Please choose a concrete subclass of %@", objc_opt_class() object file lineNumber description];

    v12 = 0;
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)CoreDAVMultiPutTask;
    v13 = [(CoreDAVTask *)&v29 initWithURL:v9];
    if (v13)
    {
      v14 = objc_alloc_init(CoreDAVXMLData);
      pushedData = v13->_pushedData;
      v13->_pushedData = v14;

      objc_storeStrong((id *)&v13->_checkCTag, a4);
      v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      uuidToHREF = v13->_uuidToHREF;
      v13->_uuidToHREF = v16;

      v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      hrefToETag = v13->_hrefToETag;
      v13->_hrefToETag = v18;

      v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      uuidToErrorItems = v13->_uuidToErrorItems;
      v13->_uuidToErrorItems = v20;

      v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      hrefToErrorItems = v13->_hrefToErrorItems;
      v13->_hrefToErrorItems = v22;

      v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      uuidToStatus = v13->_uuidToStatus;
      v13->_uuidToStatus = v24;

      v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      hrefToStatus = v13->_hrefToStatus;
      v13->_hrefToStatus = v26;
    }
    self = v13;
    v12 = self;
  }

  return v12;
}

- (id)additionalHeaderValues
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVMultiPutTask;
  v4 = [(CoreDAVTask *)&v7 additionalHeaderValues];
  [v3 addEntriesFromDictionary:v4];

  if (self->_checkCTag)
  {
    v5 = objc_msgSend(NSString, "CDVPreconditionHeaderValueWithCTag:");
    if (v5) {
      [v3 setObject:v5 forKey:@"If"];
    }
  }
  return v3;
}

- (id)httpMethod
{
  return @"POST";
}

- (id)requestBody
{
  return [(CoreDAVXMLData *)self->_pushedData data];
}

- (void)fillOutDataWithUUIDsToAddActions:(id)a3 hrefsToModDeleteActions:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v20 = a4;
  -[CoreDAVXMLData startElement:inNamespace:withAttributes:](self->_pushedData, "startElement:inNamespace:withAttributes:");
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v25 = v6;
  obuint64_t j = [v6 allKeys];
  uint64_t v26 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v26)
  {
    id v22 = *(id *)v36;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(id *)v36 != v22) {
          objc_enumerationMutation(obj);
        }
        objc_super v29 = [v25 objectForKey:*(void *)(*((void *)&v35 + 1) + 8 * i)];
        v27 = [v29 context];
        [(CoreDAVXMLData *)self->_pushedData startElement:@"resource" inNamespace:@"http://me.com/_namespace/" withAttributes:0];
        [(CoreDAVXMLData *)self->_pushedData startElement:@"set" inNamespace:@"DAV:" withAttributes:0];
        [(CoreDAVXMLData *)self->_pushedData startElement:@"prop" inNamespace:@"DAV:" withAttributes:0];
        id v8 = [NSString alloc];
        id v9 = [v27 dataPayload];
        id v10 = (void *)[v8 initWithData:v9 encoding:4];

        [(CoreDAVXMLData *)self->_pushedData appendElement:self->_appSpecificDataProp inNamespace:self->_appSpecificNamespace withStringContentAsCDATA:v10 withAttributeNamesAndValues:0];
        [(CoreDAVXMLData *)self->_pushedData endElement:@"prop" inNamespace:@"DAV:"];
        [(CoreDAVXMLData *)self->_pushedData endElement:@"set" inNamespace:@"DAV:"];
        [(CoreDAVXMLData *)self->_pushedData endElement:@"resource" inNamespace:@"http://me.com/_namespace/"];
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v26);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v11 = v20;
  id v23 = [v20 allKeys];
  uint64_t v30 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v30)
  {
    uint64_t v28 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v32 != v28) {
          objc_enumerationMutation(v23);
        }
        v13 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        v14 = [v11 objectForKey:v13];
        [(CoreDAVXMLData *)self->_pushedData startElement:@"resource" inNamespace:@"http://me.com/_namespace/" withAttributes:0];
        pushedData = self->_pushedData;
        v16 = [v13 CDVRawPath];
        [(CoreDAVXMLData *)pushedData appendElement:@"href" inNamespace:@"DAV:" withStringContent:v16 withAttributeNamesAndValues:0];

        if ([v14 action] == 2)
        {
          [(CoreDAVXMLData *)self->_pushedData appendElement:@"delete" inNamespace:@"http://me.com/_namespace/" withStringContent:0 withAttributeNamesAndValues:0];
        }
        else
        {
          v24 = [v14 context];
          [(CoreDAVXMLData *)self->_pushedData startElement:@"set" inNamespace:@"DAV:" withAttributes:0];
          [(CoreDAVXMLData *)self->_pushedData startElement:@"prop" inNamespace:@"DAV:" withAttributes:0];
          id v17 = [NSString alloc];
          v18 = [v24 dataPayload];
          v19 = (void *)[v17 initWithData:v18 encoding:4];

          v11 = v20;
          [(CoreDAVXMLData *)self->_pushedData appendElement:self->_appSpecificDataProp inNamespace:self->_appSpecificNamespace withStringContentAsCDATA:v19 withAttributeNamesAndValues:0];

          [(CoreDAVXMLData *)self->_pushedData endElement:@"prop" inNamespace:@"DAV:"];
          [(CoreDAVXMLData *)self->_pushedData endElement:@"set" inNamespace:@"DAV:"];
        }
        [(CoreDAVXMLData *)self->_pushedData endElement:@"resource" inNamespace:@"http://me.com/_namespace/"];
      }
      uint64_t v30 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v30);
  }

  [(CoreDAVXMLData *)self->_pushedData endElement:@"multiput" inNamespace:@"http://me.com/_namespace/"];
}

- (id)copyDefaultParserForContentType:(id)a3
{
  v4 = [CoreDAVXMLParser alloc];
  uint64_t v5 = objc_opt_class();
  id v6 = [(CoreDAVTask *)self url];
  objc_super v7 = [(CoreDAVXMLParser *)v4 initWithRootElementNameSpace:@"DAV:" name:@"multistatus" parseClass:v5 baseURL:v6];

  id v8 = [[CoreDAVItemParserMapping alloc] initWithNameSpace:@"DAV:" name:@"getetag" parseClass:objc_opt_class()];
  id v9 = [[CoreDAVItemParserMapping alloc] initWithNameSpace:@"http://calendarserver.org/ns/" name:@"uid" parseClass:objc_opt_class()];
  id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [v10 addObject:v8];
  [v10 addObject:v9];
  [(CoreDAVXMLParser *)v7 setParseHints:v10];

  return v7;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = [(CoreDAVTask *)self responseBodyParser];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      long long v34 = [(CoreDAVTask *)self responseBodyParser];
      objc_super v7 = [v34 rootElement];
      id v8 = [(CoreDAVTask *)self responseHeaders];
      id v9 = [v8 CDVObjectForKeyCaseInsensitive:@"ctag"];
      nextCTag = self->_nextCTag;
      self->_nextCTag = v9;

      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v33 = v7;
      obuint64_t j = [v7 responses];
      v11 = self;
      uint64_t v38 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (!v38) {
        goto LABEL_43;
      }
      uint64_t v37 = *(void *)v44;
      long long v35 = self;
      while (1)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v44 != v37) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v43 + 1) + 8 * v12);
          v14 = [v13 firstHref];
          v15 = [v14 payloadAsFullURL];

          v16 = [v13 successfulPropertiesToValues];
          v40 = [v16 CDVObjectForKeyWithNameSpace:@"DAV:" andName:@"getetag"];
          id v17 = [v40 payloadAsString];
          v39 = [v16 CDVObjectForKeyWithNameSpace:@"http://calendarserver.org/ns/" andName:@"uid"];
          v18 = [v39 payloadAsString];
          v19 = [v13 status];
          id v20 = [v19 payloadAsString];

          if (v18) {
            BOOL v21 = v15 == 0;
          }
          else {
            BOOL v21 = 1;
          }
          if (!v21) {
            [(NSMutableDictionary *)v11->_uuidToHREF setObject:v15 forKey:v18];
          }
          if (v15) {
            BOOL v22 = v17 == 0;
          }
          else {
            BOOL v22 = 1;
          }
          if (v22)
          {
            if (v18) {
              goto LABEL_19;
            }
          }
          else
          {
            [(NSMutableDictionary *)v11->_hrefToETag setObject:v17 forKey:v15];
            if (v18)
            {
LABEL_19:
              if (!v20) {
                goto LABEL_27;
              }
              goto LABEL_23;
            }
          }
          id v23 = [v13 serverUID];
          v18 = [v23 payloadAsString];

          if (!v20) {
            goto LABEL_27;
          }
LABEL_23:
          if (v18) {
            [(NSMutableDictionary *)v11->_uuidToStatus setObject:v20 forKey:v18];
          }
          if (v15) {
            [(NSMutableDictionary *)v11->_hrefToStatus setObject:v20 forKey:v15];
          }
LABEL_27:
          v24 = [v13 errorItem];
          v25 = v24;
          if (!v24) {
            goto LABEL_38;
          }
          uint64_t v26 = [v24 ctagOkay];

          if (v26)
          {
            v27 = +[CoreDAVLogging sharedLogging];
            id WeakRetained = objc_loadWeakRetained((id *)&v11->super._accountInfoProvider);
            objc_super v29 = [v27 logHandleForAccountInfoProvider:WeakRetained];

            if (v29 && os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_213BFC000, v29, OS_LOG_TYPE_INFO, "Found a ctag-ok error item, marking our ctag as invalid", buf, 2u);
            }

            v11 = v35;
            uint64_t v30 = v35->_nextCTag;
            v35->_nextCTag = 0;
          }
          if (v18)
          {
            if (!v15) {
              goto LABEL_36;
            }
LABEL_35:
            [(NSMutableDictionary *)v11->_hrefToErrorItems setObject:v25 forKey:v15];
            goto LABEL_36;
          }
          long long v31 = [v25 uid];
          v18 = [v31 payloadAsString];

          if (v15) {
            goto LABEL_35;
          }
LABEL_36:
          if (v18) {
            [(NSMutableDictionary *)v11->_uuidToErrorItems setObject:v25 forKey:v18];
          }
LABEL_38:

          ++v12;
        }
        while (v38 != v12);
        uint64_t v32 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
        uint64_t v38 = v32;
        if (!v32)
        {
LABEL_43:

          self = v11;
          id v4 = 0;
          break;
        }
      }
    }
  }
  v41.receiver = self;
  v41.super_class = (Class)CoreDAVMultiPutTask;
  [(CoreDAVTask *)&v41 finishCoreDAVTaskWithError:v4];
}

- (NSString)nextCTag
{
  return self->_nextCTag;
}

- (NSDictionary)uuidToHREF
{
  return &self->_uuidToHREF->super;
}

- (NSDictionary)hrefToETag
{
  return &self->_hrefToETag->super;
}

- (NSDictionary)uuidToErrorItems
{
  return &self->_uuidToErrorItems->super;
}

- (NSDictionary)hrefToErrorItems
{
  return &self->_hrefToErrorItems->super;
}

- (NSDictionary)uuidToStatus
{
  return &self->_uuidToStatus->super;
}

- (NSDictionary)hrefToStatus
{
  return &self->_hrefToStatus->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hrefToStatus, 0);
  objc_storeStrong((id *)&self->_uuidToStatus, 0);
  objc_storeStrong((id *)&self->_hrefToErrorItems, 0);
  objc_storeStrong((id *)&self->_uuidToErrorItems, 0);
  objc_storeStrong((id *)&self->_hrefToETag, 0);
  objc_storeStrong((id *)&self->_uuidToHREF, 0);
  objc_storeStrong((id *)&self->_nextCTag, 0);
  objc_storeStrong((id *)&self->_pushedData, 0);
  objc_storeStrong((id *)&self->_checkCTag, 0);
  objc_storeStrong((id *)&self->_appSpecificDataProp, 0);
  objc_storeStrong((id *)&self->_appSpecificNamespace, 0);
}

@end