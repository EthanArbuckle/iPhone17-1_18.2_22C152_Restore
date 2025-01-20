@interface CoreDAVDeleteTask
- (NSString)previousETag;
- (id)additionalHeaderValues;
- (id)description;
- (id)httpMethod;
- (id)requestBody;
- (void)finishCoreDAVTaskWithError:(id)a3;
- (void)setPreviousETag:(id)a3;
@end

@implementation CoreDAVDeleteTask

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVDeleteTask;
  v4 = [(CoreDAVActionBackedTask *)&v7 description];
  [v3 appendFormat:@"[%@ ", v4];

  v5 = [(CoreDAVDeleteTask *)self previousETag];
  [v3 appendFormat:@"| Previous ETag: [%@]", v5];

  [v3 appendFormat:@"]"];
  return v3;
}

- (id)httpMethod
{
  return @"DELETE";
}

- (id)additionalHeaderValues
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVDeleteTask;
  v4 = [(CoreDAVTask *)&v7 additionalHeaderValues];
  [v3 addEntriesFromDictionary:v4];

  v5 = [(CoreDAVDeleteTask *)self previousETag];
  if (v5) {
    [v3 setObject:v5 forKey:@"If-Match"];
  }

  return v3;
}

- (id)requestBody
{
  return 0;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ([v4 code] == 1)
    {
      v6 = +[CoreDAVLogging sharedLogging];
      id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._accountInfoProvider);
      v8 = [v6 logHandleForAccountInfoProvider:WeakRetained];

      if (v8)
      {
        v9 = v8;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          id v24 = (id)objc_opt_class();
          id v10 = v24;
          v11 = "%{public}@ cancelled";
          v12 = v9;
          os_log_type_t v13 = OS_LOG_TYPE_INFO;
          uint32_t v14 = 12;
LABEL_16:
          _os_log_impl(&dword_213BFC000, v12, v13, v11, buf, v14);

          goto LABEL_17;
        }
        goto LABEL_17;
      }
    }
    else
    {
      v15 = [v5 domain];
      if ([v15 isEqualToString:@"CoreDAVHTTPStatusErrorDomain"])
      {
        uint64_t v16 = [v5 code];

        if (v16 == 404)
        {
          v8 = +[CoreDAVLogging sharedLogging];
          id v17 = objc_loadWeakRetained((id *)&self->super.super._accountInfoProvider);
          v9 = [v8 logHandleForAccountInfoProvider:v17];

          if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v24 = self;
            _os_log_impl(&dword_213BFC000, v9, OS_LOG_TYPE_INFO, "Tried to delete an unknown resource.  Swallowing this error %@", buf, 0xCu);
          }
          v6 = v5;
          v5 = 0;
          goto LABEL_17;
        }
      }
      else
      {
      }
      v6 = +[CoreDAVLogging sharedLogging];
      id v18 = objc_loadWeakRetained((id *)&self->super.super._accountInfoProvider);
      v8 = [v6 logHandleForAccountInfoProvider:v18];

      if (v8)
      {
        v9 = v8;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v24 = (id)objc_opt_class();
          __int16 v25 = 2112;
          v26 = v5;
          id v10 = v24;
          v11 = "%{public}@ failed: %@";
          v12 = v9;
          os_log_type_t v13 = OS_LOG_TYPE_ERROR;
          uint32_t v14 = 22;
          goto LABEL_16;
        }
LABEL_17:
      }
    }
  }
  v19 = [(CoreDAVTask *)self delegate];
  char v20 = objc_opt_respondsToSelector();

  if (v20)
  {
    v21 = [(CoreDAVTask *)self delegate];
    [v21 deleteTask:self completedWithError:v5];

    [(CoreDAVTask *)self setDelegate:0];
  }
  v22.receiver = self;
  v22.super_class = (Class)CoreDAVDeleteTask;
  [(CoreDAVTask *)&v22 finishCoreDAVTaskWithError:v5];
}

- (NSString)previousETag
{
  return self->_previousETag;
}

- (void)setPreviousETag:(id)a3
{
}

- (void).cxx_destruct
{
}

@end