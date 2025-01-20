@interface APRequestExtension
- (NSExtensionContext)extensionContext;
- (void)_finish;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)checkDownloadQueue;
- (void)requestUpdatedWithResult:(id)a3 completion:(id)a4;
- (void)setExtensionContext:(id)a3;
@end

@implementation APRequestExtension

- (void)checkDownloadQueue
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = +[APLogConfig sharedExtensionConfig];
  if (!v2)
  {
    v2 = +[APLogConfig sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_2256FB000, v3, OS_LOG_TYPE_ERROR, "%{public}@: checkDownloadQueue has not been overriden.", (uint8_t *)&v5, 0xCu);
  }
}

- (void)requestUpdatedWithResult:(id)a3 completion:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(void))a4;
  int v5 = +[APLogConfig sharedExtensionConfig];
  if (!v5)
  {
    int v5 = +[APLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543362;
    id v9 = (id)objc_opt_class();
    id v7 = v9;
    _os_log_impl(&dword_2256FB000, v6, OS_LOG_TYPE_ERROR, "%{public}@: requestUpdatedWithResult:completion: has not been overriden.", (uint8_t *)&v8, 0xCu);
  }
  v4[2](v4);
}

- (void)_finish
{
  objc_initWeak(&location, self);
  v3 = [(APRequestExtension *)self extensionContext];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__APRequestExtension__finish__block_invoke;
  v4[3] = &unk_26474E4F0;
  objc_copyWeak(&v5, &location);
  [v3 completeRequestReturningItems:0 completionHandler:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __29__APRequestExtension__finish__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = +[APLogConfig sharedExtensionConfig];
  if (!v2)
  {
    v2 = +[APLogConfig sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_2256FB000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Extension finished", (uint8_t *)&v5, 0xCu);
  }
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(APRequestExtension *)self setExtensionContext:v4];
  int v5 = [v4 inputItems];
  id v6 = [v5 firstObject];

  uint64_t v7 = [v6 userInfo];
  int v8 = +[APLogConfig sharedExtensionConfig];
  if (!v8)
  {
    int v8 = +[APLogConfig sharedConfig];
  }
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    id v11 = v10;
    v12 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543618;
    v30 = v10;
    __int16 v31 = 2112;
    v32 = v12;
    _os_log_impl(&dword_2256FB000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Begun extension succesfully. User info: %@", buf, 0x16u);
  }
  v13 = [v7 objectForKeyedSubscript:@"checkDownloadQueue"];
  int v14 = [v13 BOOLValue];

  if (v14)
  {
    [(APRequestExtension *)self checkDownloadQueue];
    [(APRequestExtension *)self _finish];
  }
  else
  {
    v15 = [APResult alloc];
    v16 = [v7 objectForKeyedSubscript:@"result"];
    v17 = [(APResult *)v15 initWithDictionary:v16];

    uint64_t v18 = +[APLogConfig sharedExtensionConfig];
    v19 = (void *)v18;
    if (v17)
    {
      if (!v18)
      {
        v19 = +[APLogConfig sharedConfig];
      }
      v20 = [v19 OSLogObject];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = objc_opt_class();
        id v22 = v21;
        v23 = AMSHashIfNeeded();
        *(_DWORD *)buf = 138543618;
        v30 = v21;
        __int16 v31 = 2112;
        v32 = v23;
        _os_log_impl(&dword_2256FB000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: Begun extension succesfully. Result: %@", buf, 0x16u);
      }
      objc_initWeak((id *)buf, self);
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __55__APRequestExtension_beginRequestWithExtensionContext___block_invoke;
      v27[3] = &unk_26474E3B0;
      objc_copyWeak(&v28, (id *)buf);
      [(APRequestExtension *)self requestUpdatedWithResult:v17 completion:v27];
      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (!v18)
      {
        v19 = +[APLogConfig sharedConfig];
      }
      v24 = [v19 OSLogObject];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v30 = v25;
        id v26 = v25;
        _os_log_impl(&dword_2256FB000, v24, OS_LOG_TYPE_ERROR, "%{public}@: Context input item doesn't have result", buf, 0xCu);
      }
      [(APRequestExtension *)self _finish];
    }
  }
}

void __55__APRequestExtension_beginRequestWithExtensionContext___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = +[APLogConfig sharedExtensionConfig];
  if (!v2)
  {
    v2 = +[APLogConfig sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_2256FB000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Result observer finished", (uint8_t *)&v5, 0xCu);
  }
  [WeakRetained _finish];
}

- (NSExtensionContext)extensionContext
{
  return self->_extensionContext;
}

- (void)setExtensionContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end