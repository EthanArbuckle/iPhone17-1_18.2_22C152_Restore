@interface CoreDAVBulkChangeTask
- (CoreDAVBulkChangeTask)initWithURL:(id)a3 checkCTag:(id)a4 simple:(BOOL)a5 returnChangedData:(BOOL)a6 uuidsToAddActions:(id)a7 hrefsToModDeleteActions:(id)a8;
- (NSDictionary)hrefsToModDeleteActions;
- (NSDictionary)uuidsToAddActions;
- (NSSet)bulkChangeResponses;
- (NSString)nextCTag;
- (id)additionalHeaderValues;
- (id)copyDefaultParserForContentType:(id)a3;
- (id)httpMethod;
- (id)requestBody;
- (void)fillOutDataWithUUIDsToAddActions:(id)a3 hrefsToModDeleteActions:(id)a4;
- (void)finishCoreDAVTaskWithError:(id)a3;
@end

@implementation CoreDAVBulkChangeTask

- (CoreDAVBulkChangeTask)initWithURL:(id)a3 checkCTag:(id)a4 simple:(BOOL)a5 returnChangedData:(BOOL)a6 uuidsToAddActions:(id)a7 hrefsToModDeleteActions:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  if ([(CoreDAVBulkChangeTask *)self isMemberOfClass:objc_opt_class()])
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"CoreDAVBulkChangeTask.m", 44, @"You instantiated a class that doesn't want to be instantiated.  Please choose a concrete subclass of %@", objc_opt_class() object file lineNumber description];

    v16 = 0;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)CoreDAVBulkChangeTask;
    v17 = [(CoreDAVTask *)&v20 initWithURL:v13];
    v18 = v17;
    if (v17)
    {
      objc_storeStrong((id *)&v17->_checkCTag, a4);
      v18->_simple = a5;
      v18->_returnChangedData = a6;
    }
    self = v18;
    v16 = self;
  }

  return v16;
}

- (id)additionalHeaderValues
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v8.receiver = self;
  v8.super_class = (Class)CoreDAVBulkChangeTask;
  v4 = [(CoreDAVTask *)&v8 additionalHeaderValues];
  [v3 addEntriesFromDictionary:v4];

  requestDataContentType = self->_requestDataContentType;
  if (requestDataContentType) {
    [v3 setObject:requestDataContentType forKey:@"Content-Type"];
  }
  if (self->_returnChangedData) {
    [v3 setObject:@"return-changed-data" forKey:@"X-MobileMe-DAV-Options"];
  }
  if (self->_checkCTag)
  {
    v6 = objc_msgSend(NSString, "CDVPreconditionHeaderValueWithCTag:");
    if (v6) {
      [v3 setObject:v6 forKey:@"If"];
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
  return self->_pushedData;
}

- (void)fillOutDataWithUUIDsToAddActions:(id)a3 hrefsToModDeleteActions:(id)a4
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (self->_pushedData)
  {
    v41 = [MEMORY[0x263F08690] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"CoreDAVBulkChangeTask.m", 92, @"%s _pushedData is not nil. self = %@", "-[CoreDAVBulkChangeTask fillOutDataWithUUIDsToAddActions:hrefsToModDeleteActions:]", self object file lineNumber description];
  }
  v49 = self;
  if (self->_simple)
  {
    v9 = (NSData *)objc_alloc_init(MEMORY[0x263EFF990]);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v59 objects:v65 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v60 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [v10 objectForKey:*(void *)(*((void *)&v59 + 1) + 8 * i)];
          v16 = [v15 context];
          v17 = [v16 dataPayload];
          [(NSData *)v9 appendData:v17];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v59 objects:v65 count:16];
      }
      while (v12);
    }

    pushedData = (CoreDAVXMLData *)v49->_pushedData;
    v49->_pushedData = v9;
  }
  else
  {
    v43 = v8;
    pushedData = objc_alloc_init(CoreDAVXMLData);
    -[CoreDAVXMLData startElement:inNamespace:withAttributes:](pushedData, "startElement:inNamespace:withAttributes:");
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v42 = v7;
    obuint64_t j = v7;
    uint64_t v47 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
    if (v47)
    {
      uint64_t v45 = *(void *)v56;
      do
      {
        for (uint64_t j = 0; j != v47; ++j)
        {
          if (*(void *)v56 != v45) {
            objc_enumerationMutation(obj);
          }
          objc_super v20 = [obj objectForKey:*(void *)(*((void *)&v55 + 1) + 8 * j)];
          v21 = [v20 context];
          [(CoreDAVXMLData *)pushedData startElement:@"resource" inNamespace:@"http://me.com/_namespace/" withAttributes:0];
          [(CoreDAVXMLData *)pushedData startElement:@"set" inNamespace:@"DAV:" withAttributes:0];
          [(CoreDAVXMLData *)pushedData startElement:@"prop" inNamespace:@"DAV:" withAttributes:0];
          id v22 = [NSString alloc];
          v23 = [v21 dataPayload];
          v24 = (void *)[v22 initWithData:v23 encoding:4];

          [(CoreDAVXMLData *)pushedData appendElement:v49->_appSpecificDataProp inNamespace:v49->_appSpecificNamespace withStringContentAsCDATA:v24 withAttributeNamesAndValues:0];
          [(CoreDAVXMLData *)pushedData endElement:@"prop" inNamespace:@"DAV:"];
          [(CoreDAVXMLData *)pushedData endElement:@"set" inNamespace:@"DAV:"];
          [(CoreDAVXMLData *)pushedData endElement:@"resource" inNamespace:@"http://me.com/_namespace/"];
        }
        uint64_t v47 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
      }
      while (v47);
    }

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v25 = v43;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v51 objects:v63 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v52;
      id v46 = v25;
      uint64_t v44 = *(void *)v52;
      do
      {
        uint64_t v29 = 0;
        uint64_t v48 = v27;
        do
        {
          if (*(void *)v52 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v51 + 1) + 8 * v29);
          v31 = [v25 objectForKey:v30];
          [(CoreDAVXMLData *)pushedData startElement:@"resource" inNamespace:@"http://me.com/_namespace/" withAttributes:0];
          v32 = [v30 CDVRawPath];
          [(CoreDAVXMLData *)pushedData appendElement:@"href" inNamespace:@"DAV:" withStringContent:v32 withAttributeNamesAndValues:0];

          if ([v31 action] == 2)
          {
            [(CoreDAVXMLData *)pushedData appendElement:@"delete" inNamespace:@"http://me.com/_namespace/" withStringContent:0 withAttributeNamesAndValues:0];
          }
          else
          {
            v33 = [v31 context];
            v34 = [v33 syncKey];

            if (v34)
            {
              [(CoreDAVXMLData *)pushedData startElement:@"if-match" inNamespace:@"http://me.com/_namespace/" withAttributes:0];
              v35 = [v33 syncKey];
              [(CoreDAVXMLData *)pushedData appendElement:@"getetag" inNamespace:@"DAV:" withStringContent:v35 withAttributeNamesAndValues:0];

              [(CoreDAVXMLData *)pushedData endElement:@"if-match" inNamespace:@"http://me.com/_namespace/"];
            }
            [(CoreDAVXMLData *)pushedData startElement:@"set" inNamespace:@"DAV:" withAttributes:0];
            [(CoreDAVXMLData *)pushedData startElement:@"prop" inNamespace:@"DAV:" withAttributes:0];
            id v36 = [NSString alloc];
            v37 = [v33 dataPayload];
            v38 = (void *)[v36 initWithData:v37 encoding:4];

            [(CoreDAVXMLData *)pushedData appendElement:v49->_appSpecificDataProp inNamespace:v49->_appSpecificNamespace withStringContentAsCDATA:v38 withAttributeNamesAndValues:0];
            [(CoreDAVXMLData *)pushedData endElement:@"prop" inNamespace:@"DAV:"];
            [(CoreDAVXMLData *)pushedData endElement:@"set" inNamespace:@"DAV:"];

            uint64_t v28 = v44;
            id v25 = v46;
            uint64_t v27 = v48;
          }
          [(CoreDAVXMLData *)pushedData endElement:@"resource" inNamespace:@"http://me.com/_namespace/"];

          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v51 objects:v63 count:16];
      }
      while (v27);
    }

    [(CoreDAVXMLData *)pushedData endElement:@"multiput" inNamespace:@"http://me.com/_namespace/"];
    uint64_t v39 = [(CoreDAVXMLData *)pushedData data];
    v40 = v49->_pushedData;
    v49->_pushedData = (NSData *)v39;

    id v7 = v42;
    id v8 = v43;
  }
}

- (id)copyDefaultParserForContentType:(id)a3
{
  v4 = [CoreDAVXMLParser alloc];
  uint64_t v5 = objc_opt_class();
  v6 = [(CoreDAVTask *)self url];
  id v7 = [(CoreDAVXMLParser *)v4 initWithRootElementNameSpace:@"DAV:" name:@"multistatus" parseClass:v5 baseURL:v6];

  id v8 = [[CoreDAVItemParserMapping alloc] initWithNameSpace:@"DAV:" name:@"getetag" parseClass:objc_opt_class()];
  v9 = [[CoreDAVItemParserMapping alloc] initWithNameSpace:@"http://calendarserver.org/ns/" name:@"uid" parseClass:objc_opt_class()];
  id v10 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [v10 addObject:v8];
  [v10 addObject:v9];
  [(CoreDAVXMLParser *)v7 setParseHints:v10];

  return v7;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = [(CoreDAVTask *)self responseBodyParser];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v45 = [(CoreDAVTask *)self responseBodyParser];
      id v7 = [v45 rootElement];
      id v8 = [(CoreDAVTask *)self responseHeaders];
      v9 = [v8 CDVObjectForKeyCaseInsensitive:@"CTag"];
      nextCTag = self->_nextCTag;
      self->_nextCTag = v9;

      uint64_t v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
      bulkChangeResponses = self->_bulkChangeResponses;
      self->_bulkChangeResponses = v11;

      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      uint64_t v44 = v7;
      obuint64_t j = [v7 responses];
      uint64_t v49 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
      if (v49)
      {
        uint64_t v47 = *(void *)v66;
        uint64_t v48 = self;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v66 != v47) {
              objc_enumerationMutation(obj);
            }
            uint64_t v50 = v13;
            id v14 = *(void **)(*((void *)&v65 + 1) + 8 * v13);
            id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            v16 = [v14 status];

            if (v16)
            {
              v17 = (void *)[[NSString alloc] initWithCDVNameSpace:@"DAV:" andName:@"status"];
              v18 = [v14 status];
              [v15 setObject:v18 forKey:v17];
            }
            v19 = [v14 errorItem];

            if (v19)
            {
              objc_super v20 = (void *)[[NSString alloc] initWithCDVNameSpace:@"DAV:" andName:@"error"];
              v21 = [v14 errorItem];
              [v15 setObject:v21 forKey:v20];
            }
            id v22 = [v14 firstHref];

            if (v22)
            {
              v23 = (void *)[[NSString alloc] initWithCDVNameSpace:@"DAV:" andName:@"href"];
              v24 = [v14 firstHref];
              [v15 setObject:v24 forKey:v23];
            }
            long long v63 = 0u;
            long long v64 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            id v51 = [v14 propStats];
            uint64_t v53 = [v51 countByEnumeratingWithState:&v61 objects:v70 count:16];
            if (v53)
            {
              uint64_t v52 = *(void *)v62;
              do
              {
                uint64_t v25 = 0;
                do
                {
                  if (*(void *)v62 != v52) {
                    objc_enumerationMutation(v51);
                  }
                  uint64_t v26 = *(void **)(*((void *)&v61 + 1) + 8 * v25);
                  long long v57 = 0u;
                  long long v58 = 0u;
                  long long v59 = 0u;
                  long long v60 = 0u;
                  long long v54 = v26;
                  uint64_t v55 = v25;
                  uint64_t v27 = [v26 prop];
                  uint64_t v28 = [v27 extraChildItems];

                  uint64_t v29 = [v28 countByEnumeratingWithState:&v57 objects:v69 count:16];
                  if (v29)
                  {
                    uint64_t v30 = v29;
                    uint64_t v31 = *(void *)v58;
                    do
                    {
                      for (uint64_t i = 0; i != v30; ++i)
                      {
                        if (*(void *)v58 != v31) {
                          objc_enumerationMutation(v28);
                        }
                        v33 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                        id v34 = [NSString alloc];
                        v35 = [v33 nameSpace];
                        id v36 = [v33 name];
                        v37 = (void *)[v34 initWithCDVNameSpace:v35 andName:v36];

                        [v15 setObject:v33 forKey:v37];
                      }
                      uint64_t v30 = [v28 countByEnumeratingWithState:&v57 objects:v69 count:16];
                    }
                    while (v30);
                  }

                  v38 = [v54 status];

                  if (v38)
                  {
                    uint64_t v39 = (void *)[[NSString alloc] initWithCDVNameSpace:@"DAV:" andName:@"status"];
                    v40 = [v54 status];
                    [v15 setObject:v40 forKey:v39];
                  }
                  v41 = [v54 errorItem];

                  if (v41)
                  {
                    id v42 = (void *)[[NSString alloc] initWithCDVNameSpace:@"DAV:" andName:@"error"];
                    v43 = [v54 errorItem];
                    [v15 setObject:v43 forKey:v42];
                  }
                  uint64_t v25 = v55 + 1;
                }
                while (v55 + 1 != v53);
                uint64_t v53 = [v51 countByEnumeratingWithState:&v61 objects:v70 count:16];
              }
              while (v53);
            }

            self = v48;
            [(NSMutableSet *)v48->_bulkChangeResponses addObject:v15];

            uint64_t v13 = v50 + 1;
          }
          while (v50 + 1 != v49);
          uint64_t v49 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
        }
        while (v49);
      }

      id v4 = 0;
    }
  }
  v56.receiver = self;
  v56.super_class = (Class)CoreDAVBulkChangeTask;
  [(CoreDAVTask *)&v56 finishCoreDAVTaskWithError:v4];
}

- (NSDictionary)uuidsToAddActions
{
  return self->_uuidsToAddActions;
}

- (NSDictionary)hrefsToModDeleteActions
{
  return self->_hrefsToModDeleteActions;
}

- (NSString)nextCTag
{
  return self->_nextCTag;
}

- (NSSet)bulkChangeResponses
{
  return &self->_bulkChangeResponses->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDataContentType, 0);
  objc_storeStrong((id *)&self->_bulkChangeResponses, 0);
  objc_storeStrong((id *)&self->_nextCTag, 0);
  objc_storeStrong((id *)&self->_pushedData, 0);
  objc_storeStrong((id *)&self->_checkCTag, 0);
  objc_storeStrong((id *)&self->_hrefsToModDeleteActions, 0);
  objc_storeStrong((id *)&self->_uuidsToAddActions, 0);
  objc_storeStrong((id *)&self->_appSpecificDataProp, 0);
  objc_storeStrong((id *)&self->_appSpecificNamespace, 0);
}

@end