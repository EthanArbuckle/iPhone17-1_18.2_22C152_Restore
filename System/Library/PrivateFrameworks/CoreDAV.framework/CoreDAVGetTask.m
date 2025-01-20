@interface CoreDAVGetTask
- (BOOL)forceNoCache;
- (id)appSpecificDataItemResult;
- (id)copyDefaultParserForContentType:(id)a3;
- (id)description;
- (id)httpMethod;
- (id)requestBody;
- (unint64_t)cachePolicy;
- (void)finishCoreDAVTaskWithError:(id)a3;
- (void)setAppSpecificDataItemResult:(id)a3;
- (void)setForceNoCache:(BOOL)a3;
@end

@implementation CoreDAVGetTask

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v10.receiver = self;
  v10.super_class = (Class)CoreDAVGetTask;
  v4 = [(CoreDAVTask *)&v10 description];
  [v3 appendFormat:@"[%@ ", v4];

  v5 = [(CoreDAVTask *)self responseBodyParser];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [(CoreDAVTask *)self responseBodyParser];
    v8 = [v7 octetStreamData];
    objc_msgSend(v3, "appendFormat:", @"| Data length in bytes: [%lu]", objc_msgSend(v8, "length"));
  }
  else
  {
    [v3 appendFormat:@"| Data length in bytes: [unknown]"];
  }
  [v3 appendFormat:@"]"];
  return v3;
}

- (id)httpMethod
{
  return @"GET";
}

- (unint64_t)cachePolicy
{
  return [(CoreDAVGetTask *)self forceNoCache];
}

- (id)requestBody
{
  return 0;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  return objc_alloc_init(CoreDAVOctetStreamParser);
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 code];
    v7 = +[CoreDAVLogging sharedLogging];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._accountInfoProvider);
    v9 = [v7 logHandleForAccountInfoProvider:WeakRetained];

    if (v6 == 1)
    {
      if (v9)
      {
        objc_super v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v26 = (id)objc_opt_class();
          id v11 = v26;
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
      v16 = v9;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v26 = (id)objc_opt_class();
        __int16 v27 = 2112;
        v28 = v5;
        id v11 = v26;
        v12 = "%{public}@ failed: %@";
        v13 = v16;
        os_log_type_t v14 = OS_LOG_TYPE_ERROR;
        uint32_t v15 = 22;
        goto LABEL_9;
      }
LABEL_10:
    }
  }
  v17 = [(CoreDAVTask *)self delegate];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    v19 = [(CoreDAVTask *)self responseBodyParser];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v21 = [(CoreDAVTask *)self responseBodyParser];
      v22 = [v21 octetStreamData];
    }
    else
    {
      v22 = 0;
    }
    v23 = [(CoreDAVTask *)self delegate];
    [v23 getTask:self data:v22 error:v5];

    [(CoreDAVTask *)self setDelegate:0];
  }
  v24.receiver = self;
  v24.super_class = (Class)CoreDAVGetTask;
  [(CoreDAVTask *)&v24 finishCoreDAVTaskWithError:v5];
}

- (id)appSpecificDataItemResult
{
  return self->_appSpecificDataItemResult;
}

- (void)setAppSpecificDataItemResult:(id)a3
{
}

- (BOOL)forceNoCache
{
  return self->_forceNoCache;
}

- (void)setForceNoCache:(BOOL)a3
{
  self->_forceNoCache = a3;
}

- (void).cxx_destruct
{
}

@end