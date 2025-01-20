@interface CoreDAVPutTask
- (NSString)nextETag;
- (id)description;
- (id)httpMethod;
- (void)finishCoreDAVTaskWithError:(id)a3;
- (void)setNextETag:(id)a3;
@end

@implementation CoreDAVPutTask

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVPutTask;
  v4 = [(CoreDAVPostOrPutTask *)&v7 description];
  [v3 appendFormat:@"[%@ ", v4];

  v5 = [(CoreDAVPutTask *)self nextETag];
  [v3 appendFormat:@"| New ETag: [%@]", v5];

  [v3 appendFormat:@"]"];
  return v3;
}

- (id)httpMethod
{
  return @"PUT";
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(CoreDAVPutTask *)self setNextETag:0];
  if (!v4)
  {
    v6 = [(CoreDAVTask *)self responseHeaders];
    v8 = [v6 CDVObjectForKeyCaseInsensitive:@"ETag"];
    [(CoreDAVPutTask *)self setNextETag:v8];
    goto LABEL_12;
  }
  uint64_t v5 = [v4 code];
  v6 = +[CoreDAVLogging sharedLogging];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super.super._accountInfoProvider);
  v8 = [v6 logHandleForAccountInfoProvider:WeakRetained];

  if (v5 == 1)
  {
    if (!v8) {
      goto LABEL_12;
    }
    v9 = v8;
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138543362;
    id v21 = (id)objc_opt_class();
    id v10 = v21;
    v11 = "%{public}@ cancelled";
    v12 = v9;
    os_log_type_t v13 = OS_LOG_TYPE_INFO;
    uint32_t v14 = 12;
    goto LABEL_10;
  }
  if (!v8) {
    goto LABEL_12;
  }
  v9 = v8;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = (id)objc_opt_class();
    __int16 v22 = 2112;
    id v23 = v4;
    id v10 = v21;
    v11 = "%{public}@ failed: %@";
    v12 = v9;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    uint32_t v14 = 22;
LABEL_10:
    _os_log_impl(&dword_213BFC000, v12, v13, v11, buf, v14);
  }
LABEL_11:

LABEL_12:
  v15 = [(CoreDAVTask *)self delegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    v17 = [(CoreDAVTask *)self delegate];
    v18 = [(CoreDAVPutTask *)self nextETag];
    [v17 putTask:self completedWithNewETag:v18 error:v4];

    [(CoreDAVTask *)self setDelegate:0];
  }
  v19.receiver = self;
  v19.super_class = (Class)CoreDAVPutTask;
  [(CoreDAVTask *)&v19 finishCoreDAVTaskWithError:v4];
}

- (NSString)nextETag
{
  return self->_nextETag;
}

- (void)setNextETag:(id)a3
{
}

- (void).cxx_destruct
{
}

@end