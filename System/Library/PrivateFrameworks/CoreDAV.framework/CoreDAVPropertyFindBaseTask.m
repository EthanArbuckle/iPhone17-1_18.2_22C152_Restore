@interface CoreDAVPropertyFindBaseTask
- (CoreDAVMultiStatusItem)multiStatus;
- (CoreDAVPropertyFindBaseTask)initWithPropertiesToFind:(id)a3 atURL:(id)a4;
- (NSSet)propertiesToFind;
- (id)additionalHeaderValues;
- (id)copyDefaultParserForContentType:(id)a3;
- (id)description;
- (id)getTotalFailureError;
- (id)successfulValueForNameSpace:(id)a3 elementName:(id)a4;
- (void)finishCoreDAVTaskWithError:(id)a3;
- (void)setMultiStatus:(id)a3;
- (void)setPropertiesToFind:(id)a3;
- (void)updateMultiStatusFromResponse;
@end

@implementation CoreDAVPropertyFindBaseTask

- (CoreDAVPropertyFindBaseTask)initWithPropertiesToFind:(id)a3 atURL:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if ([(CoreDAVPropertyFindBaseTask *)self isMemberOfClass:objc_opt_class()])
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"CoreDAVPropertyFindBaseTask.m", 36, @"You instantiated a class that doesn't want to be instantiated.  Please choose a concrete subclass of %@", objc_opt_class() object file lineNumber description];

    v11 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CoreDAVPropertyFindBaseTask;
    v12 = [(CoreDAVTask *)&v15 initWithURL:v9];
    v13 = v12;
    if (v12) {
      objc_storeStrong((id *)&v12->_propertiesToFind, a3);
    }
    self = v13;
    v11 = self;
  }

  return v11;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVPropertyFindBaseTask;
  v4 = [(CoreDAVTask *)&v7 description];
  [v3 appendFormat:@"[%@ ", v4];

  v5 = [(CoreDAVPropertyFindBaseTask *)self propertiesToFind];
  objc_msgSend(v3, "appendFormat:", @"| Number of properties to find: [%lu]", objc_msgSend(v5, "count"));

  [v3 appendFormat:@"]"];
  return v3;
}

- (id)additionalHeaderValues
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v6.receiver = self;
  v6.super_class = (Class)CoreDAVPropertyFindBaseTask;
  v4 = [(CoreDAVTask *)&v6 additionalHeaderValues];
  [v3 addEntriesFromDictionary:v4];

  [v3 setObject:@"t" forKey:@"Brief"];
  [v3 setObject:@"return=minimal" forKey:@"Prefer"];
  return v3;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  v4 = [(CoreDAVTask *)self url];
  v5 = [(CoreDAVTask *)self lastRedirectURL];
  objc_super v6 = v5;
  if (v5)
  {
    id v7 = v5;

    v4 = v7;
  }
  id v8 = [[CoreDAVXMLParser alloc] initWithRootElementNameSpace:@"DAV:" name:@"multistatus" parseClass:objc_opt_class() baseURL:v4];
  id v9 = [(CoreDAVPropertyFindBaseTask *)self parseHints];
  [(CoreDAVXMLParser *)v8 setParseHints:v9];

  return v8;
}

- (id)successfulValueForNameSpace:(id)a3 elementName:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [(CoreDAVPropertyFindBaseTask *)self multiStatus];
  id v9 = [v8 responses];

  v10 = (void *)[v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) successfulPropertiesToValues];
        if (v13)
        {
          v14 = v13;
          v10 = [v13 CDVObjectForKeyWithNameSpace:v6 andName:v7];

          goto LABEL_11;
        }
      }
      v10 = (void *)[v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v10;
}

- (void)updateMultiStatusFromResponse
{
  id v3 = [(CoreDAVPropertyFindBaseTask *)self multiStatus];
  if (!v3)
  {
    v4 = [(CoreDAVTask *)self responseBodyParser];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
    }
    else
    {
      BOOL v5 = [(CoreDAVTask *)self simulated];

      if (!v5) {
        return;
      }
    }
    id v6 = [(CoreDAVTask *)self rootElement];
    [(CoreDAVPropertyFindBaseTask *)self setMultiStatus:v6];
    id v3 = v6;
  }
}

- (id)getTotalFailureError
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  [(CoreDAVPropertyFindBaseTask *)self updateMultiStatusFromResponse];
  id v3 = [(CoreDAVPropertyFindBaseTask *)self multiStatus];

  if (v3)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v4 = [(CoreDAVPropertyFindBaseTask *)self multiStatus];
    BOOL v5 = [v4 responses];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      v24 = self;
      int v9 = 0;
      uint64_t v10 = *(void *)v27;
      int v11 = 1;
      *(void *)&long long v7 = 138412290;
      long long v23 = v7;
      id obj = v5;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "successfulPropertiesToValues", v23);
          uint64_t v15 = [v14 count];

          BOOL v16 = v15 != 0;
          BOOL v17 = v15 == 0;
          if ([v13 hasPropertyError])
          {
            long long v18 = +[CoreDAVLogging sharedLogging];
            id WeakRetained = objc_loadWeakRetained((id *)&v24->super._accountInfoProvider);
            v20 = [v18 logHandleForAccountInfoProvider:WeakRetained];

            if (v20 && os_log_type_enabled(v20, (os_log_type_t)(2 * v16)))
            {
              *(_DWORD *)buf = v23;
              v31 = v13;
              _os_log_impl(&dword_213BFC000, v20, (os_log_type_t)(2 * v16), "There were some failures fetching properties, according to the following response: [%@].", buf, 0xCu);
            }

            int v9 = 1;
          }
          v11 &= v17;
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v8);

      if ((v9 & v11) == 1)
      {
        uint64_t v21 = [MEMORY[0x263F087E8] errorWithDomain:@"CoreDAVErrorDomain" code:2 userInfo:0];
        goto LABEL_18;
      }
    }
    else
    {
    }
  }
  uint64_t v21 = 0;
LABEL_18:
  return v21;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 code];
    long long v7 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    int v9 = [v7 logHandleForAccountInfoProvider:WeakRetained];

    if (v6 == 1)
    {
      if (v9)
      {
        uint64_t v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v19 = (id)objc_opt_class();
          id v11 = v19;
          v12 = "%{public}@ cancelled";
          v13 = v10;
          os_log_type_t v14 = OS_LOG_TYPE_INFO;
          uint32_t v15 = 12;
LABEL_9:
          _os_log_impl(&dword_213BFC000, v13, v14, v12, buf, v15);

          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    else if (v9)
    {
      BOOL v16 = v9;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v19 = (id)objc_opt_class();
        __int16 v20 = 2112;
        uint64_t v21 = v5;
        id v11 = v19;
        v12 = "%{public}@ failed: %@";
        v13 = v16;
        os_log_type_t v14 = OS_LOG_TYPE_ERROR;
        uint32_t v15 = 22;
        goto LABEL_9;
      }
LABEL_10:
    }
  }
  [(CoreDAVPropertyFindBaseTask *)self updateMultiStatusFromResponse];
  v17.receiver = self;
  v17.super_class = (Class)CoreDAVPropertyFindBaseTask;
  [(CoreDAVTask *)&v17 finishCoreDAVTaskWithError:v5];
}

- (NSSet)propertiesToFind
{
  return self->_propertiesToFind;
}

- (void)setPropertiesToFind:(id)a3
{
}

- (CoreDAVMultiStatusItem)multiStatus
{
  return self->_multiStatus;
}

- (void)setMultiStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertiesToFind, 0);
  objc_storeStrong((id *)&self->_multiStatus, 0);
}

@end