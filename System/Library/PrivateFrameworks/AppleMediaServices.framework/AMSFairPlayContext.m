@interface AMSFairPlayContext
- (AMSFairPlayContext)init;
- (unsigned)contextID;
- (unsigned)fairplayContextIDWithError:(id *)a3;
- (void)dealloc;
- (void)destroyContext;
- (void)setContextID:(unsigned int)a3;
@end

@implementation AMSFairPlayContext

- (AMSFairPlayContext)init
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)AMSFairPlayContext;
  v2 = [(AMSFairPlayContext *)&v12 init];
  v3 = v2;
  if (v2)
  {
    id v11 = 0;
    unsigned int v4 = [(AMSFairPlayContext *)v2 fairplayContextIDWithError:&v11];
    id v5 = v11;
    v3->_contextID = v4;
    if (!v4)
    {
      v6 = +[AMSLogConfig sharedConfig];
      if (!v6)
      {
        v6 = +[AMSLogConfig sharedConfig];
      }
      v7 = [v6 OSLogObject];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = objc_opt_class();
        v9 = AMSLogKey();
        *(_DWORD *)buf = 138543874;
        uint64_t v14 = v8;
        __int16 v15 = 2114;
        v16 = v9;
        __int16 v17 = 2114;
        id v18 = v5;
        _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] failed to intialize fairplay context. Error: %{public}@", buf, 0x20u);
      }
    }
  }
  return v3;
}

- (void)dealloc
{
  [(AMSFairPlayContext *)self destroyContext];
  v3.receiver = self;
  v3.super_class = (Class)AMSFairPlayContext;
  [(AMSFairPlayContext *)&v3 dealloc];
}

- (void)destroyContext
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(AMSFairPlayContext *)self contextID])
  {
    objc_super v3 = +[AMSLogConfig sharedConfig];
    if (!v3)
    {
      objc_super v3 = +[AMSLogConfig sharedConfig];
    }
    unsigned int v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 138543362;
      uint64_t v6 = objc_opt_class();
      _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_INFO, "%{public}@: Destroying context", (uint8_t *)&v5, 0xCu);
    }

    VLxCLgDpiF([(AMSFairPlayContext *)self contextID]);
    self->_contextID = 0;
  }
}

- (unsigned)fairplayContextIDWithError:(id *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  p_contextID = &self->_contextID;
  if (self->_contextID)
  {
    df35957c4e0();
    if (!v6) {
      return *p_contextID;
    }
    int v7 = v6;
    uint64_t v8 = +[AMSLogConfig sharedConfig];
    if (!v8)
    {
      uint64_t v8 = +[AMSLogConfig sharedConfig];
    }
    v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Fairplay context is invalid (%ld)", buf, 0x16u);
    }

    [(AMSFairPlayContext *)self destroyContext];
  }
  memset(buf, 0, sizeof(buf));
  if (AMSFairPlayGetHardwareInfo((uint64_t)buf)
    || ([NSString stringWithFormat:@"Failed to initialize global context due to hardware info"], v10 = objc_claimAutoreleasedReturnValue(), AMSError(505, @"Fairplay Error", v10, 0), id v11 = objc_claimAutoreleasedReturnValue(), v10, !v11))
  {
    objc_super v12 = +[AMSLogConfig sharedConfig];
    if (!v12)
    {
      objc_super v12 = +[AMSLogConfig sharedConfig];
    }
    v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v22 = 138543362;
      uint64_t v23 = objc_opt_class();
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_INFO, "%{public}@: Creating context", v22, 0xCu);
    }

    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CB10], "ams_realHomeDirectory");
    uint64_t v15 = [v14 stringByAppendingPathComponent:@"/Media/iTunes_Control/iTunes"];

    if (v15) {
      v16 = (__CFString *)v15;
    }
    else {
      v16 = @"/private/var/mobile/Media/iTunes_Control/iTunes";
    }
    __int16 v17 = v16;
    int v18 = XtCqEf5X(0, (uint64_t)buf, [(__CFString *)v17 UTF8String], (uint64_t)p_contextID);
    if (v18)
    {
      uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to initialize global context with status: %ld", v18);
      id v11 = AMSError(505, @"Fairplay Error", v19, 0);
    }
    else
    {
      id v11 = 0;
    }
  }
  if (a3) {
    *a3 = v11;
  }
  unsigned int v20 = *p_contextID;

  return v20;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (void)setContextID:(unsigned int)a3
{
  self->_contextID = a3;
}

@end