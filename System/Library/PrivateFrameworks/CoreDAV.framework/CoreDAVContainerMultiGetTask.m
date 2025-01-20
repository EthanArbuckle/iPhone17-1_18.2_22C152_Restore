@interface CoreDAVContainerMultiGetTask
- (BOOL)shouldIgnoreResponseErrors;
- (CoreDAVContainerMultiGetTask)initWithURLs:(id)a3 atContainerURL:(id)a4 appSpecificDataItemClass:(Class)a5;
- (NSSet)additionalPropElements;
- (NSSet)deletedURLs;
- (NSSet)missingURLs;
- (NSSet)parsedContents;
- (id)copyAdditionalPropElements;
- (id)copyDefaultParserForContentType:(id)a3;
- (id)httpMethod;
- (id)requestBody;
- (void)finishCoreDAVTaskWithError:(id)a3;
- (void)setAdditionalPropElements:(id)a3;
- (void)setShouldIgnoreResponseErrors:(BOOL)a3;
@end

@implementation CoreDAVContainerMultiGetTask

- (CoreDAVContainerMultiGetTask)initWithURLs:(id)a3 atContainerURL:(id)a4 appSpecificDataItemClass:(Class)a5
{
  id v10 = a3;
  id v11 = a4;
  if ([(CoreDAVContainerMultiGetTask *)self isMemberOfClass:objc_opt_class()])
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CoreDAVContainerMultiGetTask.m", 37, @"You instantiated a class that doesn't want to be instantiated.  Please choose a concrete subclass of %@", objc_opt_class() object file lineNumber description];

    v13 = 0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)CoreDAVContainerMultiGetTask;
    v14 = [(CoreDAVTask *)&v17 initWithURL:v11];
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_urls, a3);
      if (!a5) {
        a5 = (Class)objc_opt_class();
      }
      v15->_appSpecificDataItemClass = a5;
    }
    self = v15;
    v13 = self;
  }

  return v13;
}

- (id)copyAdditionalPropElements
{
  return 0;
}

- (id)httpMethod
{
  return @"REPORT";
}

- (id)requestBody
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v3 = objc_alloc_init(CoreDAVXMLData);
  id v26 = [(CoreDAVContainerMultiGetTask *)self copyAdditionalPropElements];
  -[CoreDAVContainerMultiGetTask setAdditionalPropElements:](self, "setAdditionalPropElements:");
  appSpecificMultiGetNameSpace = self->_appSpecificMultiGetNameSpace;
  if (!appSpecificMultiGetNameSpace) {
    appSpecificMultiGetNameSpace = self->_appSpecificNamespace;
  }
  [(CoreDAVXMLData *)v3 startElement:self->_appSpecificMultiGetCommand inNamespace:appSpecificMultiGetNameSpace withAttributeNamesAndValues:0];
  [(CoreDAVXMLData *)v3 startElement:@"prop" inNamespace:@"DAV:" withAttributeNamesAndValues:0];
  [(CoreDAVXMLData *)v3 appendElement:@"getetag" inNamespace:@"DAV:" withStringContent:0 withAttributeNamesAndValues:0];
  [(CoreDAVXMLData *)v3 appendElement:self->_appSpecificDataProp inNamespace:self->_appSpecificNamespace withStringContent:0 withAttributeNamesAndValues:0];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v5 = [(CoreDAVContainerMultiGetTask *)self additionalPropElements];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v11 = [v10 name];
        v12 = [v10 nameSpace];
        [(CoreDAVXMLData *)v3 appendElement:v11 inNamespace:v12 withStringContent:0 withAttributeNamesAndValues:0];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v39 count:16];
    }
    while (v7);
  }

  [(CoreDAVXMLData *)v3 endElement:@"prop" inNamespace:@"DAV:"];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = self->_urls;
  uint64_t v13 = [(NSSet *)obj countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(obj);
        }
        objc_super v17 = *(void **)(*((void *)&v28 + 1) + 8 * j);
        v18 = [v17 CDVRawPath];

        if (v18)
        {
          v19 = [v17 CDVRawPath];
          [(CoreDAVXMLData *)v3 appendElement:@"href" inNamespace:@"DAV:" withStringContent:v19 withAttributeNamesAndValues:0];
        }
        else
        {
          v19 = +[CoreDAVLogging sharedLogging];
          v20 = self;
          id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
          v22 = [v19 logHandleForAccountInfoProvider:WeakRetained];

          if (v22 && os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v37 = v17;
            _os_log_impl(&dword_213BFC000, v22, OS_LOG_TYPE_DEFAULT, "Skipping item URL, as it has no path.  URL %@", buf, 0xCu);
          }

          self = v20;
        }
      }
      uint64_t v14 = [(NSSet *)obj countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v14);
  }

  appSpecificNamespace = self->_appSpecificMultiGetNameSpace;
  if (!appSpecificNamespace) {
    appSpecificNamespace = self->_appSpecificNamespace;
  }
  [(CoreDAVXMLData *)v3 endElement:self->_appSpecificMultiGetCommand inNamespace:appSpecificNamespace];
  v24 = [(CoreDAVXMLData *)v3 data];

  return v24;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  v4 = [CoreDAVXMLParser alloc];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(CoreDAVTask *)self url];
  uint64_t v7 = [(CoreDAVXMLParser *)v4 initWithRootElementNameSpace:@"DAV:" name:@"multistatus" parseClass:v5 baseURL:v6];

  uint64_t v8 = [[CoreDAVItemParserMapping alloc] initWithNameSpace:@"DAV:" name:@"getetag" parseClass:objc_opt_class()];
  v9 = [[CoreDAVItemParserMapping alloc] initWithNameSpace:self->_appSpecificNamespace name:self->_appSpecificDataProp parseClass:objc_opt_class()];
  id v10 = objc_alloc(MEMORY[0x263EFF9C0]);
  id v11 = [(CoreDAVContainerMultiGetTask *)self additionalPropElements];
  v12 = (void *)[v10 initWithSet:v11];

  [v12 addObject:v8];
  [v12 addObject:v9];
  [(CoreDAVXMLParser *)v7 setParseHints:v12];

  return v7;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 code];
    uint64_t v7 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    v9 = [v7 logHandleForAccountInfoProvider:WeakRetained];

    if (v6 == 1)
    {
      if (v9)
      {
        id v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v71 = (id)objc_opt_class();
          id v11 = v71;
          v12 = "%{public}@ cancelled";
          uint64_t v13 = v10;
          os_log_type_t v14 = OS_LOG_TYPE_INFO;
          uint32_t v15 = 12;
LABEL_34:
          _os_log_impl(&dword_213BFC000, v13, v14, v12, buf, v15);

          goto LABEL_35;
        }
        goto LABEL_35;
      }
    }
    else if (v9)
    {
      v45 = v9;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v71 = (id)objc_opt_class();
        __int16 v72 = 2112;
        v73 = v5;
        id v11 = v71;
        v12 = "%{public}@ failed: %@";
        uint64_t v13 = v45;
        os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
        uint32_t v15 = 22;
        goto LABEL_34;
      }
LABEL_35:
    }
    id v46 = v5;
    v47 = 0;
    v16 = 0;
    goto LABEL_44;
  }
  v16 = (NSSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v59 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v60 = (NSSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  v57 = [(CoreDAVTask *)self responseBodyParser];
  [v57 rootElement];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v56 = long long v68 = 0u;
  obuint64_t j = [v56 responses];
  uint64_t v63 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (!v63)
  {
    uint64_t v58 = 0;
    goto LABEL_38;
  }
  uint64_t v58 = 0;
  uint64_t v62 = *(void *)v66;
  do
  {
    uint64_t v17 = 0;
    do
    {
      if (*(void *)v66 != v62) {
        objc_enumerationMutation(obj);
      }
      v18 = *(void **)(*((void *)&v65 + 1) + 8 * v17);
      v19 = [v18 firstHref];
      v20 = [v19 payloadAsFullURL];

      v21 = [v18 status];
      v22 = [v21 payloadAsString];
      int v23 = [v22 CDVIsHTTPStatusLineWithStatusCode:404];

      if (v23)
      {
        v24 = +[CoreDAVLogging sharedLogging];
        id v25 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        id v26 = [v24 logHandleForAccountInfoProvider:v25];

        if (v26 && os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v71 = v20;
          _os_log_impl(&dword_213BFC000, v26, OS_LOG_TYPE_DEFAULT, "Got a 404 in response to our multistatus. It looks like the item at %@ has gone away.", buf, 0xCu);
        }

        [(NSSet *)v60 addObject:v20];
      }
      v27 = [v18 successfulPropertiesToValues];
      long long v28 = v27;
      if (v27)
      {
        long long v29 = v16;
        long long v30 = [v27 CDVObjectForKeyWithNameSpace:@"DAV:" andName:@"getetag"];
        long long v31 = [v30 payloadAsString];

        long long v32 = [v28 CDVObjectForKeyWithNameSpace:self->_appSpecificNamespace andName:self->_appSpecificDataProp];
        long long v33 = [v32 payload];

        if (v20) {
          [v59 addObject:v20];
        }
        id v34 = objc_alloc(self->_appSpecificDataItemClass);
        long long v35 = [(CoreDAVTask *)self url];
        v36 = [(CoreDAVTask *)self accountInfoProvider];
        v37 = (void *)[v34 initWithURL:v20 eTag:v31 dataPayload:v33 inContainerWithURL:v35 withAccountInfoProvider:v36];

        [(CoreDAVContainerMultiGetTask *)self setAdditionalProperties:v28 onDataItem:v37];
        v16 = v29;
        [(NSSet *)v29 addObject:v37];

        goto LABEL_20;
      }
      v38 = [v18 status];
      v39 = [v38 payloadAsString];
      char v40 = [v39 CDVIsHTTPStatusLineWithStatusCode:404];

      if ((v40 & 1) == 0)
      {
        v41 = +[CoreDAVLogging sharedLogging];
        id v42 = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
        v43 = [v41 logHandleForAccountInfoProvider:v42];

        if (v43 && os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v71 = v18;
          _os_log_impl(&dword_213BFC000, v43, OS_LOG_TYPE_DEFAULT, "Got a multi-status response with no valid property values. Response is %@", buf, 0xCu);
        }

        if (!self->_shouldIgnoreResponseErrors)
        {
          [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:8 userInfo:0];
          v58 = long long v31 = (void *)v58;
LABEL_20:
        }
      }

      ++v17;
    }
    while (v63 != v17);
    uint64_t v44 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
    uint64_t v63 = v44;
  }
  while (v44);
LABEL_38:

  unint64_t v48 = [(NSSet *)v16 count];
  uint64_t v5 = 0;
  id v46 = (id)v58;
  v47 = v60;
  if (v48)
  {
    unint64_t v49 = v48;
    if (v48 < [(NSSet *)self->_urls count])
    {
      v50 = (void *)[(NSSet *)self->_urls mutableCopy];
      [v50 minusSet:v59];
      uint64_t v51 = [v50 count];
      if (v51 == [(NSSet *)self->_urls count] - v49) {
        objc_storeStrong((id *)&self->_missingURLs, v50);
      }
    }
  }

LABEL_44:
  parsedContents = self->_parsedContents;
  self->_parsedContents = v16;
  v53 = v16;

  deletedURLs = self->_deletedURLs;
  self->_deletedURLs = v47;
  v55 = v47;

  self->super._numDownloadedElements = [(NSSet *)v53 count];
  v64.receiver = self;
  v64.super_class = (Class)CoreDAVContainerMultiGetTask;
  [(CoreDAVTask *)&v64 finishCoreDAVTaskWithError:v46];
}

- (NSSet)additionalPropElements
{
  return self->_additionalPropElements;
}

- (void)setAdditionalPropElements:(id)a3
{
}

- (BOOL)shouldIgnoreResponseErrors
{
  return self->_shouldIgnoreResponseErrors;
}

- (void)setShouldIgnoreResponseErrors:(BOOL)a3
{
  self->_shouldIgnoreResponseErrors = a3;
}

- (NSSet)parsedContents
{
  return self->_parsedContents;
}

- (NSSet)missingURLs
{
  return self->_missingURLs;
}

- (NSSet)deletedURLs
{
  return self->_deletedURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedURLs, 0);
  objc_storeStrong((id *)&self->_missingURLs, 0);
  objc_storeStrong((id *)&self->_parsedContents, 0);
  objc_storeStrong((id *)&self->_additionalPropElements, 0);
  objc_storeStrong((id *)&self->_appSpecificDataProp, 0);
  objc_storeStrong((id *)&self->_appSpecificMultiGetCommand, 0);
  objc_storeStrong((id *)&self->_appSpecificMultiGetNameSpace, 0);
  objc_storeStrong((id *)&self->_appSpecificNamespace, 0);
  objc_storeStrong((id *)&self->_urls, 0);
}

@end