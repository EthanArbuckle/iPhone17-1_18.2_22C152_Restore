@interface CoreDAVPropPatchTask
- (CoreDAVPropPatchTask)initWithPropertiesToSet:(id)a3 andRemove:(id)a4 atURL:(id)a5;
- (CoreDAVPropPatchTask)initWithURL:(id)a3;
- (CoreDAVResponseItem)responseItem;
- (NSSet)propPatchRemoveElements;
- (NSSet)propPatchSetElements;
- (NSURL)priorOrderedURL;
- (id)additionalHeaderValues;
- (id)copyDefaultParserForContentType:(id)a3;
- (id)description;
- (id)httpMethod;
- (id)requestBody;
- (int)absoluteOrder;
- (void)finishCoreDAVTaskWithError:(id)a3;
- (void)setAbsoluteOrder:(int)a3;
- (void)setPriorOrderedURL:(id)a3;
- (void)setPropPatchRemoveElements:(id)a3;
- (void)setPropPatchSetElements:(id)a3;
- (void)setResponseItem:(id)a3;
@end

@implementation CoreDAVPropPatchTask

- (CoreDAVPropPatchTask)initWithURL:(id)a3
{
}

- (CoreDAVPropPatchTask)initWithPropertiesToSet:(id)a3 andRemove:(id)a4 atURL:(id)a5
{
  unint64_t v9 = (unint64_t)a3;
  unint64_t v10 = (unint64_t)a4;
  id v11 = a5;
  if (!(v9 | v10) || ((v12 = v11, !v9) || ![(id)v9 count]) && (!v10 || !objc_msgSend((id)v10, "count")))
  {
    id v16 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"The 'setElements' set or the 'removeElements' set should be non-nil and non-empty" userInfo:0];
    objc_exception_throw(v16);
  }
  v17.receiver = self;
  v17.super_class = (Class)CoreDAVPropPatchTask;
  v13 = [(CoreDAVTask *)&v17 initWithURL:v12];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_propPatchSetElements, a3);
    objc_storeStrong((id *)&v14->_propPatchRemoveElements, a4);
  }

  return v14;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v15.receiver = self;
  v15.super_class = (Class)CoreDAVPropPatchTask;
  v4 = [(CoreDAVActionBackedTask *)&v15 description];
  [v3 appendFormat:@"[%@ ", v4];

  v5 = [(CoreDAVPropPatchTask *)self propPatchSetElements];
  if (v5)
  {
    v6 = [(CoreDAVPropPatchTask *)self propPatchSetElements];
    objc_msgSend(v3, "appendFormat:", @"| Number of properties to set: [%lu]", objc_msgSend(v6, "count"));
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", @"| Number of properties to set: [%lu]", 0);
  }

  v7 = [(CoreDAVPropPatchTask *)self propPatchRemoveElements];
  if (v7)
  {
    v8 = [(CoreDAVPropPatchTask *)self propPatchRemoveElements];
    objc_msgSend(v3, "appendFormat:", @"| Number of properties to remove: [%lu]", objc_msgSend(v8, "count"));
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", @"| Number of properties to remove: [%lu]", 0);
  }

  unint64_t v9 = +[CoreDAVLogging sharedLogging];
  int v10 = [v9 shouldLogAtLevel:7 forAccountInfoProvider:0];

  if (v10)
  {
    id v11 = [(CoreDAVPropPatchTask *)self requestBody];
    uint64_t v12 = [v11 bytes];
    v13 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", v12, objc_msgSend(v11, "length"), 4);
    [v3 appendFormat:@"\n  Request body: [%@]", v13];
  }
  [v3 appendFormat:@"]"];
  return v3;
}

- (id)httpMethod
{
  return @"PROPPATCH";
}

- (id)additionalHeaderValues
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v11.receiver = self;
  v11.super_class = (Class)CoreDAVPropPatchTask;
  v4 = [(CoreDAVTask *)&v11 additionalHeaderValues];
  [v3 addEntriesFromDictionary:v4];

  if (self->_sendOrder)
  {
    v5 = [(NSURL *)self->_priorOrderedURL CDVRawLastPathComponent];
    if ([v5 length])
    {
      v6 = NSString;
      v7 = CDVRelativeOrderHeaderString();
      v8 = [v6 stringWithFormat:@"%@%@", v7, v5];
    }
    else
    {
      unint64_t v9 = [NSNumber numberWithInt:self->_absoluteOrder];
      v8 = [v9 stringValue];

      if (!v8)
      {
LABEL_6:

        goto LABEL_7;
      }
    }
    [v3 setObject:v8 forKey:@"Position"];
    goto LABEL_6;
  }
LABEL_7:
  return v3;
}

- (id)requestBody
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(CoreDAVXMLData);
  [(CoreDAVXMLData *)v3 setShouldAddFormattingSpaces:0];
  [(CoreDAVXMLData *)v3 startElement:@"propertyupdate" inNamespace:@"DAV:" withAttributeNamesAndValues:0];
  uint64_t v4 = [(CoreDAVPropPatchTask *)self propPatchSetElements];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [(CoreDAVPropPatchTask *)self propPatchSetElements];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      [(CoreDAVXMLData *)v3 startElement:@"set" inNamespace:@"DAV:" withAttributeNamesAndValues:0];
      [(CoreDAVXMLData *)v3 startElement:@"prop" inNamespace:@"DAV:" withAttributeNamesAndValues:0];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v8 = [(CoreDAVPropPatchTask *)self propPatchSetElements];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v29 != v11) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v28 + 1) + 8 * i) write:v3];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v10);
      }

      [(CoreDAVXMLData *)v3 endElement:@"prop" inNamespace:@"DAV:"];
      [(CoreDAVXMLData *)v3 endElement:@"set" inNamespace:@"DAV:"];
    }
  }
  uint64_t v13 = [(CoreDAVPropPatchTask *)self propPatchRemoveElements];
  if (v13)
  {
    v14 = (void *)v13;
    objc_super v15 = [(CoreDAVPropPatchTask *)self propPatchRemoveElements];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      [(CoreDAVXMLData *)v3 startElement:@"remove" inNamespace:@"DAV:" withAttributeNamesAndValues:0];
      [(CoreDAVXMLData *)v3 startElement:@"prop" inNamespace:@"DAV:" withAttributeNamesAndValues:0];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      objc_super v17 = [(CoreDAVPropPatchTask *)self propPatchRemoveElements];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v25;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v25 != v20) {
              objc_enumerationMutation(v17);
            }
            [*(id *)(*((void *)&v24 + 1) + 8 * j) write:v3];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v19);
      }

      [(CoreDAVXMLData *)v3 endElement:@"prop" inNamespace:@"DAV:"];
      [(CoreDAVXMLData *)v3 endElement:@"remove" inNamespace:@"DAV:"];
    }
  }
  [(CoreDAVXMLData *)v3 endElement:@"propertyupdate" inNamespace:@"DAV:"];
  v22 = [(CoreDAVXMLData *)v3 data];

  return v22;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[CoreDAVXMLParser canHandleContentType:v4])
  {
    v5 = [CoreDAVXMLParser alloc];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [(CoreDAVTask *)self url];
    v8 = [(CoreDAVXMLParser *)v5 initWithRootElementNameSpace:@"DAV:" name:@"multistatus" parseClass:v6 baseURL:v7];

    [(CoreDAVXMLParser *)v8 setParseHints:0];
  }
  else
  {
    uint64_t v9 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._accountInfoProvider);
    uint64_t v11 = [v9 logHandleForAccountInfoProvider:WeakRetained];

    if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_213BFC000, v11, OS_LOG_TYPE_ERROR, "Refusing to parse response to PROPPATCH because of content-type: [%@].", buf, 0xCu);
    }

    v13.receiver = self;
    v13.super_class = (Class)CoreDAVPropPatchTask;
    v8 = [(CoreDAVTask *)&v13 copyDefaultParserForContentType:v4];
  }

  return v8;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 code];
    uint64_t v7 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._accountInfoProvider);
    uint64_t v9 = [v7 logHandleForAccountInfoProvider:WeakRetained];

    if (v6 == 1)
    {
      if (v9)
      {
        uint64_t v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v48 = (id)objc_opt_class();
          id v11 = v48;
          uint64_t v12 = "%{public}@ cancelled";
          objc_super v13 = v10;
          os_log_type_t v14 = OS_LOG_TYPE_INFO;
          uint32_t v15 = 12;
LABEL_11:
          _os_log_impl(&dword_213BFC000, v13, v14, v12, buf, v15);

          goto LABEL_12;
        }
        goto LABEL_12;
      }
    }
    else if (v9)
    {
      objc_super v17 = v9;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v48 = (id)objc_opt_class();
        __int16 v49 = 2112;
        v50 = v5;
        id v11 = v48;
        uint64_t v12 = "%{public}@ failed: %@";
        objc_super v13 = v17;
        os_log_type_t v14 = OS_LOG_TYPE_ERROR;
        uint32_t v15 = 22;
        goto LABEL_11;
      }
LABEL_12:
    }
    id v18 = v5;
LABEL_14:
    uint64_t v19 = v18;
    goto LABEL_27;
  }
  uint64_t v16 = [(CoreDAVTask *)self responseBodyParser];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    BOOL v20 = [(CoreDAVTask *)self simulated];

    if (!v20)
    {
      v41 = +[CoreDAVLogging sharedLogging];
      id v42 = objc_loadWeakRetained((id *)&self->super.super._accountInfoProvider);
      v43 = [v41 logHandleForAccountInfoProvider:v42];

      if (v43)
      {
        v44 = v43;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v45 = [(CoreDAVTask *)self responseBodyParser];
          *(_DWORD *)buf = 138412290;
          id v48 = v45;
          _os_log_impl(&dword_213BFC000, v44, OS_LOG_TYPE_ERROR, "Unexpected parse response object for PROPPATCH: [%@].", buf, 0xCu);
        }
      }

      id v18 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:3 userInfo:0];
      goto LABEL_14;
    }
  }
  if ([(CoreDAVTask *)self simulated])
  {
    v21 = [(CoreDAVTask *)self simulatedRootElement];
  }
  else
  {
    v22 = [(CoreDAVTask *)self responseBodyParser];
    v21 = [v22 rootElement];
  }
  v23 = [v21 responses];
  long long v24 = [v23 anyObject];
  [(CoreDAVPropPatchTask *)self setResponseItem:v24];

  long long v25 = [(CoreDAVPropPatchTask *)self responseItem];
  LODWORD(v24) = [v25 hasPropertyError];

  if (!v24) {
    goto LABEL_25;
  }
  long long v26 = +[CoreDAVLogging sharedLogging];
  id v27 = objc_loadWeakRetained((id *)&self->super.super._accountInfoProvider);
  long long v28 = [v26 logHandleForAccountInfoProvider:v27];

  if (v28)
  {
    long long v29 = v28;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      long long v30 = [(CoreDAVPropPatchTask *)self responseItem];
      *(_DWORD *)buf = 138412290;
      id v48 = v30;
      _os_log_impl(&dword_213BFC000, v29, OS_LOG_TYPE_DEFAULT, "There were some failures changing properties, according to the following response: [%@].", buf, 0xCu);
    }
  }

  long long v31 = [(CoreDAVPropPatchTask *)self responseItem];
  v32 = [v31 successfulPropertiesToValues];
  uint64_t v33 = [v32 count];

  if (!v33)
  {
    uint64_t v19 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:2 userInfo:0];
  }
  else
  {
LABEL_25:
    uint64_t v19 = 0;
  }

LABEL_27:
  self->super.super._numDownloadedElements = [0 count];
  if (v19)
  {
    id v34 = v19;

    v5 = v34;
  }
  v35 = [(CoreDAVTask *)self delegate];
  char v36 = objc_opt_respondsToSelector();

  if (v36)
  {
    v37 = [(CoreDAVPropPatchTask *)self responseItem];

    if (v37)
    {
      v38 = (void *)MEMORY[0x263EFF8C0];
      v39 = [(CoreDAVPropPatchTask *)self responseItem];
      v37 = [v38 arrayWithObject:v39];
    }
    v40 = [(CoreDAVTask *)self delegate];
    [v40 propPatchTask:self parsedResponses:v37 error:v19];

    [(CoreDAVTask *)self setDelegate:0];
  }
  v46.receiver = self;
  v46.super_class = (Class)CoreDAVPropPatchTask;
  [(CoreDAVTask *)&v46 finishCoreDAVTaskWithError:v5];
}

- (void)setAbsoluteOrder:(int)a3
{
  self->_sendOrder = 1;
  self->_absoluteOrder = a3;
}

- (void)setPriorOrderedURL:(id)a3
{
  v5 = (NSURL *)a3;
  if (self->_priorOrderedURL != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_priorOrderedURL, a3);
    v5 = v6;
    if (self->_priorOrderedURL) {
      self->_sendOrder = 1;
    }
  }
}

- (NSSet)propPatchRemoveElements
{
  return self->_propPatchRemoveElements;
}

- (void)setPropPatchRemoveElements:(id)a3
{
}

- (NSSet)propPatchSetElements
{
  return self->_propPatchSetElements;
}

- (void)setPropPatchSetElements:(id)a3
{
}

- (CoreDAVResponseItem)responseItem
{
  return self->_responseItem;
}

- (void)setResponseItem:(id)a3
{
}

- (int)absoluteOrder
{
  return self->_absoluteOrder;
}

- (NSURL)priorOrderedURL
{
  return self->_priorOrderedURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorOrderedURL, 0);
  objc_storeStrong((id *)&self->_responseItem, 0);
  objc_storeStrong((id *)&self->_propPatchSetElements, 0);
  objc_storeStrong((id *)&self->_propPatchRemoveElements, 0);
}

@end