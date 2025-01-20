@interface CoreDAVHeadTask
- (id)httpMethod;
- (id)requestBody;
- (unint64_t)cachePolicy;
- (void)finishCoreDAVTaskWithError:(id)a3;
@end

@implementation CoreDAVHeadTask

- (id)httpMethod
{
  return @"HEAD";
}

- (unint64_t)cachePolicy
{
  return 0;
}

- (id)requestBody
{
  return 0;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
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
        v10 = v9;
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
      v16 = v9;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v19 = (id)objc_opt_class();
        __int16 v20 = 2112;
        v21 = v5;
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
  v17.receiver = self;
  v17.super_class = (Class)CoreDAVHeadTask;
  [(CoreDAVTask *)&v17 finishCoreDAVTaskWithError:v5];
}

@end