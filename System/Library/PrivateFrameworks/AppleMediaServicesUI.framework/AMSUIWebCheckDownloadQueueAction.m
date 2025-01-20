@interface AMSUIWebCheckDownloadQueueAction
- (AMSUIWebCheckDownloadQueueAction)initWithJSObject:(id)a3 context:(id)a4;
- (id)contentType;
- (id)runAction;
- (void)setContentType:(id)a3;
@end

@implementation AMSUIWebCheckDownloadQueueAction

- (AMSUIWebCheckDownloadQueueAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSUIWebCheckDownloadQueueAction;
  v7 = [(AMSUIWebAction *)&v11 initWithJSObject:v6 context:a4];
  if (v7)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:@"contentType"];
    id contentType = v7->_contentType;
    v7->_id contentType = (id)v8;
  }
  return v7;
}

- (id)runAction
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)AMSUIWebCheckDownloadQueueAction;
  id v3 = [(AMSUIWebAction *)&v20 runAction];
  v4 = [(AMSUIWebCheckDownloadQueueAction *)self contentType];
  uint64_t v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  id v6 = (void *)v5;
  if (v4)
  {
    if (!v5)
    {
      id v6 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      v9 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Checking download queue", buf, 0x16u);
    }
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    v10 = (void *)getAPRequestHandlerClass_softClass;
    uint64_t v24 = getAPRequestHandlerClass_softClass;
    if (!getAPRequestHandlerClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getAPRequestHandlerClass_block_invoke;
      v26 = &unk_2643E33D8;
      v27 = &v21;
      __getAPRequestHandlerClass_block_invoke((uint64_t)buf);
      v10 = (void *)v22[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v21, 8);
    if (objc_opt_respondsToSelector()) {
      uint64_t v12 = [v4 longLongValue];
    }
    else {
      uint64_t v12 = 0;
    }
    [v11 checkDownloadQueueWithContentType:v12];
    v18 = [MEMORY[0x263F27E10] promiseWithResult:MEMORY[0x263EFFA88]];
  }
  else
  {
    if (!v5)
    {
      id v6 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v13 = [v6 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = objc_opt_class();
      v15 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v15;
      _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to check download queue. Content type is missing", buf, 0x16u);
    }
    v16 = (void *)MEMORY[0x263F27E10];
    v17 = AMSError();
    v18 = [v16 promiseWithError:v17];
  }
  return v18;
}

- (id)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end