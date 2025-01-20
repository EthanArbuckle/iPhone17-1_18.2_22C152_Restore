@interface CoreDAVMkcolTask
- (CoreDAVMkcolTask)initWithPropertiesToSet:(id)a3 atURL:(id)a4;
- (CoreDAVMkcolTask)initWithURL:(id)a3;
- (NSSet)propertiesToSet;
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
- (void)setPropertiesToSet:(id)a3;
@end

@implementation CoreDAVMkcolTask

- (CoreDAVMkcolTask)initWithURL:(id)a3
{
  return [(CoreDAVMkcolTask *)self initWithPropertiesToSet:0 atURL:a3];
}

- (CoreDAVMkcolTask)initWithPropertiesToSet:(id)a3 atURL:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CoreDAVMkcolTask;
  v8 = [(CoreDAVTask *)&v11 initWithURL:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_propertiesToSet, a3);
  }

  return v9;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v13.receiver = self;
  v13.super_class = (Class)CoreDAVMkcolTask;
  v4 = [(CoreDAVActionBackedTask *)&v13 description];
  [v3 appendFormat:@"[%@ ", v4];

  v5 = [(CoreDAVMkcolTask *)self propertiesToSet];
  if (v5)
  {
    v6 = [(CoreDAVMkcolTask *)self propertiesToSet];
    objc_msgSend(v3, "appendFormat:", @"| Number of properties to set: [%lu]", objc_msgSend(v6, "count"));
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", @"| Number of properties to set: [%lu]", 0);
  }

  id v7 = +[CoreDAVLogging sharedLogging];
  int v8 = [v7 shouldLogAtLevel:7 forAccountInfoProvider:0];

  if (v8)
  {
    id v9 = [(CoreDAVMkcolTask *)self requestBody];
    uint64_t v10 = [v9 bytes];
    objc_super v11 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", v10, objc_msgSend(v9, "length"), 4);
    [v3 appendFormat:@"| Request body: [%@]", v11];
  }
  [v3 appendFormat:@"]"];
  return v3;
}

- (id)httpMethod
{
  return @"MKCOL";
}

- (id)additionalHeaderValues
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v11.receiver = self;
  v11.super_class = (Class)CoreDAVMkcolTask;
  v4 = [(CoreDAVTask *)&v11 additionalHeaderValues];
  [v3 addEntriesFromDictionary:v4];

  if (self->_sendOrder)
  {
    v5 = [(NSURL *)self->_priorOrderedURL CDVRawLastPathComponent];
    if ([v5 length])
    {
      v6 = NSString;
      id v7 = CDVRelativeOrderHeaderString();
      int v8 = [v6 stringWithFormat:@"%@%@", v7, v5];
    }
    else
    {
      id v9 = [NSNumber numberWithInt:self->_absoluteOrder];
      int v8 = [v9 stringValue];

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
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CoreDAVMkcolTask *)self propertiesToSet];
  if (v3
    && (v4 = (void *)v3,
        [(CoreDAVMkcolTask *)self propertiesToSet],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v4,
        v6))
  {
    id v7 = objc_alloc_init(CoreDAVXMLData);
    [(CoreDAVXMLData *)v7 startElement:@"mkcol" inNamespace:@"DAV:" withAttributeNamesAndValues:0];
    uint64_t v8 = [(CoreDAVMkcolTask *)self propertiesToSet];
    if (v8)
    {
      id v9 = (void *)v8;
      uint64_t v10 = [(CoreDAVMkcolTask *)self propertiesToSet];
      uint64_t v11 = [v10 count];

      if (v11)
      {
        [(CoreDAVXMLData *)v7 startElement:@"set" inNamespace:@"DAV:" withAttributeNamesAndValues:0];
        [(CoreDAVXMLData *)v7 startElement:@"prop" inNamespace:@"DAV:" withAttributeNamesAndValues:0];
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        v12 = [(CoreDAVMkcolTask *)self propertiesToSet];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v20 != v15) {
                objc_enumerationMutation(v12);
              }
              [*(id *)(*((void *)&v19 + 1) + 8 * i) write:v7];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v14);
        }

        [(CoreDAVXMLData *)v7 endElement:@"prop" inNamespace:@"DAV:"];
        [(CoreDAVXMLData *)v7 endElement:@"set" inNamespace:@"DAV:"];
      }
    }
    [(CoreDAVXMLData *)v7 endElement:@"mkcol" inNamespace:@"DAV:"];
    v17 = [(CoreDAVXMLData *)v7 data];
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  id v4 = a3;
  if (+[CoreDAVXMLParser canHandleContentType:v4])
  {
    v5 = [CoreDAVXMLParser alloc];
    uint64_t v6 = objc_opt_class();
    id v7 = [(CoreDAVTask *)self url];
    uint64_t v8 = [(CoreDAVXMLParser *)v5 initWithRootElementNameSpace:@"DAV:" name:@"mkcol-response" parseClass:v6 baseURL:v7];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CoreDAVMkcolTask;
    uint64_t v8 = [(CoreDAVTask *)&v10 copyDefaultParserForContentType:v4];
  }

  return v8;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 code];
    id v7 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._accountInfoProvider);
    id v9 = [v7 logHandleForAccountInfoProvider:WeakRetained];

    if (v6 == 1)
    {
      if (v9)
      {
        objc_super v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v32 = (id)objc_opt_class();
          id v11 = v32;
          v12 = "%{public}@ cancelled";
          uint64_t v13 = v10;
          os_log_type_t v14 = OS_LOG_TYPE_INFO;
          uint32_t v15 = 12;
LABEL_15:
          _os_log_impl(&dword_213BFC000, v13, v14, v12, buf, v15);

          goto LABEL_16;
        }
        goto LABEL_16;
      }
    }
    else if (v9)
    {
      v26 = v9;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v32 = (id)objc_opt_class();
        __int16 v33 = 2112;
        v34 = v5;
        id v11 = v32;
        v12 = "%{public}@ failed: %@";
        uint64_t v13 = v26;
        os_log_type_t v14 = OS_LOG_TYPE_ERROR;
        uint32_t v15 = 22;
        goto LABEL_15;
      }
LABEL_16:
    }
    id v25 = v5;
    long long v21 = 0;
    goto LABEL_21;
  }
  v16 = [(CoreDAVTask *)self responseBodyParser];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v18 = [(CoreDAVTask *)self responseBodyParser];
    long long v19 = [v18 rootElement];
    long long v20 = [v19 propStats];
    long long v21 = [v20 allObjects];

    if ([v19 hasPropertyError])
    {
      long long v22 = +[CoreDAVLogging sharedLogging];
      id v23 = objc_loadWeakRetained((id *)&self->super.super._accountInfoProvider);
      uint64_t v24 = [v22 logHandleForAccountInfoProvider:v23];

      if (v24 && os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v19;
        _os_log_impl(&dword_213BFC000, v24, OS_LOG_TYPE_DEFAULT, "There we no properties successfully applied according to the following item: [%@].", buf, 0xCu);
      }

      id v25 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:2 userInfo:0];
    }
    else
    {
      id v25 = 0;
    }
  }
  else
  {
    long long v21 = 0;
    id v25 = 0;
  }
LABEL_21:
  self->super.super._numDownloadedElements = [v21 count];
  v27 = [(CoreDAVTask *)self delegate];
  char v28 = objc_opt_respondsToSelector();

  if (v28)
  {
    v29 = [(CoreDAVTask *)self delegate];
    [v29 mkcolTask:self parsedPropStats:v21 error:v25];

    [(CoreDAVTask *)self setDelegate:0];
  }
  v30.receiver = self;
  v30.super_class = (Class)CoreDAVMkcolTask;
  [(CoreDAVTask *)&v30 finishCoreDAVTaskWithError:v5];
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

- (NSSet)propertiesToSet
{
  return self->_propertiesToSet;
}

- (void)setPropertiesToSet:(id)a3
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
  objc_storeStrong((id *)&self->_propertiesToSet, 0);
}

@end