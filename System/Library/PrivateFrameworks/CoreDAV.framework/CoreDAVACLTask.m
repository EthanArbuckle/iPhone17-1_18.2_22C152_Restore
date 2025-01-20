@interface CoreDAVACLTask
- (CoreDAVACLTask)initWithAccessControlEntities:(id)a3 atURL:(id)a4;
- (CoreDAVACLTask)initWithURL:(id)a3;
- (NSArray)accessControlEntities;
- (id)description;
- (id)httpMethod;
- (id)requestBody;
- (void)finishCoreDAVTaskWithError:(id)a3;
- (void)setAccessControlEntities:(id)a3;
@end

@implementation CoreDAVACLTask

- (CoreDAVACLTask)initWithURL:(id)a3
{
}

- (CoreDAVACLTask)initWithAccessControlEntities:(id)a3 atURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7 || (v9 = v8, ![v7 count]))
  {
    id v13 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Non-nil and non-empty accessControlEntities required." userInfo:0];
    objc_exception_throw(v13);
  }
  v14.receiver = self;
  v14.super_class = (Class)CoreDAVACLTask;
  v10 = [(CoreDAVTask *)&v14 initWithURL:v9];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_accessControlEntities, a3);
  }

  return v11;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVACLTask;
  v4 = [(CoreDAVTask *)&v7 description];
  [v3 appendFormat:@"[%@ ", v4];

  v5 = [(CoreDAVACLTask *)self accessControlEntities];
  objc_msgSend(v3, "appendFormat:", @"| Number of access control entities: [%lu]", objc_msgSend(v5, "count"));

  [v3 appendFormat:@"]"];
  return v3;
}

- (id)httpMethod
{
  return @"ACL";
}

- (id)requestBody
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(CoreDAVXMLData);
  [(CoreDAVXMLData *)v3 startElement:@"acl" inNamespace:@"DAV:" withAttributeNamesAndValues:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = [(CoreDAVACLTask *)self accessControlEntities];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) write:v3];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [(CoreDAVXMLData *)v3 endElement:@"acl" inNamespace:@"DAV:"];
  v9 = [(CoreDAVXMLData *)v3 data];

  return v9;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
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
        v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v23 = (id)objc_opt_class();
          id v11 = v23;
          long long v12 = "%{public}@ cancelled";
          long long v13 = v10;
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
      uint64_t v16 = v9;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v23 = (id)objc_opt_class();
        __int16 v24 = 2112;
        v25 = v5;
        id v11 = v23;
        long long v12 = "%{public}@ failed: %@";
        long long v13 = v16;
        os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
        uint32_t v15 = 22;
        goto LABEL_9;
      }
LABEL_10:
    }
    id v17 = v5;
  }
  self->super._numDownloadedElements = 0;
  v18 = [(CoreDAVTask *)self delegate];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    v20 = [(CoreDAVTask *)self delegate];
    [v20 aclTask:self error:v5];

    [(CoreDAVTask *)self setDelegate:0];
  }
  v21.receiver = self;
  v21.super_class = (Class)CoreDAVACLTask;
  [(CoreDAVTask *)&v21 finishCoreDAVTaskWithError:v5];
}

- (NSArray)accessControlEntities
{
  return self->_accessControlEntities;
}

- (void)setAccessControlEntities:(id)a3
{
}

- (void).cxx_destruct
{
}

@end