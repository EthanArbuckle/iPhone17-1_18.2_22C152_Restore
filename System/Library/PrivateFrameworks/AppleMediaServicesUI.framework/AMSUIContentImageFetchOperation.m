@interface AMSUIContentImageFetchOperation
- (AMSUIContentImageFetchOperation)initWithURL:(id)a3;
- (NSURL)imageURL;
- (id)fallbackBlock;
- (void)_fallbackWithURL:(id)a3;
- (void)main;
- (void)setFallbackBlock:(id)a3;
- (void)setImageURL:(id)a3;
@end

@implementation AMSUIContentImageFetchOperation

- (AMSUIContentImageFetchOperation)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUIContentImageFetchOperation;
  v6 = [(AMSUIContentImageFetchOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_imageURL, a3);
  }

  return v7;
}

- (void)main
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = objc_alloc(MEMORY[0x263F08BA0]);
  id v5 = [(AMSUIContentImageFetchOperation *)self imageURL];
  v6 = (void *)[v4 initWithURL:v5 resolvingAgainstBaseURL:0];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v7 = [v6 queryItems];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v13 = [v12 value];
        if (v13)
        {
          v14 = [v12 name];
          [v3 setObject:v13 forKey:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v9);
  }

  v15 = [v3 objectForKey:@"fallbackURL"];
  v16 = [v15 stringByRemovingPercentEncoding];

  if (v16) {
    v17 = (void *)[objc_alloc(NSURL) initWithString:v16];
  }
  else {
    v17 = 0;
  }
  v18 = [v3 objectForKey:@"app"];
  if (v18)
  {
    v19 = [v3 objectForKey:@"cacheKey"];
    if (v19)
    {
      id v20 = objc_alloc_init(MEMORY[0x263F27C28]);
      v21 = [v3 objectForKey:@"version"];
      v22 = [v20 contentInfoForApp:v18 cacheKey:v19 version:v21];

      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __39__AMSUIContentImageFetchOperation_main__block_invoke;
      v38[3] = &unk_2643E37F8;
      v38[4] = self;
      id v23 = v17;
      id v39 = v23;
      [v22 addErrorBlock:v38];
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __39__AMSUIContentImageFetchOperation_main__block_invoke_15;
      v36[3] = &unk_2643E3840;
      v36[4] = self;
      id v37 = v23;
      [v22 addSuccessBlock:v36];
    }
    else
    {
      v29 = [MEMORY[0x263F27CB8] sharedConfig];
      if (!v29)
      {
        v29 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v30 = [v29 OSLogObject];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = objc_opt_class();
        id v33 = v31;
        AMSLogKey();
        v32 = v35 = v6;
        *(_DWORD *)buf = 138543618;
        v45 = v31;
        __int16 v46 = 2114;
        v47 = v32;
        _os_log_impl(&dword_21C134000, v30, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Missing content cache key", buf, 0x16u);

        v6 = v35;
      }

      [(AMSUIContentImageFetchOperation *)self _fallbackWithURL:v17];
    }
  }
  else
  {
    v24 = [MEMORY[0x263F27CB8] sharedConfig];
    if (!v24)
    {
      v24 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v25 = [v24 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = objc_opt_class();
      v34 = v6;
      id v27 = v26;
      v28 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      v45 = v26;
      __int16 v46 = 2114;
      v47 = v28;
      _os_log_impl(&dword_21C134000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Missing application identifier", buf, 0x16u);

      v6 = v34;
    }

    [(AMSUIContentImageFetchOperation *)self _fallbackWithURL:v17];
  }
}

void __39__AMSUIContentImageFetchOperation_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263F27CB8] sharedConfig];
  if (!v4)
  {
    id v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    uint64_t v8 = AMSLogKey();
    int v9 = 138543874;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    v12 = v8;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to get content info: %{public}@", (uint8_t *)&v9, 0x20u);
  }
  [*(id *)(a1 + 32) _fallbackWithURL:*(void *)(a1 + 40)];
}

void __39__AMSUIContentImageFetchOperation_main__block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id v4 = [v3 allKeys];
    id v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_4];
    v6 = [v5 lastObject];

    id v7 = [v3 objectForKey:v6];
    uint64_t v8 = [v7 path];

    if (v8)
    {
      uint64_t v9 = [objc_alloc(MEMORY[0x263F827E8]) initWithContentsOfFile:v8];
      if (v9)
      {
        uint64_t v10 = (void *)v9;
        [*(id *)(a1 + 32) _finishWithImage:v9 error:0];

LABEL_11:
        goto LABEL_12;
      }
      __int16 v11 = [MEMORY[0x263F27CB8] sharedConfig];
      if (!v11)
      {
        __int16 v11 = [MEMORY[0x263F27CB8] sharedConfig];
      }
      v12 = [v11 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        __int16 v13 = objc_opt_class();
        id v14 = v13;
        uint64_t v15 = AMSLogKey();
        int v16 = 138543874;
        v17 = v13;
        __int16 v18 = 2114;
        v19 = v15;
        __int16 v20 = 2114;
        v21 = v8;
        _os_log_impl(&dword_21C134000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load image: %{public}@", (uint8_t *)&v16, 0x20u);
      }
    }
    [*(id *)(a1 + 32) _fallbackWithURL:*(void *)(a1 + 40)];
    goto LABEL_11;
  }
LABEL_12:
}

uint64_t __39__AMSUIContentImageFetchOperation_main__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 options:64];
}

- (void)_fallbackWithURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AMSUIContentImageFetchOperation *)self fallbackBlock];
  v6 = (void *)v5;
  if (v4
    && v5
    && ((*(void (**)(uint64_t, id))(v5 + 16))(v5, v4),
        (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v8 = v7;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __52__AMSUIContentImageFetchOperation__fallbackWithURL___block_invoke;
    v9[3] = &unk_2643E3868;
    v9[4] = self;
    [v7 addFinishBlock:v9];
  }
  else
  {
    uint64_t v8 = AMSError();
    [(AMSUIAssetFetchOperation *)self _finishWithImage:0 error:v8];
  }
}

uint64_t __52__AMSUIContentImageFetchOperation__fallbackWithURL___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _finishWithImage:a2 error:a3];
}

- (id)fallbackBlock
{
  return self->_fallbackBlock;
}

- (void)setFallbackBlock:(id)a3
{
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong(&self->_fallbackBlock, 0);
}

@end